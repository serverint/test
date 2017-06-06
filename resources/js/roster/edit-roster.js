/**
 * 
 */

$(document).ready(function($) {
	
	
	/**
	 * 
	 */
	
	$("#edit-roster-form").on('submit', function(e){
		
		var flag = true;
		var foodItemFlag = true;
		var categoryFlag = true;
		
		var dayOfWeek = $("#week").val();
	
	    var categoryIds = $('.categoryopt').map(function() {
            return this.value
        }).get();
	    
	  
	    
		
	   if (isBlank(dayOfWeek, "Day")){
			flag = false;
	   }
	
	    if(categoryIds.length == 1){
		   flag = false;		   
		   massageDisplay("Category can not be blank");
	   }
	   
	   
	   for(var i=0; i < (categoryIds.length - 1) ; i++){
		   
		   if (categoryIds[i] == ''){
				flag = false;
				categoryFlag = false;
		   }
		   
		  /* //checking the food Item is 
		   var foodItemIds = [];
		   
		   jQuery('#foodItems'+i+' :selected').each(function(j, selectedElement) {
			   
			   foodItemIds[j] = $(selectedElement).val();
				
			});
		   
		   
		   
		   if(foodItemIds.length == 0){
			   foodItemFlag = false;
			   flag = false;
		   }*/		  
	   }
	   
	   if(!categoryFlag){
		   massageDisplay("Category can not be blank");
	   }
	   
	   if(!foodItemFlag){
		   massageDisplay("Food Item can not be blank");
	   }
	   
	   $(".add-show-more").children(".show-food").each(function(){
//		   console.log($(this));
//		   console.log($(this)[0]);
		  if( $(this).find("Select").val() == null ){
			  flag = false;
			  massageDisplay("Food Item cannot be blank");
			  
		  }
		   
	   });
		 
	   if (flag) {
			return true;
	  }

	  return false;
});
	
	$("#show-add-more").on("click",".delete", function(e){
		
		$(this).parent().prev().prev().remove();
		$(this).parent().prev().remove();
		$(this).parent().remove();
	
	});
		
	$("#add-more-button").click(function() {

		var temp = $(".add-cat").html();

		$("#show-add-more").append(temp);

	});

	$("#show-add-more").on("change",".categoryopt",function() {
			 // $("#show-add-more").find()
				var allFoods = getAllfoodsByCategory($(this).val());

				var foodDiv = $(this).parent().next();
				var selectTag = foodDiv.find("select");
				options = "";
				
				$.each(allFoods, function(index, value) {
					/*
					 * var foodIndex = findFood(selectedFoods,
					 * value.id); if (foodIndex != -1) { options += '<option
					 * value="' + value.id + '" selected>' +
					 * value.foodItem + '</option>'; } else {
					 */
					options += '<option value="' + value.id + '">' + value.foodItem + '</option>';
					// }
				});
				
				selectTag.html(options);
			});

	$("#show-add-more").children(".show-category").each(function() {
				
				var week = $("#id").val();
				var categoryId = $(this).find(".categoryopt").val();

				var selectedFoods = {};
				
				$.ajax({
					type : "get",
					url : "edit-roster-Ajax?week=" + week + "&catId="+ categoryId,
					async : false,
					success : function(data) {
						selectedFoods = data;
					}
				});

				var foodDiv = $(this).next();
				
				var selectTag = foodDiv.find("select");
				
				//selectTag.outerHTML = objectEl.outerHTML.replace(/data="(.+?)"/, 'data="' + newUrl + '"');
				
				var allFoods = getAllfoodsByCategory(categoryId);// allfoods
				options = "";
				
				$.each(allFoods, function(index, value) {
					
					var foodIndex = findFood(selectedFoods, value.id);
					
					if (foodIndex != -1) {								
						options += '<option value="' + value.id + '" selected>' + value.foodItem + '</option>';
					} else {								
						options += '<option value="' + value.id + '">' + value.foodItem + '</option>';
					}
				});
				
				selectTag.html(options);

			});

	var rowId = 1;
	// alert($("#categoryId" + rowId));
	$("#categoryId" + rowId).change(
			function(e) {
				var categoryId = $("#categoryId" + rowId).val();
				// $("#foodItems").select2("val", "");
				if (categoryId != "") {

					var URL = 'get-food-item';
					var options = '';

					jQuery.ajax({
						url : URL,
						type : 'POST',
						dataType : 'json',
						data : {
							categoryId : categoryId
						},
						success : function(data) {
							// var data = jQuery.parseJSON(data);
							
							if (data.length > 0) {
								// $("#foodItems").html("");

								$.each(data, function(key, val) {
									console.info(val);
									options += '<option value="' + val.id + '">' + val.itemName + '</option>';
								});
							}
							$("#foodItems").html(options);

						},
						error : function(request, status, error) {

						}
					});
				}
			});

	$(".select2").select2();

});

function findFood(selectedFoods, foodId) {
	for (i = 0; i < selectedFoods.length; i++) {
		// alert("selectedFoods[i].id"+selectedFoods[i].id);
		// alert("foodId"+foodId);
		if (selectedFoods[i].id == foodId) {
			return i;
		}
	}
	return -1;
}

function getAllfoodsByCategory(cid) {
	var responseDate = {};
	var URL = 'get-food-item';
	var options = '';

	jQuery.ajax({
		url : URL,
		type : 'POST',
		dataType : 'json',
		data : {
			categoryId : cid
		},
		async : false,
		success : function(data) {
			// var data = jQuery.parseJSON(data);
			responseDate = data;

		}
	});
	
	return responseDate;
}

/*function getCategoryList(id) {
	
	var rowId = id;
	var categoryId = $("#categoryId" + rowId).val();
	// $("#foodItems").select2("val", "");
	if (categoryId != "") {

		var URL = 'get-food-item';
		var options = '';

		jQuery.ajax({
			url : URL,
			type : 'POST',
			dataType : 'json',
			data : {
				categoryId : categoryId
			},
			success : function(data) {
				// var data = jQuery.parseJSON(data);
				
				$("#foodItems" + rowId).html("");
				
				if (data.length > 0) {
					// $("#foodItems").html("");

					$.each(data, function(key, val) {						
						options += '<option value="' + val.id + '">' + val.foodItem + '</option>';
					});
				}
				
				$("#foodItems" + rowId).html(options);

			},
			error : function(request, status, error) {

			}
		});
	}

}*/
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