# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->

  $('.project').hover (event) ->
    $(this).toggleClass("hover")

  $('.shap').hover (event) ->
    $(this).toggleClass("hover")

$(document).ready(ready)
$(document).on('page:load', ready)