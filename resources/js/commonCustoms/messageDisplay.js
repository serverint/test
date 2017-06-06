jQuery(document).ready(function($){
	var success = $('.success').val();
	var error = $('.error').val();
	
   if(success != null && success != ''){
		$.growl.notice({
			message : success,
			location:'tc',
			size:'large'
			
		});
		$('.success').val('');
	}
	
	
	if(error != null && error != ''){
		$.growl.error({
			message : error,
		});
		$('.error').val('');
	}
});