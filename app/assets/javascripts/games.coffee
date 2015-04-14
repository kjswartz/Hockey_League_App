# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:change', ->
  $('.chosen-selectt').chosen
    width: '400px'
    no_results_text: "Oops, nothing found!"
    allow_single_deselect: true
  $('#adminSeasonTable').DataTable
    destroy: true
    responsive: true
    bJqueryUI: true
    scrollY: 300
    paging: false
