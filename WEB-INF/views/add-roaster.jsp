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
				<h1>Add Roaster</h1>
			</div>
		<div class="page-content">	
		  <form action="add-roaster" id="add-addon-form" method="post">
			
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">	
									<div class="form-group">
										<label>Select Days Of Week: <span class="mandatory-astric-color">*</span></label>
										 <select class="form-control" name="dayOfWeek" id="dayOfWeek">
											<option value="">Select</option>
											<c:forEach items="${daysOfWeeks}" var="daysOfWeek">
												<option value="${daysOfWeek}"  ${daysOfWeek == selectedDay ? 'selected':'' }>${daysOfWeek}</option>
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
									
									
									<div class="box-footer" align="right">
										<input type="button" name="name" id="bag-food-item" value="Bag the Food Item" class="btn btn-primary">
									</div>								
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
								<c:if test="${not empty foodListAccordingCategory}">
								   <tr id="bag-item-row-1">
										<td>
											<select class="form-control category-class" onchange="return getCategoryList(${itemCount })" name="categoryId" id="categoryId-${itemCount }" >
												<option value="">Select</option>
													<c:forEach items="${categoryDetails}" var="category">
														<option value="${category.id}" ${category.id == selectedCategory ? 'selected':'' }>${category.name}</option>
													</c:forEach>
												
											</select>
										</td>
										<td>										
											<select multiple class="form-control foodItems-class select2" name="foodItemIds" id="foodItems-1" style="width:65%" >
												 <c:forEach items="${foodListAccordingCategory}" var="foodItemsValue">
													<option value="${foodItemsValue.id}" ${foodItemsValue.id == selectedFoodItemId ? 'selected':'' }> ${foodItemsValue.itemName }</option> 
												</c:forEach> 
											</select>
										</td>
										<td>
											<a onclick="return deleteRoasterBagItem(1)">
											<i class="fa fa-trash-o"></i></a>
										</td>
									</tr> 								
								</c:if>									
								
								
								</tbody>
							</table>														
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<div class="rostar_maincont clearfix">
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
														<input type="checkbox" name="comboIds"  value=${ data.id} >
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
							</div>	
							<div class="box-footer" style="padding-top:10px;">
									<c:choose>
										<c:when test="${not empty foodListAccordingCategory}">
											<input  type="hidden" value="1" name="itemCount" id="itemCount">
										</c:when>
										<c:otherwise>
											<input  type="hidden" value="0" name="itemCount" id="itemCount">
										</c:otherwise>
									</c:choose>									
									<button class="btn btn-primary" type="submit">Submit</button>
							</div>													
						</div>
					</div>
				</div>
				
				
				</form>
			</div>

		</div>
	</div>
</div>

<%@ include file="cms-footer.jsp"%>