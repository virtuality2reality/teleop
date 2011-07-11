// Backoffice utilies
var teleop = {
  
  remove_fields: function(link, selector) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(selector).hide(200);
    $(link).closest(selector).find("input[type!=hidden]").remove();
  },

  add_fields: function(link, association, content, selector) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    $content = $(content.replace(regexp, new_id)).hide();
    $(link).parent().siblings(selector).append($content);
    $content.slideDown(200);
  }
}

$.fn.niceShow = function(duration) {
  duration = duration || 500;
  return $(this).slideDown().fadeTo(duration,1); 
};
$.fn.niceHide = function(duration) {
  duration = duration || 500;
  return $(this).fadeTo(duration,0).slideUp(); 
};

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

/**
 * Hide notification when close button is pressed
**/
$('.notif .close').click(function(){
   $(this).parent().fadeTo(500,0).slideUp(); 
   return false; 
});

/**
 * Fake Placeholder
 * User labels as placeholder for the next input
 * */
$('.placeholder,#content.login .input').each(function(){
   var label = $(this).find('label:first');
 var input = $(this).find('input:first,textarea:first'); 
   if(input.val() != ''){
       label.stop().hide(); 
   }
   input.focus(function(){
       if($(this).val() == ''){
            label.stop().fadeTo(500,0.5);  
       }
       $(this).parent().removeClass('error').find('.error-message').fadeOut(); 
   });
   input.blur(function(){
       if($(this).val() == ''){
            label.stop().fadeTo(500,1);  
       }
   });
   input.keypress(function(){
      label.stop().hide(); 
   });
   input.keyup(function(){
       if($(this).val() == ''){
            label.stop().fadeTo(500,0.5); 
       }
   });
 input.bind('cut copy paste', function(e) {
	label.stop().hide(); 
 });
});

});