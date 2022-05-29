class ApiUpdateJob
  include Sidekiq::Job

  def perform(import_id)
    Imports::YandexMarket::Products.run(import: Import.find(import_id))
    # Imports::YandexMarket::Orders.run(campaign: campaign)
    # Imports::YandexMarket::Costs.run(campaign: campaign)
  end
end
