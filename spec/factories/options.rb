# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :option, :class => 'Options' do
    name "MyString"
    value "MyText"
  end
end
