/**
 * author Supratim Sarkar
 */
jQuery(document).ready(function($) {
	
	$(".select2").select2();
	


	$("#add-addon-form").on('submit',function(e) {

				var flag = true;				
				var foodItemFlag = true;
				var categoryFlag = true;
				var foodCount = 0;

				var dayOfWeek = $("#dayOfWeek").val();

				var categoryIds = $('.category-class').map(function() {
									return this.value
								 }).get();				
				

				if (isBlank(dayOfWeek, "Day")) {
					flag = false;
				}

				if (categoryIds.length == 0) {
					flag = false;
					massageDisplay("Category can not be blank");
				}

				for (var i = 0; i < categoryIds.length; i++) {

					if (categoryIds[i] == '') {
						flag = false;
						categoryFlag = false;
					}
				}
				
			 $(this).find("[name='foodItemIds']").each(function(){
				 foodCount = foodCount + 1;
				  if( $(this).val() == null ){
					  flag = false;
					  massageDisplay("Food Item cannot be blank");					  
				  }
			   });
			
			 if(foodCount == 0){
				 flag = false;
				  massageDisplay("Food Item cannot be blank");
			 }
						
						
			if (!categoryFlag) {
				massageDisplay("Category can not be blank");
			}

			if (!foodItemFlag) {
				massageDisplay("Food Item can not be blank");
			}

			if (flag) {
				return true;
			}

			return false;
	});
	
	
	$("#edit-addon-form").on('submit',function(e) {

		var flag = true;				
		var foodItemFlag = true;
		var categoryFlag = true;
		var foodCount = 0;

		var dayOfWeek = $("#dayOfWeek").val();
		var status    = $("#status").val();

		var categoryIds = $('.category-class').map(function() {
							return this.value
						 }).get();	
		
		if (isBlank(dayOfWeek, "Day")) {
			flag = false;
		}
		
		if (isBlank(status, "Status")) {
			flag = false;
		}

		if (categoryIds.length == 0) {
			flag = false;
			massageDisplay("Category can not be blank");
		}

		for (var i = 0; i < categoryIds.length; i++) {

			if (categoryIds[i] == '') {
				flag = false;
				categoryFlag = false;
			}
		}
		
	 $(this).find("[name='foodItemIds']").each(function(){
		 foodCount = foodCount + 1;
		  if( $(this).val() == null ){
			  flag = false;
			  massageDisplay("Food Item cannot be blank");					  
		  }
	   });
	
	 if(foodCount == 0){
		 flag = false;
		  massageDisplay("Food Item cannot be blank");
	 }
				
				
	if (!categoryFlag) {
		massageDisplay("Category can not be blank");
	}

	if (!foodItemFlag) {
		massageDisplay("Food Item can not be blank");
	}

	if (flag) {
		return true;
	}

	return false;
});


					
	$("#bag-food-item").on("click", function(e){
		
		var flag = true;
		
		var itemCount    = $("#itemCount").val();
		var  categoryId  = $("#categoryId-0").val();
		var foodItemsIds = [];		
		
		jQuery('#foodItems-0 :selected').each(function(i, selectedElement) {
			foodItemsIds[i] = $(selectedElement).val();
		});
		
		if (isBlank(categoryId, "Category")) {
			flag = false;
		}
		
		if(foodItemsIds.length == 0){
			flag = false;
			massageDisplay("Food item can not be blank");
		}
		
		if(flag){
			
			var newItemCount = parseInt(itemCount) + 1;
			
			
			var categoryHtml = getCategorySelectBox(categoryId, newItemCount );
			var foodItemHtml = getFoodItemSelectBox(foodItemsIds, newItemCount );
			
			var html = '<tr id="bag-item-row-' + newItemCount + '">'							
						+'<td>'+categoryHtml +'</td>'				
						+'<td>'+ foodItemHtml +'</td>'
						+'<td><a onclick="return deleteRoasterBagItem(' +newItemCount+ ')"><i class="fa fa-trash-o"></i></a></td>'
					 +'</tr>';			

				$("#itemCount").val(newItemCount);			
				$('#tbody-food-item').append(html);
				
				$('#categoryId-0 option[value=""]').prop("selected", true);
				$("#foodItems-0").html("");	
				$(".select2").select2();
				$("#bag-item-row-"+newItemCount).find(".select2").css("width",'65%');
		}
		
	});

});//end of document ready 


