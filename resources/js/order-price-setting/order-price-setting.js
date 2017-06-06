/**
 * author Supratim Sarkar
 */
jQuery(document).ready(function($) {

	/**
	 * is used to check form validation at Add time
	 */
	$("#add-orderprice-form").submit(function(event) {

		var flag = true;

		var price = $("#price").val().trim();
		var codPrice = $("#cod-price").val().trim();
		var maxCodPrice = $("#max-cod-price").val().trim();
		
		
		if (isBlank(price, "Price")) {
			flag = false;
		} else {
			
			if (price == '0') {

				flag = false;

				jQuery.growl.error({
					message : "Order Amount Can Not Be Zero"
				});

			}else if (price == '0.0'){
				flag = false;

				jQuery.growl.error({
					message : "Order Amount Can Not Be Zero"
				});
			}
			
			else if (/^[1-9]\d*(\.\d+)?$/.test(price) == false) {

				flag = false;

				jQuery.growl.error({
					message : "Order Amount Should Be Numeric Only"
				});

			}
		}
		
		
		
		if (isBlank(codPrice, "COD Price")) {
			flag = false;
		} else {
			
			if (codPrice == '0') {

				flag = false;

				jQuery.growl.error({
					message : "COD Price Can Not Be Zero"
				});

			}else if (codPrice == '0.0'){
				flag = false;

				jQuery.growl.error({
					message : "COD Price Can Not Be Zero"
				});
			}
			
			else if (/^[1-9]\d*(\.\d+)?$/.test(codPrice) == false) {

				flag = false;

				jQuery.growl.error({
					message : "COD Price Should Be Numeric Only"
				});

			}
		}
		
		if (isBlank(maxCodPrice, "Max COD Price")) {
			flag = false;
		} else {
			
			if (maxCodPrice == '0') {

				flag = false;

				jQuery.growl.error({
					message : "Max COD Price Can Not Be Zero"
				});

			}else if (maxCodPrice == '0.0'){
				flag = false;

				jQuery.growl.error({
					message : "Max COD Price Can Not Be Zero"
				});
			}
			
			else if (/^[1-9]\d*(\.\d+)?$/.test(maxCodPrice) == false) {

				flag = false;

				jQuery.growl.error({
					message : "Max COD Price Should Be Numeric Only"
				});

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
function deleteSizeConfirmation(sizeId) {
	$("#sizeId").val(sizeId);
}
