<title>Peyala Cash</title>
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
<script src="resources/js/peyala-cash/peyala-cash.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Peyala Cash</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
							
								<form action="peyala-cash" id="peyala-cash-form" method="post" enctype="multipart/form-data">
								
									<div class="cont-top">
										<h3>Amount to point</h3>
									</div>
									<div class="form-group">
										<label>Amount(Taka) : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 5 digit)</span></label> <input type="text" name="amount"
											id="amount" class="form-control"
											value="${peyalaCashModel.amount}" maxlength="5">
									</div>
									<div class="form-group">
										<label>AmountToPoint : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 5 digit)</span></label> <input type="text" name="amountToPoint"
											id="amountToPoint" class="form-control" value="${peyalaCashModel.amountToPoint}" maxlength="5">
									</div>
									
									
									
									<div class="cont-top">
										<h3>Point to Cash</h3>
									</div>
									
									<div class="form-group">
										<label>PointToCash : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 5 digit)</span></label> <input type="text" name="pointToCash"
											id="pointToCash" class="form-control"
											value="${peyalaCashModel.pointToCash}"  maxlength="5">
									</div>
									
									<div class="form-group">
										<label>Cash : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 5 digit)</span></label> <input type="text" name="cash"
											id="cash" class="form-control"
											value="${peyalaCashModel.cash}"  maxlength="5">
									</div>
									
									
									
									<c:choose>
										<c:when test="${empty peyalaCashModel.imageName}">
											<div class="form-group">
												<label for="exampleInputFile">Item Image : <span
													class="mandatory-astric-color">*</span><span
													class="mandatory-msg">(jpeg, jpg, png, gif image
														only)</span></label>

												<div class="fileUpload btn btn-success">
													<span>Upload Image</span> <input type="file" class="upload"
														id="image" name="image">
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="form-group">
												<label> <img
													src="image-draw?imageName=${peyalaCashModel.imageName}&fileType=image&viewType=view&imageType=amountToPointItems"
													width="80px" height="80px" />  <input type="file" class="" id="image" name="image">
													<span class="mandatory-msg">(jpeg, jpg, png, gif
														image only)</span></label>
											</div>
										</c:otherwise>
									</c:choose>
									
									
									<div class="form-group">
										<label>Description : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 50 characters)</span></label> 
										<textarea  name="description" id="description" class="form-control" maxlength="50" rows="3" cols="3">${peyalaCashModel.description}</textarea>
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