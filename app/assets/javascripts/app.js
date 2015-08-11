// Application specific javascript here.

$(document).ready(function() {
  readyFunctions();
});

var readyFunctions = function() {
  fieldsWithErrors();
  toggles();
}

var fieldsWithErrors = function() {
  $("span[data-behaviour='field_with_errors']").each(function(i, el) {
    $(el).removeAttr('data-behaviour');
    var $formGroup = $(el).closest('div.form-group');
    var last = $formGroup.children().last();
    last.append($(el));
    $formGroup.addClass('has-error');
  });
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
