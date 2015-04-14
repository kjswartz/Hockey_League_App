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

  $('#leagueWeeklyScheduleButton').click ->
    $('#leagueWeeklySchedule').show()
    $('#leagueSeason').hide()
    $('#leagueStats').hide()
    $('#leaguePriorGames').hide()

  $('#leagueSeasonButton').click ->
    $('#leagueSeason').show()
    $('#leagueWeeklySchedule').hide()
    $('#leagueStats').hide()
    $('#leaguePriorGames').hide()
    schedTable.draw()

  $('#leagueStatsButton').click ->
    $('#leagueStats').show()
    $('#leagueWeeklySchedule').hide()
    $('#leagueSeason').hide()
    $('#leaguePriorGames').hide()
    statsTable.draw()

  $('#leaguePriorGamesButton').click ->
    $('#leaguePriorGames').show()
    $('#leagueWeeklySchedule').hide()
    $('#leagueSeason').hide()
    $('#leagueStats').hide()
