# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('body.bounties.index').ready ->
    $('#bounties-table').DataTable
        order: [[2, 'desc'], [0, 'asc'], [1, 'asc']]
        autoWidth: false
