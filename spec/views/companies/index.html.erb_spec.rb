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
    assert_select "tr>td", :text => "Comp Name Cn".to_s, :count => 2
    assert_select "tr>td", :text => "Business Line".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Legal Nature".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Corp Representative".to_s, :count => 2
    assert_select "tr>td", :text => "Reg Address En".to_s, :count => 2
    assert_select "tr>td", :text => "Reg Address Cn".to_s, :count => 2
    assert_select "tr>td", :text => "Oper Address En".to_s, :count => 2
    assert_select "tr>td", :text => "Oper Address Cn".to_s, :count => 2
    assert_select "tr>td", :text => "Post Code".to_s, :count => 2
    assert_select "tr>td", :text => "Tel".to_s, :count => 2
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
    assert_select "tr>td", :text => "Province".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "County".to_s, :count => 2
    assert_select "tr>td", :text => "Datasource".to_s, :count => 2
    assert_select "tr>td", :text => "Memo".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Investment Rmb".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
