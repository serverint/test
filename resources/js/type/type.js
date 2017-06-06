/**
 * author Supratim Sarkar
 */
jQuery(document).ready(
		function($) {

			/**
			 * is used to check form validation at Add time
			 */
			$("#add-type-form").submit(
					function(event) {

						var flag = true;

						var name = $("#name").val().trim();
						var category = $("#category").val().trim();
						var foodType = $("#foodType").val().trim();

												
						if (isBlank(name, "Type Name")) {
							flag = false;
						}
						
						if (isBlank(foodType, "Type Preference")) {
							flag = false;
						}
						
						if (/^[a-zA-Z0-9- ]*$/.test(name) == false) {

							flag = false;

							jQuery.growl.error({
								message : "No special charecter allowed"
							});

						}
						
						
						if (isBlank(category, "Category Name")) {
							flag = false;
						}

						if (flag) {
							return true;
						}

						return false;
					} );

			/**
			 * is used to check form validation at Update time
			 */
			$("#edit-type-form").submit(
					function(event) {	

						var flag = true;

						var name = $("#name").val().trim();
						var category = $("#category").val().trim();
						var foodType = $("#foodType").val().trim();
						var status = $("#status").val().trim();

						if (isBlank(name, "Type Name")) {
							flag = false;
						}
						
						if (isBlank(foodType, "Type Preference")) {
							flag = false;
						}
						
						if (isBlank(category, "Category Name")) {
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
					} );
			
//			$("#textLength").html('30 Characters Limit');
			
			/*if($("#name").val() == null){
				$("#textLength").html('30 Characters left');
			}
			else{
				var size= 30 - $("#name").val().length;
				$("#textLength").html(size +' Characters left');
			}

			$("#name").on('keyup', function(e){
				var text = $("#name").val();
				var max = 30;
				
				if (e.which < 0x20) {
					var left = max - this.value.length;
			        $("#textLength").html(left+' Characters left');
			        return;
			    }
			   
				if (text.length == max) {
			        e.preventDefault();
			    } else if (text.length > max) {
			        this.value = this.value.substring(0, max);
			    }
			   
				var left = max - this.value.length;
			    $("#textLength").html(left+' Characters left');
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
 * @param typeId
 */
function deleteTypeConfirmation(typeId) {
	$("#typeId").val(typeId);
}
