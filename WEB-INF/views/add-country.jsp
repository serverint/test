<title>Country</title>
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
<script src="resources/js/country/country.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Add Country</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="add-country" id="add-country-form" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label>Country Name : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 30 characters)</span></label> 
										<input type="text" name="countryName" id="countryName" value="" class="form-control" maxlength="30">
									</div>
									<div class="form-group">
											<label for="exampleInputFile">Image : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(jpeg, jpg, png, gif image only)</span></label>
											
											<div>
    											<img id="blah" src=""  />
    											<br>
    											<br>
												<input type="file" class="upload" id="image" name="image" onchange="readURL(this);">
											
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