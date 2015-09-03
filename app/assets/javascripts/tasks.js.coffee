# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ajax:before', '.task-toggle', () ->
  $(this).find('button').prop('disabled', true)

$(document).on 'ajax:success', '.task-toggle', (event, data, status, xhr) ->
  taskId = $(this).data('task-id')
  $(".tasks .task-#{taskId}").replaceWith(data)
  fix_name_category_width_for_reordering()


fix_name_category_width_for_reordering = ->
  table_width = $('.tasks').width()
  desired_width = table_width - 30 - 100 + 'px' # 30 (checkbox), 100 (actions)
  $('.tasks td.task-name-category').css('width', desired_width)


$(document).on 'ready page:load', ->

  if $('.tasks').length > 0

    fix_name_category_width_for_reordering()

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
