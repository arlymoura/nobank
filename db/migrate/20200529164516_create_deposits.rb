class CreateDeposits < ActiveRecord::Migration[6.0]
  def change
    create_table :deposits do |t|
      t.decimal :value, default: 0.0
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
