/**
 * 
 */

jQuery(document).ready(function($) {

	$("#change-password-form").submit(function(event) {

		var flag = true;
		
		var oldPassword     = $("#oldPassword").val();
		var newPassword 	= $("#newPassword").val();
		var confirmPassword = $("#confirmPassword").val();

		if (isBlank(oldPassword, "Old password")) {
			flag = false;
		}

		if (isBlank(newPassword, "New password")) {
			flag = false;
		}

		if (isBlank(confirmPassword, "Confirm password")) {
			flag = false;
		}

		if (newPassword != confirmPassword) {
			flag = false;

			jQuery.growl.error({
				message : "Confirm password not match"
			});
		}

		if (flag) {
			return true;
		}

		return false;
	});
});

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
