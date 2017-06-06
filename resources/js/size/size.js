/**
 * author Supratim Sarkar
 */
jQuery(document).ready(function($) {

	/**
	 * is used to check form validation at Add time
	 */
	$("#add-size-form").submit(function(event) {

		var flag = true;

		var name = $("#name").val().trim();

		if (isBlank(name, "Size Name")) {
			flag = false;
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
	$("#edit-size-form").submit(function(event) {

		var flag = true;

		var name = $("#name").val().trim();
		var status = $("#status").val().trim();

		if (isBlank(name, "Size Name")) {
			flag = false;
		}
		
		if (/^[a-zA-Z0-9- ]*$/.test(name) == false) {

			flag = false;

			jQuery.growl.error({
				message : "No special charecter allowed"
			});

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
//function deleteSizeConfirmation(sizeId) {
//	$("#sizeId").val(sizeId);
//}

/**
 * 
 * @param sizeId
 */
function deleteSizeConfirmation(sizeId) {
	$("#sizeId").val(sizeId);
	var url = 'delete-size-new';
	var options = "";
	jQuery.ajax({
		url  	 : url,
		type 	 : 'POST',
		dataType : 'json',
		data 	 : {sizeId : sizeId},
		success	 : function(data){
			
			//alert("success ajax");
			
		    
		  //  alert("data length"+data.length);
		    if(data.length > 0 ){
		    	jQuery("#getCodeModal").modal('show');
		    	var val = data;
		    	//alert(data[0].itemName);
		    	$.each(data, function(key, val){
					options += val.itemName + " , ";
				});
		    	//var str = "12345.00";
		    	options = options.slice(0, -2);
		    	//alert(options);
		    	$("#getCode").html(options);
		    
		    }
		    else{
		    	//location.reload(true);
		    	jQuery.growl.error({
		    		
					message : "Successfully Deleted"
				});
		    	
		    	setTimeout(location.reload.bind(location), 1000);
		    }
			
		},
		error 	 : function(request, status, error){
			alert("error in ajax part")
			
		}
	});
}











