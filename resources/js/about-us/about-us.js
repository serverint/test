/**
 * author Supratim
 */

jQuery(document).ready(
		function($) {

			/**
			 * is used to check form validation at Add time
			 */
			$("#add-about-us-form").submit(
					function(event) {

						var flag = true;

						var content = CKEDITOR.instances['content'].getData();

						if (isBlank(content, "About-Us Note")) {
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
