class CreateSalesReports < ActiveRecord::Migration[7.0]
  def change
    create_table :sales_reports do |t|
      t.references :store, null: false, foreign_key: true
      t.string :barcode, null: false, foreign_key: true, index: true
      t.date :date_from
      t.date :date_to
      t.datetime :create_dt
      t.datetime :order_dt
      t.datetime :sale_dt
      t.datetime :rr_dt
      t.integer :quantity
      t.string :subject_name
      t.string :realizationreport_id
      t.string :doc_type_name
      t.string :srid, uniq: true
      t.string :rid
      t.string :nm_id
      t.string :gi_id, foreign_key: true, index: true
      t.string :rrd_id
      t.string :declaration_number
      t.string :site_country
      t.string :ts_name
      t.string :sa_name
      t.string :brand_name
      t.string :office_name
      t.string :supplier_oper_name
      t.string :suppliercontract_code
      t.decimal :retail_price, precision: 18, scale: 4
      t.decimal :retail_amount, precision: 18, scale: 4
      t.decimal :commission_percent, precision: 18, scale: 4
      t.decimal :sale_percent, precision: 18, scale: 4
      t.decimal :retail_price_withdisc_rub, precision: 18, scale: 4

      t.decimal :penalty, precision: 18, scale: 4
      t.decimal :additional_payment, precision: 18, scale: 4
      t.decimal :acquiring_fee, precision: 18, scale: 4
      t.decimal :acquiring_bank, precision: 18, scale: 4
      t.decimal :product_discount_for_report, precision: 18, scale: 4
      t.decimal :delivery_rub, precision: 18, scale: 4
      t.decimal :return_amount, precision: 18, scale: 4
      t.decimal :delivery_amount, precision: 18, scale: 4
      t.integer :supplier_promo

      t.decimal :ppvz_spp_prc, precision: 18, scale: 4
      t.decimal :ppvz_kvw_prc_base, precision: 18, scale: 4
      t.decimal :ppvz_kvw_prc, precision: 18, scale: 4
      t.decimal :ppvz_sales_commission, precision: 18, scale: 4
      t.decimal :ppvz_for_pay, precision: 18, scale: 4
      t.decimal :ppvz_reward, precision: 18, scale: 4
      t.decimal :ppvz_vw, precision: 18, scale: 4
      t.decimal :ppvz_vw_nds, precision: 18, scale: 4
      t.string :ppvz_office_id
      t.string :ppvz_office_name
      t.string :ppvz_supplier_id
      t.string :ppvz_supplier_name
      t.string :ppvz_inn

      t.string :kiz
      t.string :shk_id
      t.string :bonus_type_name
      t.string :sticker_id
      t.string :gi_box_type_name
      t.timestamps

      #
      # "suppliercontract_code": null,
      # "rrd_id": 1232610467,
      # "gi_id": 123456,
      #
      # "nm_id": 1234567,
      # "brand_name": "BlahBlah",
      # "sa_name": "MAB123",
      # "ts_name": "0",
      # "doc_type_name": "Продажа",
      # "quantity": 1,
      # "retail_price": 1249,
      # "retail_amount": 367,
      # "sale_percent": 68,
      # "commission_percent": 0.1324,
      # "office_name": "Коледино",
      # "supplier_oper_name": "Продажа",
      # "order_dt": "2022-10-13T00:00:00Z",
      # "sale_dt": "2022-10-20T00:00:00Z",
      # "rr_dt": "2022-10-20T00:00:00Z",
      # "shk_id": 1239159661,
      # "retail_price_withdisc_rub": 399.68,
      # "delivery_amount": 0,
      # "return_amount": 0,
      # "delivery_rub": 0,
      # "gi_box_type_name": "Монопалета",
      # "product_discount_for_report": 399.68,
      # "supplier_promo": 0,
      # "rid": 123722249253,
      # "ppvz_spp_prc": 0.1581,
      # "ppvz_kvw_prc_base": 0.15,
      # "ppvz_kvw_prc": -0.0081,
      # "ppvz_sales_commission": -3.74,
      # "ppvz_for_pay": 376.99,
      # "ppvz_reward": 0,
      # "acquiring_fee": 14.89,
      # "acquiring_bank": "Тинькофф",
      # "ppvz_vw": -3.74,
      # "ppvz_vw_nds": -0.75,
      # "ppvz_office_id": 105383,
      # "ppvz_office_name": "Пункт самовывоза (ПВЗ)",
      # "ppvz_supplier_id": 186465,
      # "ppvz_supplier_name": "ИП Жасмин",
      # "ppvz_inn": "010101010101",
      # "declaration_number": "",
      # "bonus_type_name": "Штраф МП. Невыполненный заказ (отмена клиентом после недовоза)",
      # "sticker_id": "1964038895",
      # "site_country": "RU",
      # "penalty": 231.35,
      # "additional_payment": 0,
      # "kiz": "0102900000376311210G2CIS?ehge)S\u001d91002A\u001d92F9Qof4FDo/31Icm14kmtuVYQzLypxm3HWkC1vQ/+pVVjm1dNAth1laFMoAGn7yEMWlTjxIe7lQnJqZ7TRZhlHQ==",
      #

    end
  end
end
