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
<script src="resources/js/user/user.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Edit User</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="edit-user" id="edit-user-form" method="post">
									<div class="form-group">
										<label>First Name :</label> 
										<input name="firstName" id="firstName" value="${userModel.firstName}" class="form-control" readonly>
									</div>
									
									<div class="form-group">
										<label>Last Name :</label> 
										<input name="lastName" id="lastName" value="${userModel.lastName}" class="form-control" readonly>
									</div>
									
									<div class="form-group">
										<label>Gender :</label> 
										<input type="text" name="gender" id="gender" value="${userModel.gender}" class="form-control" readonly>
									</div>
									
									<div class="form-group">
										<label>Email Id :</label> 
										<input type="text" name="emailId" id="emailId" value="${userModel.emailId}" class="form-control" readonly>
									</div>
									
									<div class="form-group">
										<label>DOB :</label> 
										<input name="dob" id="dob" value="${userModel.dob}" class="form-control" readonly>
									</div>
									
									<div class="form-group">
										<label>Login Type :</label> 
										<input name="dob" id="dob" value="${userModel.loginType}" class="form-control" readonly>
									</div>
									
									<div class="form-group">
										<label>Zipcode :</label> 
										<input name="zipcode" id="zipcode" value="${userModel.zipcode}" class="form-control" readonly>
									</div>
									
									<div class="form-group">
										<label>Address :</label> 
										<textarea rows="3" cols="3" class="form-control" readonly>${userModel.address}</textarea>
									</div>
									
									
									<c:if test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
									
										<div class="form-group">
											<label>Select Status</label> 
											<select class="form-control"
												name="status" id="status" disabled>
												<option value="">Select</option>
												
												<c:forEach items="${statusDetails}" var="eStatus">
	
													<option value="${eStatus}"
														<c:out value="${userModel.status == eStatus ? 'selected': ''}"/>><c:out
															value="${eStatus}" /></option>
												</c:forEach>
												
											</select>
										</div>
									</c:if>
									
									<div class="form-group">
										<label>Note : <span class="mandatory-msg">(max 50 characters)</span></label> 
										<textarea  name="note" id="note" class="form-control" maxlength="50" rows="3" cols="3">${userModel.note}</textarea>
									</div>
									
									<c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
									
										<div class="form-group">
										<label>Select Status</label> 
										<select class="form-control"
											name="status" id="status">
											<option value="">Select</option>
											
											<c:forEach items="${statusDetails}" var="eStatus">

												<option value="${eStatus}"
													<c:out value="${userModel.status == eStatus ? 'selected': ''}"/>><c:out
														value="${eStatus}" /></option>
											</c:forEach>
											
										</select>
									</div>
									
									<div class="box-footer">
										<input type="hidden" name="id" id="id" value="${userModel.id}">
										<button class="btn btn-primary" type="submit">Submit</button>
									</div>
									</c:if>
									
									
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