require 'faker'

FactoryGirl.define do
  factory :item do
    name { Faker::Book.title }
    description { Faker::Book.author }
  end
end