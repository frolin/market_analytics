module Costs
  class Update < ActiveInteraction::Base
    hash :params, default: {}, strip: false

    def execute
      update_logistics && update_fulfillment
    end


    private

    def update_logistics
      params[:logistic].each { |id, value| SupplyCosts::Logistic.find(id).update(value: value) }
    end

    def update_fulfillment
      params[:fulfillment].each { |id, value| SupplyCosts::Fulfillment.find(id).update(value: value) }
    end
  end
end