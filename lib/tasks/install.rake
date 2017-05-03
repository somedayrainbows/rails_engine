require 'csv'

namespace :csv do
  task :import => :environment do
    CSV.foreach('data/transactions.csv', headers: true, encoding: "ISO-8859-1:UTF-8") do |row|
      Transaction.create([
                          invoice_id: row["invoice_id"],
                          credit_card_number: row["credit_card_number"],
                          credit_card_expiration_date: rotw["credit_card_expiration_date"],
                          result: row["result"],
                          transaction_created_at: row["created_at"],
                          transaction_updated_at: row["updated_at"]
                         ])
    end
  end
end
