/**
 * 
 */
jQuery(document).ready(function($) {
	
/**
 * call the event on submit of Add page
 */
	$("#add-combo-item-form").submit(function(e){
		
		var flag = true;
	    var comboCategoryFlag 		= true;
	    var comboTypeFlag 			= true;
		var comboFoodItemFlag 		= true;
		var comboFoodItemSizeFlag 	= true;
		
		var comboName 		 = $("#comboName").val().trim();
		var image 	 	   = $("#image").val();
		var comboPrice		 = $("#comboPrice").val().trim();
		var comboDescription = $("#comboDescription").val().trim();
		
		
		
	   if (isBlank(comboName, "Combo Name")){
			flag = false;
		}
	   
	   if (isBlank(image, "Image")) {
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
					massageDisplay("Please select proper image");
					flag = false;
				}
			}
		}


	   if (isBlank(comboPrice, "Combo Price")){
			flag = false;
		} else {
			
			if(comboPrice == '0') {
				
				flag = false;	
				massageDisplay("Price Can Not Be Zero");
			}
			else if(isNaN(comboPrice)){
				   flag = false;
				   massageDisplay("Please enter a numeric Combo Price");
			   }
		}
	   
	   if (isBlank(comboDescription, "Combo Description")){
			flag = false;
	   }
		   
		   
		  
		//get the dynamic Items value by class  
	   var comboCategoryIds = $('.comboCategoryId-class').map(function() {
            return this.value
        }).get();
	   
	   var comboTypeIds = $('.comboTypeId-class').map(function() {
            return this.value
        }).get();
	   
	   var comboFoodItems = $('.comboFoodItemId-class').map(function() {
            return this.value
        }).get();
	   
	   var comboFoodItemSizes = $('.comboFoodItemSizeId-class').map(function() {
            return this.value
        }).get();
		   

	   if(comboCategoryIds.length == 0 ||  comboCategoryIds.length == 1){
		   massageDisplay("Please bag minimum 2 item");
	   } else {
		   
		   for(var i = 0; i< comboCategoryIds.length;i++){//check combo block for blank field
			   
			   if (comboCategoryIds[i] == "") {
				   comboCategoryFlag = false;
				}
			   
			   if (comboTypeIds[i] == "") {
				   comboTypeFlag = false;
				}
			   
			   if (comboFoodItems[i] == "") {
				   comboFoodItemFlag = false;
				}
			   
			   if (comboFoodItemSizes[i] == "") {
					comboFoodItemSizeFlag = false;
				}	   
			 	
		   }//end of loop
		   
		   if(!comboCategoryFlag){
			   flag = false;
			   massageDisplay("Combo categoty is required");
		   }
		   
		   if(!comboTypeFlag){
			   flag = false;
			   massageDisplay("Combo Type is required");
		   }
		   
		   if(!comboFoodItemFlag){
			   flag = false;
			   massageDisplay("Combo FoodItem is required");
		   }
		   
		   if(!comboFoodItemSizeFlag){
			   flag = false;
			   massageDisplay("Combo FoodItem Size is required");
		   }
	   }
		 

		
		
		if (flag) {
			return true;
		}

		return false;
	});
	
	
