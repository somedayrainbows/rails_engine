FactoryGirl.define do
  factory :invoice do
    name "baseball bat"
    description "used to hit baseballs"
    customer
    merchant
  end
end