function deleteRoasterBagItem(id){
	
	 if (confirm("Are you sure?") == true) {
		 $("#bag-item-row-"+id).remove();
	 }
}

/**
 * 
 * @param row
 */
function getCategoryList(row) {

	var categoryId = $("#categoryId-" + row).val();
	
	$("#foodItems-0").html("");
	
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
				
				if (data.length > 0) {				

					$.each(data, function(key, val) {
						var arr = [];
						$("select[name='categoryId'] option:selected[value='"+ $("#categoryId-0").val()+"']").each(function(){
							var tempArr = $(this).closest("td").parent().find("td:nth-child(2) select").val();
							if(tempArr != null){
								$.merge( arr, tempArr );
							}
							
						});
						
						if($.inArray(String(val.id), arr ) == -1){
							options += '<option value="' + val.id + '">' 	+ val.foodItem + '</option>';
						}
						
					});
				}
				$("#foodItems-" + row).select2("val", "");
				$("#foodItems-" + row).html(options);
				
			},
			error : function(request, status, error) {

			}
		});
	}else {
		$("#foodItems-" + row).select2("val", "");
		$("#foodItems-" + row).html("");
		
	}

}
/**
 * This is the Reloading the Category
 */

function reloadCategoryList(){
	
	
	//getCategoryList(0);
	/*$('#categoryId-0 option[value=""]').prop("selected", true);
	$("#foodItems-0").html("");	
	$(".select2").select2();*/
	//getCategoryList(0)
	$(".select2").select2();
	getCategoryList(0);
	
	
}


/**
 * 
 * @param categoryId
 * @param count
 * @returns {String}
 */
function getCategorySelectBox(categoryId, count){
	
	var categoryAllIds = $.map($('#categoryId-0 option') ,function(e) {
	    return e.value;
	});;
	var categoryAllTexts = $.map($('#categoryId-0 option') ,function(e) {
	    return e.text;
	});
;
	
	var selectBoxCategory = '<select class="form-control category-class" onchange="return getCategoryList(' + count + ')" name ="categoryId" id = "categoryId-' + count  + '">[categoryOption]</select>';
	var categotyOption = '';
	
	for(var i=0; i <categoryAllIds.length; i++){
		
		if(categoryId == categoryAllIds[i]){
			
			categotyOption+='<option value="'+categoryAllIds[i] +'" selected> '+categoryAllTexts[i] +' </option>';
			
		} else {
			
			categotyOption+='<option value="'+categoryAllIds[i] +'"> '+categoryAllTexts[i] +' </option>';
		}
		
	}
	
	selectBoxCategory = selectBoxCategory.replace("[categoryOption]", categotyOption);
	
	return selectBoxCategory;
}

/**
 * 
 * @param foodItemsIds
 * @param comboCount
 * @returns {String}
 */
function getFoodItemSelectBox(foodItemsIds, comboCount){
	
	var foodItemAllIds = $.map($('#foodItems-0 option') ,function(e) {
	    return e.value;
	});
	
	var foodItemAllTexts = $.map($('#foodItems-0 option') ,function(e) {
	    return e.text;
	});
	
	var selectBoxType = '<select  multiple="multiple" class="form-control foodItems-class select2"  name ="foodItemIds" id="foodItems-' + comboCount  + '">[foodItemOption]</select>';
	var foodItemOption = '';
	
	for(var i=0; i <foodItemAllIds.length; i++){
		
		if(($.inArray(foodItemAllIds[i],foodItemsIds)) != -1){
			
			foodItemOption+='<option value="'+foodItemAllIds[i] +'" selected> '+foodItemAllTexts[i] +' </option>';
			
		} else {
			
			foodItemOption+='<option value="'+foodItemAllIds[i] +'"> '+foodItemAllTexts[i] +' </option>';
		}
		
	}
	
	selectBoxType = selectBoxType.replace("[foodItemOption]", foodItemOption);
	
	return selectBoxType;
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

function deleteRosterConfirmation(roasterId) {
	$("#roasterId").val(roasterId);
}