/**
 * call the event on submit of Edit page
 */
	$("#edit-combo-item-form").submit(function(e){
		
		
		var flag = true;
	    var comboCategoryFlag 		= true;
	    var comboTypeFlag 			= true;
		var comboFoodItemFlag 		= true;
		var comboFoodItemSizeFlag 	= true;
		
		
		var comboName 		 = $("#comboName").val().trim();
		var image 	 	   = $("#image").val();
		var comboPrice		 = $("#comboPrice").val().trim();
		var comboDescription = $("#comboDescription").val().trim();
		var status			 = $("#status").val();
		
		
	   if (isBlank(comboName, "Combo Name")){
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
					massageDisplay("Please select proper image");
					flag = false;
				}
			}
		}

	   if (isBlank(comboPrice, "Combo Price")){
			flag = false;
		} else {
			
			if(comboPrice == '0') {
				
				flag = false;	
				massageDisplay("Price Can Not Be Zero");
			}
			else if(isNaN(comboPrice)){
				   flag = false;
				   massageDisplay("Please enter a numeric Combo Price");
			   }
		}
	   
	   if (isBlank(comboDescription, "Combo Description")){
			flag = false;
	   }
	   
	   if (isBlank(status, "status")){
			flag = false;
	   }
		   
		   
		  
		//get the dynamic Items value by class  
	   var comboCategoryIds = $('.comboCategoryId-class').map(function() {
            return this.value
        }).get();
	   
	   var comboTypeIds = $('.comboTypeId-class').map(function() {
            return this.value
        }).get();
	   
	   var comboFoodItems = $('.comboFoodItemId-class').map(function() {
            return this.value
        }).get();
	   
	   var comboFoodItemSizes = $('.comboFoodItemSizeId-class').map(function() {
            return this.value
        }).get();
		   

	   if(comboCategoryIds.length == 0 ||  comboCategoryIds.length == 1){
		   massageDisplay("Please bag minimum 2 item");
	   } else {
		   
		   for(var i = 0; i< comboCategoryIds.length;i++){//check combo block for blank field
			   
			   if (comboCategoryIds[i] == "") {
				   comboCategoryFlag = false;
				}
			   
			   if (comboTypeIds[i] == "") {
				   comboTypeFlag = false;
				}
			   
			   if (comboFoodItems[i] == "") {
				   comboFoodItemFlag = false;
				}
			   
			   if (comboFoodItemSizes[i] == "") {
					comboFoodItemSizeFlag = false;
				}	   
			 	
		   }//end of loop
		   
		   if(!comboCategoryFlag){
			   flag = false;
			   massageDisplay("Combo categoty is required");
		   }
		   
		   if(!comboTypeFlag){
			   flag = false;
			   massageDisplay("Combo Type is required");
		   }
		   
		   if(!comboFoodItemFlag){
			   flag = false;
			   massageDisplay("Combo FoodItem is required");
		   }
		   
		   if(!comboFoodItemSizeFlag){
			   flag = false;
			   massageDisplay("Combo FoodItem Size is required");
		   }
	   }
		 

		
		
		if (flag) {
			return true;
		}

		return false;
	});
	

	
	/**
	 * this is called on the change on Category
	 */
	$("#comboCategoryId").change(function(e){
		
		var categoryId = $("#comboCategoryId").val();
		var url = 'active-type-list';
		var options = '<option value="">Select</option>';
		if(categoryId != ""){
			
			
			
			jQuery.ajax({
				url  	 : url,
				type 	 : 'POST',
				dataType : 'json',
				data 	 : {categoryId : categoryId},
				success	 : function(data){
					
					if(data.length > 0 ){
						$.each(data, function(key, val){
							options+= '<option value="' + val.id + '">' + val.name + '</option>';
						});
					}	
					
					$("#comboTypeId").html(options);
					$("#comboFoodItemId").html('<option value="">Select</option>');				
					$("#comboFoodItemSizeId").html('<option value="">Select</option>');
					
				},
				error 	 : function(request, status, error){
					
					$("#comboTypeId").html(options);
					$("#comboFoodItemId").html(options);				
					$("#comboFoodItemSizeId").html(options);
				}
			});			
		} else {
			
			$("#comboTypeId").html(options);
			$("#comboFoodItemId").html(options);				
			$("#comboFoodItemSizeId").html(options);
		}
	});
	//end of 
	
	/**
	 * this is called on the change on Type
	 */
	$("#comboTypeId").change(function(e){
		
		var comboTypeId = $("#comboTypeId").val();
		
		var url = 'active-food-item-list';
		var options = '<option value="">Select</option>';
		
		if(comboTypeId != ""){
			
			jQuery.ajax({
				url  	 : url,
				type 	 : 'POST',
				cache    : false,
				dataType : 'json',
				data 	 : { comboTypeId : comboTypeId},
				success	 : function(data){
					
					if(data.length > 0 ){
						$.each(data, function(key, val){
							options+= '<option value="' + val.id + '">' + val.foodItem + '</option>';
						});
					}
					
					$("#comboFoodItemId").html(options);				
					$("#comboFoodItemSizeId").html('<option value="">Select</option>');
					
				},
				error 	 : function(request, status, error){
					$("#comboFoodItemId").html(options);
					$("#comboFoodItemSizeId").html('<option value="">Select</option>');
				}
			});			
		} else {
			$("#comboFoodItemId").html(options);
			$("#comboFoodItemSizeId").html('<option value="">Select</option>');
		}	
	});
	//end of 
	
	/**
	 * this is called on the change on Type
	 */
	$("#comboFoodItemId").change(function(e){
		
		var foodItemId = $("#comboFoodItemId").val();
		
		var url = 'food-item-size-list';
		var options = '<option value="">Select</option>';
		
		if(foodItemId != ""){
			
			jQuery.ajax({
				url  	 : url,
				type 	 : 'POST',
				cache    : false,
				dataType : 'json',
				data 	 : { foodItemId : foodItemId},
				success	 : function(data){
				
					if(data.length > 0 ){
						$.each(data, function(key, val){
							options+= '<option value="' + val.id + '">' + val.name + '</option>';
						});
					}	
					
					$("#comboFoodItemSizeId").html(options);
					
				},
				error 	 : function(request, status, error){
					$("#comboFoodItemSizeId").html(options);
				}
			});			
		} else {
			$("#comboFoodItemSizeId").html(options);
		}	
	});
	//end of 
	
	$("#combo-bag-id").on("click", function(){
		
		var flag = true;
		
		var comboCategoryId 		= $("#comboCategoryId").val();
		var comboTypeId 			= $("#comboTypeId").val();
		var comboFoodItemId 		= $("#comboFoodItemId").val();
		var comboFoodItemSizeId 	= $("#comboFoodItemSizeId").val();
		
		var comboCategoryHtml 		= $("#comboCategoryId").text();
		var comboTypeHtml 			= $("#comboTypeId").text();
		var comboFoodItemHtml		= $("#comboFoodItemId").text();
		var comboFoodItemSizeHtml 	= $("#comboFoodItemSizeId").text();
		
		var comboCount				= $("#comboCount").val();
		
		if (isBlank(comboCategoryId, "Category")) {
			flag = false;
		}
		
		if (isBlank(comboTypeId, "Type")) {
			flag = false;
		}
		
		if (isBlank(comboFoodItemId, "Food Item")) {
			flag = false;
		}
		
		if (isBlank(comboFoodItemSizeId, "Food Item Size")) {
			flag = false;
		}
		
		
		if(flag){
			
			var selectBoxCategory 	  = getCategorySelectBox(comboCategoryId,comboCount);
			var selectBoxType 	 	  = getTypeSelectBox(comboTypeId, comboCount);
			var selectBoxFoodItem	  = getFoodItemSelectBox(comboFoodItemId, comboCount);
			var selectBoxFoodItemSize = getFoodItemSizeSelectBox(comboFoodItemSizeId, comboCount);
			
			var newComboCount = parseInt(comboCount)+1;
			var html = '<tr id="bag-item-row-' + comboCount + '">'							
							+'<td>'+selectBoxCategory +'</td>'
							+'<td>' +selectBoxType +'</td>'
							+'<td>'+selectBoxFoodItem +'</td>'
							+'<td>'+ selectBoxFoodItemSize +'</td>'
							+'<td><a onclick="return deleteBagItem(' +comboCount+ ')"><i class="fa fa-trash-o"></i></a></td>'
						+'</tr>';			
			
			$("#comboCount").val(newComboCount);
			$('#tbody-food-item').append(html);
			
			$('#comboCategoryId option[value=""]').prop("selected", true);
			$("#comboTypeId").html('<option value="">Select</option>');
			$("#comboFoodItemId").html('<option value="">Select</option>');
			$("#comboFoodItemSizeId").html('<option value="">Select</option>');
		} 
		
	});
	
		
});

