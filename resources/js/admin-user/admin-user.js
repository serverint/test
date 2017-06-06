/**
 * 
 */
jQuery(document).ready(function($) {

	$("#add-admin-user-form").submit(function(e) {
		var flag = true;

		var firstName = $("#firstName").val().trim();
		var middleName = $("#middleName").val().trim();
		var lastName = $("#lastName").val().trim();
		var phone = $("#phone").val().trim();
		var email = $("#email").val().trim();
		var branchId = $("#branchId").val();

		//validate firstName
		if (isBlank(firstName, "First name")) {
			flag = false;
		} else {
			
			if(firstName.length >30){
				flag = false;
				massageDisplay("First name should be in 30 character");
			}
		}
		
		if(middleName != ''){
			
			if(middleName.length >30){
				flag = false;
				massageDisplay("Middle name should be in 30 character");
			}
		}

		//validate lastName
		if (isBlank(lastName, "Last name")) {
			flag = false;
		} else {
			
			if(firstName.length >30){
				flag = false;
				massageDisplay("Last name should be in 30 character");
			}
		}

		//validate phone No.
		if (isBlank(phone, "Phone")) {
			flag = false;
		} else {
			if(phone.length > 20)	{
				flag = false;
				massageDisplay("Phone No should be 20 digit");
			} 
			
			if(isNaN(phone)) {
				flag = false;
				massageDisplay("Phone No should be numoric");
			}
		}

		//validate Email
		if (isBlank(email, "Email")) {
			flag = false;
		}  else {
			if (!chekEmailPattern(email)) {
				jQuery.growl.error({
					message : "Email Id is not valid"
				});
				flag = false;
			}
		}

		
		if (isBlank(branchId, "Branch")) {
			flag = false;
		}

		if (flag) {
			return true;
		}

		return false;
	});

	$("#edit-admin-user-form").submit(function(e) {
		var flag = true;

		var firstName = $("#firstName").val().trim();
		var middleName = $("#middleName").val().trim();
		var lastName = $("#lastName").val().trim();
		var phone = $("#phone").val().trim();
		var email = $("#email").val().trim();
		var branchId = $("#branchId").val();
		var status  = $("#status").val();

		//validate firstName
		if (isBlank(firstName, "First name")) {
			flag = false;
		} else {
			
			if(firstName.length >30){
				flag = false;
				massageDisplay("First name should be in 30 character");
			}
		}
		
		if(middleName != ''){
			
			if(middleName.length >30){
				flag = false;
				massageDisplay("Middle name should be in 30 character");
			}
		}

		//validate lastName
		if (isBlank(lastName, "Last name")) {
			flag = false;
		} else {
			
			if(firstName.length >30){
				flag = false;
				massageDisplay("Last name should be in 30 character");
			}
		}

		//validate phone No.
		if (isBlank(phone, "Phone")) {
			flag = false;
		} else {
			if(phone.length > 20)	{
				flag = false;
				massageDisplay("Phone No should be 20 digit");
			} 
			
			if(isNaN(phone)) {
				flag = false;
				massageDisplay("Phone No should be numoric");
			}
		}

		//validate Email
		if (isBlank(email, "Email")) {
			flag = false;
		}  else {
			if (!chekEmailPattern(email)) {
				jQuery.growl.error({
					message : "Email Id is not valid"
				});
				flag = false;
			}
		}

		
		if (isBlank(branchId, "Branch")) {
			flag = false;
		}
		
		if (isBlank(status, "Status")) {
			flag = false;
		}

		if (flag) {
			return true;
		}

		return false;
	});
	
	
	$("#phone").on("keyup",function(e){
		
		var phone = $("#phone").val();
		
		if(phone != ''){
			
			if(isNaN(phone)) {
				$("#phone").val(phone.replace(/\D/g,''));
			}
		}
	});	
	
});

/**
 * 
 * @param menuId
 */
function adminUserDeleteConfirmation(adminUserId) {
	$("#adminUserId").val(adminUserId);
}

function chekEmailPattern(string) {
	var reg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return reg.test(string);
}

/**
 * is used to check filed is blank or not and show the msg
 */
function isBlank(string, field) {
	if (string == null || string == '') {
		jQuery.growl.error({
			message : field + " can not be blank"
		});

		return true;
	}
	return false;
}

function massageDisplay(massage) {
	jQuery.growl.error({
		message : massage
	});
	return true;
}