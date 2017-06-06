$(document).ready(function(){
	var message = $('.message').val();
	
	if(message != null && message != ''){
		jQuery.growl.error({
			message : message
		});
		$('.message').val('');
	}
	
	$('#loginForm').submit(function(){
		var loginID = $('#loginID').val();
		var password = $('#password').val();
		if(validationCheck(loginID, password)){
			return true;
		}
		return false;
	});
});

function validationCheck(loginID, password){
	var flag = true;
	
	if(isBlank(loginID, 'Username')){
		$('#loginID').val('');
		flag = false;
	}
	
	if(isBlank(password, 'Password')){
		 $('#password').val('');
		flag = false;
	}
	
	return flag;
}

function isBlank(string, field){
	if(string == null || string.trim() == ''){
		jQuery.growl.error({
			message : field + " can not be blank"
		});
		
		return true;
	}
	return false;
}