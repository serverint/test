/**
 * author Supratim
 */

jQuery(document).ready(
		function($) {

			/**
			 * is used to check form validation at Add time
			 */
			$("#add-banner-form").submit(
					function(event) {

						var flag = true;

						var note = $("#note").val().trim();
						var image = $("#image").val();
						var checkFoodItem=$("#isFoodItem").prop('checked');
						var categoryId = $("#category-food").val();
						var foodItemsId = $("#food-item").val();

						if (isBlank(note, "Banner Note")) {
							flag = false;
						}
						
						if (/^[a-zA-Z0-9- ]*$/.test(name) == false) {

							flag = false;

							jQuery.growl.error({
								message : "No special charecter allowed"
							});

						}

						if (isBlank(image, "Banner Image")) {
							flag = false;
						}

						if (image != "") {
							var control = document.getElementById("image");
							var files = control.files;

							for (var i = 0; i < files.length; i++) {
								if (files[i].type == "image/jpeg"
										|| files[i].type == "image/jpg"
										|| files[i].type == "image/gif"
										|| files[i].type == "image/png"
										|| files[i].type == "image/bmp") {

								} else {
									isImageMsg();
									flag = false;
								}
							}
						}
						
						if(checkFoodItem == true){
							
							if (isBlank(categoryId, "Category")) {
								flag = false;
							}
							
							if (isBlank(foodItemsId, "Food Item")) {
								flag = false;
							}
							
						}else{
							$("#isFoodItem").val(0);
						}
						

						if (flag) {
							return true;
						}

						return false;
					});
			
			/**
			 * is fodd item
			 */
			$("#isFoodItem").click(function(e){
				var foodDiv=$("#food-div");
				
				
				 if($(this).prop('checked')) {
					 foodDiv.show();
					 
					var URL = 'get-active-category';
					var options = '<option value="">Select</option>';
							
							
					jQuery.ajax({
						url  	 : URL,
						type 	 : 'POST',
						success	 : function(data){
							console.log(data);
							
							if(data.length > 0 ){
								$.each(data, function(key, val){
									options+= '<option value="' + val.id + '">' + val.name + '</option>';
								});
							}	
							
							$("#category-food").html(options);
							
						},
						error 	 : function(request, status, error){
							
							$("#category-food").html(options);
						}
					});	
					 
		            } else {
		             foodDiv.hide();
		             $("#category-food").html("");
		             $("#food-item").html("");
		             
		             //$("#category-food-1").html("");
		         }
				
				 
				 $("#category-food").change(function(e){
					 
					 var categoryId = $('#category-food').val();
					 console.log(categoryId);
					 
					 if(categoryId!=null){
						 
						 var URL = 'get-food-item';
						 var foodOptions = '<option value="">Select</option>';
						 jQuery.ajax({
								url  	 : URL,
								type 	 : 'POST',
								data : {
									categoryId : categoryId
								},
								success	 : function(data){
									console.log(data);
									
									if(data.length > 0 ){
										$.each(data, function(key, val){
											foodOptions += '<option value="' + val.id + '">' 	+ val.foodItem + '</option>';
										});
									}	
									
									$("#food-item").html(foodOptions);
									
								},
								error 	 : function(request, status, error){
									
									$("#food-item").html(foodOptions);
								}
							});	
						 
					 }else{
						 $("#food-item").html("");
					 }
					 
				 });
				 
				 
			});
			
			
			/**
			 * on load
			 */
			
			     var categoryId = $('#category-food').val();
			     console.log(categoryId);
			     if(categoryId != null){
			    	 var foodItemSelectObj=$("#food-item");
					 console.log(categoryId);
					 var selectedVal=foodItemSelectObj.data('food-item');
					 var URL = 'get-food-item';
					 var foodOptions = '<option value="">Select</option>';

					 jQuery.ajax({
							url  	 : URL,
							type 	 : 'POST',
							data : {
								categoryId : categoryId
							},
							success	 : function(data){
								console.log(data);
								
								
								if(data.length > 0 ){
									$.each(data, function(key, val){
										foodOptions += '<option value="' + val.id + '">' 	+ val.foodItem + '</option>';
									});
								}	
								
								foodItemSelectObj.html(foodOptions);
								foodItemSelectObj.find("option[value='"+selectedVal+"']").attr("selected","selected");
							},
							error 	 : function(request, status, error){
								
								foodItemSelectObj.html(foodOptions);
							}
						});	
			    	 
			     }
			     
				
				 
			 /**
			  * edit Onload food change category wish 
			  */
				 
				 $("#category-food").change(function(e){
					 
					 var categoryId = $('#category-food').val();
					 console.log(categoryId);
					 
					 if(categoryId!=""){
						 
						 var URL = 'get-food-item';
						 var foodOptions = '<option value="">Select</option>';
						 jQuery.ajax({
								url  	 : URL,
								type 	 : 'POST',
								data : {
									categoryId : categoryId
								},
								success	 : function(data){
									console.log(data);
									
									if(data.length > 0 ){
										$.each(data, function(key, val){
											foodOptions += '<option value="' + val.id + '">' 	+ val.foodItem + '</option>';
										});
									}	
									
									$("#food-item").html(foodOptions);
									
								},
								error 	 : function(request, status, error){
									
									$("#food-item").html(foodOptions);
								}
							});	
						 
					 }else{
						 $("#food-item").html("");
					 }
					 
				 });
			
			

			/**
			 * is used to check form validation at Update time
			 */
			$("#edit-banner-form").submit(
					function(event) {

						var flag = true;

						var note = $("#note").val().trim();
						var status = $("#status").val();
						var image = $("#image").val();
						var checkFoodItem=$("#isFoodItem").prop('checked');
						var categoryId = $("#category-food").val();
						var foodItemsId = $("#food-item").val();

						if (isBlank(note, "Banner Note")) {
							flag = false;
						}
						
						if (/^[a-zA-Z0-9- ]*$/.test(note) == false) {

							flag = false;

							jQuery.growl.error({
								message : "No special charecter allowed"
							});

						}
						
						if (isBlank(status, "Banner status")) {
							flag = false;
						}

						if (image != "") {
							var control = document.getElementById("image");
							var files = control.files;

							for (var i = 0; i < files.length; i++) {

								if (files[i].type == "image/jpeg"
										|| files[i].type == "image/jpg"
										|| files[i].type == "image/gif"
										|| files[i].type == "image/png"
										|| files[i].type == "image/bmp") {

								} else {
									isImageMsg();
									flag = false;
								}
							}
						}
						
						if(checkFoodItem == true){
							
							if (isBlank(categoryId, "Category")) {
								flag = false;
							}
							
							if (isBlank(foodItemsId, "Food Item")) {
								flag = false;
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
 */
function isImageMsg() {
	jQuery.growl.error({
		message : "Please select proper image"
	});
	return true;
}

/**
 * 
 * @param  bannerId
 */
function deleteBannerConfirmation(bannerId) {
	$("#bannerId").val(bannerId);
}
