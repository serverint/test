/**
 * author Supratim Sarkar
 */
jQuery(document).ready(function($) {

	/**
	 * is used to check form validation at Add time
	 */
	$("#add-deliveryperson-form").submit(function(event) {

		var flag = true;

		var to = $("#to").val().trim();
		var from = $("#from").val().trim();
		var comment = $("#comment").val().trim();

		if (isBlank(to, "Distance To")) {
			flag = false;
		}
		
		if (/^[a-zA-Z0-9- ]*$/.test(to) == false) {

			flag = false;

			jQuery.growl.error({
				message : "No special charecter allowed"
			});

		}
		
		//validate contactNo
		if (isBlank(from, "Distance From")) {
			flag = false;
		} else {
			if(from.length > 10)	{
				flag = false;
				massageDisplay("From should be 10 digit");
			} 
			
			if(isNaN(from)) {
				flag = false;
				massageDisplay("From should be numeric");
			}
		}
		
		if (isBlank(comment, "comment")) {
			flag = false;
		}
		
		if (flag) {
			return true;
		}

		return false;
	});

	/**
	 * is used to check form validation at Update time
	 */
	$("#edit-deliveryperson-form").submit(function(event) {

		var flag = true;

		var to = $("#to").val().trim();
		var from = $("#from").val().trim();
		var comment = $("#comment").val().trim();
		var status = $("#status").val().trim();

		if (isBlank(to, "Distance To")) {
			flag = false;
		}
		
		if (/^[a-zA-Z0-9- ]*$/.test(to) == false) {

			flag = false;

			jQuery.growl.error({
				message : "No special charecter allowed"
			});

		}
		
		//validate contactNo
		if (isBlank(from, " Distance From")) {
			flag = false;
		} else {
			if(from.length > 10)	{
				flag = false;
				massageDisplay("From should be 10 digit");
			} 
			
			if(isNaN(from)) {
				flag = false;
				massageDisplay("From should be numeric");
			}
		}
		
		if (isBlank(comment, "comment")) {
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
 * @param sizeId
 */
function deleteDistanceConfirmation(deliveryPersonId) {
	$("#distanceId").val(deliveryPersonId);
}