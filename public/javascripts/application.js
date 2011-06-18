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

$(document).ready(function (){

/** 
 * Sidebar menus
 * Slidetoggle for menu list
 * */
var currentMenu = null; 
$('#sidebar>ul>li[class!="nosubmenu"]>a').each(function(){
    if(!$(this).parent().hasClass('current')){
        $(this).parent().find('ul:first').hide();
    }else{
        currentMenu = $(this); 
    }
    $(this).click(function(){
        $('#sidebar>ul>li.current').removeClass('current'); 
        if(currentMenu != null && currentMenu.text() != $(this).text()){
            currentMenu.parent().find('ul:first').slideUp(); 
        }
        if(currentMenu != null && currentMenu.text() == $(this).text()){
            currentMenu.parent().find('ul:first').slideUp(); 
            currentMenu = null;
        }else{
            currentMenu = $(this);
            currentMenu.parent().addClass('current'); 
            currentMenu.parent().find('ul:first').slideDown(); 
        }
        return false;
    }); 
});

});