<title>Notification</title>
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
<script src="resources/js/notification/notification.js"></script>








<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Add Notification</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="add-notification" id="add-notification-form" method="post">
									<div class="form-group">
										<label>Notification Message : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 500 characters)</span></label>
										<textarea rows="3" cols="3" name="message" id="message" class="form-control" maxlength="500"></textarea> 
									</div>
									
									<div class="form-group">
										<label>Select Notification Type :<span class="mandatory-astric-color">*</span></label> 
										<select class="form-control"
											name="notificationType" id="notification-type">
											<option value="">Select</option>
											
											<c:forEach items="${notificationType}" var="notifications">

												<option value="${notifications}">${notifications}</option>
											</c:forEach>
											
										</select>
									</div>
									
									<div class="form-group">
										<label>Select Notified Type :<span class="mandatory-astric-color">*</span></label> 
										<select class="form-control"
											name="notifiedType" id="notified-type">
											<option value="">Select</option>
											
											<c:forEach items="${notifiedType}" var="notifications">

												<option value="${notifications}">${notifications}</option>
											</c:forEach>
											
										</select>
									</div>
									
									<div class="form-group" id="notification-type-user-div">
										<label>Select User :<span class="mandatory-astric-color">*</span></label> 
										<select class="form-control select2" name="userId" id="notification-type-user"></select>
									</div>
									
									<div class="box-footer">
										<button class="btn btn-primary" type="submit">Submit</button>
									</div>
								</form>
								
								<div id="loading">
                                    <!-- <img src="images/ajax-loader.gif" id="img" style="display:none" alt="Loading..." /> -->
                                   <!--   <button class="btn btn-lg btn-warning " style="display:none"><span class="glyphicon glyphicon-refresh glyphicon-refresh-animate"></span> Loading...</button> -->
                                <span class="glyphicon glyphicon-refresh glyphicon-refresh-animate abz" style="display:none"></span>
                                             
                                </div>
								
								
								
							</div>
							<!-- /.box-body -->
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>




<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>-->


<script type="text/javascript">
$(window).load(function() {
	// Animate loader off screen
	//$('#loading').hide();
});

</script>



<%@ include file="cms-footer.jsp"%>