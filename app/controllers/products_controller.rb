class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_store, only: %i[ index ]

  # GET /products or /products.json
  def index
    @products = Product.all.decorate
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = current_user.products.new
    @photos = @product.photos.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    if params[:files].present?
      # transform the list of uploaded files into a photos attributes hash
      new_photos_attributes = params[:files].inject({}) do |hash, file|
        hash.merge!(SecureRandom.hex => { image: file })
      end

      # merge new photos attributes with existing (`album_params` is whitelisted `params[:album]`)
      photos_attributes = product_params[:photos_attributes].to_h.merge(new_photos_attributes)
      product_attributes = product_params.merge(photos_attributes: photos_attributes)

      @product = current_user.products.new(product_attributes)
    end

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    # transform the list of uploaded files into a photos attributes hash
    if params[:files].present?
      new_photos_attributes = params[:files].inject({}) do |hash, file|
        hash.merge!(SecureRandom.hex => { image: file })
      end

      # merge new photos attributes with existing (`album_params` is whitelisted `params[:album]`)
      photos_attributes = product_params[:photos_attributes].to_h.merge(new_photos_attributes)
      product_attributes = product_params.merge(photos_attributes: photos_attributes)

      @product = current_user.products.new(product_attributes)
    end

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  def set_store
    @store = Store.find_by(params[:store_id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :sku, :barcode, :offer_id, :campaign_id, :import_id, :content, :price, :purchase_price,
                                    data: {}, properties: {}, parameters: {}, photos_attributes: {}, cost: {})
  end
end
