# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:change', ->
  $('#lstable').DataTable
    destroy: true
    responsive: true
    bJqueryUI: true
    scrollY: 300
    paging: false
  $('#lstatstable').DataTable
    destroy: true
    responsive: true
    bJqueryUI: true
    scrollY: 300
    paging: false

  $('#leagueWeeklyScheduleButton').click ->
    $('#leagueWeeklySchedule').toggle()
    $('#leagueSeason').hide()
    $('#leagueStats').hide()
    $('#leaguePriorGames').hide()

  $('#leagueSeasonButton').click ->
    $('#leagueSeason').toggle()
    $('#leagueWeeklySchedule').hide()
    $('#leagueStats').hide()
    $('#leaguePriorGames').hide()

  $('#leagueStatsButton').click ->
    $('#leagueStats').toggle()
    $('#leagueWeeklySchedule').hide()
    $('#leagueSeason').hide()
    $('#leaguePriorGames').hide()

  $('#leaguePriorGamesButton').click ->
    $('#leaguePriorGames').toggle()
    $('#leagueWeeklySchedule').hide()
    $('#leagueSeason').hide()
    $('#leagueStats').hide()
