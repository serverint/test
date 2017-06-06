jQuery(document).ready(function($) {

	$("#peyala-cash-form").submit(function(e) {

		var flag = true;
	
		var amount = $("#amount").val();
		var amountToPoint = $("#amountToPoint").val();
		var pointToCash = $("#pointToCash").val();
		var cash = $("#cash").val();
		var description = $("#description").val();
		var image = $("#image").val();
		

		if (isBlank(amount, "Amount")) {
			flag = false;
		} else {
			if (isNaN(amount)) {
				flag = false;
				massageDisplay("Please enter a numeric value for Amount");
			}
		}

		if (isBlank(amountToPoint, "Amount To Point")) {
			flag = false;
		} else {
			if (isNaN(amountToPoint)) {
				flag = false;
				massageDisplay("Please enter a numeric value for Amount To Point");
			}
		}
		
		
		if (isBlank(pointToCash, "Point To Cash")) {
			flag = false;
		} else {
			if (isNaN(pointToCash)) {
				flag = false;
				massageDisplay("Please enter a numeric value for Point To Cash");
			}
		}
		
		
		if (isBlank(cash, "Cash")) {
			flag = false;
		} else {
			if (isNaN(point)) {
				flag = false;
				massageDisplay("Please enter a numeric value for Cash");
			}
		}
		
		if (isBlank(description, "Decription")) {
			flag = false;
		}


		if (flag) {
			return true;
		}

		return false;

	});

});

/**
 * 
 * @param string
 * @param field
 * @returns {Boolean}
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
 */
function massageDisplay(massage) {
	jQuery.growl.error({
		message : massage
	});
	return true;
}