class CreateFinancialInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :financial_instruments do |t|
      t.references :customer, null: false, foreign_key: true
      # t.references :stocks, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
