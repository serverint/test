<title>Notification</title>
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

<script src="resources/js/notification/notification.js"></script>

<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>List Notification</h1>
			</div>
			<div class="page-content">
			
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<div class="box-body date-class">
								<form action="search-notification" method="post" id="search-notification-form">
									
									<div class="form-group">
										<label>Select Notification Type <span class="mandatory-astric-color">*</span></label> 
										<select class="form-control"
											name="notificationType" id="notification-type">
											<option value="">Select</option>
											
											<c:forEach items="${notificationType}" var="notifications">
												<c:choose>
												  <c:when test="${notifications == notificationModel.notificationType }">
												  	<option value="${notifications}" selected>${notifications}</option>
												  </c:when>
												  <c:otherwise>
												  	<option value="${notifications}">${notifications}</option>
												  </c:otherwise>
												</c:choose>
												
											</c:forEach>
											
										</select>
									</div>
									
									<div class="col-md-4">

										<div class="form-group" id="div-newItemStartDate">
											<label>From Date :<span class="mandatory-astric-color">*</span></label> 
											<input class="form-control" type="text" name="fromDate" id="fromDate" value="${notificationModel.fromDate }" readonly>
										</div>
										
									</div>
									
									<div class="col-md-4">
										
										<div  class="form-group" id="div-newItemEndDate">
											<label>To Date :<span class="mandatory-astric-color">*</span></label> 
											<input class="form-control" type="text" name="toDate" id="toDate" value="${notificationModel.toDate }" readonly>
										</div>
									</div>
									
									<div class="col-md-4" style="margin-top: 26px;">
										<input class="btn btn-primary" type="submit" value="submit"/>
									</div>

								</form>

							</div>

						</div>
					</div>
				</div>
			
			
			
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
										<th>Message</th>
										<th>Notification Type</th>
										<th>Date</th>																	

										<!-- <th>Action</th> -->
									</tr>
								</thead>
								<tbody>
								
									<c:if test="${not empty notificationDetails}">
									
									<c:choose>
										<c:when test="${not empty notificationDetails}">
											<c:forEach items="${notificationDetails}" var="data">
												<tr>
													<td></td>
													<td>${data.lastUpdateTimeStamp }</td>
													<td>${data.message}</td>
													<td>${data.notificationl}</td>
													<td>${data.sendingDate}</td>												
													<%-- <td>
														<a href="#?id=${data.id}" class="btn btn-default btn-xs"> 
															<i class="fa fa-pencil"></i>
														</a> 
														
													</td> --%>												
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<td colspan="5" align="center">No Records Found</td>
										</c:otherwise>
									</c:choose>
										
									</c:if>
									
								</tbody>
							</table>
							</div>
							<!-- Modal Start -->

						<!-- <div class="modal fade" id="deleteModal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
							</div> -->
							<!-- Modal End -->
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
</div>
<script >

jQuery(document).ready(function($) {
	
	$("#fromDate").datepicker({
		  changeMonth: true,
	    changeYear: true,
	    dateFormat: "yy-mm-dd",
	   
	    onSelect: function(selected) {
	        $("#toDate").datepicker("option","minDate", selected)
	      }
	});

	$("#toDate").datepicker({
		  changeMonth: true,
	    changeYear: true,
	    dateFormat: "yy-mm-dd",
	   
	    onSelect: function(selected) {
	         $("#fromDate").datepicker("option","maxDate", selected)
	      }
	});

});

</script>

<!-- DataTables -->
<%@ include file="cms-footer.jsp"%>

