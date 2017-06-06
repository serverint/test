<title>Addon</title>
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
<script src="resources/js/addon/addon.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Add Addon</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="add-addon" id="add-addon-form" method="post">
									<div class="form-group">
										<label>Name : <span class="mandatory-astric-color">*</span><span
											class="mandatory-msg">(max 30 characters)</span></label> <input
											type="text" name="name" id="addOnName" class="form-control"
											maxlength="30">
									</div>
									<div class="form-group">
										<label>Price(Taka) : <span class="mandatory-astric-color">*</span><span
											class="mandatory-msg"></span></label> <input type="text" name="price"
											id="price" class="form-control">
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
<script>
jQuery(document).ready(function($) {
	  $(".select2").select2();
	});
</script>

<%@ include file="cms-footer.jsp"%>