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
				<h1>Edit Country</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="edit-country" id="edit-country-form" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label>Country Name : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 30 characters)</span></label> 
										<input type="text" name="countryName" id="countryName" value="${countryModel.countryName}" class="form-control" maxlength="30">
									</div>
									
									<div class="form-group">
										<label> Image: <span class="mandatory-astric-color">*</span></label>
										<img id="blah" src=""  />
										<img id="firstblah" src="image-draw?imageName=${countryModel.imageName}&fileType=image&viewType=view&imageType=country" width="80px" height="80px" />
										<br>
										<input type="file" class="" id="image" name="image" onchange="readURL(this);">
										<p class="help-block">jpeg, jpg, png, gif image only</p>
										 
									</div>
									
									<div class="form-group">
										<label>Select Status</label> 
										<select class="form-control"
											name="status" id="status">
											<option value="">Select</option>
											
											<c:forEach items="${statusDetails}" var="eStatus">

												<option value="${eStatus}"
													<c:out value="${countryModel.status == eStatus ? 'selected': ''}"/>><c:out
														value="${eStatus}" /></option>
											</c:forEach>
											
										</select>
									</div>
									
									<div class="box-footer">
										<input type="hidden" name="countryId" id="countryId" value="${countryModel.countryId}">
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
        // $('#blah').parent().html().replace("image-draw?imageName=${bannerModel.imageName}&fileType=image&viewType=view&imageType=banner","");
         $('#firstblah').attr('style', 'display: none;');
       //  
        reader.readAsDataURL(input.files[0]);
    }
}

</script>

<%@ include file="cms-footer.jsp"%>