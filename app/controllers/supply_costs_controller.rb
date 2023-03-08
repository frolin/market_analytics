class SupplyCostsController < ApplicationController
  before_action :set_supply_cost, only: %i[show edit update destroy]

  # GET /supply_costs or /supply_costs.json
  def index
    @supply_costs = SupplyCost.all
  end

  # GET /supply_costs/1 or /supply_costs/1.json
  def show; end

  # GET /supply_costs/new
  def new
    @supply_cost = SupplyCost.new
  end

  # GET /supply_costs/1/edit
  def edit; end

  # POST /supply_costs or /supply_costs.json
  def create
    @supply_cost = SupplyCost.new(supply_cost_params)

    respond_to do |format|
      if @supply_cost.save
        format.html { redirect_to supply_cost_url(@supply_cost), notice: 'Supply cost was successfully created.' }
        format.json { render :show, status: :created, location: @supply_cost }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supply_cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supply_costs/1 or /supply_costs/1.json
  def update
    respond_to do |format|
      if @supply_cost.update(supply_cost_params)
        format.html { redirect_to supply_cost_url(@supply_cost), notice: 'Supply cost was successfully updated.' }
        format.json { render :show, status: :ok, location: @supply_cost }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supply_cost.errors, status: :unprocessable_entity }
      end
    end
  end

  def supply_cost_update
    binding.pry
    update_cost = Costs::Update.run(params: params.permit!.to_h)

    respond_to do |format|
      if update_cost.valid?
        format.html { redirect_to supply_path(supply), notice: 'Supply cost was successfully updated.' }
        format.json { render :show, status: :ok, location: @supply }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: update_cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supply_costs/1 or /supply_costs/1.json
  def destroy
    @supply_cost.destroy

    respond_to do |format|
      format.html { redirect_to supply_costs_url, notice: 'Supply cost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_supply_cost
    @supply_cost = SupplyCost.find(params[:id])
  end

  def supply
    @supply ||= Supply.find(params[:supply_id])
  end

  # Only allow a list of trusted parameters through.
  def supply_cost_params
    params.require(:supply_cost).permit(:name, :value, :operation_type, :data, :supply_id, :type)
  end
end
