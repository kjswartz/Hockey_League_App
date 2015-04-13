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
  teamScheduleTable = $('#tstable').DataTable
    destroy: true
    responsive: true
    bJqueryUI: true
    scrollY: 300
    paging: false
    order: [2, 'asc']

  $('#weeklyScheduleButton').click ->
    $('#weeklySchedule').show()
    $('#schedule').hide()
    $('#roster').hide()
    $('#teamStats').hide()

  $('#scheduleButton').click ->
    $('#schedule').show()
    $('#roster').hide()
    $('#teamStats').hide()
    $('#weeklySchedule').hide()
    teamScheduleTable.draw()

  $('#statsButton').click ->
    $('#teamStats').show()
    $('#roster').hide()
    $('#schedule').hide()
    $('#weeklySchedule').hide()

  $('#rosterButton').click ->
    $('#roster').show()
    $('#schedule').hide()
    $('#teamStats').hide()
    $('#weeklySchedule').hide()

  $('#playerSceduleButton').click ->
    $('#playerSchedules').toggle()
