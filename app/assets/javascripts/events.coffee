# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:change', ->
  $("#new_event").on("ajax:success", (e, data, status, xhr) ->
    $("#new_event").append xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_event").append "<p>ERROR</p>"
