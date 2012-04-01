require 'spec_helper'

describe "field_groups/show" do
  before(:each) do
    @field_group = assign(:field_group, stub_model(FieldGroup,
      :name => "Name",
      :label => "Label",
      :position => 1,
      :tag_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Label/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
