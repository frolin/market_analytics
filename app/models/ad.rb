# == Schema Information
#
# Table name: ads
#
#  id          :bigint           not null, primary key
#  advert_id   :bigint
#  store_id    :bigint
#  ad_type     :integer
#  status      :integer
#  create_time :datetime
#  change_time :datetime
#  data        :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  notified    :boolean          default(FALSE)
#
class Ad < ApplicationRecord
  audited
  belongs_to :store

  # Статус РК:
  # 9 - идут показы
  # 11 - РК на паузе
  # Тип РК:
  # 4 - реклама в каталоге
  # 5 - реклама в карточке товара
  # 6 - реклама в поиске
  # 7 - реклама в рекомендациях на главной странице

  enum status: { show: 9, pause: 11 }
  enum ad_type: { catalog: 4, card_list: 5, search: 6, recommendation: 7 }

  store_accessor  :data, :daily_budget, :price, :set_id, :subject_name

  attr_accessor :skip_notify
  after_update :notify

  def notify
    return if skip_notify

    Telegram::Notifications::AdsApi.new(self).call
  end

end
