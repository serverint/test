<title>Addon</title>
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
<!-- <script src="resources/js/news/news.js"></script> -->
<!-- <script src="resources/js/addon/addon.js"></script> -->
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Delete addon From Food</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="delete-addon-from-food" id="add-addon-form" method="post">
									
                                  <c:forEach var="foodItemModel" items="${foodItemModels}">
                                     
                                       <input type="checkbox" name="vehicle" value="${foodItemModel.id}">${foodItemModel.itemName}</input>
                                      <br/>
                                    
                                 </c:forEach>
				                    <div class="form-group">
										 <input type="text" name="id" id="id" class="form-control" value="${addonId}">
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
<script>
jQuery(document).ready(function($) {
	  $(".select2").select2();
	});
</script>

<%@ include file="cms-footer.jsp"%>