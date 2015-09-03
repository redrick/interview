# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ajax:before', '.task-toggle', () ->
  $(this).find('button').prop('disabled', true)

$(document).on 'ajax:success', '.task-toggle', (event, data, status, xhr) ->
  taskId = $(this).data('task-id')
  $(".tasks .task-#{taskId}").replaceWith(data)
  init_sortable_td_width()


init_sortable_td_width = ->
  table_width = $('.tasks').width()
  cells = $('.tasks').find('tr')[0].cells.length
  desired_width = table_width / cells + 'px'
  $('.tasks td').css('width', desired_width)
  console.log(desired_width)


$ ->

  if $('.tasks').length > 0

    init_sortable_td_width()

    $('.tasks').sortable(
      axis: 'y'
      items: '.task'
      cursor: 'move'

      sort: (e, ui) ->
        ui.item.addClass('active-item-shadow')
      stop: (e, ui) ->
        ui.item.removeClass('active-item-shadow')
        ui.item.children('td').effect('highlight', {}, 1000)
      update: (e, ui) ->
        item_id = ui.item.data('id')
        position = ui.item.index() # this will not work with paginated items, as the index is zero on every page
        $.ajax(
          type: 'PATCH'
          url: "/tasks/#{item_id}/reorder"
          data: { order_position: position }
        )
    )
