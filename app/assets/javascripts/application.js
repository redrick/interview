// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require html.sortable
//= require_tree .


var ready, set_positions;

set_positions = function(){
    // loop through and give each task a data-pos
    // attribute that holds its position in the DOM
    $('.task').each(function(i){
        $(this).attr("data-pos",i+1);
    });
}

ready = function(){

    // call set_positions function
    set_positions();

    $('.sortable').sortable();

    $('.sortable').sortable().bind('sortupdate', function(e, ui) {
        // array to store new order
        updated_order = []
        // set the updated positions
        set_positions();

        // populate the updated_order array with the new task positions
        $('.task').each(function(i){
            updated_order.push({ id: $(this).data('id'), position: i+1 });
        });
        var user_id = $('.tasks').data('user-id');
        // send the updated order via ajax
        $.ajax({
            type: 'PATCH',
            url: '/users/'+user_id+'/tasks/sort',
            data: { order: updated_order }
        });
    });
}

$(document).on('ready', ready);
$(document).on('page:load', ready);
