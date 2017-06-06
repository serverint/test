/**
 * 
 */
jQuery(document).ready(function($) {
	
	
      $(".select2").select2();
      $(".defaultAddonIds").select2();
	  
	  $("#newItemStartDate").datepicker({
		  changeMonth: true,
	      changeYear: true,
	      dateFormat: "dd-mm-yy",
	      minDate: 0,
	      onSelect: function(selected) {
	          $("#newItemEndDate").datepicker("option","minDate", selected)
	        }
	  });
	  
	  $("#newItemEndDate").datepicker({
		  changeMonth: true,
	      changeYear: true,
	      dateFormat: "dd-mm-yy",
	      minDate: 0,
	      onSelect: function(selected) {
	           $("#newItemStartDate").datepicker("option","maxDate", selected)
	        }
	  });

	 
/**
 * call the event on submit of Add page
 */
	$("#button-sub").click(function(e){
		
		var flag = true;		

		var itemName 	   = $("#itemName").val().trim();
		var keyword 	   = $("#keyword").val().trim();
		var preparationTime= $("#preparationTime").val();
		var deliveryTime= $("#deliveryTime").val();
		var image 	 	   = $("#image").val();
		var foodBannerImage = $("#foodItemBannerImage").val();
		var categoryId     = $("#categoryId").val();
		var typeId 		   = $("#typeId").val();
		var commonDesciption = $("#commonDesciption").val().trim();
				
		var isNewItem	     = 0;	
		var addonIsAvailable = 0;
		var newItemStartDate = $("#newItemStartDate").val();
		var newItemEndDate   = $("#newItemEndDate").val();
		
		if($("#isNewItem").is(":checked")){			
			isNewItem = 1;					
		} 
		
		if($("#addonIsAvailable").is(":checked")){			
			addonIsAvailable = 1;					
		} 
		
		var sizeIds 	  = [];
		var sizeIdName    = [];
		var addonIds 	  = [];
		
	
		
		jQuery('#sizeIds :selected').each(function(i, selectedElement) {
			sizeIds[i] = $(selectedElement).val();
			sizeIdName[i] = $(selectedElement).text();
		});	
		
		jQuery('#addonIds :selected').each(function(i, selectedElement) {
			addonIds[i] = $(selectedElement).val();			
		});	
		
	
		
		if (isBlank(itemName, "Food Item Name")) {
			flag = false;
		} else {			
			if(itemName.length >30){
				flag = false;
				massageDisplay("Item name should be in 30 character");
			}
		}
		
		
		if (isBlank(keyword, "Food Item Keyword")) {
			flag = false;
		} else {			
			if(keyword.length >30){
				flag = false;
				massageDisplay("Item keyword should be in 30 character");
			}
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
		if (isBlank(foodBannerImage, "Food Item Banner Image")) {
			flag = false;
		}
		if (foodBannerImage != "") {
			var control = document.getElementById("foodItemBannerImage");
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
		
		if (isBlank(categoryId, "Category")) {
			flag = false;
		}
		
		if(isBlank(typeId, "Type")){
			flag = false;
		}
		
		if(isBlank(commonDesciption, "Food Desciption")){
			flag = false;
		}
		
		if(sizeIds.length == 0){
			massageDisplay("Please select size");
		}
		
		//checking Item size Price
		for(var i = 0 ; i < sizeIds.length ; i++ ){
								
			var itemSizePrice = $("#itemSizePrice-" + sizeIds[i]).val();
			var discountAmount = $("#discountAmount-" + sizeIds[i]).val();
			
			if(isBlank(itemSizePrice , "Price of "+sizeIdName[i] +" Item")){
				flag = false;
			} else {
				
				if(isNaN(itemSizePrice)){
					flag = false;
					massageDisplay("Price of "+sizeIdName[i] +" item should be numeric value");
				}
				
				if(discountAmount != ''){					
					if(isNaN(discountAmount)){
						flag = false;
						massageDisplay("Discount Amount for "+ sizeIdName[i]+ " Size should be numoric");
					}
				}
			}
			
		}// end loop for Item size price
		
		
		if (isBlank(preparationTime, "Preparation Time")) {
			flag = false;
		}
		
		//alert(preparationTime);
		
		if (preparationTime == "00:0") {
			flag = false;
			massageDisplay("Please check Preparation Time");
		}
		
		if (deliveryTime == "00:0") {
			flag = false;
			massageDisplay("Please check Delivery Time");
		}
		
		if(isNewItem == 1){// if New Item is available, check the Start date and end date
			
			if (isBlank(newItemStartDate, "New Item Start Date")) {
				flag = false;
			}
			
			if (isBlank(newItemEndDate, "New Item End Date")) {
				flag = false;
			}
		}

		
		if(addonIsAvailable == 1){
			
			if(addonIds.length == 0){
				massageDisplay("Addon can not be blank");
			}
			
			for(var i = 0 ; i < sizeIds.length ; i++ ){
				
				var defaultAddons = $("#defaultAddons-" + sizeIds[i]).val();
				var maxAddons 	  = $("#maxAddons-" + sizeIds[i]).val();
				
				
				
				var selectedDefaultAddonsIds = [];
				
			
				jQuery('#defaultAddonIds_'+sizeIds[i]+' :selected').each(function(i, selectedElement) {
					selectedDefaultAddonsIds[i] = parseInt($(selectedElement).val());
					
				});
				
				
			/*	jQuery('#sizeIds :selected').each(function(i, selectedElement) {
					sizeIds[i] = $(selectedElement).val();
					sizeIdName[i] = $(selectedElement).text();
				});*/
				
				
				
				if(defaultAddons == ''){
					flag = false;
					massageDisplay("Default Addon Count for "+ sizeIdName[i]+ " Size can not blank");
				} else {					
					if(isNaN(defaultAddons)){
						flag = false;
						massageDisplay("Default Addon Count for "+ sizeIdName[i]+ " Size should be numoric");
					}
				}
				
				if(maxAddons == ''){
					flag = false;
					massageDisplay("Max Addon Count for "+ sizeIdName[i]+ " Size can not blank");
					
				} else {					
					if(isNaN(maxAddons)){
						flag = false;
						massageDisplay("Max Addon Count for "+ sizeIdName[i]+ " Size should be numoric");
					}
				}
				
				if(parseInt(maxAddons) < parseInt(defaultAddons)){
					flag = false;
					massageDisplay("Max Addon for"+ sizeIdName[i]+ " Size should be should larger/equal than Default Addon ");
				}
				
				if(parseInt(defaultAddons) > selectedDefaultAddonsIds.length ){
					flag = false;
					massageDisplay("For "+ sizeIdName[i]+" size, at least "+parseInt(defaultAddons)+" Default Addon have to be select ");
				}
				
				
			}// end of loop		
			
		}	
		
		if (flag) {
			
			if (confirm("Do you want to add this food in Roster ?") == true){				
				 $("#wishToRoaster").val("1");				 
				 $("#mydelModal").modal();
			} else {
				$("#wishToRoaster").val("0");				
				document.getElementById("add-food-item-form").submit();
			}
		} else {
			$("#wishToRoaster").val("0");
		}

		
		
		return false;
	});
	
	/**
	 * 
	 */
	$("#add-food-item-form").on("submit",function(e){		
		var flag = true;
		
		var wishToRoaster = $("#wishToRoaster").val();
		var dayOfWeek = $("#dayOfWeek").val();

		if(wishToRoaster == "1"){	
			
			if (typeof dayOfWeek == "undefined" || dayOfWeek =="") {
				flag = false;			
				massageDisplay("Please Select a day");
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
	$("#edit-food-item-form").submit(function(e){
		var flag = true;		

		var itemName 	   = $("#itemName").val().trim();
		var keyword 	   = $("#keyword").val().trim();
		var preparationTime= $("#preparationTime").val();
		var deliveryTime= $("#deliveryTime").val();
		var image 	 	   = $("#image").val();
		var foodBannerImage = $("#foodItemBannerImage").val();
		var categoryId     = $("#categoryId").val();
		var typeId 		   = $("#typeId").val();	
		var commonDesciption = $("#commonDesciption").val().trim();
		var status 		   = $("#status").val();

		
		var isNewItem	     = 0;	
		var addonIsAvailable = 0;
		var newItemStartDate = $("#newItemStartDate").val();
		var newItemEndDate   = $("#newItemEndDate").val();
		
		if($("#isNewItem").is(":checked")){			
			isNewItem = 1;					
		} 
		
		if($("#addonIsAvailable").is(":checked")){			
			addonIsAvailable = 1;					
		} 
		
		var sizeIds 	  = [];
		var sizeIdName    = [];
		var addonIds 	  = [];
		
	
		
		jQuery('#sizeIds :selected').each(function(i, selectedElement) {
			sizeIds[i] = $(selectedElement).val();
			sizeIdName[i] = $(selectedElement).text();
		});	
		
		jQuery('#addonIds :selected').each(function(i, selectedElement) {
			addonIds[i] = $(selectedElement).val();			
		});	
		
	
		
		if (isBlank(itemName, "Food Item Name")) {
			flag = false;
		} else {			
			if(itemName.length >30){
				flag = false;
				massageDisplay("Item name should be in 30 character");
			}
		}
		
		
		if (isBlank(keyword, "Food Item Keyword")) {
			flag = false;
		} else {			
			if(keyword.length >30){
				flag = false;
				massageDisplay("Item keyword should be in 30 character");
			}
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
		
//		if (isBlank(foodBannerImage, "Food Item Banner Image")) {
//			flag = false;
//		}
		if (foodBannerImage != "") {
			var control = document.getElementById("foodItemBannerImage");
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
		
		
		
		
		
		
		
		if (isBlank(categoryId, "Category")) {
			flag = false;
		}
		
		if(isBlank(typeId, "Type")){
			flag = false;
		}
		
		if(isBlank(commonDesciption, "Food Desciption")){
			flag = false;
		}
		
		if(sizeIds.length == 0){
			massageDisplay("Please select size");
		}
		
		//checking Item size Price
		for(var i = 0 ; i < sizeIds.length ; i++ ){
								
			var itemSizePrice = $("#itemSizePrice-" + sizeIds[i]).val();
			var discountAmount = $("#discountAmount-" + sizeIds[i]).val();
			
			if(isBlank(itemSizePrice , "Price of "+sizeIdName[i] +" Item")){
				flag = false;
			} else {
				
				if(isNaN(itemSizePrice)){
					flag = false;
					massageDisplay("Price of "+sizeIdName[i] +" item should be numeric value");
				}
				
				if(discountAmount != ''){					
					if(isNaN(discountAmount)){
						flag = false;
						massageDisplay("Discount Amount for "+ sizeIdName[i]+ " Size should be numoric");
					}
				}
			}
			
		}// end loop for Item size price
		
		
		if (isBlank(preparationTime, "Preparation Time")) {
			flag = false;
		}
		
		if (preparationTime == "00:0") {
			flag = false;
			massageDisplay("Please check Preparation Time");
		}
		
		if (deliveryTime == "00:0") {
			flag = false;
			massageDisplay("Please check Delivery Time");
		}
		
		
		if(isNewItem == 1){// if New Item is available, check the Start date and end date
			
			if (isBlank(newItemStartDate, "New Item Start Date")) {
				flag = false;
			}
			
			if (isBlank(newItemEndDate, "New Item End Date")) {
				flag = false;
			}
		}

		
		if(addonIsAvailable == 1){
			
			if(addonIds.length == 0){
				massageDisplay("Addon can not be blank");
			}
			
			for(var i = 0 ; i < sizeIds.length ; i++ ){
				
				var defaultAddons = $("#defaultAddons-" + sizeIds[i]).val();
				var maxAddons 	  = $("#maxAddons-" + sizeIds[i]).val();
				
				
				
				var selectedDefaultAddonsIds = [];
				
			
				jQuery('#defaultAddonIds_'+sizeIds[i]+' :selected').each(function(i, selectedElement) {
					selectedDefaultAddonsIds[i] = parseInt($(selectedElement).val());
					
				});
				
				
			/*	jQuery('#sizeIds :selected').each(function(i, selectedElement) {
					sizeIds[i] = $(selectedElement).val();
					sizeIdName[i] = $(selectedElement).text();
				});*/
				
				
				
				if(defaultAddons == ''){
					flag = false;
					massageDisplay("Default Addon Count for "+ sizeIdName[i]+ " Size can not blank");
				} else {					
					if(isNaN(defaultAddons)){
						flag = false;
						massageDisplay("Default Addon Count for "+ sizeIdName[i]+ " Size should be numoric");
					}
				}
				
				if(maxAddons == ''){
					flag = false;
					massageDisplay("Max Addon Count for "+ sizeIdName[i]+ " Size can not blank");
					
				} else {					
					if(isNaN(maxAddons)){
						flag = false;
						massageDisplay("Max Addon Count for "+ sizeIdName[i]+ " Size should be numoric");
					}
				}
				
				if(parseInt(maxAddons) < parseInt(defaultAddons)){
					flag = false;
					massageDisplay("Max Addon for"+ sizeIdName[i]+ " Size should be should larger/equal than Default Addon ");
				}
				
				if(parseInt(defaultAddons) > selectedDefaultAddonsIds.length ){
					flag = false;
					massageDisplay("For "+ sizeIdName[i]+" size, at least "+parseInt(defaultAddons)+" Default Addon have to be select ");
				}
				
				
			}// end of loop		
			
		}	
		
		if (isBlank(status, "Status")) {
			flag = false;
		}
		
		if (flag) {
			return true;
		}

		return false;
	});	
	

/**
 * this is used on the change of multi select Item Size
 */
	$("#sizeIds").change(function(e){
		
		var sizeId = "";
		var sizeIds = [];		
		var html = '';
		
		//this html is used to Size wise price
				var baseHtml  = '<div class="form-group">'
									+'<label>Price of [lable] Item : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 5 digit)</span></label>'
									+'<input type="text" name="itemSizePrice" id="[itemSizePrice]" class="form-control" value="[value]" maxlength="5">'
								+'</div>';
		var baseDiscountAmount = '<div class="form-group">'
									+'<label>Discount Amount in % for [foodSize] size : <span class="mandatory-msg">(max 30 characters)</span></label>' 
									+'<input type="text" name="discountAmount" id="[discountAmount]" value="[discountAmountValue]" class="form-control" maxlength="30">'
							 +'</div>'
	 
		 var BaseDiscountDescription = '<div class="form-group">'
										 +'<label>Discount Description for [foodSize] size : <span class="mandatory-msg">(max 300 characters)</span></label>'
										 +'<textarea name="discountText" id="[discountText]" class="form-control" maxlength="300">[discountTextValue]</textarea>'
									   +'</div>';	
		
		
		jQuery('#sizeIds :selected').each(function(i, selectedElement) {
			
			sizeId = $(selectedElement).val();
			
			if(sizeId != ""){
				
				var sizeprice = $("#itemSizePrice-" + sizeId).val();
				
				if(typeof sizeprice == "undefined"){
					sizeprice = "";
				}
				
				var sizeText  = $(selectedElement).text();
				
				var discountAmountValue = $("#discountAmount-" + sizeId).val();
				var discountTextValue = $("#discountText-" +sizeId).val();
			
				
				if(typeof discountAmountValue == "undefined" ){
					discountAmountValue = '';
				}				
				if(typeof discountTextValue == "undefined" ){
					discountTextValue = '';
				}
				
				var sizeHtml = baseHtml.replace("[lable]", $(selectedElement).text())
									   .replace("[value]" , sizeprice)
									   .replace("[itemSizePrice]", "itemSizePrice-" + sizeId);
				var discountAmount = baseDiscountAmount.replace("[foodSize]", sizeText)
														.replace("[discountAmount]", "discountAmount-" + sizeId)
														.replace("[discountAmountValue]",discountAmountValue);
				
				var discountDescription = BaseDiscountDescription.replace("[foodSize]", sizeText)
															 	 .replace("[discountText]", "discountText-" + sizeId)
																 .replace("[discountTextValue]", discountTextValue);
				
				
				
				
				sizeIds = sizeId;
				html+= '<div class="box box-primary">' + sizeHtml  + discountAmount + discountDescription + '<div>';
			}			
		});
	
		if(sizeIds.length > 0){
			$("#div-item-size-price").html(html);
			setAddonProperty();
		} else {
			$("#div-item-size-price").children().remove();
			$("#div-item-addon-property").children().remove();
		}
		
	});
	
	//end of
	
	/**
	 * this is called on the change on Category
	 */
	$("#categoryId").change(function(e){
		var categoryId = $("#categoryId").val();
		
		if(categoryId != ""){
			
			var url = 'active-type-list';
			var options = '<option value="">Select</option>';
			
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
					
					$("#typeId").html(options);
					
				},
				error 	 : function(request, status, error){
					$("#typeId").html(options);
				}
			});			
		} else {
			$("#typeId").html(options);
		}
	});
	//end of 
	
	
	$("#addonIsAvailable").on("click", function(e){			
		setAddonProperty();
	});
	
	
	$("#isNewItem").on("click", function(e){	
		
		if($("#isNewItem").is(":checked")){
			
			$("#div-newItemStartDate,#div-newItemEndDate").css("display", "block");
					
		} else {
			
			$("#div-newItemStartDate,#div-newItemEndDate").css("display", "none");					
		}		
		
	});
	
	/**
	 * 
	 */
	$("#addonIds").change(function(event){
		
		var sizeIds = [];
		
		var addonIds = [];
		var addonText = [];
		
		jQuery('#addonIds :selected').each(function(i, selectedElement) {
			addonIds[i] = $(selectedElement).val();
			addonText[i] = $(selectedElement).text();
		}); 
		
		jQuery('#sizeIds :selected').each(function(i, selectedElement) {
			sizeIds[i] = $(selectedElement).val();			
		});	
		
		if(sizeIds.length > 0){
			
			for(var i=0; i <sizeIds.length; i++){
				
				var addonOption='';
				
				var defaultAddonIds = [];
				var defaultAddonText = [];
			
				jQuery('#defaultAddonIds_'+sizeIds[i]+' :selected').each(function(i, selectedElement) {
					defaultAddonIds[i] = parseInt($(selectedElement).val());
					defaultAddonText[i] = $(selectedElement).text();
				}); 
				
			
		
				if(addonIds.length > 0){			
					
					for(var j=0; j <addonIds.length; j++){
					
						var selectedflag = !($.inArray(parseInt(addonIds[j]), defaultAddonIds ))? 'Selected' : '';
						
						addonOption+='<option value="'+addonIds[j] +'" '+selectedflag+'   > '+addonText[j] +' </option>';			
					}
				}				
				
				$('#defaultAddonIds_'+sizeIds[i]).html(addonOption);
			}
		}
		
		$(".defaultAddonIds").select2();
		
	});
	//end of

});


/**
 * this function is used to set up Addon property
 */
function setAddonProperty(){
	var sizeId = "";
	var sizeIds = [];
	var addonPropertyHtml = '';
	var sizeText = '';
	
		
		if($("#addonIsAvailable").is(":checked")){
			
		var baseHeaderLabels = '<div class="box-header with-border">'
								+'<h3 class="box-title">Addon Property for [foodSize] size</h3>'
							+'</div>';	
		
		var baseDefaultAddon = '<div class="form-group">'
								  +'<label>Default Addon Count for [foodSize] size : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 2 digit)</span></label>' 
								  +'<input type="text" name="defaultAddons" id="[defaultAddons]" value="[defaultAddonsValue]" class="form-control" maxlength="2">'
							'</div>';
		
		var baseMaxAddon = '<div class="form-group">'
								+'<label>Max Addon Count for [foodSize] size: <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 2 digit)</span></label>' 
								+'<input type="text" name="maxAddons" id="[maxAddons]" value="[maxAddonsValue]" class="form-control" maxlength="2">'
						  +'</div>';	
		
		var baseDiscountAmount = '<div class="form-group">'
									+'<label>Discount Amount for [foodSize] size : <span class="mandatory-msg">(max 30 characters)</span></label>' 
									+'<input type="text" name="discountAmount" id="[discountAmount]" value="[discountAmountValue]" class="form-control" maxlength="30">'
							 +'</div>'
							 
        /*var BaseDiscountDescription = '<div class="form-group">'
            							 +'<label>Discount Description for [foodSize] size : <span class="mandatory-msg">(max 300 characters)</span></label>'
            							 +'<textarea name="discountText" id="[discountText]" class="form-control" maxlength="300">[discountTextValue]</textarea>'
            						   +'</div>';*/		
		var baseSelectedDefaultAddons = '<div class="form-group">'
											+'<label>Default Addon for [foodSize] size : <span class="mandatory-astric-color">*</span></label>'
											 +'<select class="form-control defaultAddonIds" name="[defaultAddonIds]" id="[defaultAddonIds]" multiple="multiple">'
											    +'[addonOption]'
											 +'</select>'
										+'</div>';					 
		
		var addonOption = '';
		
		var addonIds = [];
		var addonText = [];
		
		jQuery('#addonIds :selected').each(function(i, selectedElement) {
			addonIds[i] = $(selectedElement).val();
			addonText[i] = $(selectedElement).text();
		});	
		
	
		
		if(addonIds.length > 0){			
			
			for(var i=0; i <addonIds.length; i++){
				addonOption+='<option value="'+addonIds[i] +'"> '+addonText[i] +' </option>';				
			}
		}
		
		//get the food item size details and the html for addon property
		
		jQuery('#sizeIds :selected').each(function(i, selectedElement) {

			
			sizeId = $(selectedElement).val();
			 
			
			if(sizeId != ""){		
				
				sizeText  = $(selectedElement).text();
				
				var defaultAddonsValue = $("#defaultAddons-" + sizeId).val();
				var maxAddonsValue     = $("#maxAddons-" + sizeId).val();
		
				
				if(typeof defaultAddonsValue == "undefined" ){
					defaultAddonsValue = '';
				}
				
				if(typeof maxAddonsValue == "undefined" ){
					maxAddonsValue = '';
				}
				
				
			
				
				var headerLabels = baseHeaderLabels.replace("[foodSize]", sizeText);
				
				var defaultAddon = baseDefaultAddon.replace("[foodSize]", sizeText)
													.replace("[defaultAddons]", "defaultAddons-" + sizeId)
													.replace("[defaultAddonsValue]", defaultAddonsValue);
				
				var maxAddon = baseMaxAddon.replace("[foodSize]", sizeText)
											.replace("[maxAddons]", "maxAddons-" + sizeId)
											.replace("[maxAddonsValue]", maxAddonsValue);
				
				var addonHtml = baseSelectedDefaultAddons.replace("[defaultAddonIds]", "defaultAddonIds_"+sizeId)				
												.replace("[defaultAddonIds]", "defaultAddonIds_"+sizeId)
												.replace("[foodSize]", sizeText)
												.replace("[addonOption]", addonOption);
				
				addonPropertyHtml+= '<div class="box box-primary">' + headerLabels + defaultAddon + maxAddon  + addonHtml + ' </div>';
				sizeIds = sizeId;	
				
			}			
		});
		//end the loop
		
		$("#div-addonIds").css("display", "block");
		$("#addonIds").select2();
		$("#div-item-addon-property").html(addonPropertyHtml);
		$(".defaultAddonIds").select2();
								
			
		} else {
			$("#div-addonIds").css("display", "none");
			$("#div-item-addon-property").children().remove();

		}
}

/**
 * this function is to delete purpose
 * @param foodItemId
 */
function deleteFoodItemConfirmation(foodItemId){
	$("#foodItemId").val(foodItemId);
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