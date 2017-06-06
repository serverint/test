/**
 * 
 */
$(document).ready(function(){
	
	function ValidateEmail(email) {
		var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		return expr.test(email);
	}
	
	$("#add-contactus-form").submit(function(event){
		var flag = true;
		$("textarea, input[type='text']").each(function(){
			if($(this).val().trim() == ""){
				event.preventDefault();
				flag = false;
				jQuery.growl.error({
					message : $(this).attr("name")+" can not be blank."
				});
			}
		});
		if(flag){
			$("input[type='text'][name='mobiles']").each(function(){
				var mobileNo = $(this).val().trim();
				if(isNaN(mobileNo) || mobileNo.length<10 || mobileNo.length>20){
					event.preventDefault();
					jQuery.growl.error({
						message : "Mobile no. must be Valid."
					});
				}
			});
			
			$("input[type='text'][name='emails']").each(function(){
				var email = $(this).val().trim();
				if(!ValidateEmail(email)){
					event.preventDefault();
					jQuery.growl.error({
						message : "Email must be Valid."
					});
				}
			});
		}
		
		
	});
});
