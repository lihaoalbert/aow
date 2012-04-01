require 'spec_helper'

describe "fields/edit" do
  before(:each) do
    @field = assign(:field, stub_model(Field,
      :name => "MyString",
      :label => "MyString",
      :field_group_id => 1,
      :as => "MyString",
      :collection => "MyText",
      :position => 1
    ))
  end

  it "renders the edit field form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => fields_path(@field), :method => "post" do
      assert_select "input#field_name", :name => "field[name]"
      assert_select "input#field_label", :name => "field[label]"
      assert_select "input#field_field_group_id", :name => "field[field_group_id]"
      assert_select "input#field_as", :name => "field[as]"
      assert_select "textarea#field_collection", :name => "field[collection]"
      assert_select "input#field_position", :name => "field[position]"
    end
  end
end
