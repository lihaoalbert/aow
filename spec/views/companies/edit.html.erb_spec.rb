require 'spec_helper'

describe "companies/edit" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :compNameEN => "MyString",
      :compNameCN => "MyString",
      :businessLine => "MyString",
      :legalDuration => 1.5,
      :legalNature => "MyString",
      :registeredCapital => 1.5,
      :investment => 1.5,
      :corpRepresentative => "MyString",
      :regAddressEN => "MyString",
      :regAddressCN => "MyString",
      :operAddressEN => "MyString",
      :operAddressCN => "MyString",
      :postCode => "MyString",
      :tel => "MyString",
      :fax => "MyString",
      :province => "MyString",
      :city => "MyString",
      :county => "MyString",
      :datasource => "MyString",
      :memo => "MyString",
      :registeredCapitalRMB => 1.5,
      :investmentRMB => "MyString",
      :status => 1,
      :statusYear => 1,
      :auditFlag => false
    ))
  end

  it "renders the edit company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => companies_path(@company), :method => "post" do
      assert_select "input#company_compNameEN", :name => "company[compNameEN]"
      assert_select "input#company_compNameCN", :name => "company[compNameCN]"
      assert_select "input#company_businessLine", :name => "company[businessLine]"
      assert_select "input#company_legalDuration", :name => "company[legalDuration]"
      assert_select "input#company_legalNature", :name => "company[legalNature]"
      assert_select "input#company_registeredCapital", :name => "company[registeredCapital]"
      assert_select "input#company_investment", :name => "company[investment]"
      assert_select "input#company_corpRepresentative", :name => "company[corpRepresentative]"
      assert_select "input#company_regAddressEN", :name => "company[regAddressEN]"
      assert_select "input#company_regAddressCN", :name => "company[regAddressCN]"
      assert_select "input#company_operAddressEN", :name => "company[operAddressEN]"
      assert_select "input#company_operAddressCN", :name => "company[operAddressCN]"
      assert_select "input#company_postCode", :name => "company[postCode]"
      assert_select "input#company_tel", :name => "company[tel]"
      assert_select "input#company_fax", :name => "company[fax]"
      assert_select "input#company_province", :name => "company[province]"
      assert_select "input#company_city", :name => "company[city]"
      assert_select "input#company_county", :name => "company[county]"
      assert_select "input#company_datasource", :name => "company[datasource]"
      assert_select "input#company_memo", :name => "company[memo]"
      assert_select "input#company_registeredCapitalRMB", :name => "company[registeredCapitalRMB]"
      assert_select "input#company_investmentRMB", :name => "company[investmentRMB]"
      assert_select "input#company_status", :name => "company[status]"
      assert_select "input#company_statusYear", :name => "company[statusYear]"
      assert_select "input#company_auditFlag", :name => "company[auditFlag]"
    end
  end
end
