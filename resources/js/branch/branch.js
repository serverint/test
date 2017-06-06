/**
 * author Supratim Sarkar
 */
jQuery(document).ready(
		function($) {

			/**
			 * is used to check form validation at Add time
			 */
			
			$('div.accessories div.acc-wrapper1 input:checkbox').click(function(event) {
               
				$("#takeaway").val("");
	            if($(this).prop('checked')) {
	                $('div.accessories div.acc-wrapper1 div.field1').show();
	            } else {
	                $('div.accessories div.acc-wrapper1 div.field1').hide();
	            }

	        });
			
			$('div.accessories div.acc-wrapper2 input:checkbox').click(function(event) {
				 $("#delivery").val("");
	            if($(this).prop('checked')) {
	                $('div.accessories div.acc-wrapper2 div.field2').show();
	            } else {
	                $('div.accessories div.acc-wrapper2 div.field2').hide();
	            }

	        });
			
	
			
			$("#add-branch-form").submit(
					function(event) {

						var flag = true;

						var branchName = $("#branchName").val().trim();
						var address = $("#address").val().trim();
						var contactNo = $("#contactNo").val();
						var zipcode	  = $("#zipcode").val();
						var takeAwayCheckbox = $("#takeAwayCheckbox").prop('checked');
						var deliveryCheckbox = $("#deliveryCheckbox").prop('checked');
						var radious= $("#radious").val().trim();
						var branchStartTime = $("#branchStartTime").val().trim();
						var branchEndTime = $("#branchEndTime").val().trim();
						var orderStartTime = $("#orderStartTime").val().trim();
						var orderEndTime = $("#orderEndTime").val().trim();

						var countryId = $("#countryId").val();
						if(takeAwayCheckbox == true){
							
						    var takeaway = $("#takeaway").val();
						    if (isBlank(takeaway, "Take Away Time")) {
								flag = false;
							}
				
						}
						
                        if(deliveryCheckbox == true){
							
						    var delivery = $("#delivery").val();
						    if (isBlank(delivery, "Delivery Time")) {
								flag = false;
							}
				
						}
				
						//validate branchName
						if (isBlank(branchName, "Branch Name")) {
							flag = false;
						} else if(branchName.length > 30) {
							flag = false;
							massageDisplay("Branch name should be in 30 character");
						}
						
						if (isBlank(address, "Address")) {
							flag = false;
						}
						
						if (isBlank(countryId, "Country")) {
							flag = false;
						}
						
						
						
						//validate contactNo
						if (isBlank(contactNo, "Contact No")) {
							flag = false;
						} else {
							if(contactNo.length > 20)	{
								flag = false;
								massageDisplay("Contact No should be 20 digit");
							} 
							
							if(isNaN(contactNo)) {
								flag = false;
								massageDisplay("Contact No should be numeric");
							}
						}
						
						
						if (isBlank(radious, "Radious")) {
							flag = false;
						}else {
							if (/^[1-9]\d*(\.\d+)?$/.test(radious) == false) {

								flag = false;

								jQuery.growl.error({
									message : "Radious can allow Numeric Character"
								});

							}
						}
						
						 if (isBlank(zipcode, "Zip Code")) {
								flag = false;
						 } /*else if (/^[1-9]\d*(\.\d+)?$/.test(zipcode) == false) {

								flag = false;
								massageDisplay("Zip Code Should Be Numeric Only");

						 }*/
						
						//validate zipcode
						/*if (isBlank(zipcode, "Zip Code")) {
							flag = false;
						} else {
							
							if(zipcode.length > 10)	{
								flag = false;
								massageDisplay("Zip Code should be less than 10 digit");
							} 
							
							if(isNaN(zipcode)) {
								flag = false;
								massageDisplay("Zip Code should be numoric");
							}
						}*/
						
						
						if (isBlank(branchStartTime, "Branch StartTime")) {
							flag = false;
						}
						
						if (isBlank(branchEndTime, "Branch EndTime")) {
							flag = false;
						}
						
						if (isBlank(orderStartTime, "Order StartTime")) {
							flag = false;
						}
						
						if (isBlank(orderEndTime, "Order EndTime")) {
							flag = false;
						}
						
						
						
						if(branchEndTime < branchStartTime && branchEndTime!= '' &&  branchStartTime != ''){
							flag = false;
							massageDisplay("Start time should be before end time");
						}
						
						if(orderStartTime < branchStartTime && orderStartTime != '' && branchStartTime != ''){
							flag = false;
							massageDisplay("Order start time should be after branch start time");
						}
						
						if(branchEndTime < orderEndTime &&  branchEndTime !='' && orderEndTime != '' ){
							flag = false;
							massageDisplay("Order End time should be before branch end time");
						}
						
						if(orderEndTime < orderStartTime && orderEndTime != '' && orderStartTime != ''){
							flag = false;
							massageDisplay("Order End time should be after order start time");
						}
						
						

						if (flag) {
							return true;
						}

						return false;
					});

			/**
			 * is used to check form validation at Update time
			 */
			$("#edit-branch-form").submit(
					function(event) {

						var flag = true;

						var branchName = $("#branchName").val().trim();
						var address = $("#address").val().trim();
						var contactNo = $("#contactNo").val();
						
						var zipcode	  = $("#zipcode").val();
						var takeAwayCheckbox = $("#takeAwayCheckbox").prop('checked');
						var deliveryCheckbox = $("#deliveryCheckbox").prop('checked');
						
						var countryId = $("#countryId").val();
						var radious= $("#radious").val().trim();
						
						//var zipcode	  = $("#zipcode").val();	
						var branchStartTime = $("#branchStartTime").val().trim();
						var branchEndTime = $("#branchEndTime").val().trim();
						var orderStartTime = $("#orderStartTime").val().trim();
						var orderEndTime = $("#orderEndTime").val().trim();
						var status		 = $("#status").val();
						
                        if(takeAwayCheckbox == true){
							
						    var takeaway = $("#takeaway").val();
						    if (isBlank(takeaway, "Take Away Time")) {
								flag = false;
							}
				
						}
						
                        if(deliveryCheckbox == true){
							
						    var delivery = $("#delivery").val();
						    if (isBlank(delivery, "Delivery Time")) {
								flag = false;
							}
				
						}
		
						//validate branchName
						if (isBlank(branchName, "Branch Name")) {
							flag = false;
						} else if(branchName.length > 30) {
							flag = false;
							massageDisplay("Branch name should be in 30 character");
						}
						
						if (isBlank(address, "Address")) {
							flag = false;
						}
				
						if (isBlank(countryId, "Country")) {
							flag = false;
						}
						
						//validate contactNo
						if (isBlank(contactNo, "Contact No")) {
							flag = false;
						} else {
							if(contactNo.length > 20)	{
								flag = false;
								massageDisplay("Contact No should be 20 digit");
							} 
							
							if(isNaN(contactNo)) {
								flag = false;
								massageDisplay("Contact No should be numeric");
							}
						}
						
						
						if (isBlank(radious, "Radious")) {
							flag = false;
						}else {
							if (/^[1-9]\d*(\.\d+)?$/.test(radious) == false) {

								flag = false;

								jQuery.growl.error({
									message : "Radious can allow Numeric Character"
								});

							}
						}
						
						//validate zipcode
						/*if (isBlank(zipcode, "Zip Code")) {
							flag = false;
						} else {
							
							if(zipcode.length > 10)	{
								flag = false;
								massageDisplay("Zip Code should be less than 10 digit");
							} 
							
							if(isNaN(zipcode)) {
								flag = false;
								massageDisplay("Zip Code should be numoric");
							}
						}*/
						
						if (isBlank(status, "Status")) {
							flag = false;
						}
						
						
						if (isBlank(branchStartTime, "Branch StartTime")) {
							flag = false;
						}
						
						if (isBlank(branchEndTime, "Branch EndTime")) {
							flag = false;
						}
						
						if (isBlank(orderStartTime, "Order StartTime")) {
							flag = false;
						}
						
						if (isBlank(orderEndTime, "Order EndTime")) {
							flag = false;
						}
						
						if (isBlank(zipcode, "Zip Code")) {
							flag = false;
					 } /*else if (/^[1-9]\d*(\.\d+)?$/.test(zipcode) == false) {

							flag = false;
							massageDisplay("Zip Code Should Be Numeric Only");

					 }*/
						
						if(branchEndTime < branchStartTime && branchEndTime!= '' &&  branchStartTime != ''){
							flag = false;
							massageDisplay("Start time should be before end time");
						}
						
						if(orderStartTime < branchStartTime && orderStartTime != '' && branchStartTime != ''){
							flag = false;
							massageDisplay("Order start time should be after branch start time");
						}
						
						if(branchEndTime < orderEndTime &&  branchEndTime !='' && orderEndTime != '' ){
							flag = false;
							massageDisplay("Order End time should be before branch end time");
						}
						
						if(orderEndTime < orderStartTime && orderEndTime != '' && orderStartTime != ''){
							flag = false;
							massageDisplay("Order End time should be after order start time");
						}
						
						

						if (flag) {
							return true;
						}

						return false;
					});

			
			$("#contactNo").on("keyup",function(e){
				
				var contactNo = $("#contactNo").val();
				
				if(contactNo != ''){
					
					if(isNaN(contactNo)) {
						$("#contactNo").val(contactNo.replace(/\D/g,''));
					}
				}
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
 * @param branchId
 */
function deleteBranchConfirmation(branchId) {
	$("#branchId").val(branchId);
}

function massageDisplay(massage) {
	jQuery.growl.error({
		message : massage
	});
	return true;
}
