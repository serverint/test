jQuery(document).ready(function($) {

	$("#point-amount-save-form").submit(function(e) {

		var flag = true;
		var point = $("#point").val();
		var amount = $("#amount").val();
		var image = $("#image").val();
		var description = $("#description").val();

		if (isBlank(point, "point")) {
			flag = false;
		} else {
			if (isNaN(point)) {
				flag = false;
				massageDisplay("Please enter a numeric value for point");
			}
		}

		if (isBlank(amount, "Amount")) {
			flag = false;
		} else {
			if (isNaN(amount)) {
				flag = false;
				massageDisplay("Please enter a numeric value for amount");
			}
		}
		
		if (isBlank(image, "Loyalty Image")) {
			flag = false;
		}
		
//		if (isBlank(description, "Decription")) {
//			flag = false;
//		}

		if (image != "") {
			var control = document.getElementById("image");
			var files = control.files;

			for (var i = 0; i < files.length; i++) {
				if (files[i].type == "image/jpeg"
						|| files[i].type == "image/jpg"
						|| files[i].type == "image/gif"
						|| files[i].type == "image/png"
						|| files[i].type == "image/bmp") {

				} else {
					isImageMsg();
					flag = false;
				}
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