// Backoffice utilies
var teleop = {
  
  remove_fields: function(link, selector) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(selector).hide(200);
  },

  add_fields: function(link, association, content, selector) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    $content = $(content.replace(regexp, new_id)).hide();
    $(link).parent().siblings(selector).append($content);
    $content.slideDown(200);
  }
}