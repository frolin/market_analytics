class DashboardController < ApplicationController

  def index

    # if date_range.present?
    #
    #
    # end

    # ::Filters::DateRange.filter(data_range, current_user, self)

  end

  private

  def permitted_params
    params.permit(:data_range, :store_id)
  end

  def date_range
    permitted_params[:data_range]
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