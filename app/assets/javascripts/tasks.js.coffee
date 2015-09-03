# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ajax:before', '.task-toggle', () ->
  $(this).find('button').prop('disabled', true)

$(document).on 'ajax:success', '.task-toggle', (event, data, status, xhr) ->
  taskId = $(this).data('task-id')
  $(".tasks .task-#{taskId}").replaceWith(data)
