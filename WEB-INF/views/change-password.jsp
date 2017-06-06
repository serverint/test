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
<script type="text/javascript" src="resources/js/admin-user/change-password.js"></script>


<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Change Password</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">

							<div class="box-body">

								<form action="change-password" method="post" id="change-password-form">

									<div class="form-group">
										<label>Old Password : <span class="mandatory-astric-color">*</span></label> 
										<input type="password" name="oldPassword" id="oldPassword" class="form-control">
									</div>

									<div class="form-group">
										<label>New Password : <span class="mandatory-astric-color">*</span></label> 
										<input type="password" name="newPassword" id="newPassword" class="form-control">
									</div>

									<div class="form-group">
										<label>Confirm Password : <span class="mandatory-astric-color">*</span></label> 
										<input type="password" class="form-control" name="confirmPassword" value="" id="confirmPassword">
									</div>

									<div class="box-footer">
										<button id="addUserSubmit" class="btn btn-primary" type="submit">Submit</button>										
									</div>
								</form>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="cms-footer.jsp"%>

