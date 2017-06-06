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
<script src="resources/js/roster/roaster.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Edit Roaster</h1>
			</div>
		<div class="page-content">	
		  <form action="edit-roaster" id="edit-addon-form" method="post">
			
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">	
									<div class="form-group">
										<label>Select Days Of Week: <span class="mandatory-astric-color">*</span></label>
										 <select class="form-control" name="dayOfWeek" id="dayOfWeek">
											<c:forEach items="${daysOfWeeks}" var="daysOfWeek">
												<c:if test="${roasterModel.dayOfWeek == daysOfWeek}">
													<option value="${daysOfWeek}" } > ${daysOfWeek} </option>
												</c:if>												
											</c:forEach>
										</select>
									</div>
									<div class="form-group">
										<label>Select Status: <span class="mandatory-astric-color">*</span></label> 
										<select class="form-control" name="status" id="status">
											<option value="">Select</option>
												<c:forEach items="${statusValues}" var="eStatus">
													<option value="${eStatus }" ${roasterModel.status == eStatus ? 'selected': ''}>${eStatus}</option>
												</c:forEach>
										</select>
									</div>

									<hr>
									<div class="form-group show-category">
										<label>Select Category: <span class="mandatory-astric-color">*</span></label> 
										<select class="form-control"  id="categoryId-0" onchange="getCategoryList(0)">
											<option value="">Select</option>
											<c:forEach items="${categoryDetails}" var="category">
												<option value="${category.id}">${category.name}</option>
											</c:forEach>
										</select>
									</div>

									<div class="form-group">
										<label>Select Food Item: <span class="mandatory-astric-color">*</span></label> 
										<select class="form-control select2"  id="foodItems-0" multiple="multiple">
										</select>
									</div>                                
									
									<c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
										<div class="box-footer" align="right">
											<input type="button" name="name" id="bag-food-item" value="Bag the Food Item" class="btn btn-primary">
										</div>	
									</c:if>
									
																
							</div>
							<!-- /.box-body -->
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<table id="" class="table table-bordered table-hover">
								<thead>
									<tr>										
										<th>Category</th>										
										<th>Food Item</th>										
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="tbody-food-item">	
									<c:set var="itemCount"  value="0"/>		
									<c:forEach var="entry" items="${roasterModel.categoryWiseSelectedFoodItems}">	
									  <c:set var="itemCount"  value="${itemCount+1}"/>
									  <tr id="bag-item-row-${itemCount }">
										<td>
											<select class="form-control category-class" disabled onchange="return getCategoryList(${itemCount })" name="categoryId" id="categoryId-${itemCount }" >
												<option value="">Select</option>
												<c:forEach items="${categoryDetails}" var="category">
													<option value="${category.id}" ${category.id == entry.key ? 'selected':''} >${category.name} </option>
												</c:forEach>
												
											</select>
										</td>
										<td>										
											<select multiple class="form-control foodItems-class select2" onchange="return reloadCategoryList()" name="foodItemIds" id="foodItems-${itemCount }" style="width:65%" >
												<c:forEach items="${roasterModel.categoryWiseAllFoodItems[entry.key]}" var="foodItemsValue">
												  <c:if test="${roasterModel.selectedFoodItemIdsCategoryWise[entry.key].contains(foodItemsValue.id)}">
												  <option value="${foodItemsValue.id}" selected>${foodItemsValue.foodItem }</option>
												  </c:if>
													
												</c:forEach>
											</select>
										</td>
										<td>
											<a onclick="return deleteRoasterBagItem(${itemCount })">
											<i class="fa fa-trash-o"></i></a>
										</td>
									</tr>
									  
									</c:forEach>
								</tbody>
							</table>														
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<table id="" class="table table-bordered table-hover">
								<thead>
									<tr>										
										<th>Combo</th>										
										<th>Food Item</th>	
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty comboDetails}">
											<c:forEach items="${comboDetails}" var="data">
												<tr>
													<td>
														<input type="checkbox" name="comboIds" ${roasterModel.comboIds.contains(data.id)  ? 'checked': '' } value=${ data.id} >
														 ${data.comboName }
													</td>
													<td>
														<c:forEach items="${data.comboFoodItemModels }" var="food">
															<span>--&nbsp</span>${food.foodItemModel.itemName}</br>
														
														</c:forEach>
													</td>
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
							<div class="box-footer">
									<input  type="hidden" value="${itemCount }" name="itemCount" id="itemCount">
									<input  type="hidden" value="${roasterModel.id }" name="id" id="id">
									<c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
											<button class="btn btn-primary" type="submit">Submit</button>
									</c:if>
									
							</div>													
						</div>
					</div>
				</div>
				
				
				</form>
			</div>

		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	
})
</script>
<%@ include file="cms-footer.jsp"%>
