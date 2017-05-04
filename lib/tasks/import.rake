require 'csv'

namespace :csv do
  task :import => :environment do
    CSV.foreach('data/items.csv', headers: true, encoding: "ISO-8859-1:UTF-8") do |row|
      Merchant.create!([
                        name: row["name"],
                        created_at: row["created_at"],
                        updated_at: row["updated_at"]

                        ])
      Item.create!([
                          name: row["name"],
                          description: row["description"],
                          unit_price: row["unit_price"],
                          merchant_id: row["merchant_id"],
                          created_at: row["created_at"],
                          updated_at: row["updated_at"]
                         ])
    end

    CSV.foreach('data/invoices.csv', headers: true, encoding: "ISO-8859-1:UTF-8") do |row|
			

      Customer.create!([
                      first_name: row["first_name"],
                      last_name: row["last_name"],
                      created_at: row["created_at"],
                      updated_at: row["updated_at"]
                      ])
                        
      Transaction.create!([
                          credit_card_number: row["credit_card_number"],
                          credit_card_expiration_date: row["credit_card_expiration_date"],
                          result: row["result"],
                          created_at: row["created_at"],
                          updated_at: row["updated_at"],
                          invoice_id: row["invoice_id"]

                           ])
      Invoice.create!([
                        merchant_id: row["merchant_id"],
                        customer_id: row["customer_id"],
                        created_at: row["created_at"],
                        updated_at: row["updated_at"]
                      ])
    end
  end
end
