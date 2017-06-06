<title>Minimam Order Price</title>
<%@ include file="cms-header.jsp"%>
<!---------- top navigation start -------->
<%@ include file="cms-navigation-header.jsp"%>
<!---------- top navigation end -------->
<!-- Sidebar -->
<!---------- left menu start -------->
<%@ include file="cms-menu.jsp"%>
<!---------- left menu end -------->
<!-- DataTables -->

<link rel="stylesheet" href="resources/css/dataTables.bootstrap.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="resources/css/table.css">
<!-- DataTables -->
<script src="resources/js/datatables/jquery.dataTables.min.js"></script>
<script src="resources/js/datatables/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/common.js"></script>
<script src="resources/js/sidebar_menu.js"></script>
<script type="text/javascript" src="resources/js/dataTableCustom/dataTableCustom.js"></script>

<script src="resources/js/size/size.js"></script>

<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>List Minimam Order Price</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
						<div class="res_table">
							<table id="dataTable"
								class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>Sl No.</th>
										<th></th>	
										<th>Price</th>	
										<th>COD Price</th>																
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty listOrderPriceSetting}">
											<c:forEach items="${listOrderPriceSetting}" var="data">
												<tr>
													<td></td>
													<td>${data.lastUpdateTimeStamp }</td>
													<td>${data.price}</td>
													<td>${data.codPrice}</td>											
													<c:choose>
														<c:when test="${data.status == 'ACTIVE'}">
															<td ><span class="label label-primary">${data.status}</span></td>
														</c:when>
														<c:otherwise>
															<td ><span class="label label-warning">${data.status}</span></td>
														</c:otherwise>
													</c:choose>
													<td>
														<a href="edit-orderprice?id=${data.id}" class="btn btn-default btn-xs"> 
															<i class="fa fa-pencil"></i>
														</a> 
														
													</td>												
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<td colspan="5" align="center">No Records Found</td>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							</div>
							<!-- Modal Start -->

						<div class="modal fade" id="deleteModal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<form style="margin-bottom: 0px !important;"
											class="form-horizontal" method="POST"
											action="delete-size">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="myModalLabel">Delete Size</h4>
												<hr />
											</div>
											<div class="modal-body">
												<input type="hidden" name="sizeId" id="sizeId" value="">
												<div class="text-center">
													<span>Are you sure, you want to <b>
													<font color="green">Delete</font> 
													<strong> this Size</strong></span> ?
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
												<button type="submit" class="btn btn-primary">Delete
													Size</button>
											</div>
										</form>
									</div>
								</div>
							</div>
							<!-- Modal End -->
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
</div>
<!-- DataTables -->
<%@ include file="cms-footer.jsp"%>

