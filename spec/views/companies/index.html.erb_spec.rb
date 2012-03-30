require 'spec_helper'

describe "companies/index" do
  before(:each) do
    assign(:companies, [
      stub_model(Company,
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
      ),
      stub_model(Company,
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
      )
    ])
  end

  it "renders a list of companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Comp Name En".to_s, :count => 2
  end
end