function deleteBagItem(id){
	 if (confirm("Are you sure?") == true) {
		 $("#bag-item-row-"+id).remove();
	 }
}

/**
 * for category select box
 * @param comboCategoryId
 * @returns {String}
 */
function getCategorySelectBox(comboCategoryId, comboCount){
	
	var comboCategoryAllIds = $.map($('#comboCategoryId option') ,function(e) {
	    return e.value;
	});
	
	var comboCategoryAllTexts = $.map($('#comboCategoryId option') ,function(e) {
	    return e.text;
	});
	
	var selectBoxCategory = '<select class="comboCategoryId-class" onchange="return getTypeList(' + comboCount + ')" name ="comboCategoryId" id = "comboCategoryId-' + comboCount  + '">[categoryOption]</select>';
	var categotyOption = '';
	
	for(var i=0; i <comboCategoryAllIds.length; i++){
		
		if(comboCategoryId == comboCategoryAllIds[i]){
			
			categotyOption+='<option value="'+comboCategoryAllIds[i] +'" selected> '+comboCategoryAllTexts[i] +' </option>';
			
		} else {
			
			categotyOption+='<option value="'+comboCategoryAllIds[i] +'"> '+comboCategoryAllTexts[i] +' </option>';
		}
		
	}
	
	selectBoxCategory = selectBoxCategory.replace("[categoryOption]", categotyOption);
	
	return selectBoxCategory;
}

