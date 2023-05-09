class UnitEconomicsController < ApplicationController
  before_action :set_unit_economic, only: %i[ show edit update destroy ]

  # GET /unit_economics or /unit_economics.json
  def index
    @unit_economics = UnitEconomic.all
  end

  # GET /unit_economics/1 or /unit_economics/1.json
  def show
  end

  # GET /unit_economics/new
  def new
    @unit_economic = UnitEconomic.new
  end

  # GET /unit_economics/1/edit
  def edit
  end

  # POST /unit_economics or /unit_economics.json
  def create
    @unit_economic = UnitEconomic.new(unit_economic_params)

    respond_to do |format|
      if @unit_economic.save
        format.html { redirect_to unit_economic_url(@unit_economic), notice: "Unit economic was successfully created." }
        format.json { render :show, status: :created, location: @unit_economic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @unit_economic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unit_economics/1 or /unit_economics/1.json
  def update
    respond_to do |format|
      if @unit_economic.update(unit_economic_params)
        format.html { redirect_to unit_economic_url(@unit_economic), notice: "Unit economic was successfully updated." }
        format.json { render :show, status: :ok, location: @unit_economic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @unit_economic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_economics/1 or /unit_economics/1.json
  def destroy
    @unit_economic.destroy

    respond_to do |format|
      format.html { redirect_to unit_economics_url, notice: "Unit economic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit_economic
      @unit_economic = UnitEconomic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def unit_economic_params
      params.require(:unit_economic).permit(:supply_id, :data, :date)
    end
end
