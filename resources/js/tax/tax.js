/**
 * author Subhajit Seth
 */
jQuery(document).ready(function($) {

	/**
	 * is used to check form validation at Add time
	 */
	$("#add-tax-form").submit(function(event) {

		var flag = true;

		var name = $("#serviceName").val().trim();
		var percentage = $("#percentage").val().trim();
		var cuntryId = $("select[name='countryId']").val();
		if(cuntryId === "Select..."){
			jQuery.growl.error({
				message : "Please select a cuntry"
			});
			flag = false;
		}

		if (isBlank(name, "Service Name")) {
			flag = false;
		} else {
			if (/^[a-zA-Z0-9- ]*$/.test(name) == false) {

				flag = false;

				jQuery.growl.error({
					message : "No special charecter allowed"
				});

			}
		} 

		if (isBlank(percentage, "Tax Percentage")) {
			flag = false;
		} else {
			
			if(parseInt(percentage) > 100)	{
				flag = false;
				jQuery.growl.error({
					message : "Tax Percentage can not allow more than 100%"
				});
			}
			
			if (/^[1-9]\d*(\.\d+)?$/.test(percentage) == false) {

				flag = false;

				jQuery.growl.error({
					message : "Tax Percentage can allow Numeric Character"
				});

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
	$("#edit-tax-form").submit(function(event) {

		var flag = true;

		var name = $("#serviceName").val().trim();
		var percentage = $("#percentage").val().trim();
		var status = $("#status").val().trim();

		if (isBlank(name, "Service Name")) {
			flag = false;
		} else {
			
			if(parseInt(percentage) > 100)	{
				flag = false;
				jQuery.growl.error({
					message : "Tax Percentage can not allow more than 100%"
				});
			}
			
			if (/^[a-zA-Z0-9- ]*$/.test(name) == false) {

				flag = false;

				jQuery.growl.error({
					message : "No special charecter allowed"
				});

			}			
		}
		
		if (isBlank(percentage, "Percentage")) {
			flag = false;
		} else {
			if (/^[1-9]\d*(\.\d+)?$/.test(percentage) == false) {

				flag = false;

				jQuery.growl.error({
					message : "Tax Percentage can allow Numeric Character"
				});

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
 * @param sizeId
 */
function deletetaxConfirmation(taxId) {
	$("#taxId").val(taxId);
}
