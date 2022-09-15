module Wb
  class OrderNotificationsWorker
    include Sidekiq::Worker

    sidekiq_retry_in do |count, exception|
      60 * (count + 1)
    end

    def perform
      today = DateTime.current.beginning_of_day..DateTime.current.end_of_day

      User.all.each do |user|
        user.wb.campaigns.each { |campaign|
          today_orders = campaign.orders.where(date: today, notified: false)
          next if today_orders.blank?

          Notifications::Tg.run!(user: user, campaign: campaign, data: today_orders, type: :today_orders)
          today_orders.update_all(notified: true)
        }
      end
    end
  end
end
