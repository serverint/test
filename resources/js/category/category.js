/**
 * author swapnasish
 */

jQuery(document).ready(
		function($) {

			/**
			 * is used to check form validation at Add time
			 */
			$("#add-category-form").submit(
					function(event) {

						var flag = true;

						var name = $("#name").val().trim();
						var image = $("#image").val();

						if (isBlank(name, "Category Name")) {
							flag = false;
						}
						
						if (/^[a-zA-Z0-9- ]*$/.test(name) == false) {

							flag = false;

							jQuery.growl.error({
								message : "No special charecter allowed"
							});

						}

						if (isBlank(image, "Category Image")) {
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
									isImageMsg();
									flag = false;
								}
							}
						}

						if (flag) {
							return true;
						}

						return false;
					});

			/**
			 * is used to check form validation at Update time
			 */
			$("#edit-category-form").submit(
					function(event) {

						var flag = true;

						var name = $("#name").val().trim();
						var status = $("#status").val();
						var image = $("#image").val();

						if (isBlank(name, "Category Name")) {
							flag = false;
						}
						
						if (/^[a-zA-Z0-9- ]*$/.test(name) == false) {

							flag = false;

							jQuery.growl.error({
								message : "No special charecter allowed"
							});

						}
						
						if (isBlank(status, "Category status")) {
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
									isImageMsg();
									flag = false;
								}
							}
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
 */
function isImageMsg() {
	jQuery.growl.error({
		message : "Please select proper image"
	});
	return true;
}

/**
 * 
 * @param categoryId
 */
function deleteCategoryConfirmation(categoryId) {
	$("#categoryId").val(categoryId);
}
