$(document).ready(function(){
		
		bodyMinHeight();
		centerContent();
		// For Collaapse
		$('.btn-collaapse').click(function(){
										
			if($(this).attr('aria-expanded') == 'true' ){
				$(this).html('<i class="fa fa-minus"></i>');				
				}else
				{
					$(this).html('<i class="fa fa-plus"></i>');
					}
										   
		});
		
				// For Remove
		$('.btn-remove').click(function(){
										
			$(this).parents('.box-remove').hide();
										   
		});
		
		// For accordion
		function toggleChevron(e) {
    $(e.target)
        .prev('.panel-heading')
        .find("i.indicator")
        .toggleClass('fa-minus');
		}
		$('#accordion').on('hidden.bs.collapse', toggleChevron);
		$('#accordion').on('shown.bs.collapse', toggleChevron);
						   
});

$(window).resize(function(){		
		bodyMinHeight();
						   
});


// For main body min height
function bodyMinHeight(){
		var windowHeight = $(document).height();
		var headerHeight = $('.nav-head').height();
		var footerHeight = $('.footer').height();
		var contentHeight = ((windowHeight - headerHeight) - footerHeight);		
		$('.main-body ').css('min-height', contentHeight-10);
	}
	
// For login box center 
$(window).resize(function()
{
	centerContent();
});


function centerContent()
				  {
					$(".loginBox").each(function(){						
						var boxHeight = $(this).height();
						var boxWidth  = $(this).width();
						var boxTopPos = boxHeight / 2 * -1 ;
						var boxLeftPos = boxWidth / 2 * -1;
						
						$(this).css('margin-left', boxLeftPos + "px");
						$(this).css('margin-top', boxTopPos + "px");
					})
					}	