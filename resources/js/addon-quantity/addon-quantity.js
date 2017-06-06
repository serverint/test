/**
 * author Supratim Sarkar
 */
jQuery(document).ready(function($) {

	/**
	 * is used to check form validation at Add time
	 */
	$("#add-addon-quantity-form").submit(function(event) {

		var flag = true;

		var name = $("#name").val().trim();

		if (isBlank(name, "Addon quantity Name")) {
			flag = false;
		}
		
		if (/^[a-zA-Z0-9- ]*$/.test(name) == false) {

			flag = false;

			jQuery.growl.error({
				message : "No special charecter allowed"
			});

		}
		
		if (flag) {
			return true;
		}

		return false;
	});

	/**
	 * is used to check form validation at Update time
	 */
	$("#edit-addon-quantity-form").submit(function(event) {

		var flag = true;

		var name = $("#name").val().trim();
		var status = $("#status").val().trim();

		if (isBlank(name, "Addon quantity Name")) {
			flag = false;
		}
		
		if (/^[a-zA-Z0-9- ]*$/.test(name) == false) {

			flag = false;

			jQuery.growl.error({
				message : "No special charecter allowed"
			});

		}
	
		if (isBlank(status, "Status")) {
			flag = false;
		}

		if (flag) {
			return true;
		}

		return false;
	});

//	$("#textLength").html('30 Characters Limit');
	
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
 * @param addOnQuantityId
 */
function deleteAddonQuantityConfirmation(addOnQuantityId) {
	$("#addOnQuantityId").val(addOnQuantityId);
}
