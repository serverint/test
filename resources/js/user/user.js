/**
 * author Supratim Sarkar
 */
jQuery(document).ready(function($) {


	/**
	 * is used to check form validation at Update time
	 */
	$("#edit-user-form").submit(function(event) {

		var flag = true;

		//var name = $("#name").val().trim();
		var status = $("#status").val().trim();

	
		if (isBlank(status, "Status")) {
			flag = false;
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

/**
 * 
 * @param userId
 */
function deleteUserConfirmation(userId) {
	$("#userId").val(userId);
}
