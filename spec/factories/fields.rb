# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :field do
    name "MyString"
    label "MyString"
    field_group_id 1
    as "MyString"
    collection "MyText"
    position 1
  end
end
