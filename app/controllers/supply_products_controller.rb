class SupplyProductsController < ApplicationController
  before_action :set_supply_product, only: %i[ show edit update destroy ]

  # GET /supply_products or /supply_products.json
  def index
    @supply_products = SupplyProduct.all
  end

  # GET /supply_products/1 or /supply_products/1.json
  def show
  end

  # GET /supply_products/new
  def new
    @supply_product = SupplyProduct.new
  end

  # GET /supply_products/1/edit
  def edit
  end

  # POST /supply_products or /supply_products.json
  def create
    @supply_product = SupplyProduct.new(supply_product_params)

    respond_to do |format|
      if @supply_product.save
        format.html { redirect_to supply_product_url(@supply_product), notice: "Supply product was successfully created." }
        format.json { render :show, status: :created, location: @supply_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supply_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supply_products/1 or /supply_products/1.json
  def update
    respond_to do |format|
      if @supply_product.update(supply_product_params)
        format.html { redirect_to supply_product_url(@supply_product), notice: "Supply product was successfully updated." }
        format.json { render :show, status: :ok, location: @supply_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supply_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supply_products/1 or /supply_products/1.json
  def destroy
    @supply_product.destroy

    respond_to do |format|
      format.html { redirect_to supply_products_url, notice: "Supply product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supply_product
      @supply_product = SupplyProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def supply_product_params
      params.require(:supply_product).permit(:product_id, :supply_id, :count)
    end
end