/**
 * for type select box
 * @param comboCategoryId
 * @returns {String}
 */
function getTypeSelectBox(comboTypeId, comboCount){
	
	var comboTypeIdAllIds = $.map($('#comboTypeId option') ,function(e) {
	    return e.value;
	});
	
	var comboTypeIdAllTexts = $.map($('#comboTypeId option') ,function(e) {
	    return e.text;
	});
	
	var selectBoxType = '<select class="comboTypeId-class" onchange="return getFoodItemList(' + comboCount + ')"  name ="comboTypeId" id="comboTypeId-' + comboCount  + '">[typeOption]</select>';
	var typeOption = '';
	
	for(var i=0; i <comboTypeIdAllIds.length; i++){
		
		if(comboTypeId == comboTypeIdAllIds[i]){
			
			typeOption+='<option value="'+comboTypeIdAllIds[i] +'" selected> '+comboTypeIdAllTexts[i] +' </option>';
			
		} else {
			
			typeOption+='<option value="'+comboTypeIdAllIds[i] +'"> '+comboTypeIdAllTexts[i] +' </option>';
		}
		
	}
	
	selectBoxType = selectBoxType.replace("[typeOption]", typeOption);
	
	return selectBoxType;
}

/**
 * this is used for Food Item Select Box
 * @param comboFoodItemId
 * @param comboCount
 * @returns {String}
 */
function getFoodItemSelectBox(comboFoodItemId, comboCount){
	
	var comboFoodItemAllIds = $.map($('#comboFoodItemId option') ,function(e) {
	    return e.value;
	});
	
	var comboFoodItemAllTexts = $.map($('#comboFoodItemId option') ,function(e) {
	    return e.text;
	});
	
	var selectBoxType = '<select class="comboFoodItemId-class" onchange="return getFoodItemSize(' + comboCount + ')" name ="comboFoodItemId" id="comboFoodItemId-' + comboCount  + '">[foodItemOption]</select>';
	var foodItemOption = '';
	
	for(var i=0; i <comboFoodItemAllIds.length; i++){
		
		if(comboFoodItemId == comboFoodItemAllIds[i]){
			
			foodItemOption+='<option value="'+comboFoodItemAllIds[i] +'" selected> '+comboFoodItemAllTexts[i] +' </option>';
			
		} else {
			
			foodItemOption+='<option value="'+comboFoodItemAllIds[i] +'"> '+comboFoodItemAllTexts[i] +' </option>';
		}
		
	}
	
	selectBoxType = selectBoxType.replace("[foodItemOption]", foodItemOption);
	
	return selectBoxType;
}

/**
 * this method is used for set food Item Size
 * @param comboFoodItemSizeId
 * @param comboCount
 * @returns {String}
 */
function getFoodItemSizeSelectBox(comboFoodItemSizeId, comboCount){
	
	var comboFoodItemSizeAllIds = $.map($('#comboFoodItemSizeId option') ,function(e) {
	    return e.value;
	});
	
	var comboFoodItemSizeAllTexts = $.map($('#comboFoodItemSizeId option') ,function(e) {
	    return e.text;
	});
	
	var selectBoxType = '<select class="comboFoodItemSizeId-class" name ="comboFoodItemSizeId" id="comboFoodItemSizeId-' + comboCount  + '">[foodItemSizeOption]</select>';
	var foodItemSizeOption = '';
	
	for(var i=0; i <comboFoodItemSizeAllIds.length; i++){
		
		if(comboFoodItemSizeId == comboFoodItemSizeAllIds[i]){
			
			foodItemSizeOption+='<option value="'+comboFoodItemSizeAllIds[i] +'" selected> '+comboFoodItemSizeAllTexts[i] +' </option>';
			
		} else {
			
			foodItemSizeOption+='<option value="'+comboFoodItemSizeAllIds[i] +'"> '+comboFoodItemSizeAllTexts[i] +' </option>';
		}
		
	}
	
	selectBoxType = selectBoxType.replace("[foodItemSizeOption]", foodItemSizeOption);
	
	return selectBoxType;
}



