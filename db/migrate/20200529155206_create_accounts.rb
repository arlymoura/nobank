class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.decimal :balance, default: 0.0
      t.string :agency, default: '0001'
      t.string :account_number
      t.boolean :status, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :accounts, :account_number, unique: true
  end
end
