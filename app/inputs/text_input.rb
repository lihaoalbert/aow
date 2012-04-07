class TextInput < SimpleForm::Inputs::TextInput
  def input
    @builder.text_area(attribute_name, {:rows => 4}.merge(input_html_options))
  end
end
