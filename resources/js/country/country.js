/**
 * author Supratim Sarkar
 */
jQuery(document).ready(function($) {

	/**
	 * is used to check form validation at Add time
	 */
	$("#add-country-form").submit(function(event) {

		var flag = true;

		var name = $("#countryName").val().trim();
		var image = $("#image").val();

		if (isBlank(name, "Country Name")) {
			flag = false;
		}
		
	   if (isBlank(image, "Image")) {
			flag = false;
		}

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
					massageDisplay("Please select proper image");
					flag = false;
				}
			}
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
	$("#edit-country-form").submit(function(event) {

		var flag = true;

		var name = $("#countryName").val().trim();
		var image 	 	   = $("#image").val();
		var status = $("#status").val().trim();

		if (isBlank(name, "Country Name")) {
			flag = false;
		}
		
		if (/^[a-zA-Z0-9- ]*$/.test(name) == false) {

			flag = false;

			jQuery.growl.error({
				message : "No special charecter allowed"
			});

		}
		
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
					massageDisplay("Please select proper image");
					flag = false;
				}
			}
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
 * @param countryId
 */
function deleteCountryConfirmation(countryId) {
	$("#countryId").val(countryId);
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
