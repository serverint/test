<!-- <title>Order</title> -->
<%@ include file="cms-header.jsp"%>
<!---------- top navigation start -------->
<%@ include file="cms-navigation-header.jsp"%>
<!---------- top navigation end -------->
<!-- Sidebar -->
<!---------- left menu start -------->
<%@ include file="cms-menu.jsp"%>
<!---------- left menu end -------->
<!-- DataTables -->

<%
	response.setIntHeader("Refresh", 60);
%>

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
<script type="text/javascript" src="resources/js/dataTableCustom/orderDataTableCustom.js"></script>

<!-- <script src="resources/js/size/size.js"></script> -->

<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Today's Order</h1>
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
											<th>Order Id</th>
											<th>Customer Name</th>
											<!-- <th>Phone</th> -->
											<th>Order Price</th>
											<th>Order Time</th>
											
											<th>Transaction Type</th>
											<th>Order Type</th>
											<th>Order Status</th>
											<!-- <th>Branch</th> -->
											<th>Service Time</th>
											<!-- <th>Status</th> -->
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty orderDetails}">
												<c:forEach items="${orderDetails}" var="data">
													<tr>
														<td></td>
														<td></td>
														<%-- <td>${data.lastUpdateTimeStamp }</td> --%>
														<td>${data.orderId}</td>

														<td>${data.userModel.firstName}
															${data.userModel.lastName}</td>
														<%-- <td>${data.userModel.phoneNumber}</td> --%>
                                                        
														<td>${data.orderPrice}</td>
														<td>${data.lastUpdateTimeStamp}</td>
														<td>${data.transactionType}</td>
														<td>${data.orderType}</td>
														<%-- <td>${data.orderStatus}</td> --%>
														<td><select class="form-control orderstatus" name="orderStatus"
															>
																<!-- 													<option value="">Select</option> -->




																<c:forEach items="${data.orderStatuses}"
																	var="orderStatusValue">
																	<c:choose>
																		<c:when
																			test="${orderStatusValue == orderModel.orderStatus}">
																			<option value="${orderStatusValue }" selected>${fn:replace(orderStatusValue,'_', '  ')}</option>
																		</c:when>
																		<c:otherwise>
																			<option value="${orderStatusValue }">${fn:replace(orderStatusValue,'_', '  ')}</option>
																		</c:otherwise>
																	</c:choose>
																	<%-- <option value="${orderStatusValue }" ${orderStatusValue == orderModel.orderStatus ? 'selected': ''}>${fn:replace(orderStatusValue,'_', '  ')}</option> --%>
																</c:forEach>
														</select></td>

														<%-- <td>
													
													
													<div class="form-group">
										<select class="form-control" name="orderStatus" id="orderStatus">
<!-- 													<option value="">Select</option> -->
												<c:forEach items="${orderStatusValues}" var="orderStatusValue">
													<option value="${orderStatusValue }" ${orderStatusValue == orderModel.orderStatus ? 'selected': ''}>${fn:replace(orderStatusValue,'_', '  ')}</option>
												</c:forEach>
										</select>
									</div>
													
													
													
													</td> --%>


														<%-- <td>${data.branchModel.branchName}</td> --%>
														<td>${data.deliveryOrTakeAwayTime}</td>
														<%-- <c:choose>
															<c:when test="${data.status == 'ACTIVE'}">
																<td><span class="label label-primary">${data.status}</span></td>
															</c:when>
															<c:otherwise>
																<td><span class="label label-warning">${data.status}</span></td>
															</c:otherwise>
														</c:choose> --%>
														<td><a href="edit-order?orderId=${data.id}"
															class="btn btn-default btn-xs"> <i
																class="fa fa-pencil"></i>
														</a>
														<a href="print-order?orderId=${data.id}" 
															class="btn btn-default btn-xs" target="_tab"> <i 
																class="fa fa-print" aria-hidden="true"></i>
														</a>
														
														</td>
														
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<td colspan="8" align="center">No Records Found</td>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
							<!-- Modal Start -->

							<div class="modal fade" id="deleteModal" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<form style="margin-bottom: 0px !important;"
											class="form-horizontal" method="POST" action="#">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="myModalLabel">Delete Order</h4>
												<hr />
											</div>
											<div class="modal-body">
												<input type="hidden" name="sizeId" id="sizeId" value="">
												<div class="text-center">
													<span>Are you sure, you want to <b> <font
															color="green">Delete</font> <strong> this Order</strong></span>
													?
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
												<button type="submit" class="btn btn-primary">Delete
													Order</button>
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

<script>
	jQuery(document).ready(function($){

						//location.reload(true);
						$('.orderstatus').change(function(event) {
											//var tdarr = $(this).closest('tr td');
											//:::: Checking by me ::::: //
											//alert("$(this).html()"+$(this).html());
											//var checking = $(this).closest('.odd').find("td").next().html();
											//alert("checking"+checking);
											// :::: Checking by me ending ::::: //
											var valueorderId = $(this).closest('tr').children("td")[1].innerHTML;
											//alert("valueorderId"+valueorderId);
											var valueorderType = $(this).closest('tr').children("td")[6].innerHTML;
											//alert("TypeName"+valueorderType);
											var valueorderTransactiontype = $(this).closest('tr').children("td")[5].innerHTML;
											//alert("Transactiontype"+valueorderTransactiontype);
											var valueorderStatus = $(this).val();
											//alert("Statusname"+valueorderStatus);
											//alert(valueorderId);
											//alert(valueorderType);
											//alert(valueorderStatus);
											/* $($(this).closest('tr').children("td")[1]).html();// ... Same as the previous ...
											$(this).parent().prev();
											$(this).parent().prev().html(); */

											if (valueorderStatus != "") {
												//alert()
												var url = 'update-order-type';
												//var options = '<option value="">Select</option>';

												jQuery.ajax({
															url : url,
															type : 'POST',
															dataType : 'json',
															data : {
																Statusname : valueorderStatus,
																TypeName : valueorderType,
																OrderId : valueorderId,
																Transactiontype : valueorderTransactiontype
															},
															success : function(data) {
																//alert("Success");
																location.reload(true);

															},
															error : function(request,status,error) {
																//alert("error");
																//$("#typeId").html(options);
															}
														});
											} else {
												//$("#typeId").html(options);
											}

										})

					})
</script>

<!-- DataTables -->
<%@ include file="cms-footer.jsp"%>

