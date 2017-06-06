<!---------- header start -------->
<%@ include file="cms-header.jsp"%>
<!---------- header start -------->
<!---------- top navigation start -------->
<%@ include file="cms-navigation-header.jsp"%>
<!---------- top navigation end -------->

<!-- Sidebar -->
<!---------- left menu start -------->
<%@ include file="cms-menu.jsp"%>
<!---------- left menu end -------->
<!-- sidebar -->
<script src="resources/js/common.js"></script>
<script src="resources/js/sidebar_menu.js"></script>
<script src="resources/js/food-item/food-item.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Edit Food Item</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="edit-food-item" id="edit-food-item-form" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label>Item Name : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 30 characters)</span></label> 
										<input type="text" name="itemName" id="itemName" value="${foodItemModel.itemName}" class="form-control" maxlength="30">
									</div>
									<div class="form-group">
										<label>Item Keyword : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 30 characters)</span></label> 
										<input type="text" name="keyword" id="keyword" value="${foodItemModel.keyword }" class="form-control" maxlength="30">
									</div>
									
								<div class="form-group">
									<label>
										<img id="firstblah2" src="image-draw?imageName=${foodItemModel.foodItemBannerImageName}&fileType=image&viewType=view&imageType=foodItemBanner" width="80px" height="80px" />
										
										<img id="blah2" src=""  />
										<br>
										<input type="file" class="" id="foodItemBannerImage" name="foodItemBannerImage" onchange="readURL2(this);">
											
										<span class="mandatory-msg">(jpeg, jpg, png, gif image only)</span></label>
								</div>
									
									<div class="form-group">
									<label>
										<img id="firstblah" src="image-draw?imageName=${foodItemModel.imageName}&fileType=image&viewType=view&imageType=foodItem" width="80px" height="80px" />
										
										<img id="blah" src=""  />
										<br>
										<input type="file" class="" id="image" name="image" onchange="readURL(this);">
											
										<span class="mandatory-msg">(jpeg, jpg, png, gif image only)</span></label>
									</div>
									
								
									
									
									
									<div class="form-group">
											<label>Category : <span class="mandatory-astric-color">*</span></label>
											 <select class="form-control" name="categoryId" id="categoryId">
											 		<option value="">Select</option>	
													 <c:if test="${not empty  categoryModels}">
													 	<c:forEach items="${categoryModels}" var="category">
															<option value="${category.id }"  ${foodItemModel.categoryModel.id == category.id ? 'selected':'' }>${category.name}</option>
														</c:forEach>
													 </c:if>	
											</select>
									</div>
									<div class="form-group">
											<label>Type : <span class="mandatory-astric-color">*</span></label>
											 <select class="form-control" name="typeId" id="typeId">
											 		<option value="">Select</option>	
											 		 <c:if test="${not empty  typeModels}">
													 	<c:forEach items="${typeModels}" var="typeModel">
															<option value="${typeModel.id }"  ${foodItemModel.typeModel.id == typeModel.id ? 'selected':'' }>${typeModel.name}</option>
														</c:forEach>
												   </c:if>
											</select>
									</div>
									<div class="form-group">
										<label>Food Description : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 300 characters)</span></label>
										<textarea name="commonDesciption" id="commonDesciption" class="form-control" maxlength="300">${foodItemModel.commonDesciption }</textarea>
									</div>
									<div class="form-group">
											<label>Item size : <span class="mandatory-astric-color">*</span></label>
											 <select class="form-control select2" name="sizeIds" id="sizeIds" multiple="multiple">													 
													 <c:if test="${not empty  sizeModels}">
													 	<c:forEach items="${sizeModels}" var="size">
															<option value="${size.id }"  ${foodItemModel.sizeIds.contains(size.id)  ? 'selected': ''} >${size.name}</option>
														</c:forEach>
													 </c:if>	
											</select>
									</div>
									<!-- for size price -->
									<div id="div-item-size-price">
										<c:if test="${not empty foodItemModel.foodItemSizeModels}">
											<c:forEach items="${foodItemModel.foodItemSizeModels}" var="data1">
											<div class="box box-primary">
												<div class="form-group " >
													<label>Price of ${data1.sizeModel.name} Item : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 5 digit)</span></label>
													<input type="text" name="itemSizePrice" id="itemSizePrice-${data1.sizeModel.id}" value="${data1.itemSizePrice}" class="form-control" maxlength="5">													
												</div>
												<div class="form-group">
														<label>Discount Amount in % for ${data1.sizeModel.name} size : 
														<span class="mandatory-msg">(max 30 characters)</span></label> 
														<input type="text" name="discountAmount" id="discountAmount-${data1.sizeModel.id}" value="${data1.discountAmount }" class="form-control" maxlength="30">
												</div>
												<div class="form-group">
													<label>Discount Description for ${data1.sizeModel.name} size : 
													<span class="mandatory-msg">(max 300 characters)</span></label>
													<textarea name="discountText" id="discountText-${data1.sizeModel.id}" class="form-control" maxlength="300">${data1.discountText }</textarea>
												</div>
											</div>
											</c:forEach>
										</c:if>
									</div>
									<!-- End-->	
									<div class="form-group">
										<label>Preparation Time (HH:mm): <span class="mandatory-astric-color">*</span></label> 
										<input type="text" name="preparationTime" id="preparationTime" value="${foodItemModel.preparationTime}" class="form-control">
									</div>
									<div class="form-group">
										<label>Delivery Time (HH:mm): </label> 
										<input type="text" name="deliveryTime" id="deliveryTime" value="${foodItemModel.deliveryTime}" class="form-control">
									</div>
									
									<div class="checkbox">
						                  <label>
						                    <input type="checkbox" name="loyaltyPointIsAvailable" id="loyaltyPointIsAvailable" value=1  ${foodItemModel.loyaltyPointIsAvailable == "YES"?'checked':''}>Is Loyalty Point Available
						                  </label>
                					</div>
                					
                					<div class="checkbox">
						                  <label>
						                    <input type="checkbox" name="takeAwayIsAvailable" id="takeAwayIsAvailable" value=1  ${foodItemModel.takeAwayIsAvailable == "YES"?'checked':''}>Is Take Away Available
						                  </label>
                					</div>
                					<div class="checkbox">
						                  <label>
						                    <input type="checkbox" name="deliveryIsAvailable" id="deliveryIsAvailable" value=1  ${foodItemModel.deliveryIsAvailable == "YES"?'checked':''}>Is Delivery Available
						                  </label>
                					</div>
                					<div class="checkbox">
						                  <label>
						                    <input type="checkbox" name="isNewItem" id="isNewItem" value=1 ${foodItemModel.isNewItem == "YES"?'checked':''} >Is New Item
						                  </label>
                					</div>
                					
                					<div class="form-group" id="div-newItemStartDate"  ${newItemDateDisplay }>
										<label>New Item Start :<span class="mandatory-astric-color">*</span></label> 
										<input class="form-control" type="text" name="newItemStartDate" id="newItemStartDate" value="${foodItemModel.newItemStartDate }">
									</div>
									
									<div  class="form-group" id="div-newItemEndDate" ${newItemDateDisplay }>
										<label>New Item End :<span class="mandatory-astric-color">*</span></label> 
										<input class="form-control" type="text" name="newItemEndDate" id="newItemEndDate" value="${foodItemModel.newItemEndDate }">
									</div>
									                					
									<div class="checkbox">
						                  <label>
						                    <input type="checkbox" name="addonIsAvailable" id="addonIsAvailable" value=1  ${foodItemModel.addonIsAvailable == "YES" ?'checked':''} >Is addon available
						                  </label>
                					</div>																
									<div class="form-group" id="div-addonIds" ${addonDivDisplay}>
											<label>Item Addons : <span class="mandatory-astric-color">*</span></label>
											 <select class="form-control select2" name="addonIds" id="addonIds" multiple="multiple">											 	
												 <c:if test="${not empty  addOnModels}">
												 	<c:forEach items="${addOnModels}" var="addon">
														<option value="${addon.id }" ${foodItemModel.addonIds.contains(addon.id)  ? 'selected': '' } >${addon.name}</option>
													</c:forEach>
												 </c:if>	
											</select>
									</div>
									<div id="div-item-addon-property" >
										<c:if test="${foodItemModel.addonIsAvailable == 'YES'}">
											<c:forEach items="${foodItemModel.foodItemSizeModels}" var="data">
												<div class="box box-primary">
													<div class="box-header with-border">
														<h3 class="box-title">Addon Property for ${data.sizeModel.name} size</h3>
													</div>
												   <div class="form-group">
														<label> Default Addon Quantity for ${data.sizeModel.name} size : 
															<span class="mandatory-astric-color">*</span>
															<span class="mandatory-msg">(max 2 digit)</span>
														</label> 
														<input type="text" name="defaultAddons"	id="defaultAddons-${data.sizeModel.id}" value="${data.defaultAddons }" class="form-control" maxlength="2">
													</div>
													<div class="form-group">
														<label>Max Addon Quantity for ${data.sizeModel.name} size: 
														<span class="mandatory-astric-color">*</span>
														<span class="mandatory-msg">(max 2 digit)</span></label> 
														<input type="text" name="maxAddons" id="maxAddons-${data.sizeModel.id}" value="${data.maxAddons }" class="form-control" maxlength="2">
													</div>
													<div class="form-group">
															<label>Default Addon for ${data.sizeModel.name} size : <span class="mandatory-astric-color">*</span></label>
															 <select class="form-control defaultAddonIds" name="defaultAddonIds_${data.sizeModel.id }" id="defaultAddonIds_${data.sizeModel.id}" multiple="multiple">											 	
																 <c:if test="${not empty  foodItemModel.foodIteamAddonModels}">
																 	<c:forEach items="${foodItemModel.foodIteamAddonModels}" var="addon">
																		<option value="${addon.addOnModel.id }" ${fn:contains(foodItemModel.selectedDefaultAddonSizewiseOutput[data.sizeModel.id], addon.addOnModel.id)?'selected':''}>${addon.addOnModel.name}</option>
																	</c:forEach>
																 </c:if>	
															</select>
													</div>
																																						
												</div>
											</c:forEach>
										</c:if>
									</div>	
									
									
					
									<div class="form-group">
										<label>Status : <span class="mandatory-astric-color">*</span></label> 
										<select class="form-control" name="status" id="status">
											<option value="">Select</option>
												<c:forEach items="${statusValues}" var="eStatus">
													<option value="${eStatus }" ${foodItemModel.status == eStatus ? 'selected': ''}>${eStatus}</option>
												</c:forEach>
										</select>
									</div>
									
									<c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
									
										<div class="box-footer">
											<button class="btn btn-primary" type="submit">Submit</button>
											<input type="hidden" value="${foodItemModel.id }" name="id" id="id">
										</div>
									</c:if>								
									
								</form>
							</div>
							<!-- /.box-body -->
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<script>


