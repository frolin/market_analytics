# frozen_string_literal: true

class StoresController < ApplicationController
  before_action :set_store, only: %i[show edit update destroy]

  # GET /store or /store.json
  def index
    @stores = TgUser.last.stores
  end

  # GET /store/1 or /store/1.json
  def show
    default_date_range = DateTime.now.advance(days: -7)..DateTime.now
    @orders = @store.orders.month
    @sales = @store.sales.month
    @sales_data = @sales.group_by_date_with_zero(date_range: default_date_range, type: :by_date)
    @orders_data = @orders.group_by_date_with_zero(date_range: default_date_range, type: :by_date)
    @canceled_data = @orders.canceled.group_by_date_with_zero(date_range: default_date_range, type: :by_date)
    @sales_data_sum = @sales.group_by_date_with_zero(date_range: default_date_range, type: :by_price)
    # @ads_sum = @store.finance_week_reports.group_by_date_with_zero(date_range: default_date_range, type: :by_price, field_name: 'finishedPrice')
    @products = ProductDecorator.decorate(@store.products)

    # .where('stocks.api_data')
    # .group('products.id')
    # .select('products.*, SUM((sales.api_data->>\'totalPrice\')::numeric) AS sum_column')
    # .order('sum_column DESC')
    @ad_active = @store.ads.show.decorate
    @ad_pause = @store.ads.pause.decorate
    @reports = @store.finance_week_reports.last(2)

    if date_range_params.present?
      @orders = @store.orders.by_date(date_range_params)
      @sales = @store.sales.by_date(date_range_params)

      @sales_data = @sales.group_by_date_with_zero(date_range: date_range_params, type: :by_date)
      @orders_data = @orders.group_by_date_with_zero(date_range: date_range_params, type: :by_date)
      @canceled_data = @orders.canceled.group_by_date_with_zero(date_range: date_range_params, type: :by_date)
      @sales_data_sum = @sales.group_by_date_with_zero(date_range: date_range_params, type: :by_price)
      # @ads_sum = @store.finance_week_reports.group_by_date_with_zero(date_range: default_date_range, type: :by_price)
      @reports = SourceReportDecorator.decorate(@store.finance_week_reports.where(start_date: date_range_params))
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
    @store = Store.find(params[:id]).decorate
  end

  # Only allow a list of trusted parameters through.
  def store_params
    params.require(:store).permit(:name, :slug, :data, campaigns: [])
  end

  def permitted_params
    params.permit(:date_range, :start_date, :end_date)
  end

  def date_range_params
    return unless permitted_params[:date_range]

    date_params = permitted_params[:date_range].split(' - ')

    date_params.first.to_datetime.beginning_of_day..date_params.last.to_datetime.end_of_day
  end

  def start_end_date
    return unless permitted_params[:start_date] && permitted_params[:end_date]

    date_params = [permitted_params[:start_date], permitted_params[:end_date]]
    date_params.first.to_datetime.beginning_of_day..date_params.last.to_datetime.end_of_day
  end

end
