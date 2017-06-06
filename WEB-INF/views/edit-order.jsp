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
<!-- <script src="resources/js/category/category.js"></script> -->
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body  clearfix">
			<div class="cont-top">
				<h1>Edit Order</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="edit-order" id="edit-order-form" method="post">
									<div class="form-group">
										<label>Order Id: </label>  
										<input type="text"  value="${orderModel.orderId }" name ="orderId" class="form-control" readonly="readonly">
									</div>
									<div class="form-group">
										<label>Order Type: </label>  
										<input type="text"  value="${orderModel.orderType }" name="orderType" class="form-control" readonly="readonly">
									</div>	
									<div class="form-group">
										<label>Order Price: </label>  
										<input type="text"  value="${orderModel.orderPrice }" class="form-control" readonly="readonly">
									</div>
									<div class="form-group">
										<label>Total Tax: </label>  
										<input type="text"  value="${orderModel.totalPaidTax}" class="form-control" readonly="readonly">
									</div>
									<div class="form-group">
										<label>Transaction Type: </label>  
										<input type="text"  value="${orderModel.transactionType}" name="transactionType" class="form-control" readonly="readonly">
									</div>
																	
									<div class="form-group">
										<label>Assigned Branch: <span class="mandatory-astric-color">*</span></label> 
										<select class="form-control" name="branchId" id="branchId">																						
												<c:forEach items="${branchModels}" var="branchModel">
													<c:if test="${branchModel.id == orderModel.branchModel.id }">
														<option value="${branchModel.id }">${branchModel.branchName}</option>
													</c:if>													
												</c:forEach>
										</select>
									</div> 
									<div class="form-group">
										<label>Order Status: <span class="mandatory-astric-color">*</span></label> 
										<select class="form-control" name="orderStatus" id="orderStatus">
<!-- 													<option value="">Select</option> -->
												<c:forEach items="${orderStatusValues}" var="orderStatusValue">
													<option value="${orderStatusValue }" ${orderStatusValue == orderModel.orderStatus ? 'selected': ''}>${fn:replace(orderStatusValue,'_', '  ')}</option>
												</c:forEach>
										</select>
									</div>
									<div class="form-group">
										<label>Allergy Note : </label>
										<textarea name="allergyNote" id="allergyNote" class="form-control" maxlength="300" readonly="readonly">${orderModel.allergyNote }</textarea>
									</div>
									
									<div class="box-footer">
									
										
										<input type="hidden" name="id" id="id" value="${orderModel.id}">
										
<%-- 										<input type="text" name="id" id="id" value="${orderModel.lastOrder}"> --%>
										
										<c:if test="${orderModel.lastOrder == '0'}">
											<button class="btn btn-primary" type="submit">Submit</button>
											<a href= "list-order"><button class="btn btn-warning" type="button">Back</button></a>
										</c:if>
										
										
										<c:if test="${orderModel.lastOrder == '1'}">
											<a href= "list-old-order"><button class="btn btn-warning" type="button">Back</button></a>
										</c:if>
										
									</div>
									
								</form>
							</div>
							<!-- /.box-body -->
						</div>
					</div>
				</div>
				<c:if test="${orderModel.orderType ==  orderType[2]}">
				
					<div class="cont-top">
						<h1>Order Delivery Address</h1>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="box box-primary clearfix">
								<!-- /.box-header -->
								<div class="box-body">
									<form >
										<div class="form-group">
											<label>Address Line1: </label>  
											<input type="text"  value="${orderModel.deliveryAddressModel.addressLine1 }" class="form-control" readonly="readonly">
										</div>	
										<div class="form-group">
											<label>Address Line2: </label>  
											<input type="text"  value="${orderModel.deliveryAddressModel.addressLine2 }" class="form-control" readonly="readonly">
										</div>
										<div class="form-group">
											<label>Land Mark: </label>  
											<input type="text"  value="${orderModel.deliveryAddressModel.landMark}" class="form-control" readonly="readonly">
										</div>
										<div class="form-group">
											<label>City: </label>  
											<input type="text"  value="${orderModel.deliveryAddressModel.city}" class="form-control" readonly="readonly">
										</div>
										<div class="form-group">
											<label>Pincode: </label>  
											<input type="text"  value="${orderModel.deliveryAddressModel.pincode}" class="form-control" readonly="readonly">
										</div>
										<div class="form-group">
											<label>Phone: </label>  
											<input type="text"  value="${orderModel.deliveryAddressModel.phoneNo}" class="form-control" readonly="readonly">
										</div>
									</form>
								</div>
								<!-- /.box-body -->
							</div>
						</div>
					</div>
				
				</c:if>
				
				<!-- List Food Item Details -->
					<div class="cont-top">
						<h1>List Food Item</h1>
					</div>
					<div class="page-content">
						<div class="row">
							<div class="col-md-12">
								<div class="box box-primary clearfix">
									<table  class="table table-bordered table-hover">
										<thead>
											<tr>
												<th>Food Name</th>
												<th>Item Size</th>
												<th>Default Addons(Quantity)</th>
												<th>Paid Addons(Quantity)</th>
											<!-- 	<th>Category</th>
												<th>Type</th> -->
												<th>Item Quantity</th>
												<th>Item Price/unit</th>
												<th>Discount</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${not empty orderFoodItemModels}">
													<c:forEach items="${orderFoodItemModels}" var="data">
														<tr>
															<td>${data.foodItemModel.itemName}</td>	
															<td>${data.sizeModel.name}</td>
															<td>																
																<c:forEach items="${data.orderFoodItemAddonModels}" var="data1" varStatus="loop">
																	<c:if test="${data1.defaultAddonFlag == 'YES'}">
																		${data1.addOnModel.name} (${data1.addonQuantity }) 
																		<c:if test="${!loop.last}">,</c:if>
																	</c:if>	
																</c:forEach>
																	
															</td>
															<td>																
																<c:forEach items="${data.orderFoodItemAddonModels}" var="data1" varStatus="loop">
																	<c:if test="${data1.defaultAddonFlag == 'NO'}">
																		${data1.addOnModel.name} (${data1.addonQuantity }) 
																		<c:if test="${!loop.last}">,</c:if>
																	</c:if>	
																</c:forEach>
																	
															</td>
															
														<%-- 	<td>${data.foodItemModel.categoryModel.name}</td>
															<td>${data.foodItemModel.typeModel.name}</td> --%>
															<td>${data.foodItemQuantity}</td>		
