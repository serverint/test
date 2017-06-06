/**
 * author Supratim Sarkar
 */
jQuery(document).ready(function($) {

	/**
	 * is used to check form validation at Add time
	 */
	$("#add-registration-form").submit(function(event) {
				
				event.preventDefault();
				var flag = true;
				
				var firstname = $("#firstName").val();
				var lastname = $("#lastName").val();
				
				if (isBlank(lastname, "First Name")) {
					flag = false;
				}
				
				if (isBlank(lastName, "Last Name")) {
					flag = false;
				}
              
				
				var jsoData = {};
				jsoData.firstname = firstname;
				jsoData.lastname = lastname;
				finaData = "userRegistrationValue="+ JSON.stringify(jsoData);

				console.log(finaData);
				
				
				$.ajax({
					data: finaData,
			        type: 'POST',
					url: "./api/userregistration",
					success	 : function(data){
						console.log(data);
						
						if(data.length > 0 ){
							
						}	
						
					},
					error 	 : function(request, status, error){}
					
				});
				

				if (flag) {
					return true;
				}

				return false;
			});

	/**
	 * is used to check form validation at Update time
	 */
	/*$("#edit-addon-form").submit(function(event) {
	
		var flag = true;
		
		var addOnName = $("#addOnName").val();
		var price =     $("#price").val();
		var status =    $("#status").val();
		
	  
		
	
		if (flag) {
			return true;
		}
	
		return false;
	});*/

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
function massageDisplay(massage) {
	jQuery.growl.error({
		message : massage
	});
	return true;
}
