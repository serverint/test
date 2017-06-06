jQuery(document).ready(function($) {
	$("#admin-user-login-form").submit(function(e) {

		var flag = true;

		var email = $("#email").val().trim();
		var password = $("#password").val().trim();

		if (isBlank(email, "Email")) {
			flag = false;
		} else {
			if (!chekEmailPattern(email)) {				
				flag = false;
				massageDisplay("Email Id is not valid");
			}
		}

		if (isBlank(password, "Password")) {
			flag = false;
		}

		if (flag) {
			return true;
		}

		return false;

	});
	
	
	
	
	/**
	 * 
	 */
	$("#password-form").submit(function() {
		var flag = true;
		
		var email = $("#fEmail").val();
		
		if (isBlank(email, 'Email')) {
			flag = false;
		} else {			
			if (!chekEmailPattern(email)) {
				flag = false;
					massageDisplay("Email Id is not valid");
				}			
		}
		
		if (flag) {
			return true;
		}

		return false;		
	});
});

function isBlank(string, field) {
	if (string == null || string == '') {
		jQuery.growl.error({
			message : field + " can not be blank"
		});

		return true;
	}
	return false;
}

function chekEmailPattern(string) {
	var reg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return reg.test(string);
}


function massageDisplay(massage) {
	jQuery.growl.error({
		message : massage
	});
	return true;
}