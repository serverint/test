<title>Item Wise Sales Report</title>
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
<script src="resources/js/report/item-wise-sales-report.js"></script>
<script src="resources/js/faq/faq.js"></script>

<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Item Wise Sales Report</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">

							<!-- /.box-header -->
							<div class="box-body">

								<form action="item-wise-sales-report"
									id="item-wise-sales-report" method="post">
									<div class="form-group" id="div-startDate">
										<label>Select Date:</label> <input class="form-control"
											type="text" name="startDate" id="date" autocomplete="off">
									</div>



									<c:choose>
										<c:when
											test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
											<input type="hidden" name="branchId"
												value="${sessionScope.adminUserModel.branchModel.id}"
												id="branchId1">
										</c:when>
										<c:otherwise>
											<div class="form-group">
												<div id="branch">
													<label>Select Branch: </label> <select
														class="form-control select2" name="branchId" id="branchId"
														multiple>
														<option value="ALL" selected="selected">ALL</option>
														<c:if test="${not empty branchList}">
															<c:forEach items="${branchList}" var="branch">
																<option value="${branch.id }">${branch.branchName}</option>
															</c:forEach>
														</c:if>
													</select>
												</div>
											</div>
										</c:otherwise>
									</c:choose>


									<div class="form-group">
										<div id="food">
											<label>Select Food Category : </label> <select
												class="form-control select2" name="categoryId"
												id="categoryId" multiple>
												<option value="ALL" selected="selected">ALL</option>
												<c:if test="${not empty  categoryModels}">
													<c:forEach items="${categoryModels}" var="category">
														<option value="${category.id }">${category.name}</option>
													</c:forEach>
													<option value="COMBO">COMBO</option>
												</c:if>
												
											</select>
										</div>
									</div>

									<div class="box-footer">
										<button class="btn btn-primary" type="submit">Search</button>
									</div>

								</form>
							</div>
							<!-- /.box-body -->
						</div>
					</div>

					<div class="col-md-12">
					
					<a class="btn btn-primary" href="export-to-excel-item-wish-sale">Export to Excel</a>
					
						<div class="box box-primary clearfix">
							<div class="res_table">
								<table id="dataTable" class="table table-bordered table-hover">
									<thead>
										<tr>
										    <th>Sl.No</th>
										    <th></th>
											<th>Branch Name</th>
											<th>Category Name</th>
											<th>Item Name</th>
											<th>Size</th>
											<th>Price</th>
											<th>Sale Quentity</th>
											<th>Total Sale(%)</th>
											<th>Gross Sale</th>
											<th>Gross Sale(%)</th>
											<th>Item Discount</th>
											<th>Total Item Discount(%)</th>
											<th>Net Sale</th>
											<th>Net Sale(%)</th>
											
											
											
											
											<!-- <th>Summation Of Category</th> -->
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${itemwiseSalesDetailsReportModels}" var="itemwiseSalesDetailsReportModel">
												<tr>
												    <td></td>
												    <td></td>
													<td>${itemwiseSalesDetailsReportModel.branchName}</td>
													<td>${itemwiseSalesDetailsReportModel.categoryName}</td>
													<td>${itemwiseSalesDetailsReportModel.itemName}</td>
													<td>${itemwiseSalesDetailsReportModel.size}</td>
													<td>${itemwiseSalesDetailsReportModel.price}</td>
													<td>${itemwiseSalesDetailsReportModel.saleQuentity}</td>
													<td>${itemwiseSalesDetailsReportModel.totalSalePercentage}</td>
													<td>${itemwiseSalesDetailsReportModel.grossSale}</td>
													<td>${itemwiseSalesDetailsReportModel.grossSalePercentage}</td>
													<td>${itemwiseSalesDetailsReportModel.itemDiscount}</td>
													<td>${itemwiseSalesDetailsReportModel.itemDiscountPercentage}</td>
													<td>${itemwiseSalesDetailsReportModel.netSale}</td>
													<td>${itemwiseSalesDetailsReportModel.netSalePercentage}</td>
													
													
													
													
													<%-- <td>${salesReport.value.summationOfCategory}</td> --%>
												</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- DataTables -->
<%@ include file="cms-footer.jsp"%>