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
				<h1>Add Type</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="add-type" id="add-type-form" method="post">									
<!-- 									<div id="textLength" class="form-group character-left"></div> -->	
									<div class="form-group">
										<label>Type Name : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 30 characters)</span></label> 
										<input type="text" name="name" id="name" value="" class="form-control" maxlength="30">
									</div>								
									<div class="form-group">
										<label>Select Category : <span class="mandatory-astric-color">*</span></label> 
										<select class="form-control" name="categoryModel.id" id="category">
											<option value="">Select</option>											
											<c:forEach items="${categoryDetails}" var="categorys">
												<option value="${categorys.id}">${categorys.name}</option>
											</c:forEach>											
										</select>
									</div>
									<div class="form-group">
										<label>Type Preference  : <span class="mandatory-astric-color">*</span></label> 
										<select class="form-control" name="foodType" id="foodType">
											<option value="">Select</option>											
											<c:forEach items="${foodTypeValue}" var="foodType">
												<option value="${foodType}">${fn:replace(foodType,'_', '  ')}</option>
											</c:forEach>											
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

<!-- <script type="text/javascript">

$("#textLength").html('30 Characters left');

$("#name").on('keyup', function(e){
	var text = $("#name").val();
	var max = 30;
	
	if (e.which < 0x20) {
		var left = max - this.value.length;
        $("#textLength").html(left+' Characters left');
        return;
    }
   
	if (text.length == max) {
        e.preventDefault();
    } else if (text.length > max) {
        this.value = this.value.substring(0, max);
    }
   
	var left = max - this.value.length;
    $("#textLength").html(left+' Characters left');
});
</script> -->

<%@ include file="cms-footer.jsp"%>