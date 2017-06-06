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
<link rel="stylesheet" href="resources/css/dataTables.bootstrap.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="resources/css/table.css">
<!-- DataTables -->
<script src="resources/js/datatables/jquery.dataTables.min.js"></script>
<script src="resources/js/datatables/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/common.js"></script>
<script src="resources/js/sidebar_menu.js"></script>
<script type="text/javascript"
	src="resources/js/dataTableCustom/dataTableCustom.js"></script>
<script src="resources/js/addon/addon.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">

				<h1>List Addon</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<div class="res_table">
								<table id="dataTable" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Sl No.</th>
											<th></th>
											<th>Add-On Name</th>
											<th>Price</th>
											<th>Status</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty listaddons}">
												<c:forEach items="${listaddons}" var="data">
													<tr>
														<td></td>
														<td>${data.lastUpdateTimeStamp }</td>
														<td>${data.name}</td>
														<td>${data.price}</td>

														<c:choose>
															<c:when test="${data.status == 'ACTIVE'}">
																<td><span class="label label-primary"> <c:out
																			value="${data.status}" /></span></td>
															</c:when>
															<c:otherwise>
																<td><span class="label label-warning"> <c:out
																			value="${data.status}" /></span></td>

															</c:otherwise>
														</c:choose>
														<td><a href="edit-addon?addOnId=${data.id}"
															class="btn btn-default btn-xs"> <i
																class="fa fa-pencil"></i>
														</a> <a
															onclick="return deleteaddonConfirmation('${data.id}');"
															data-toggle="" data-target=""
															class="btn btn-default btn-xs"> <i
																class="fa fa-trash-o"></i>
														</a></td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<td></td>
												<td colspan="5" align="center">No Records Found</td>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
							<!-- Modal Start -->

							<div class="modal fade" id="mydelModal" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<form style="margin-bottom: 0px !important;"
											class="form-horizontal" method="POST" action="delete-addon">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="myModalLabel">Delete Addon</h4>
												<hr />
											</div>
											<div class="modal-body">
												<input type="hidden" name="id" id="addonid" value="">
												<div class="text-center">
													<span>Are you sure, you want to <b> <font
															color="green">Delete</font> <strong> this add-on</strong></span>
													?
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
												<button type="submit" class="btn btn-primary">Delete
													Add-On</button>
											</div>
										</form>
									</div>
								</div>
							</div>
							<!-- Modal End -->
							<!-- Modal -->
							<div class="modal fade" id="getCodeModal" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">Please delete this addon from below food Items</h4>
										</div>
										<div class="modal-body" id="getCode"
											style="overflow-x: scroll;">  </div>
									</div>
								</div>
							</div>








						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<%@ include file="cms-footer.jsp"%>