// Application specific javascript here.

$(document).ready(function() {
  readyFunctions();
});

var readyFunctions = function() {
  toggles();
}

var toggles = function() {
  $("[data-behaviour='toggle']").each(function(i, el) {
    var div = $(el);
    div.removeAttr('data-behaviour');
    div.children('a').bind("ajax:beforeSend", function(ev, data, status, xhr) {
      $(this).removeClass('btn-success').removeClass('btn-danger').addClass('btn-warning');
    });
    div.children('a').bind("ajax:success", function(ev, data, status, xhr) {
      if(!xhr.getResponseHeader('Content-Type').match('text/javascript')) {
        div.replaceWith(data);
        toggles();
      }
    });
  });
}
