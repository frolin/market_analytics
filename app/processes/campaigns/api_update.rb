module Campaigns
  class ApiUpdate < ActiveInteraction::Base
    record :campaign

    def execute
      import = campaign.imports.create!

      case campaign.market.slug.to_sym
      when :yandex
        YandexApiUpdateJob.perform_async(import.id)
      when :ozone
        # Campaign::Ozone.run(campaign: campaign)
      when :wildberries
        # Campaign::Wildberries.run(campaign: campaign)
      end
    end
  end
end