FactoryBot.define do
  factory :order do
    pickup_location { "MyString" }
    dropoff_location { "MyString" }
    weight { "9.99" }
    status { "MyString" }
  end
end
