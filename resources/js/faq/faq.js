/**
 * author Supratim Sarkar
 */
jQuery(document).ready(function($) {

	/**
	 * is used to check form validation at Add time
	 */
	$("#add-faq-form").submit(function(event) {

		var flag = true;

		var question = $("#question").val().trim();
		var answer = $("#answer").val().trim();
		
		
		if (isBlank(question, "Question")) {
			flag = false;
		}
		
		if (isBlank(answer, "Question")) {
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
	$("#edit-faq-form").submit(function(event) {

		var flag = true;

		var question = $("#question").val().trim();
		var answer = $("#answer").val().trim();
		var status = $("#status").val().trim();
		
		
		if (isBlank(question, "Question")) {
			flag = false;
		}
		
		if (isBlank(answer, "Question")) {
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
function deleteFaqConfirmation(faqId) {
	$("#faqId").val(faqId);
}
