# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $(".chzn-select").chosen()
  $("#product_field_group_list_").chosen().change( ->
    display_field_groups($("#product_field_group_list_").val())
  )

display_field_groups = (groups) ->
  display_field_group group for group in groups if groups != null

display_field_group = (group) ->
  #alert(group)
