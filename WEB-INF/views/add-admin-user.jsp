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
<script src="resources/js/admin-user/admin-user.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Add Branch User</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="add-admin-user" id="add-admin-user-form" method="post">
									<div class="form-group">
										<label>First Name : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 30 characters)</span></label> 
										<input type="text" name="firstName" id="firstName"  class="form-control" maxlength="30" >
									</div>
									<div class="form-group">
										<label>Middle Name : <span class="mandatory-msg">(max 30 characters)</span></label> 
										<input type="text" name="middleName" id="middleName"  class="form-control" maxlength="30" >
									</div>
									<div class="form-group">
										<label>Last Name : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 30 characters)</span></label> 
										<input type="text" name="lastName" id="lastName"  class="form-control" maxlength="30">
									</div>
									<div class="form-group">
										<label>Email : <span class="mandatory-astric-color">*</span></label> 
										<input type="text" name="email" id="email" class="form-control">
									</div>
									<div class="form-group">
										<label>Phone : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 20 digit)</span></label> 
										<input type="text" name="phone" id="phone"  class="form-control" maxlength="20">
									</div>
									<div class="form-group">
											<label>Branch: <span class="mandatory-astric-color">*</span></label>
											 <select class="form-control" name="branchId" id="branchId">
												<option value="" selected="selected">Select</option>
												<c:if test="${not empty branchList}">
													<c:forEach items="${branchList}" var="branch">
														<option value="${branch.id }">${branch.branchName}</option>
													</c:forEach>
												</c:if>
											</select>
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