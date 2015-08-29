# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    table = $('#scoreboard').DataTable
        order: [[3, 'desc']]
        columnDefs: [
                targets: ['rank', 'avatar']
                orderable: false
                searchable: false
            ,
                targets: ['score', 'commits', 'additions', 'deletions']
                render: (data, type, _row, _meta) ->
                    if type is 'display'
                        return data
                    else
                        return data.replace(/[^\d]/g, '')
        ]
        bFilter: false
        paging: false
        autoWidth: false

    # Recalculate rank column when table changes, so it stays fixed
    table.on 'order.dt search.dt', ->
        table.column '.rank',
            search: 'applied'
            order: 'applied'
        .nodes().each (cell, i) ->
            cell.innerHTML = (i + 1) + '.'
