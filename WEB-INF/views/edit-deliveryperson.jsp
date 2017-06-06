<title>Delivery Person</title>
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
<script src="resources/js/delivery-person/delivery-person.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Edit Delivery Person</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="edit-deliveryperson" id="edit-deliveryperson-form" method="post">
									<div class="form-group">
										<label>Name : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 30 characters)</span></label> 
										<input type="text" name="name" id="name" value="${deliveryPersonModel.name}" class="form-control" maxlength="30">
									</div>
									
									<div class="form-group">
										<label>Mobile : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 20 characters)</span></label> 
										<input type="text" name="mobile" id="mobile" value="${deliveryPersonModel.mobile}" class="form-control" maxlength="20">
									</div>
									
									
									<div class="form-group">
										<label>Select Status</label> 
										<select class="form-control"
											name="status" id="status">
											<option value="">Select</option>
											
											<c:forEach items="${statusDetails}" var="eStatus">

												<option value="${eStatus}"
													<c:out value="${deliveryPersonModel.status == eStatus ? 'selected': ''}"/>><c:out
														value="${eStatus}" /></option>
											</c:forEach>
											
										</select>
									</div>
									
									<div class="form-group">
										<label>Address: <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 50 characters)</span></label> 
										<textarea name="address" id="address" class="form-control" maxlength="50" rows="5" cols="5">${deliveryPersonModel.address}</textarea>
									</div>
									
									<div class="box-footer">
										<input type="hidden" name="id" id="id" value="${deliveryPersonModel.id}">
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