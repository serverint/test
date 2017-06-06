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
<script src="resources/js/type/type.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Edit Type</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="edit-type" id="edit-type-form" method="post">
									<div class="form-group">
										<label>Type Name : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 30 characters)</span></label> 
										<input type="text" name="name" id="name" value="${typeModel.name}" class="form-control" maxlength="30">
									</div>
									<div id="textLength" class="form-group character-left"></div>
									
									<div class="form-group">
										<label>Select Category :<span class="mandatory-astric-color">*</span></label> 
										<select class="form-control"
											name="categoryModel.id" id="category">
											<option value="">Select</option>
											
											<c:forEach items="${categoryDetails}" var="categorys">

												<option value="${categorys.id}" ${typeModel.categoryModel.id == categorys.id ? 'selected' :'' }>${categorys.name}</option>
											</c:forEach>
											
										</select>
									</div>
									<div class="form-group">
										<label>Type Preference  : <span class="mandatory-astric-color">*</span></label> 
										<select class="form-control" name="foodType" id="foodType">
											<option value="">Select</option>											
											<c:forEach items="${foodTypeValue}" var="foodType">
												<option value="${foodType}" ${typeModel.foodType == foodType ? 'selected': ''}>${fn:replace(foodType,'_', '  ')}</option>
											</c:forEach>											
										</select>
									</div>
									<div class="form-group">
										<label>Select Status : <span class="mandatory-astric-color">*</span></label> 
										<select class="form-control"
											name="status" id="status">
											<option value="">Select</option>
											
											<c:forEach items="${statusDetails}" var="eStatus">

												<option value="${eStatus}"
													<c:out value="${typeModel.status == eStatus ? 'selected': ''}"/>><c:out
														value="${eStatus}" /></option>
											</c:forEach>
											
										</select>
									</div>
									
									<div class="box-footer">
										<input type="hidden" name="id" id="id" value="${typeModel.id}">
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