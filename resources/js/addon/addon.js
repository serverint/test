/**
 * author Supratim Sarkar
 */
jQuery(document).ready(function($) {

	/**
	 * is used to check form validation at Add time
	 */
	$("#add-addon-form").submit(function(event) {

				var flag = true;
				
				var addOnName = $("#addOnName").val();
				var price = $("#price").val();
				
              
				if (isBlank(addOnName, "Addon Name")) {
					flag = false;
				} else {							
					if (/^[a-zA-Z0-9- ]*$/.test(addOnName) == false) {
						flag = false;
						massageDisplay("No special charecter allowed");								
					}
				}
				
				if (isBlank(price, "price")) {
					flag = false;
				} else {
					
					if(price == '0') {
						
						flag = false;	
						massageDisplay("Price Can Not Be Zero");
					}
					else if(isNaN(price)){
						flag = false;	
						massageDisplay("Price should be numeric");
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
	$("#edit-addon-form").submit(function(event) {
	
		var flag = true;
		
		var addOnName = $("#addOnName").val();
		var price =     $("#price").val();
		var status =    $("#status").val();
		
	  
		if (isBlank(addOnName, "Addon Name")) {
			flag = false;
		} else {							
			if (/^[a-zA-Z0-9- ]*$/.test(addOnName) == false) {
				flag = false;
				massageDisplay("No special charecter allowed");		
			}
		}
		
		if (isBlank(price, "price")) {
			flag = false;
		} else {
			
			if(price == '0') {
				
				flag = false;	
				massageDisplay("Price Can Not Be Zero");
			}
			else if(isNaN(price)){
				flag = false;	
				massageDisplay("Price should be numeric");
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
function deleteaddonConfirmation(addonId) {
	$("#addonid").val(addonId);
	var url = 'delete-addon-new';
	var options = "";
	jQuery.ajax({
		url  	 : url,
		type 	 : 'POST',
		dataType : 'json',
		data 	 : {addonId : addonId},
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
/**
 * 
 */
function massageDisplay(massage) {
	jQuery.growl.error({
		message : massage
	});
	return true;
}
