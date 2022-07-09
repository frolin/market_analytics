class YandexApiUpdateJob
  include Sidekiq::Job

  def perform(import_id)
    import = Import.find(import_id)

    # Imports::YandexMarket::Products.run(import: import)
    Imports::YandexMarket::Orders.run(import: import)
    # Imports::YandexMarket::Costs.run(campaign: campaign)
  end
end
