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
<script src="resources/js/happening/happening.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Add What's Happening</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="add-happening" id="add-happening-form"
									method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label>Title : <span
											class="mandatory-astric-color">*</span><span
											class="mandatory-msg">(max 50 characters)</span></label> <input
											type="text" name="title" id="title" value=""
											class="form-control" maxlength="50">
									</div>
									<div class="form-group">
										<label>Description: <span
											class="mandatory-astric-color">*</span></label>

										<textarea name="description" id="description"
											class="form-control" rows="3" cols="3"></textarea>
									</div>
									<!-- <div class="form-group">
										<label>Happening Content: <span
											class="mandatory-astric-color">*</span></label>

										<textarea name="content" id="content" class="form-control"
											rows="3" cols="3"></textarea>
									</div> -->
									
									<div class="form-group">
											<label>Content: </label>
											<textarea  name="content" id="content" ></textarea>
										</div>
									
									
									<div class="form-group">
										<label for="exampleInputFile">Image: <span
											class="mandatory-astric-color">*</span></label>
										<div>
											<input type="file" class="upload"
												id="imageName" name="imageName" multiple>
										</div>

										<p class="help-block">jpeg, jpg, png, gif image only</p>
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