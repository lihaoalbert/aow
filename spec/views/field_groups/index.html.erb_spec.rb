require 'spec_helper'

describe "field_groups/index" do
  before(:each) do
    assign(:field_groups, [
      stub_model(FieldGroup,
        :name => "Name",
        :label => "Label",
        :position => 1,
        :tag_id => 2
      ),
      stub_model(FieldGroup,
        :name => "Name",
        :label => "Label",
        :position => 1,
        :tag_id => 2
      )
    ])
  end

  it "renders a list of field_groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
