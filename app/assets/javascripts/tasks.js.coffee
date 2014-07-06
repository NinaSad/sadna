# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('.task').hover (event) ->
    $(this).toggleClass("hover")

  $("#myTable").tablesorter()

  $("#date").datepicker({
    format: 'yyyy-mm-dd'
  })
  $("#due_date").datepicker('setValue' ,new Date())
  $("#start_date").datepicker('setValue' ,new Date())

#filter by assigned to me button
  login_name = $("#login_name").text();

  $('#menu_assigned_to_me').click (e) ->
    $("tr.task").each( (index,ele) ->
      if $(ele).children('.assignee').text() != login_name
        $(ele).remove())

#filter by created by me button
  $('#menu_created_by_me').click (e) ->
    $("tr.task").each( (index,ele) ->
      if $(ele).children('.created_by').text() != login_name
        $(ele).remove())

$(document).ready(ready)
$(document).on('page:load', ready)