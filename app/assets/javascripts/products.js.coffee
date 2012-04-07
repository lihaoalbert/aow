# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $(".chzn-select").chosen()
  display_field_groups($("#product_field_group_list_").val())
  $("#product_field_group_list_").chosen().change( ->
    display_field_groups($("#product_field_group_list_").val())
  )

# display field_groups by the value of the field group select
display_field_groups = (groups) ->
  $("#field_groups > div").hide()
  display_field_group group for group in groups if groups != null

# display field_group of specify group
display_field_group = (group) ->
  $("#field_group_"+group+"_container").show()
