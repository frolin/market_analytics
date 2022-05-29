class CampaignsController < ApplicationController
	before_action :set_campaign, only: %i[ show edit update destroy, api_update]
	before_action :set_market

	# GET /campaigns or /campaigns.json
	def index
		@campaigns = @market.campaigns
	end

	# GET /campaigns/1 or /campaigns/1.json
	def show
	end

	# GET /campaigns/new
	def new
		@campaign = @market.campaigns.new
	end

	# GET /campaigns/1/edit
	def edit
	end

	# POST /campaigns or /campaigns.json
	def create
		@campaign = @market.campaigns.new(campaign_params)

		respond_to do |format|
			if @campaign.save
				format.html { redirect_to market_campaign_url(@market, @campaign), notice: "Campaign was successfully created." }
				format.json { render :show, status: :created, location: @campaign }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json { render json: @campaign.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /campaigns/1 or /campaigns/1.json
	def update
		respond_to do |format|
			if @campaign.update(campaign_params)
				format.html { redirect_to market_campaign_url(@market, @campaign), notice: "Campaign was successfully updated." }
				format.json { render :show, status: :ok, location: @campaign }
			else
				format.html { render :edit, status: :unprocessable_entity }
				format.json { render json: @campaign.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /campaigns/1 or /campaigns/1.json
	def destroy
		@campaign.destroy

		respond_to do |format|
			format.html { redirect_to market_campaigns_url, notice: "Campaign was successfully destroyed." }
			format.json { head :no_content }
		end
	end

	def api_update
		Campaigns::ApiUpdate.run(campaign: @campaign)

		respond_to do |format|
			format.html { redirect_to markets_url, notice: "Обновление магазина поставлено в очередь" }
			format.json { head :no_content }
		end
	end

	private

	# Use callbacks to share common setup or constraints between actions.
	def set_campaign
		@campaign = Campaign.find_by(number: params[:id] || params[:campaign_id])
	end

	def set_market
		@market = Market.friendly.find(params[:market_id])
	end

	# Only allow a list of trusted parameters through.
	def campaign_params
		params.require(:campaign).permit(:name, :number, :market_id, :data, :token)
	end
end
