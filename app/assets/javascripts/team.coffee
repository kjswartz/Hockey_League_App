# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:change', ->
  $('#membershiprequestModal').click ->
    $('#basicModal').modal 'show'
  $('#eventcalendarModal').click ->
    $('#eventModal').modal 'show'
  # enable chosen js
  $('.chosen-select').chosen
    width: '300px'
    no_results_text: "Oops, nothing found!"
    allow_single_deselect: true
