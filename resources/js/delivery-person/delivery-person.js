/**
 * author Supratim Sarkar
 */
jQuery(document).ready(function($) {

	/**
	 * is used to check form validation at Add time
	 */
	$("#add-deliveryperson-form").submit(function(event) {

		var flag = true;

		var name = $("#name").val().trim();
		var mobile = $("#mobile").val().trim();
		var address = $("#address").val().trim();

		if (isBlank(name, "Delivery Person Name")) {
			flag = false;
		}
		
		if (/^[a-zA-Z0-9- ]*$/.test(name) == false) {

			flag = false;

			jQuery.growl.error({
				message : "No special charecter allowed"
			});

		}
		
		//validate contactNo
		if (isBlank(mobile, "Mobile No")) {
			flag = false;
		} else {
			if(mobile.length > 20)	{
				flag = false;
				massageDisplay("Contact No should be 20 digit");
			} 
			
			if(isNaN(mobile)) {
				flag = false;
				massageDisplay("Contact No should be numeric");
			}
		}
		
		if (isBlank(address, "Address")) {
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

		var name = $("#name").val().trim();
		var mobile = $("#mobile").val().trim();
		var address = $("#address").val().trim();
		var status = $("#status").val().trim();

		if (isBlank(name, "Delivery Person Name")) {
			flag = false;
		}
		
		if (/^[a-zA-Z0-9- ]*$/.test(name) == false) {

			flag = false;

			jQuery.growl.error({
				message : "No special charecter allowed"
			});

		}
		
		//validate contactNo
		if (isBlank(mobile, "Mobile No")) {
			flag = false;
		} else {
			if(mobile.length > 20)	{
				flag = false;
				massageDisplay("Contact No should be 20 digit");
			} 
			
			if(isNaN(mobile)) {
				flag = false;
				massageDisplay("Contact No should be numeric");
			}
		}
		
		if (isBlank(address, "Address")) {
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
function deleteDeliveryPersonConfirmation(deliveryPersonId) {
	$("#deliveryPersonId").val(deliveryPersonId);
}