<%-- 															<td>${data.foodItemModel.foodItemSizeModels[0].itemSizePrice}</td> --%>
<%-- 															<td>${data.foodItemModel.foodItemSizeModels[0].discountAmount}</td>				 --%>

															<td>${data.amount}</td>
															<td>${data.discount}</td>	
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<td colspan="6" align="center">No Records Found</td>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>							
								</div>
							</div>
						</div>
					</div>					
					<!-- List Combo Item Details -->
					
					<div class="cont-top">
						<h1>List Combo Item</h1>
					</div>
					<div class="page-content">
						<div class="row">
							<div class="col-md-12">
								<div class="box box-primary clearfix">
									<table  class="table table-bordered table-hover">
										<thead>
											<tr>
												<th>Combo Name</th>
												<th>Combo Price</th>
												<th>Combo Quantity</th>													
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${not empty comboModels}">
													<c:forEach items="${comboModels}" var="data">
														<tr>
															<td><a href="javascript:void(0)" title="Details" onclick="return comboFoodItemList('${data.id}','${data.comboOrderUniqueId}')"  data-toggle="modal" data-target="#comboFoodItem">${data.comboName}</a></td>	
															<td>${data.comboPrice}</td>
															<td>${data.comboQuantity}</td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<td colspan="3" align="center">No Records Found</td>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>							
								</div>
							</div>
						</div>
					</div>
					<!--  modal start -->
					
						<div class="modal fade" id="comboFoodItem"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">								
										<div class="main-body edit_ordercont clearfix" style="min-height: 200px;">
												<div class="cont-top">
													<h1>Combo Food Item</h1>
												</div>
												<div class="page-content">
													<div class="row" >
														<div class="col-md-12">
															<div class="box box-primary clearfix">
																<table  class="table table-bordered table-hover">
																	<thead>
																		<tr>
																			<th>Name</th>
																			<th>Item Size</th>
																			<th>Default Addons(Quantity)</th>
																			<th>Paid Addons(Quantity)</th>
																			<!-- <th>Item Quantity</th>
																			<th>Item Price/unit</th> -->
																		</tr>
																	</thead>
																	<tbody id="order-combo-food-item1">
																														
																	</tbody>
																</table>							
															</div>
														</div>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
												</div>
											</div>
									</div>
							</div>	
					<!-- end modal -->
			</div>
		</div>
	</div>
</div>
<script>

function comboFoodItemList(comboId, comboUniqueId){
	
	var url = 'get-order-food-item-by-combo-id';
	var html1 = '';
	var orderId = $("#id").val(); 
	
	jQuery.ajax({
		url  :  url,
		type : 'POST',
		dataType : 'json',
		data : { comboId : comboId, orderId : orderId, comboUniqueId : comboUniqueId},
		success : function(data){
			
			
					
			if(data.length > 0){
				
				
				$.each(data,function(index, val){
				
					var defaultAddonsHtml = '';
					var paidAddonsHtml = '';
			
					 $.each(val.orderFoodItemAddonModels, function(i, addons){//create the addons
						 
						 if(addons.defaultAddonFlag == "YES"){
							 defaultAddonsHtml+= addons.addOnModel.name + '(' + addons.addonQuantity + '),'; 
						 }						 
					}); 
					 
					 $.each(val.orderFoodItemAddonModels, function(i, addons){//create the addons
						 if(addons.defaultAddonFlag == "NO"){
							 paidAddonsHtml+= addons.addOnModel.name + '(' + addons.addonQuantity + '),'; 
						 }						 
					});  
					
					 defaultAddonsHtml = defaultAddonsHtml.replace(/,\s*$/, "");
					 paidAddonsHtml = paidAddonsHtml.replace(/,\s*$/, "");
					
					 html1+= '<tr>'
								+'<td>' +  val.foodItemModel.itemName   + '</td>'
								+'<td>' + val.sizeModel.name  + '</td>'
								+'<td>' + defaultAddonsHtml  + '</td>'
								+'<td>' + paidAddonsHtml  + '</td>'
								/* +'<td>' + val.foodItemQuantity  + '</td>'
								+'<td>' + val.foodItemModel.foodItemSizeModels[0].itemSizePrice  + '</td>' */
						  +'</tr>'; 
					
				});
				
				//alert(html1);
				jQuery("#order-combo-food-item1").html(html1);
			}
			
			
		},
		error : function(request, status, error){
			
		}
		
	});
}

</script>
<%@ include file="cms-footer.jsp"%>