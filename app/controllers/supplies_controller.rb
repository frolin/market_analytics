class SuppliesController < ApplicationController
  before_action :set_supply, only: %i[show edit update destroy]

  # GET /supplies or /supplies.json
  def index
    @supplies = Supply.all.decorate
  end

  # GET /supplies/1 or /supplies/1.json
  def show
    @supply_products = @supply.supply_products.decorate
  end

  # GET /supplies/new
  def new
    @supply = Supply.new
  end

  # GET /supplies/1/edit
  def edit; end

  # POST /supplies or /supplies.json
  def create
    new_supply = Supplies::Create.run(user: current_user, supply_params: supply_params)

    respond_to do |format|
      if new_supply.valid?
        format.html { redirect_to supplies_path, notice: 'Supply was successfully created.' }
        format.json { render :show, status: :created, location: @supply }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplies/1 or /supplies/1.json
  def update
    supply_update = Supplies::Update.run(supply: @supply, supply_params: supply_params)

    respond_to do |format|
      if supply_update.valid?
        format.html { redirect_to supply_url(@supply), notice: 'Supply was successfully updated.' }
        format.json { render :show, status: :ok, location: @supply }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_count
    @supply = Supply.find(params[:supply_id])

    count_params[:product].each_value do |supply_product|
      sp = SupplyProduct.find(supply_product[:id])
      sp.update(count: supply_product[:count])
    end

    respond_to do |format|
      # if @supply.update(count_params)
      format.html { redirect_to supply_url(@supply), notice: 'Supply was successfully updated.' }
      format.json { render :show, status: :ok, location: @supply }
      # else
      #   format.html { render :edit, status: :unprocessable_entity }
      #   format.json { render json: @supply.errors, status: :unprocessable_entity }
      # end
    end
  end

  # DELETE /supplies/1 or /supplies/1.json
  def destroy
    @supply.products.destroy_all
    @supply.destroy

    respond_to do |format|
      format.html { redirect_to supplies_url, notice: 'Supply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def google_export
    supply = Supply.find(params[:supply_id])
    process = Export::GoogleDrive.run(supply: supply)

    respond_to do |format|
      if process.valid?
        format.html { redirect_to supply, notice: 'Supply was successfully export.' }
        format.json { head :no_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_supply
    @supply = Supply.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def supply_params
    params.require(:supply).permit(:name, :user_id, :campaign_id, :market_id, product_ids: [])
  end

  def count_params
    params.require(:supply).permit(product: {})
  end
end
