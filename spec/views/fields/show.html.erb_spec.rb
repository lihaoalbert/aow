require 'spec_helper'

describe "fields/show" do
  before(:each) do
    @field = assign(:field, stub_model(Field,
      :name => "Name",
      :label => "Label",
      :field_group_id => 1,
      :as => "As",
      :collection => "MyText",
      :position => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Label/)
    rendered.should match(/1/)
    rendered.should match(/As/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
  end
end
