# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    compNameEN "MyString"
    compNameCN "MyString"
    businessLine "MyString"
    foundationDate "2012-03-28"
    legalDuration 1.5
    legalNature "MyString"
    registeredCapital 1.5
    investment 1.5
    corpRepresentative "MyString"
    regAddressEN "MyString"
    regAddressCN "MyString"
    operAddressEN "MyString"
    operAddressCN "MyString"
    postCode "MyString"
    tel "MyString"
    fax "MyString"
    province "MyString"
    city "MyString"
    county "MyString"
    datasource "MyString"
    memo "MyString"
    registeredCapitalRMB 1.5
    investmentRMB "MyString"
    status 1
    statusYear 1
    auditFlag false
  end
end
