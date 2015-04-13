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
    width: '500px'
    no_results_text: "Oops, nothing found!"
    allow_single_deselect: true
  $('#tstable').DataTable
    destroy: true
    responsive: true
    bJqueryUI: true
    scrollY: 300
    paging: false

  $('#weeklyScheduleButton').click ->
    $('#weeklySchedule').toggle()
    $('#schedule').hide()
    $('#roster').hide()
    $('#teamStats').hide()

  $('#scheduleButton').click ->
    $('#schedule').toggle()
    $('#roster').hide()
    $('#teamStats').hide()
    $('#weeklySchedule').hide()

  $('#statsButton').click ->
    $('#teamStats').toggle()
    $('#roster').hide()
    $('#schedule').hide()
    $('#weeklySchedule').hide()

  $('#rosterButton').click ->
    $('#roster').toggle()
    $('#schedule').hide()
    $('#teamStats').hide()
    $('#weeklySchedule').hide()