function readURL(input) {
    
	if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah')
                .attr('src', e.target.result)
                .width(80)
                .height(80);
        };
        // $('#blah').parent().html().replace("image-draw?imageName=${bannerModel.imageName}&fileType=image&viewType=view&imageType=banner","");
         $('#firstblah').attr('style', 'display: none;');
       //  
        reader.readAsDataURL(input.files[0]);
    }
}


function readURL2(input) {
    
	if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah2')
                .attr('src', e.target.result)
                .width(80)
                .height(80);
        };
        // $('#blah').parent().html().replace("image-draw?imageName=${bannerModel.imageName}&fileType=image&viewType=view&imageType=banner","");
         $('#firstblah2').attr('style', 'display: none;');
       //  
        reader.readAsDataURL(input.files[0]);
    }
}


jQuery(document).ready(function($) {	

	  $('#preparationTime').timepicki({
			show_meridian:false,
			min_hour_value:0,
			max_hour_value:5,
			step_size_minutes:01,
			overflow_minutes:true,
			increase_direction:'up',
			disable_keyboard_mobile: true,
			start_time: ["01", "00"]
	  });
	  
	  $('#deliveryTime').timepicki({
			show_meridian:false,
			min_hour_value:0,
			max_hour_value:5,
			step_size_minutes:01,
			overflow_minutes:true,
			increase_direction:'up',
			disable_keyboard_mobile: true,
			start_time: ["01", "00"]
	  });
	  
	});
</script>
<%@ include file="cms-footer.jsp"%>