require 'csv'

namespace :csv do
  task :items => :environment do
    CSV.foreach('data/items.csv', headers: true, encoding: "ISO-8859-1:UTF-8") do |row|
      Item.create([
                          name: row["name"],
                          description: row["description"],
                          unit_price: row["unit_price"],
                          created_at: row["created_at"],
                          updated_at: row["updated_at"]
                         ])
    end
  end
  task :transactions => :environment do
    CSV.foreach('data/transactions.csv', headers: true, encoding: "ISO-8859-1:UTF-8") do |row|
      Transaction.create([
                          credit_card_number: row["credit_card_number"],
                          credit_card_expiration_date: row["credit_card_expiration_date"],
                          result: row["result"],
                          created_at: row["created_at"],
                          updated_at: row["updated_at"],
                          invoice_id: row["invoice_id"]

                           ])
    end
  end
end
