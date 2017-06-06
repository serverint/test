$("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
     $("#menu-toggle-2").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled-2");
        $('#menu ul').hide();
    });
 
     function initMenu() {
      $('#menu ul').hide();
      $('#menu ul').children('.current').parent().show();
      //$('#menu ul:first').show();
	  $('ul#menu  li').each(function(){
			  if ($(this).children().length > 1 ) {				 
				  	$(this).children('a').append('<span class="arrow"></span>');
			  }						 					 
			});
	  
	
      $('#menu li a').click(
        function() {
          var checkElement = $(this).next();		 
          if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
			  checkElement.slideToggle('normal');
			  $('.arrow').removeClass('down');
            return false;
			
            }
          if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
			   $(this).parent().toggleClass('current');
			   $(this).parent().siblings().removeClass('current');
            $('#menu ul:visible').slideUp('normal');			
			$('.arrow').addClass('down');
			$(this).parent().siblings().find('.arrow').removeClass('down');
            checkElement.slideToggle('normal');			
            return false;
            }
          }
        );
      }
	  
    $(document).ready(function() {initMenu();});