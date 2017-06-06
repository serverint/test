/**
 * author Supratim Sarkar
 */
jQuery(document).ready(function($) {
	
	$("#notification-type-user-div").hide();
	

	/**
	 * is used to check form validation at Add time
	 */
	$("#add-notification-form").submit(function(event) {

		var flag = true;

		var name = $("#message").val().trim();
		var notificationType = $("#notification-type").val().trim();
		var notifiedType = $("#notified-type").val();
		var notificationTypeUser = $("#notification-type-user").val();
		
		
		if (isBlank(name, "Notification Message")) {
			flag = false;
		}
		
		if (isBlank(notificationType, "Notification Type")) {
			flag = false;
		}
		
		if (isBlank(notifiedType, "Notified Type")) {
			flag = false;
		} else{
			
			if(notifiedType == 'NOTIFICATION_TO_SPECIFIC_USER'){
				if (isBlank(notificationTypeUser, "Notification User")) {
					flag = false;
				}
			}
		}
		
		if (flag) {
			$('#img').show();
			$('.abz').show();
			return true;
		}
		
		

		return false;
	});
	
	
	/**
	 * this is called on the change on Category
	 */
	$("#notified-type").change(function(e){
		
		var notifiedType = $("#notified-type").val();
		var selectNotificationUserDiv = $("#notification-type-user-div");
		
		if(notifiedType == ''){
			//selectNotificationUserDiv.css("display", "block");
			selectNotificationUserDiv.hide();
		
		}
		
		if(notifiedType == 'NOTIFICATION_TO_ALL'){
			//selectNotificationUserDiv.css("display", "block");
			selectNotificationUserDiv.hide();
		}
		
		if(notifiedType == 'NOTIFICATION_TO_SPECIFIC_USER'){
			selectNotificationUserDiv.show();
			
			var URL = 'get-notification-specific-user';
			var options = '<option value="">Select</option>';
				
				
				jQuery.ajax({
					url  	 : URL,
					type 	 : 'GET',
					success	 : function(data){
						console.log(data);
						
						if(data.length > 0 ){
							$.each(data, function(key, val){
								options+= '<option value="' + val.userId + '">' + val.userName +' - ('+val.email + ')</option>';
							});
						}	
						
						$("#notification-type-user").html(options);
						$("#notification-type-user").select2();
					},
					error 	 : function(request, status, error){
						
						$("#notification-type-user").html(options);
					}
				});		
		}
		
		
	});
	//end of 
	
	
	$("#search-notification-form").submit(function(event) {

		var flag = true;

		var notificationType = $("#notification-type").val().trim();
		var fromDate=$("#fromDate").val().trim();
		var toDate=$("#toDate").val().trim();
		
		
		if (isBlank(notificationType, "Notification Type")) {
			flag = false;
		}
		
		if (isBlank(fromDate, "From Date")) {
			flag = false;
		}
		
		if (isBlank(toDate, "To Date")) {
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
