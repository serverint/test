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
<script src="resources/js/combo/combo.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Edit Combo Items</h1>
			</div>
			<div class="page-content">
			<form action="edit-combo-item" id="edit-combo-item-form" method="post"  enctype="multipart/form-data">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">								
									<div class="form-group">
										<label>Combo Name : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 30 characters)</span></label> 
										<input type="text" name="comboName" id="comboName" value="${comboModel.comboName }" class="form-control" maxlength="30">
									</div>
									<div class="form-group">
									<label>	Combo Image: <span class="mandatory-astric-color">*</span></label>
									    <img id="blah" src=""  />
										<img id="firstblah" src="image-draw?imageName=${comboModel.imageName}&fileType=image&viewType=view&imageType=comboItem" width="80px" height="80px" />
										 <br>
										<input  type="file" class="" id="image" name="image" onchange="readURL(this);">
											
										<span class="mandatory-msg">(jpeg, jpg, png, gif image only)</span>
									</div>
									<div class="form-group">
										<label>Combo Price(Taka) : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 5 digit)</span></label> 
										<input type="text" name="comboPrice" id="comboPrice" value="${comboModel.comboPrice }" class="form-control" maxlength="5">
									</div>
									<div class="form-group">
										<label>Combo Discount : <span class="mandatory-msg">(max 5 digit)</span></label> 
										<input type="text" name="comboDiscount" id="comboDiscount" value="${comboModel.comboDiscount}" class="form-control" maxlength="5">
									</div>
									<div class="checkbox">
						                  <label>
						                    <input type="checkbox" name="loyaltyPointIsAvailable" id="loyaltyPointIsAvailable" value=1  ${comboModel.loyaltyPointIsAvailable == "YES"?'checked':''}>Is Loyalty Point Available
						                  </label>
                					</div>
									<div class="form-group">
										<label>Combo Description : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 300 characters)</span></label>
										<textarea name="comboDescription" id="comboDescription" class="form-control" maxlength="300">${comboModel.comboDescription }</textarea>
									</div>	
									<div class="form-group">
										<label>Select Status</label> 
										<select class="form-control" name="status" id="status">
											<option value="">Select</option>
												<c:forEach items="${statusValues}" var="eStatus">
													<option value="${eStatus }" ${comboModel.status == eStatus ? 'selected': ''}>${eStatus}</option>
												</c:forEach>
										</select>
									</div>
									<hr>
									<hr>
									<div class="form-group">
										<label>Category : </label>
											<select class="form-control" id="comboCategoryId" >
														<option value="">Select</option>
														<c:if test="${not empty  categoryModels}">
														 	<c:forEach items="${categoryModels}" var="category">
																<option value="${category.id }"  ${foodItemModel.categoryId == category.id ? 'selected':'' }>${category.name}</option>
															</c:forEach>
														 </c:if>
											</select>
									</div>
									<div class="form-group">
										<label>Type : </label>
											<select class="form-control"  id="comboTypeId">
												<option value="">Select</option>
											</select>
									</div>
									<div class="form-group">
										<label>Food Item : </label>
											<select class="form-control"  id="comboFoodItemId" >
												<option value="">Select</option>
											</select>
									</div>
									<div class="form-group">
										<label>Food Item Size : </label>
											<select class="form-control"  id="comboFoodItemSizeId" ">
												<option value="">Select</option>
											</select>
									</div>
									<div class="box-footer" align="right">										
										<button class="btn btn-primary" type="button" id="combo-bag-id">Bag it into Combo list</button>
									</div>
									
								
							</div>
							<!-- /.box-body -->
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<table id="" class="table table-bordered table-hover">
								<thead>
									<tr>										
										<th>Category</th>
										<th>Type</th>	
										<th>Food Item</th>
										<th>Food Item Size</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="tbody-food-item">
									<c:set var="counter" value="0" />
									
									<c:if test="${not empty comboModel.comboFoodItemModels}">
											
											<c:forEach items="${comboModel.comboFoodItemModels}" var="data">
												<tr id="bag-item-row-${counter }">
													<td>
														<select class="comboCategoryId-class" onchange="return getTypeList(${counter })" name="comboCategoryId" id="comboCategoryId-${counter }">
															<option value=""> Select</option>
																<c:if test="${not empty  categoryModels}">
																 	<c:forEach items="${categoryModels}" var="category">
																		<option value="${category.id }"  ${data.foodItemModel.categoryModel.id == category.id ? 'selected':'' }>${category.name}</option>
																	</c:forEach>
																 </c:if>
														</select>
													</td>
													
													<td>
														<select class="comboTypeId-class" onchange="return getFoodItemList(${counter })" name="comboTypeId" id="comboTypeId-${counter }">
															<option value=""> Select</option>
															<c:if test="${not empty  comboModel.listOfTypeList[counter]}">
																<c:forEach items="${comboModel.listOfTypeList[counter]}" var="comType">
																	<option value="${comType.id }" ${comType.id == data.foodItemModel.typeModel.id ?'selected':'' }>${comType.name }</option>
																</c:forEach>
															</c:if>
														</select>
													</td>
													<td>
														<select class="comboFoodItemId-class" onchange="return getFoodItemSize(${counter })" name="comboFoodItemId" id="comboFoodItemId-${counter }">
															<option value="">Select</option>
															<c:if test="${not empty  comboModel.listOfTFoodItemList[counter]}">
																<c:forEach items="${comboModel.listOfTFoodItemList[counter]}" var="comFoodItem">
																	<option value="${comFoodItem.id }" ${comFoodItem.id == data.foodItemModel.id ?'selected':'' }>${comFoodItem.foodItem }</option>
																</c:forEach>
															</c:if>
														</select>
													</td>
													<td>
														<select class="comboFoodItemSizeId-class" name="comboFoodItemSizeId" id="comboFoodItemSizeId-${counter }">
															<option value="">Select</option>
															<c:if test="${not empty  comboModel.listOfSizeList[counter]}">
																 	<c:forEach items="${comboModel.listOfSizeList[counter]}" var="comSize">
																		<option value="${comSize.id }"  ${data.sizeModel.id == comSize.id ? 'selected':'' }>${comSize.name}</option>
																	</c:forEach>
															</c:if>
														</select>
													</td>
													<td>
														<a onclick="return deleteBagItem(${counter })"><i class="fa fa-trash-o"></i></a>
													</td>
												</tr>
													
												<c:set var="counter" value="${counter + 1}"/>
											</c:forEach>
													  	
									</c:if>
										
										
										
										
									</tbody>
							</table>
							<div class="box-footer">
									<input  type="hidden" value="${counter}" name="comboCount" id="comboCount">
									<input type="hidden" value="${comboModel.id }" name="id">
									<button class="btn btn-primary" type="submit">Submit</button>
							</div>							
						</div>
					</div>
				</div>
				</form>
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