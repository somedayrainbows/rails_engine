require "csv"

namespace :install do
  task :ensure_development_environment => :environment do
    if Rails.env.production?
      raise "\nCurrently in production environment.\n Can't drop production database."
    end
  end
  
  desc "Run all rake tasks for install in test environment"
  task :all => [:ensure_development_environment,
                    "db:drop",
                    "db:create",
                    "db:migrate",
                    "db:test:prepare",
                    "db:seed"]
end
