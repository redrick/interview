$(function() {
  $('.sorted_table').sortable({
    containerSelector: 'table',
    itemPath: '> tbody',
    itemSelector: 'tr',
    placeholder: '<tr class="placeholder"/>',
    onDrop: function  ($item, container, _super) {
      var newIndex = $item.index();
      update_position(newIndex, $item.attr('id'))
      _super($item, container);
    }
  })

  var update_position = function(index, task_id){
    $.ajax({
      url: '/tasks/' + task_id,
      type: "PUT",
      dataType: "json",
      data: { task: { position: index } },
      // your ajax code
      beforeSend: function(){
        $("body").append("<div class='loader'></div>")
      },
      complete: function(){
        $('.loader').remove();
      },
      success: function(data, textStatus, xhr) {
        console.log(data)
      },
      error: function() {
        alert("Ajax error!")
      }
    });
  }
});


