require 'spec_helper'

describe "companies/show" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :compNameEN => "Comp Name En",
      :compNameCN => "Comp Name Cn",
      :businessLine => "Business Line",
      :legalDuration => 1.5,
      :legalNature => "Legal Nature",
      :registeredCapital => 1.5,
      :investment => 1.5,
      :corpRepresentative => "Corp Representative",
      :regAddressEN => "Reg Address En",
      :regAddressCN => "Reg Address Cn",
      :operAddressEN => "Oper Address En",
      :operAddressCN => "Oper Address Cn",
      :postCode => "Post Code",
      :tel => "Tel",
      :fax => "Fax",
      :province => "Province",
      :city => "City",
      :county => "County",
      :datasource => "Datasource",
      :memo => "Memo",
      :registeredCapitalRMB => 1.5,
      :investmentRMB => "Investment Rmb",
      :status => 1,
      :statusYear => 2,
      :auditFlag => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Comp Name En/)
    rendered.should match(/Comp Name Cn/)
    rendered.should match(/Business Line/)
    rendered.should match(/1.5/)
    rendered.should match(/Legal Nature/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/Corp Representative/)
    rendered.should match(/Reg Address En/)
    rendered.should match(/Reg Address Cn/)
    rendered.should match(/Oper Address En/)
    rendered.should match(/Oper Address Cn/)
    rendered.should match(/Post Code/)
    rendered.should match(/Tel/)
    rendered.should match(/Fax/)
    rendered.should match(/Province/)
    rendered.should match(/City/)
    rendered.should match(/County/)
    rendered.should match(/Datasource/)
    rendered.should match(/Memo/)
    rendered.should match(/1.5/)
    rendered.should match(/Investment Rmb/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/false/)
  end
end
