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
				<h1>Add Combo Items</h1>
			</div>
			<div class="page-content">
			<form action="add-combo-item" id="add-combo-item-form" method="post"  enctype="multipart/form-data">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">								
									<div class="form-group">
										<label>Combo Name : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 30 characters)</span></label> 
										<input type="text" name="comboName" id="comboName" value="" class="form-control" max="30">
									</div>
									<div class="form-group">
											<label for="exampleInputFile">Item Image : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(jpeg, jpg, png, gif image only)</span></label>
											
											<div>
    											<img id="blah" src=""  />
    											<br>
    											<br>
												<input type="file" class="upload" id="image" name="image" onchange="readURL(this);">
											
											</div>										
									</div>
									<div class="form-group">
										<label>Combo Price(Taka) : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 5 digit)</span></label> 
										<input type="text" name="comboPrice" id="comboPrice" value="" class="form-control" maxlength="5">
									</div>
									<div class="form-group">
										<label>Combo Discount : <span class="mandatory-msg">(max 5 digit)</span></label> 
										<input type="text" name="comboDiscount" id="comboDiscount" value="" class="form-control" maxlength="5">
									</div>
									<div class="checkbox">
						                  <label>
						                    <input type="checkbox" name="loyaltyPointIsAvailable" id="loyaltyPointIsAvailable" value=1 >Is Loyalty Point Available
						                  </label>
                					</div>
									<div class="form-group">
										<label>Combo Description : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 300 characters)</span></label>
										<textarea name="comboDescription" id="comboDescription" class="form-control" maxlength="300"></textarea>
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
									
								</tbody>
							</table>
							<div class="box-footer">
									<input  type="hidden" value="0" name="comboCount" id="comboCount"  >
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

        reader.readAsDataURL(input.files[0]);
    }
}

</script>
<%@ include file="cms-footer.jsp"%>