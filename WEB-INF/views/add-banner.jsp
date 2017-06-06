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
				<h1>Add Banner</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="add-banner" id="add-banner-form" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label>Banner Note: <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 30 characters)</span></label> 
										
										<textarea name="note" id="note" class="form-control" maxlength="50" rows="3" cols="3"></textarea>
									</div>
									<div class="form-group">
											<label for="exampleInputFile">Banner Image: <span class="mandatory-astric-color">*</span></label>
											<div>
    											
												<input type="file" class="upload" id="image" name="image" onchange="readURL(this);">
												<br>
												<img id="blah" src=""  />
											
											</div>
											
											<p class="help-block">jpeg, jpg, png, gif image only</p>
									</div>
									
									<div class="checkbox">
						                  <label>
						                    <input type="checkbox" name="isFoodItem" id="isFoodItem" value="1" >Is Food Item
						                  </label>
                					</div>
                					
                					
                					<div class="form-group" id="food-div" style="display: none;">
										<label>Select Category</label> 
										<select class="form-control" name="categoryId" id="category-food"></select>
										
										<label>Select Food Item</label> 
										<select class="form-control" name="foodItemsId" id="food-item"></select>
									</div>
                					
									
									<div class="box-footer">
										<button class="btn btn-primary" type="submit">Submit</button>
									</div>
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

        reader.readAsDataURL(input.files[0]);
    }
}

</script>
<%@ include file="cms-footer.jsp"%>