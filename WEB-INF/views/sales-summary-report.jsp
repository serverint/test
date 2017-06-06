<%@ include file="cms-header.jsp"%>
<!---------- top navigation start -------->
<%@ include file="cms-navigation-header.jsp"%>
<!---------- top navigation end -------->
<!-- Sidebar -->
<!---------- left menu start -------->
<%@ include file="cms-menu.jsp"%>
<!---------- left menu end -------->
<!-- DataTables -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map.*"%>
<%@ page import="com.peyala.model.*"%>
<%
	String frequencyOption = "";
%>
<link rel="stylesheet" href="resources/css/dataTables.bootstrap.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="resources/css/table.css">
<!-- DataTables -->
<script src="resources/js/datatables/jquery.dataTables.min.js"></script>
<script src="resources/js/datatables/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/common.js"></script>
<script src="resources/js/sidebar_menu.js"></script>
<script type="text/javascript"
	src="resources/js/dataTableCustom/dataTableCustom.js"></script>

<script src="resources/js/report/sales-summary-report.js"></script>
<script src="resources/js/bootstrap/bootstrap-datetimepicker.min.js"></script>
<script src="resources/js/report/moment.js"></script>
<script src="resources/js/report/date-format.js"></script>

<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Sales Summary Report</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">

							<!-- /.box-header -->
							<div class="box-body">

								<form action="sales-summary-report" id="sales-summary-report" method="POST">
									<div class="form-group">
										<label>Select Frequency Option : </label>
										 <select class="form-control" name="frequencyOption" id="frequencyOption" >
										    <option value="">Select</option>
											<option value="DAILY">Daily</option>
											<option value="WEEKLY">Weekly</option>
											<option value="MONTHLY">Monthly</option>
											<option value="QUARTERLY">Quarterly</option>
											<option value="YEARLY">Yearly</option>		
										</select>
									</div>

									<!-- Weekly Code Start-->
									<div class="form-group" id="div-monthNYear" style="display: none;">
										<label>Select Month & Year:<span
											class="mandatory-astric-color">*</span></label> 
											<input class="form-control" type="text" name="monthNYear" id="monthNYear" autocomplete="off">
									</div>
									
									<div class="form-group" style="display: none;" id="div-weekOption">
										<label>Select Week :<span class="mandatory-astric-color">*</span></label> 
										<select class="form-control" name="weekOption" id="weekOption">
											<option value="">Select</option>
										</select>
									</div>
									<!-- Weekly Code End-->

									<!-- Monthly Code Start-->
									<div class="form-group" id="div-month" style="display: none;">
										<label>Select Month & Year:<span class="mandatory-astric-color">*</span></label> 
										<input class="form-control" type="text" name="month" id="month" autocomplete="off">
									</div>
									<!-- Monthly Code End-->

									<!-- Quarterly Code Start-->
									<div class="form-group" id="div-Quarter" style="display: none;">
										<label>Select Year:<span class="mandatory-astric-color">*</span></label>
											 <input	class="form-control" type="text" name="quarterYear"	id="quarterYear" autocomplete="off">
									</div>
									<div class="form-group" id="div-Quarterly"	style="display: none;">
										<label>Select Quarter:<span class="mandatory-astric-color">*</span></label> 
										<select	class="form-control" name="quarterly" id="quarterly">
											<option value="">Select</option>
											<option value="QUARTER1">Quarter 1(APRIL-JUNE)</option>
											<option value="QUARTER2">Quarter 2(JULY-SEPTEMBER)</option>
											<option value="QUARTER3">Quarter 3(OCTOBER-DECEMBER)</option>
											<option value="QUARTER4">Quarter 4(JANUARY-MARCH)</option>
										</select>
									</div>

									<!-- Quarterly Code End-->

									<!-- Yearly Code Start-->
									<div class="form-group" id="div-Year" style="display: none;">
										<label>Select Year:<span class="mandatory-astric-color">*</span></label> 
										<input	class="form-control" type="text" name="year" id="year">
									</div>
									<!-- Yearly Code End-->

									<div class="form-group" id="div-startDate" 	style="display: none;">
										<label>Start Date:<span class="mandatory-astric-color">*</span></label>
										<input class="form-control" type="text" name="startDate" value="${reportSalesSummeryModel.startDate}"  id="startDate" autocomplete="off">
									</div>
									
									<div class="form-group" id="div-endDate" style="display: none;">
										<label>End Date:<span class="mandatory-astric-color">*</span></label>
										<input class="form-control" type="text" name="endDate" value="${reportSalesSummeryModel.endDate}" 	id="endDate" autocomplete="off">
									</div>
									
									<input type="hidden" name="check" value="${sessionScope.adminUserModel.adminType}" id="check">
									
									<c:choose>
										<c:when test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
											<input type="hidden" name="branchId" value="${sessionScope.adminUserModel.branchModel.id}" id="branchId1">
										</c:when>
										<c:otherwise>
											<div class="form-group">
												<div id="branch">
													<label>Select Branch: </label> 
													<select class="form-control select2" name="branchId" id="branchId" multiple>
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
											<label>Select Food Category : </label> 
											<select class="form-control select2" name="categoryId" id="categoryId" multiple>
												<option value="ALL" selected="selected">ALL</option>
												<c:if test="${not empty  categoryModels}">
													<c:forEach items="${categoryModels}" var="category">
														<option value="${category.id }">${category.name}</option>
													</c:forEach>
												</c:if>
												<option value="COMBO">Combo</option>
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
						<div class="box box-primary clearfix">
							<a class="btn btn-primary" href="export-to-excel-sale-summary">Export to Excel</a>
							<div class="box-body">
								<c:if test="${not empty selectedFrequencyOption }">
									<div class="form-group">
											<label>Selected Frequency :</label> 
											<label>${selectedFrequencyOption }</label>										
									</div>								
								</c:if>
								
								<c:if test="${not empty selectedBranchName }">
									<div class="form-group">
											<label>Selected Branch :</label> 
											<label>${selectedBranchName }</label>										
									</div>
								</c:if>
								
								<c:if test="${not empty selectedCategoryName }">
									<div class="form-group">
											<label>Selected Category :</label> 
											<label>${selectedCategoryName }</label>										
									</div>
								</c:if>
								
								<c:if test="${empty selectedYear }">
									<c:if test="${not empty selectedstartDate }">
										<div class="form-group">
												<label>Report From Date :</label> 
												<label>${selectedstartDate }</label>										
										</div>
									</c:if>
									
									<c:if test="${not empty selectedEndDate }">
										<div class="form-group">
												<label>Report To Date :</label> 
												<label>${selectedEndDate }</label>										
										</div>
									</c:if>
								</c:if>
								
								
								<c:if test="${not empty selectedYear }">
									<div class="form-group">
												<label>Report To Year :</label> 
												<label>${selectedYear}</label>										
										</div>
								</c:if>
								
								
															
							</div>
							
							<div class="res_table">
								<table  class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Branch Name</th>
											<th>Category Name</th>
											<th>Net Sale</th>
											<th>Tax</th>
											<th>Item Revenue </th>
											<th>Item Discount</th>
											<th>Sale Amount/payment mode</th>
											<th>Transaction Count</th>											
										</tr>
									</thead>
									<tbody>									
									<c:choose>
										<c:when test="${not empty reportSalesSummeryModels}">
											<c:forEach items="${reportSalesSummeryModels}" var="report">
														<tr>
															
															<td>${report.branchName}</td>															
															<td>${report.categoryName}</td>
															<td>${report.sumOrderPrice}</td>
															<td>${report.tax}</td>
															<td>${report.revenue}</td>														
															<td>${report.discount}</td>
															<td>	
																<c:if test="${not empty report.cardTypeValue}">
																
																	<c:forEach items="${report.cardTypeValue}" var="paymentCard" >
																	
																		${paymentCard.key} : ${paymentCard.value}<br>
																																		    
																	</c:forEach>
																</c:if>													
															</td>
															<td>${report.transactionCount}</td>													
														</tr>
												</c:forEach>										
										</c:when>
										<c:otherwise>
												<td colspan="10" align="center">No Records Found</td>
											</c:otherwise>
										</c:choose>
									
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
					

	
				</div>
			</div>
		</div>
	</div>

	<!-- DataTables -->
	<%@ include file="cms-footer.jsp"%>