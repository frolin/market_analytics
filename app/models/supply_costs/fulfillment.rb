module SupplyCosts
  class Fulfillment < SupplyCost
    DEFAULT_TARIFF = {
      '450' => 37,
      '500' => 37,
      '750' => 38,
      '1000' => 39,
      '3000' => 43
    }.freeze


    store_accessor :data

  end
end
