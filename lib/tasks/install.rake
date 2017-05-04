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
end
