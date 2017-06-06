<title>Profile Wise Sales Report</title>
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

<!-- <script src="resources/js/report/time-period-sales-report.js"></script> -->
<script src="resources/js/bootstrap/bootstrap-datetimepicker.min.js"></script>
<script src="resources/js/report/moment.js"></script>
<script src="resources/js/report/date-format.js"></script>

<script src="resources/js/report/profile-wise-sales-report.js"></script>

<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Profile Wise Sales Report</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">

							<!-- /.box-header -->
							<div class="box-body">

								<form action="profile-wise-sales-report"
									id="profile-wise-sales-report" method="post">
									<div class="form-group">
										<label>Select Frequency Option : </label> <select
											class="form-control" name="frequencyOption"
											id="frequencyOption" style="height: 37px">
											<option value="">Select</option>
											<option value="DAILY">Daily</option>
											<option value="WEEKLY">Weekly</option>
											<option value="MONTHLY">Monthly</option>
											<option value="QUARTERLY">Quarterly</option>
											<option value="YEARLY">Yearly</option>
										</select>
									</div>

									<!-- Weekly Code Start-->
									<div class="form-group" id="div-monthNYear"
										style="display: none;">
										<label>Select Month & Year:<span
											class="mandatory-astric-color">*</span></label> <input
											class="form-control" type="text" name="monthNYear"
											id="monthNYear" autocomplete="off">
									</div>
									<div class="form-group" style="display: none;"
										id="div-weekOption">
										<label>Select Week :<span
											class="mandatory-astric-color">*</span></label> <select
											class="form-control" name="weekOption" id="weekOption">
											<option value="">Select</option>

										</select>
									</div>
									<!-- Weekly Code End-->

									<!-- Monthly Code Start-->
									<div class="form-group" id="div-month" style="display: none;">
										<label>Select Month & Year:<span
											class="mandatory-astric-color">*</span></label> <input
											class="form-control" type="text" name="month" id="month"
											autocomplete="off">
									</div>
									<!-- Monthly Code End-->

									<!-- Quarterly Code Start-->
									<div class="form-group" id="div-Quarter" style="display: none;">
										<label>Select Year:<span
											class="mandatory-astric-color">*</span></label> <input
											class="form-control" type="text" name="quarterYear"
											id="quarterYear" autocomplete="off">
									</div>
									<div class="form-group" id="div-Quarterly"
										style="display: none;">
										<label>Select Quarter:<span
											class="mandatory-astric-color">*</span></label> <select
											class="form-control" name="quarterly" id="quarterly">
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
										<label>Select Year:<span
											class="mandatory-astric-color">*</span></label> <input
											class="form-control" type="text" name="year" id="year">
									</div>
									<!-- Yearly Code End-->


									<div class="form-group" id="div-startDate"
										style="display: none;">
										<label>Start Date:<span class="mandatory-astric-color">*</span></label>
										<input class="form-control" type="text" name="startDate"
											id="startDate" autocomplete="off">
									</div>

									<div class="form-group" id="div-endDate" style="display: none;">
										<label>End Date:<span class="mandatory-astric-color">*</span></label>
										<input class="form-control" type="text" name="endDate"
											id="endDate" autocomplete="off">
									</div>
									
									<input type="hidden" name="check"
												value="${sessionScope.adminUserModel.adminType}"
												id="check">
												
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
												</c:if>
												<option value="COMBO">COMBO</option>
											</select>
										</div>
									</div>
									
									<div class="form-group" id="div-Gender">
										<label>Select Gender:<span
											class="mandatory-astric-color">*</span></label> <select
											class="form-control" name="gender" id="gender">
											<option value="">Select</option>
											<option value="ANY">Any</option>
											<option value="MALE">Male</option>
											<option value="FEMALE">Female</option>
										</select>
									</div>
									
									<div class="form-group" id="div-Age">
										<!-- <label>Select Age:<span
											class="mandatory-astric-color">*</span></label> <select
											class="form-control" name="age" id="age">
											<option value="">Select</option>
											<option value="0-20">(0-20)</option>
											<option value="21-30">(21-30)</option>
											<option value="31-50">(31-50)</option>
											<option value=">50">(Above 50)</option>
										</select> -->
										<label>To Age : <span
                                            class="mandatory-astric-color">*</span><span
                                            class="mandatory-msg">(max 30 characters)</span></label> <input
                                            type="text" name="toAge" id="toAge" class="form-control"
                                            maxlength="30">
                                        <label>From Age : <span
                                            class="mandatory-astric-color">*</span><span
                                            class="mandatory-msg">(max 30 characters)</span></label> <input
                                            type="text" name="fromAge" id="fromAge" class="form-control"
                                            maxlength="30">
										
									</div>
									 
									<div class="form-group" id="div-Amount-Slab">
										<!-- <label>Select Amount:<span
											class="mandatory-astric-color">*</span></label> <select
											class="form-control" name="amountSlab" id="amountSlab">
											<option value="">Select</option>
											<option value="0-500">(0-500)</option>
											<option value="501-1000">(501-1000)</option>
											<option value="1001-2000">(1001-2000)</option>
											<option value=">2000">(Above 2000)</option>
										</select> -->
										
										<label>To Amount : <span
                                            class="mandatory-astric-color">*</span><span
                                            class="mandatory-msg">(max 30 characters)</span></label> <input
                                            type="text" name="toAmount" id="toAmount" class="form-control"
                                            maxlength="30">
                                        <label>From Amount : <span
                                            class="mandatory-astric-color">*</span><span
                                            class="mandatory-msg">(max 30 characters)</span></label> <input
                                            type="text" name="fromAmount" id="fromAmount" class="form-control"
                                            maxlength="30">
										
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
								
								<c:if test="${not empty selectedYear }">
									<div class="form-group">
											<label>Report From Year :</label> 
											<label>${selectedYear }</label>										
									</div>
								</c:if>
								
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
															
							</div>
						
					
					
						 <div class="box box-primary clearfix">

							<!-- /.box-header -->
							<div class="box-body">
									<a class="btn btn-primary" href="export-to-excel-profile">Export to Excel</a>
								<div class="res_table">
									<table id="dataTable" class="table table-bordered table-hover">
										<thead>
											<tr>
												<th align="center">Sl No.</th>
												<th align="center"></th>
												<th align="center">Branch Name</th>
												<th align="center">Date</th>
												<th align="center">User Name</th>
												<th align="center">Age Slab</th>
												<th align="center">Gender</th>
												<th align="center">Location</th>
												<th align="center">Food Category</th>
												
												
												<%
													TimeperiodSalesReportModel timeperiodSalesReportModel = (TimeperiodSalesReportModel) request
															.getAttribute("timeperiodSalesReportModel");
													if (timeperiodSalesReportModel != null) {
														frequencyOption = timeperiodSalesReportModel
																.getFrequencyOption();
														if (frequencyOption.equals("HOURLY")) {
												%>
												<th align="center">Hourly Interval</th>
												<%
													}
													}
												%>
												<th align="center">Frequently Bought Food Item</th>												
												<th align="center">Net Sale</th>
												<th align="center">% of Total (Sales)</th>
												<th align="center">No. of Order Transactions</th>
												<th align="center">Average Order Transactions</th>
											</tr>
										</thead>
										<tbody>
											<%
												Map<String, Map<String, List<String>>> outerMap = (Map<String, Map<String, List<String>>>) request
														.getAttribute("reportList");

												if (outerMap != null) {
													System.out.println("outerMap" + outerMap);
													Map<String, List<String>> innerMapValues = null;
													List<String> innerList = null;

													//operation 
													for (Entry<String, Map<String, List<String>>> entry : outerMap
															.entrySet()) {

														//System.out.println(entry.getKey() +" ****==First===***** " + entry.getValue());
														innerMapValues = entry.getValue();

														if (innerMapValues != null) {
															for (Entry<String, List<String>> innerEntry : innerMapValues
																	.entrySet()) {

																//System.out.println(innerEntry.getKey() +" *****Second**** " + innerEntry.getValue());
																innerList = innerEntry.getValue();
																//innerList.add(innerEntry.getValue().toString());

																if (innerList != null & innerList.size() > 0) {

																	int j = 1;
																	System.out.println("innerList.size() --->>>>"
																			+ innerList.size());
																	//String netSale = innerList.get(innerList.size() - 1);
																	//System.out.println("netSale --->>>>" + netSale);
																	//String percentageOfTotalSale = innerList.get(innerList.size()-1);

																	//System.out.println("percentageOfTotalSale --->>>>"+percentageOfTotalSale);
																	//for(String s: innerList){
																	for (int i = 0; i < innerList.size(); i = i + 13) {
											%><tr>
												<%
													//System.out.println("List === >>>>"+innerList.get(i++));
												%><td align="center"><%=j++%></td>
												<%
													
												%><td align="center"></td>
												<%
													
												%><td align="center"><%=innerList.get(i + 4)%></td>
												<%
													
												%><td align="center"><%=innerList.get(i + 5)%></td>
												<%
													
												%><td align="center"><%=innerList.get(i + 0)%></td>
												<td align="center"><%=innerList.get(i + 1)%></td>
												<td align="center"><%=innerList.get(i + 2)%></td>
												<td align="center"><%=innerList.get(i + 3)%></td>
												
												<%
													if (frequencyOption.equals("HOURLY")) {
												%>
												<td align="center"><%=innerEntry
												.getKey()
												.substring(
														innerEntry.getKey()
																.lastIndexOf(
																		";") + 1)%></td>
												<%
													}
												%><td align="center"><%=innerList.get(i + 6)%></td>
												<td align="center"><%=innerList.get(i + 12)%></td>
												<%
													
												%><td align="center"><%=innerList.get(i + 7)%></td>
												<%
													
												%><td align="center"><%=innerList.get(i + 8)%></td>
												<%
													
												%><td align="center"><%=innerList.get(i + 9)%></td>
												<td align="center"><%=innerList.get(i + 10)%></td>
												<%
													
												%>
											</tr>
											<%
												}

																}
															}
														}
													}

												}
											%>

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