/**
 * this function is to delete purpose
 * @param comboId
 */
function deleteComboConfirmation(comboId){
	$("#comboId").val(comboId);
}


/**
 * this method is used to get the List of Type List
 * @param categoryId
 */
function getTypeList(id){
	
	var categoryId = $("#comboCategoryId-" + id).val();
	
	var url = 'active-type-list';
	var options = '<option value="">Select</option>';
	
	if(categoryId != ""){
		
		jQuery.ajax({
			url  	 : url,
			type 	 : 'POST',
			dataType : 'json',
			data 	 : {categoryId : categoryId},
			success	 : function(data){
				
				if(data.length > 0 ){
					$.each(data, function(key, val){
						options+= '<option value="' + val.id + '">' + val.name + '</option>';
					});
				}	
				
				$("#comboTypeId-"+id).html(options);
				$("#comboFoodItemId-"+id).html('<option value="">Select</option>');
				$("#comboFoodItemSizeId-"+id).html('<option value="">Select</option>');
				
			},
			error 	 : function(request, status, error){
				$("#comboTypeId-"+id).html(options);
				$("#comboTypeId-"+id).html(options);
				$("#comboFoodItemId-"+id).html(options);
				$("#comboFoodItemSizeId-"+id).html(options);
			}
		});			
	} else {
		$("#comboTypeId-"+id).html(options);
		$("#comboTypeId-"+id).html(options);
		$("#comboFoodItemId-"+id).html(options);
		$("#comboFoodItemSizeId-"+id).html(options);
	}	
}

/**
 * this method is used to get the List of Type List
 * @param categoryId
 */
function getFoodItemList(id){
	
	var comboTypeId = $("#comboTypeId-" + id).val();
	var foodItemId = $("#id").val(); /*this #id is the field at the page and different from id(function parameter) */
	
	if(typeof foodItemId == "undefined"){
		foodItemId = '';
	}
	
	var url = 'active-food-item-list';
	var options = '<option value="">Select</option>';
	
	if(comboTypeId != ""){
		
		jQuery.ajax({
			url  	 : url,
			type 	 : 'POST',
			cache    : false,
			dataType : 'json',
			data 	 : { comboTypeId : comboTypeId, foodItemId : foodItemId},
			success	 : function(data){
			
				if(data.length > 0 ){
					$.each(data, function(key, val){
						options+= '<option value="' + val.id + '">' + val.foodItem + '</option>';
					});
				}	
				
				$("#comboFoodItemId-"+id).html(options);		
				$("#comboFoodItemSizeId-"+id).html('<option value="">Select</option>');
				
			},
			error 	 : function(request, status, error){
				$("#comboFoodItemId-"+id).html(options);
				$("#comboFoodItemSizeId-"+id).html('<option value="">Select</option>');
			}
		});			
	} else {
		$("#comboFoodItemId-"+id).html(options);
		$("#comboFoodItemSizeId-"+id).html('<option value="">Select</option>');
	}	
}

/**
 * this function is used to get the size of the foodItem according to the Food Item Id
 */
function getFoodItemSize(id){
	
	var foodItemId = $("#comboFoodItemId-" + id).val();
	
	var url = 'food-item-size-list';
	var options = '<option value="">Select</option>';
	
	if(foodItemId != ""){
		
		jQuery.ajax({
			url  	 : url,
			type 	 : 'POST',
			cache    : false,
			dataType : 'json',
			data 	 : { foodItemId : foodItemId},
			success	 : function(data){
			
				if(data.length > 0 ){
					$.each(data, function(key, val){
						options+= '<option value="' + val.id + '">' + val.name + '</option>';
					});
				}	
				
				$("#comboFoodItemSizeId-"+id).html(options);
				
			},
			error 	 : function(request, status, error){
				$("#comboFoodItemSizeId-"+id).html(options);
			}
		});			
	} else {
		$("#comboFoodItemSizeId-"+id).html(options);
	}	
}



/**
 * 
 * @param id
 * @returns {Boolean}
 */
function comboOptionDelete(id){	 
	
	     if (confirm("Are you sure?") == true) {	    	 
	    	 $("#combo-delete-div-"+id).remove();	    	 
	     } 	     
	     return false;
}

/**
 * 
 * @param string
 * @param field
 * @returns {Boolean}
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