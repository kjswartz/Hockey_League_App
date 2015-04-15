# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:change', ->
  schedTable = $('#lstable').DataTable
    destroy: true
    responsive: true
    bJqueryUI: true
    scrollY: 300
    paging: false
  statsTable = $('#lstatstable').DataTable
    destroy: true
    responsive: true
    bJqueryUI: true
    scrollY: 300
    paging: false
    order: [4, 'desc']
  scoresTable = $('#lscorestable').DataTable
    destroy: true
    responsive: true
    bJqueryUI: true
    scrollY: 300
    paging: false

  $('#leagueWeeklyScheduleButton').click ->
    $('#leagueWeeklySchedule').show()
    $('#leagueSeason').hide()
    $('#leagueStats').hide()
    $('#leagueScores').hide()

  $('#leagueSeasonButton').click ->
    $('#leagueSeason').show()
    $('#leagueWeeklySchedule').hide()
    $('#leagueStats').hide()
    $('#leagueScores').hide()
    schedTable.draw()

  $('#leagueStatsButton').click ->
    $('#leagueStats').show()
    $('#leagueWeeklySchedule').hide()
    $('#leagueSeason').hide()
    $('#leagueScores').hide()
    statsTable.draw()

  $('#leagueScoresButton').click ->
    $('#leagueScores').show()
    $('#leagueWeeklySchedule').hide()
    $('#leagueSeason').hide()
    $('#leagueStats').hide()
    scoresTable.draw()
