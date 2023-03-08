# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @stores = if date_range.present?
                current_user.stores.orders_and_sales_by_date(date_range)
              else
                current_user.stores
              end

    respond_to do |format|
      format.html do
        @stores
      end
      format.turbo_stream do |stream|
        flash.now[:success] = 'reload'
        stream.replace(:dashboard, @stores)
      end
    end
  end

  private

  def permitted_params
    params.permit(:date_range, :store_id)
  end

  def date_range
    return unless permitted_params[:date_range]

    date_params = permitted_params[:date_range].split(' - ')

    date_params.first.to_date..date_params.last.to_date
  end

  def find_store
    if permitted_params[:store_id] == 'all'
      current_user.stores
    else
      @store ||= current_user.stores.find_by(id: permitted_params[:store_id])
    end
  end

  def stores
    current_user.stores
  end

  def orders
    @orders ||= store.present? ? store.orders : stores.orders
  end
end
