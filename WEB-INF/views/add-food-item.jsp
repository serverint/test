
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
<script src="resources/js/bootstrap/bootstrap-datetimepicker.min.js"></script>
<script src="resources/js/common.js"></script>
<script src="resources/js/sidebar_menu.js"></script>
<script src="resources/js/food-item/food-item.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Add Food Item</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="add-food-item" id="add-food-item-form" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label>Item Name : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 30 characters)</span></label> 
										<input type="text" name="itemName" id="itemName" value="" class="form-control" maxlength="30">
									</div>
									<div class="form-group">
										<label>Item Keyword : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 30 characters)</span></label> 
										<input type="text" name="keyword" id="keyword" value="" class="form-control" maxlength="30">
									</div>
									<!-- <div class="form-group">
											<label for="exampleInputFile">Item Image : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(jpeg, jpg, png, gif image only)</span></label>
											
											<div class="fileUpload btn btn-success">
    											<span>Upload Image</span>
												<input type="file" class="upload" id="image" name="image">
											</div>											
									</div> -->
									
									<div class="form-group">
											<label for="exampleInputFile">Food Item Image: <span class="mandatory-astric-color">*</span></label>
											<div>
    											
												<input type="file" class="upload" id="image" name="image" onchange="readURL(this);">
												<br>
												<img id="blah" src=""  />
											
											</div>
											
											<p class="help-block">jpeg, jpg, png, gif image only</p>
									</div>
									
									
									<div class="form-group">
											<label for="exampleInputFile">Food Item Banner Image: <span class="mandatory-astric-color">*</span></label>
											<div>
    											
												<input type="file" class="upload" id="foodItemBannerImage" name="foodItemBannerImage" onchange="readURLBanner(this);">
												<br>
												<img id="blahfdbannerImage" src=""  />
											
											</div>
											
											<p class="help-block">jpeg, jpg, png, gif image only</p>
									</div>
									
									
									<div class="form-group">
											<label>Category : <span class="mandatory-astric-color">*</span></label>
											 <select class="form-control" name="categoryId" id="categoryId">
											 		<option value="">Select</option>	
												 <c:if test="${not empty  categoryModels}">
												 	<c:forEach items="${categoryModels}" var="category">
														<option value="${category.id }" >${category.name}</option>
													</c:forEach>
												 </c:if>	
											</select>
									</div>
									<div class="form-group">
											<label>Type : <span class="mandatory-astric-color">*</span></label>
											 <select class="form-control" name="typeId" id="typeId">
											 		<option value="">Select</option>												 	
											</select>
									</div>	
									<div class="form-group">
										<label>Food Description : <span class="mandatory-astric-color">*</span> <span class="mandatory-msg">(max 300 characters)</span></label>
										<textarea name="commonDesciption" id="commonDesciption" class="form-control" maxlength="300"></textarea>
									</div>															
									<div class="form-group">
											<label>Item size : <span class="mandatory-astric-color">*</span></label>
											 <select class="form-control select2" name="sizeIds" id="sizeIds" multiple="multiple">													 
													 <c:if test="${not empty  sizeModels}">
													 	<c:forEach items="${sizeModels}" var="size">
															<option value="${size.id }">${size.name}</option>
														</c:forEach>
													 </c:if>	
											</select>
									</div>
									<div id="div-item-size-price"></div>
									<div class="form-group">
										<label>Preparation Time (HH:mm): <span class="mandatory-astric-color">*</span></label> 
										<input type="text" name="preparationTime" id="preparationTime" value="" class="form-control">
									</div>
									<div class="form-group">
										<label>Delivery Time (HH:mm): </label> 
										<input type="text" name="deliveryTime" id="deliveryTime" value="" class="form-control">
									</div>
									<div class="checkbox">
						                  <label>
						                    <input type="checkbox" name="loyaltyPointIsAvailable" id="loyaltyPointIsAvailable" value=1 >Is Loyalty Point Available
						                  </label>
                					</div>
									<div class="checkbox">
						                  <label>
						                    <input type="checkbox" name="takeAwayIsAvailable" id="takeAwayIsAvailable" value=1 >Is Take Away Available
						                  </label>
                					</div>
                					<div class="checkbox">
						                  <label>
						                    <input type="checkbox" name="deliveryIsAvailable" id="deliveryIsAvailable" value=1 >Is Delivery Available
						                  </label>
                					</div>
                					<div class="checkbox">
						                  <label>
						                    <input type="checkbox" name="isNewItem" id="isNewItem" value=1 >Is New Item
						                  </label>
                					</div>
                					
                					<div class="form-group" id="div-newItemStartDate"  style="display: none;">
										<label>New Item Start :<span class="mandatory-astric-color">*</span></label> 
										<input class="form-control" type="text" name="newItemStartDate" id="newItemStartDate">
									</div>
									
									<div  class="form-group" id="div-newItemEndDate" style="display: none;">
										<label>New Item End :<span class="mandatory-astric-color">*</span></label> 
										<input class="form-control" type="text" name="newItemEndDate" id="newItemEndDate">
									</div>
									
                				
                					
									<div class="checkbox">
						                  <label>
						                    <input type="checkbox" name="addonIsAvailable" id="addonIsAvailable" value=1 >Is addon available
						                  </label>
                					</div>   
                					
                					<div class="form-group" id="div-addonIds" style="display: none;">
											<label>Item Addons : <span class="mandatory-astric-color">*</span></label>
											 <select class="form-control select2" name="addonIds" id="addonIds" multiple="multiple">											 	
												 <c:if test="${not empty  addOnModels}">
												 	<c:forEach items="${addOnModels}" var="addon">
														<option value="${addon.id }" ${foodItemModel.addonIds.contains(addon.id)  ? 'selected': '' } >${addon.name}</option>
													</c:forEach>
												 </c:if>	
											</select>
									</div>  
									<div id="div-item-addon-property" ></div>									
									<div class="box-footer">	
										<input type="hidden"  name="wishToRoaster" id="wishToRoaster" value="">									
										<button class="btn btn-primary" type="button" id="button-sub">Submit</button>
									</div>
									
									<!-- Modal Start -->

							<div class="modal fade" id="mydelModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="myModalLabel">Select Days Of Week </h4>
												<hr />
											</div>
											<div class="modal-body">
												<div class="form-group">					
												<label>Select Days Of Week: <span class="mandatory-astric-color">*</span></label>								
													 <select class="form-control" name="dayOfWeek" id="dayOfWeek">
														<option value="">Select</option>
														<c:forEach items="${daysOfWeeks}" var="daysOfWeek">
															<option value="${daysOfWeek}">${daysOfWeek}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
												<button type="submit" class="btn btn-primary">Submit</button>
											</div>										
									</div>
								</div>
							</div>
							<!-- Modal End -->
									
									
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

        reader.readAsDataURL(input.files[0]);
    }
}


function readURLBanner(input) {
    
	if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blahfdbannerImage')
                .attr('src', e.target.result)
                .width(80)
                .height(80);
        };

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