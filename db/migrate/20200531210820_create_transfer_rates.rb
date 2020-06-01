class CreateTransferRates < ActiveRecord::Migration[6.0]
  def change
    create_table :transfer_rates do |t|
      t.decimal :value
      t.references :transfer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
