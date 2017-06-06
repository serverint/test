

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
<!-- <script src="resources/js/news/news.js"></script> -->
<!-- <script src="resources/js/addon/addon.js"></script> -->
<script src="resources/js/tax/tax.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap-select.css">
<style>
select.selectpicker {
	display: none; /* Prevent FOUC */
}
.media-object {
    width: 30px;
    height: 30px;
}
</style>

<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Add Tax</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="add-tax" id="add-tax-form" method="post">
									<div class="form-group">
										<label>Select Country : <span
											class="mandatory-astric-color">*</span></label> <select
											title="Select your surfboard" class="selectpicker" name="countryId">
											<option>Select...</option>
											<c:forEach items="${listCounrty}" var="data">
											   
											   <option value="${data.countryId}" data-thumbnail="image-draw?imageName=${data.imageName}&fileType=image&viewType=view&imageType=country">${data.countryName}</option>
											</c:forEach>
										</select>
									</div>
									<div class="form-group">
										<label>Service Name : <span
											class="mandatory-astric-color">*</span><span
											class="mandatory-msg">(max 30 characters)</span></label> <input
											type="text" name="serviceName" id="serviceName"
											class="form-control" maxlength="30">
									</div>
									<div class="form-group">
										<label>VAT(%) : <span class="mandatory-astric-color">*</span></label>
										<input type="text" name="percentage" id="percentage"
											class="form-control" maxlength="3">
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
<%@ include file="cms-footer.jsp"%>
<script src="resources/js/bootstrap-select.js"></script>
<script>
	$(document).ready(function() {
		// Initiate with custom caret icon
		$('select.selectpicker').selectpicker({
			caretIcon : 'glyphicon glyphicon-menu-down'
		});
	});
</script>