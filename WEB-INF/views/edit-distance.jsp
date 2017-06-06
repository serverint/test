<title>Distance</title>
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
<script src="resources/js/distance/distance.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Edit Distance</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="edit-distance" id="edit-deliveryperson-form" method="post">
									<div class="form-group">
										<label>To : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 30 characters)</span></label> 
										<input type="text" name="to" id="to" value="${distanceModel.to}" class="form-control" maxlength="30">
									</div>
									
									<div class="form-group">
										<label>From : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 20 characters)</span></label> 
										<input type="text" name="from" id="from" value="${distanceModel.from}" class="form-control" maxlength="20">
									</div>
									
									
									<div class="form-group">
										<label>Select Status</label> 
										<select class="form-control"
											name="status" id="status">
											<option value="">Select</option>
											
											<c:forEach items="${statusDetails}" var="eStatus">

												<option value="${eStatus}"
													<c:out value="${distanceModel.status == eStatus ? 'selected': ''}"/>><c:out
														value="${eStatus}" /></option>
											</c:forEach>
											
										</select>
									</div>
									
									<div class="form-group">
										<label>Comment: <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 50 characters)</span></label> 
										<textarea name="comment" id="comment" class="form-control" maxlength="50" rows="5" cols="5">${distanceModel.comment}</textarea>
									</div>
									
									<div class="box-footer">
										<input type="hidden" name="distanceId" id="distanceId" value="${distanceModel.distanceId}">
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