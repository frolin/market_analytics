# == Schema Information
#
# Table name: supplies
#
#  id         :bigint           not null, primary key
#  name       :string
#  store_id   :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  data       :jsonb
#
class Supply < ApplicationRecord
  belongs_to :store
  belongs_to :user
  has_one :unit_economic

  has_many :report_sales, foreign_key: :gi_id, primary_key: :name
  has_many :supply_costs

  has_many :supply_products, dependent: :destroy
  has_many :products, through: :supply_products

  after_initialize :data_defaults, :if => :new_record?
  # store_accessor :data

  def data_defaults
    self.data = {
      order_date: Date.today,
      delivered_date: Date.today,
      price: 0,
      exchange_rate: 12,
      cost_price: 100.00
    }
  end


  def cost_price

  end

  def data_parse

    # product_id
    # Дата заказа
    # Дата прихода
    # Курс
    # Цена, юань
    # Закупка, руб
    # Кол-во, шт

    # Вес, кг
    # Доставка
    # Себестоимость, руб
    # Сумма, руб
    # Цена товара поставки
    # Скидка
    # Промо
    # Цена продажи

    # Брак
    # СПП	цена
    # СПП
    # Комиссия %
    # Комиссия
    # % выкупа
    # Доставка, шт
    # Доставка
    # Хранение
    # Реклама на 1 ед

    # Выручка с единицы, руб
    # Выручка, сумма
    # Налог
    # Прибыль с единицы, руб
    # Прибыль с партии, руб
    # Маржинальность
    # Рентабельность вложений
    # Рентабельность продаж
  end

end
