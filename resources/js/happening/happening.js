/**
 * author Avirup Paul and co
 */
var imageChecking;
jQuery(document).ready(function($) {
	//
	/**
	 * is used to check form validation at Add time
	 */
	
	$("#add-happening-form").submit(function(event) {

		var flag = true;

		var title = $("#title").val().trim();
		var description = $("#description").val().trim();
		var content = CKEDITOR.instances['content'].getData();
		var image = $("#imageName").val();
		
		
		if (isBlank(title, "Title")) {
			flag = false;
		}
		
		if (isBlank(description, "Description")) {
			flag = false;
		}
		
		if (isBlank(content, "Content")) {
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

		
		
		if (flag) {
			return true;
		}

		return false;
	});

	/**
	 * is used to check form validation at Update time
	 */
	$("#edit-happening-form").submit(function(event) {

		var flag = true;

		var title = $("#title").val().trim();
		var description = $("#description").val().trim();
		var content = CKEDITOR.instances['content'].getData();
		var image = $("#imageName").val();
		
		
		if (isBlank(title, "Title")) {
			flag = false;
		}
		
		if (isBlank(description, "Description")) {
			flag = false;
		}
		
		if (isBlank(content, "Content")) {
			flag = false;
		}
		           // alert("imageChecking"+imageChecking);
		if (typeof imageChecking === "undefined") {
			if(isBlank(image, "Happening Image"))
			flag = false;
		}
	
		if (image != "") {
			var control = document.getElementById("imageName");
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
function deleteHappeningConfirmation(happeningId) {
	$("#happeningId").val(happeningId);
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
