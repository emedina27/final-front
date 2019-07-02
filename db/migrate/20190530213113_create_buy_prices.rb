class CreateBuyPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_prices do |t|
      t.integer :pennies
      # t.references :stock_sales, null: false, foreign_key: true

      t.timestamps
    end
  end
end
