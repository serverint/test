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
<script src="resources/js/banner/banner.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Edit Banner</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="edit-banner" id="edit-banner-form" method="post" enctype="multipart/form-data">
									
									
									<c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
									
										<div class="form-group">
											<label>Banner Note: <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 50 characters)</span></label> 
											
											<textarea name="note" id="note" class="form-control" maxlength="50" rows="5" cols="5">${bannerModel.note}</textarea>
										</div>
										
									<div class="form-group">
										<label>	Banner Image: <span class="mandatory-astric-color">*</span></label>
										<img id="blah" src=""  />
										
											<img id="firstblah" src="image-draw?imageName=${bannerModel.imageName}&fileType=image&viewType=view&imageType=banner" width="80px" height="80px"  />
											<br>
											<!-- <input type="file" class="" id="image" name="image" > -->
												<input type="file" class="" id="image" name="image" onchange="readURL(this);">
												
												<p class="help-block">jpeg, jpg, png, gif image only</p>
									</div>
									
									</c:if>
									
									
									
									<c:if test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
									
										<div class="form-group">
											<label>Banner Note: <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 50 characters)</span></label> 
											
											<textarea name="note" id="note" class="form-control" maxlength="50" rows="5" cols="5" disabled>${bannerModel.note}</textarea>
										</div>
									
									   <div class="form-group">
										<label>	<label>Banner Image: <span class="mandatory-astric-color">*</span></label>
											<img src="image-draw?imageName=${bannerModel.imageName}&fileType=image&viewType=view&imageType=banner" width="80px" height="80px" />
												<input type="file" class="" id="image" name="image" disabled>
												<p class="help-block">jpeg, jpg, png, gif image only</p></label>
										</div>
									
										<div class="form-group">
											<label>Select Status: <span class="mandatory-astric-color">*</span></label> 
											<select class="form-control" name="status" id="status" disabled>
												
													<c:forEach items="${statusValues}" var="eStatus">
													
														<c:if test="${bannerModel.status == eStatus}">
															<option value="${eStatus }">${eStatus}</option>
														</c:if>
														
													</c:forEach>
											</select>
										</div>
										
										<div class="checkbox">
							                  <label>
							                    <input type="checkbox" name="isFoodItem" id="isFoodItem" value=1 <c:if test="${bannerModel.isFoodItem == '1' }">checked </c:if> >Is Food Item
							                  </label>
	                					</div>
										<script type="text/javascript">
											$('#isFoodItem').prop('disabled', true);
										</script>
										
										
										<c:if test="${bannerModel.isFoodItem == '1' }">
											
											<div class="form-group category-food" id="food-div">

												<div class="form-group">
													<label>Select Category: <span class="mandatory-astric-color">*</span></label> 
													<select class="form-control" name="categoryId" id="category-food" disabled>
														<option value="">Select</option>
															<c:forEach items="${categoryModels}" var="category">
																<option value="${category.id}" ${bannerModel.categoryId == category.id ? 'selected': ''}  >${category.name}</option>
															</c:forEach>
													</select>
												</div>
												
														
												<label>Select Food Item</label> 
												<select class="form-control" name="foodItemsId" id="food-item" data-food-item="${bannerModel.foodItemsId}" disabled></select>
												
											</div>	
											
										</c:if>
										
 										<c:if test="${bannerModel.isFoodItem == '0' }"> 
											
	                					   
	                					   <div class="form-group" id="food-div" style="display: none;">
												<label>Select Category</label> 
												<select class="form-control" name="categoryId" id="category-food"></select>
												
												<label>Select Food Item</label> 
												<select class="form-control" name="foodItemsId" id="food-item"></select>
										  </div>
										
										</c:if>
										
										
										
										
										
									</c:if>
									
									<c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
									
										<div class="form-group">
											<label>Select Status: <span class="mandatory-astric-color">*</span></label> 
											<select class="form-control" name="status" id="status">
												<option value="">Select</option>
													<c:forEach items="${statusValues}" var="eStatus">
														<option value="${eStatus }" ${bannerModel.status == eStatus ? 'selected': ''}>${eStatus}</option>
													</c:forEach>
											</select>
										</div>
										
										<div class="checkbox">
							                  <label>
							                    <input type="checkbox" name="isFoodItem" id="isFoodItem" value=1 <c:if test="${bannerModel.isFoodItem == '1' }">checked </c:if> >Is Food Item
							                  </label>
	                					</div>
										
										
										
										<c:if test="${bannerModel.isFoodItem == '1' }">
											
											<div class="form-group category-food" id="food-div">

												<div class="form-group">
													<label>Select Category: <span class="mandatory-astric-color">*</span></label> 
													<select class="form-control" name="categoryId" id="category-food" >
														<option value="">Select</option>
															<c:forEach items="${categoryModels}" var="category">
																<option value="${category.id}" ${bannerModel.categoryId == category.id ? 'selected': ''}  >${category.name}</option>
															</c:forEach>
													</select>
												</div>
												
														
												<label>Select Food Item</label> 
												<select class="form-control" name="foodItemsId" id="food-item" data-food-item="${bannerModel.foodItemsId}"></select>
												
											</div>	
											
										</c:if>
										
 										<c:if test="${bannerModel.isFoodItem == '0' }"> 
											
	                					   
	                					   <div class="form-group" id="food-div" style="display: none;">
												<label>Select Category</label> 
												<select class="form-control" name="categoryId" id="category-food"></select>
												
												<label>Select Food Item</label> 
												<select class="form-control" name="foodItemsId" id="food-item"></select>
										  </div>
										
										</c:if>
										
										
										
										<div class="box-footer">
											<input type="hidden" name="id" id="id" value="${bannerModel.id}">
											<button class="btn btn-primary" type="submit">Submit</button>
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

<script type="text/javascript">

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

</script>
<%@ include file="cms-footer.jsp"%>