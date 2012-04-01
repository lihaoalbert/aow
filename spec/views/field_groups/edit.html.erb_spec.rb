require 'spec_helper'

describe "field_groups/edit" do
  before(:each) do
    @field_group = assign(:field_group, stub_model(FieldGroup,
      :name => "MyString",
      :label => "MyString",
      :position => 1,
      :tag_id => 1
    ))
  end

  it "renders the edit field_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => field_groups_path(@field_group), :method => "post" do
      assert_select "input#field_group_name", :name => "field_group[name]"
      assert_select "input#field_group_label", :name => "field_group[label]"
      assert_select "input#field_group_position", :name => "field_group[position]"
      assert_select "input#field_group_tag_id", :name => "field_group[tag_id]"
    end
  end
end
