class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :symbol
      # t.references :stock_sales, null: false, foreign_key: true
      t.references :financial_instrument, null: false, foreign_key: true

      t.timestamps
    end
  end
end
