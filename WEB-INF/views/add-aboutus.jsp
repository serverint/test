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
<script src="resources/js/about-us/about-us.js"></script>

<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>About Us</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="add-aboutus" id="add-about-us-form"
									method="post" enctype="multipart/form-data">
									
									<div class="form-group">
											<label>Description: </label>
											<textarea  name="note" id="content">${aboutUs.note}</textarea>
										</div>
									
									
									<c:if test="${not empty aboutUs.imageName}">
										<div class="form-group">
											<label>	<label>Upload Image: <span class="mandatory-astric-color">*</span></label>
												<img src="image-draw?imageName=${aboutUs.imageName}&fileType=image&viewType=view&imageType=aboutUsImages" width="80px" height="80px" />
													<input type="file" class="" id="image" name="image">
													<p class="help-block">jpeg, jpg, png, gif image only</p></label>
											</div>
										
									</c:if>
									
									<c:if test="${empty aboutUs.imageName}">
										<div class="form-group">
											<label for="exampleInputFile">Upload Image: <span
												class="mandatory-astric-color">*</span></label>
											<div class="fileUpload btn btn-success">
												<span>Upload Image</span>
												 <input type="file" class="upload" id="imageName" name="image">
											</div>
	
											<p class="help-block">jpeg, jpg, png, gif image only</p>
										</div>
									</c:if>
									
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
<script>
/**
 * use to load cke editor
 */
	initSample();	
</script>
		</div>
	</div>
</div>
<%@ include file="cms-footer.jsp"%>