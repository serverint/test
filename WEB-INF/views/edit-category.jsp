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
<script src="resources/js/category/category.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Edit Category</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="edit-category" id="edit-category-form" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label>Category Name: <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 30 characters)</span></label> 
										<input type="text" name="name" id="name" value="${categoryModel.name}" class="form-control" maxlength="30">
									</div>
									<div class="form-group">
									<label>
										<img src="image-draw?imageName=${categoryModel.imageName}&fileType=image&viewType=view&imageType=category" width="80px" height="80px" />
											<input type="file" class="" id="image" name="image">
											<p class="help-block">jpeg, jpg, png, gif image only</p></label>
									</div>
									<div class="form-group">
										<label>Select Status: <span class="mandatory-astric-color">*</span></label> 
										<select class="form-control" name="status" id="status">
											<option value="${categoryModel.status }">${categoryModel.status}</option>
										</select>
									</div>
									<div class="box-footer">
										<input type="hidden" name="id" id="id" value="${categoryModel.id}">
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
<%@ include file="cms-footer.jsp"%>