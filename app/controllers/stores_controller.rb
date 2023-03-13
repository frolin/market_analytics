# frozen_string_literal: true

class StoresController < ApplicationController
  before_action :set_store, only: %i[show edit update destroy]

  # GET /store or /store.json
  def index
    @stores = TgUser.last.stores
  end

  # GET /store/1 or /store/1.json
  def show
    @start_date = DateTime.now.beginning_of_week.to_date
    @end_date = DateTime.now.end_of_week.to_date
    @orders = @store.orders.week
    @sales = @store.sales.week
    @products = @store.products.decorate
    @ad_active = @store.ads.show.decorate
    @ad_pause = @store.ads.pause.decorate
    @reports = @store.finance_week_reports.last(2)

    if date_range.present?
      @orders = @store.orders.by_date(date_range)
      @sales = @store.sales.by_date(date_range)
      @reports = SourceReportDecorator.decorate(@store.finance_week_reports.where(start_date: date_range))
      # @reports = @store.finance_week_reports.where(date('data' ->> 'Дата начала') BETWEEN '2021-10-01' AND '2021-10-30'), )
    end

  end

  # GET /store/new
  def new
    @store = Store.new
  end

  # GET /store/1/edit
  def edit; end

  # POST /store or /store.json
  def create
    @store = Store.new(store_params)
    @store.user = current_user

    respond_to do |format|
      if @store.save
        format.html { redirect_to store_url, notice: 'Market was successfully created.' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store/1 or /store/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to store_url, notice: 'Market was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store/1 or /store/1.json
  def destroy
    @store.destroy

    respond_to do |format|
      format.html { redirect_to store_url, notice: 'Market was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_store
    @store = Store.friendly.find(params[:id]).decorate
  end

  # Only allow a list of trusted parameters through.
  def store_params
    params.require(:store).permit(:name, :slug, :data, campaigns: [])
  end

  def permitted_params
    params.permit(:date_range)
  end

  def date_range
    return unless permitted_params[:date_range]

    date_params = permitted_params[:date_range].split(' - ')

    date_params.first.to_datetime.beginning_of_day..date_params.last.to_datetime.end_of_day
  end
end
