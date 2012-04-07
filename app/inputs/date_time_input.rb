class DateTimeInput < SimpleForm::Inputs::DateTimeInput

  def input
    @builder.text_field(attribute_name, {:class => "datepicker"})
  end

end
