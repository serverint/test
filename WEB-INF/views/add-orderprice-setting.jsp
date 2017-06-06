<title>Minimum Order Amount</title>
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
<script src="resources/js/order-price-setting/order-price-setting.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Add Minimum Order ,COD and Max COD Amount </h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="add-orderprice" id="add-orderprice-form" method="post">
									<div class="form-group">
										<label>Order Minimum Amount(Taka) : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 8 digits)</span></label> 
										<input type="text" name="price" id="price" value="${orderPriceModel.price}" class="form-control" maxlength="8">
									</div>
									
									<div class="form-group">
										<label>Order Minimum COD Amount(Taka) : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 8 digits)</span></label> 
										<input type="text" name="codPrice" id="cod-price" value="${orderPriceModel.codPrice}" class="form-control" maxlength="8">
									</div>
									
									<div class="form-group">
										<label>Order Maximum COD Amount(Taka) : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 8 digits)</span></label> 
										<input type="text" name="maxCodPrice" id="max-cod-price" value="${orderPriceModel.maxCodPrice}" class="form-control" maxlength="8">
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