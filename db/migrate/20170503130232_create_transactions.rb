class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.text :credit_card_number
      t.date :credit_card_expiration_date
      t.string :result
    end
  end
end
