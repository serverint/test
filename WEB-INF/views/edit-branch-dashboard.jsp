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
<script src="resources/js/bootstrap/bootstrap-datetimepicker.min.js"></script>

<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAvKbnKF0H4Wxg9ooBMtAwuIfr1kOzsS3g&callback=initMap"
	type="text/javascript"></script>
<script src="resources/js/branch/branch.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Edit Branch</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="edit-branch" id="edit-branch-form" method="post">
								
								<div class="form-group">
										<label>Select Country : <span class="mandatory-astric-color">*</span></label> <select
											class="form-control" name="countryId" id="countryId" disabled>
											<option value="">Select</option>

											<c:forEach items="${countryModels}" var="country">
											
												<c:choose>
													<c:when test="${country.countryId == branchModel.countryId}">
														<option value="${country.countryId}" selected>${country.countryName}</option>
													</c:when>
													<c:otherwise>
														<option value="${country.countryId}">${country.countryName}</option>
													</c:otherwise>
												</c:choose>
												
							
												
											</c:forEach>
										</select>
									</div>
				
								
									<div class="form-group">
										<label>Branch Name : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 30 characters)</span></label> <input type="text"
											name="branchName" id="branchName" class="form-control" value="${branchModel.branchName}" maxlength="30" readonly>
									</div>
									<div class="form-group">
										<label>Address :</label><textarea rows="" cols="" class="form-control" id="address" name="address" readonly>${branchModel.address}</textarea>
									</div>
									<div class="form-group">
										<label>Contact No : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 10 digit)</span></label></label> <input type="text"
											name="contactNo" id="contactNo" class="form-control" value="${branchModel.contactNo}" readonly>
									</div>
									
									<div class="form-group">
										<label>Branch Radious : <span
											class="mandatory-astric-color">*</span><span
											class="mandatory-msg">(max 30 characters)</span></label> <input
											type="text" name="radious" id="radious"
											class="form-control" maxlength="30" value="${branchModel.radious}" readonly >
									</div>
									<div class="form-group">
										<label>Zip Code : <span class="mandatory-astric-color">*</span></label> <input type="text"
											name="zipcode" id="zipcode" class="form-control" value="${branchModel.zipcode}" readonly>
									</div>
									<input type="hidden"
											name="zipcodehidden" id="zipcodehidden" class="form-control" value="${branchModel.zipcode}">
									
									<div class="accessories">
									 <div class="acc-wrapper">
										
											<label>Dinning</label> 
									
											<input type="checkbox" id="dinning"
												name="dinning" value="1" readonly
												<c:if test="${branchModel.dinning == 'YES' }">checked </c:if>  /> <br />
											
									</div>
                                       
										<div class="acc-wrapper1">
											<label>Take Away</label>
											<c:choose>
											
											<c:when test="${branchModel.takeAwayCheckbox == 'YES' }">
											
											<input type="checkbox" id="takeAwayCheckbox"
												name="takeAwayCheckbox" value="1" checked  /> <br />
											<div class="field1" >
												<label>Take Away Time</label> <input class="form-control date onlytime" type="text" id="takeaway"
													name="takeaway" value="${branchModel.takeaway}" readonly disabled /> 
											</div>
											
											</c:when>
											
											<c:otherwise>
											
											<input type="checkbox" id="takeAwayCheckbox"
												name="takeAwayCheckbox" value="1"  /> <br />
											<div class="field1" style="display: none;" >
												<label>Take Away Time</label> <input class="form-control date onlytime" type="text" id="takeaway"
													name="takeaway" value="" readonly disabled /> 
											</div>
											
											
											</c:otherwise>
											
											</c:choose> 
										</div>

										<div class="acc-wrapper2">
											<label>Delivery</label> 
											
											<c:choose>
											
											<c:when test="${branchModel.deliveryCheckbox == 'YES' }">
											
											<input type="checkbox" id="deliveryCheckbox"
												name="deliveryCheckbox" value="1" checked readonly  /> <br />
											<div class="field2">
												<label>Delievery Time</label> <input class="form-control date onlytime" type="text" id="delivery"
													name="delivery" value="${branchModel.delivery}" readonly disabled /> 
											</div>
											
											</c:when>
											
											<c:otherwise>
											
											<input type="checkbox" id="deliveryCheckbox"
												name="deliveryCheckbox" value="1" readonly /> <br />
											<div class="field2" style="display: none;">
												<label>Delievery Time</label> <input class="form-control date onlytime" type="text" id="delivery"
													name="delivery" value="" readonly disabled /> 
											</div>
											
											
											</c:otherwise>
											
											</c:choose> 
								
										</div>
									</div>
									
									
									
									
									

									<div class="form-group">
										<label>Select Status <span class="mandatory-astric-color">*</span></label> 
										<select class="form-control"
											name="status" id="status" disabled>
											<option value="">Select</option>
											
											<c:forEach items="${statusDetails}" var="eStatus">

												<option value="${eStatus}"
													<c:out value="${branchModel.status == eStatus ? 'selected': ''}"/>><c:out
														value="${eStatus}" /></option>
											</c:forEach>
											
										</select>
									</div>
									
									<div class="col-sm-3">
										<label>Branch Start Time <span class="mandatory-astric-color">*</span></label> <input
											class="form-control date onlytime" type="text"
											name="branchStartTime" id="branchStartTime" value="${branchModel.branchStartTime}" readonly disabled>
									</div>
									<div class="col-sm-3">
										<label>Branch End Time <span class="mandatory-astric-color">*</span></label> <input
											class="form-control date onlytime" type="text"
											name="branchEndTime" id="branchEndTime" value="${branchModel.branchEndTime}" readonly disabled>
									</div>
									<div class="col-sm-3">
										<label>Order Start Time <span class="mandatory-astric-color">*</span></label> <input
											class="form-control date onlytime" type="text"
											name="orderStartTime" id="orderStartTime" value="${branchModel.orderStartTime}" readonly disabled>
									</div>
									<div class="col-sm-3">
										<label>Order End Time <span class="mandatory-astric-color">*</span></label> <input
											class="form-control date onlytime" type="text"
											name="orderEndTime" id="orderEndTime" value="${branchModel.orderEndTime}" readonly disabled>
									</div>

									<div class="form-group">
										<div class="col-sm-12">
											<div id="map-canvas" style="height: 200px;"></div>
										</div>
									</div>

									<div class="form-group">
										
										 <input type="hidden" name="latitude"
											id="latitude" class="form-control">
										 <input type="hidden" name="longitude" id="longitude"
											class="form-control">
											
										<input type="hidden" id="fullAddress"
											class="form-control" value="${fullAddress}">
										<input type="hidden" name="id" value="${branchModel.id}"
											class="form-control">
									</div>

									<!-- <div class="box-footer">
										<button class="btn btn-primary" type="submit">Submit</button>
									</div> -->
								</form>
							</div>
							<!-- /.box-body -->
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

<script type="text/javascript">
	 $(document).ready(function () {
	 //initialize the javascript
	/*  App.init(); */
	 
	 $(".onlytime").datetimepicker({
         format: "hh:ii",
         autoclose: true,
         todayBtn: true,
        // startDate: "2016-01-01 00:00",
         minuteStep: 10,
         showMeridian: true,
         startView: 1,
//         minView: 2,
//         maxView: 1
     });
	 
	 
	 
/* 	 $('form').parsley(); */
	 }); 
 
	var map;
	var marker = null;
	function initialize() {
		var myLatlng = new google.maps.LatLng(60.631522, -106.546875);
		var mapOptions = {
			zoom : 8,
			center : myLatlng
		};
		map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);
		//setVendorMarker();
	}
	function _(ele) {
		return document.getElementById(ele);
	}
	function clearMarkers() {
		setAllMap(null);
	}

	function setVendorMarker() {
		
		var state = $("#state").val();
		var country = $("#country").val();
		var address = null;

		address = $("#fullAddress").val();
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				map.setCenter(results[0].geometry.location);
				if (marker)
					marker.setMap(null);
				marker = new google.maps.Marker({
					map : map,
					position : results[0].geometry.location,
					//                     title: title,
					draggable : false
				});
				getVendorMarker();
				this.adas = google.maps.event.addListener(marker, 'dragend',
						getVendorMarker);

			}
		});
		var myLatlng = new google.maps.LatLng(60.631522, -106.546875);
	}
	function getVendorMarker() {
		$("#latitude").val(marker.getPosition().lat());
		$("#longitude").val(marker.getPosition().lng());
		
		$.ajax({
			url : 'addressThroughLatLong?latitude='+ marker.getPosition().lat() + "&longitude=" + marker.getPosition().lng(),
            cache: true,
            type: "GET",
            success: function(result) {
                var data = result;
                $("#address").val(data);
                var markup = "";
                
                setTimeout(function() {
                    next2();
                }, 50);
            },
            error: function(reponse) {
            }
        });
		
		var latlng = new google.maps.LatLng(marker.getPosition().lat(), marker.getPosition().lng());
		var geocoder1 = new google.maps.Geocoder();

		    geocoder1.geocode({'latLng': latlng}, function(results, status) {
		        if (status == google.maps.GeocoderStatus.OK) {
		        	$("#zipcode").val("");
		            if (results[0]) {
		                for (j = 0; j < results[0].address_components.length; j++) {
		                    if (results[0].address_components[j].types[0] == 'postal_code')
		                    	 $("#zipcode").val(results[0].address_components[j].short_name);
		                }
		            }
		             if($("#zipcode").val() == ""){
		            	 
		            	 jQuery.growl.notice({
								message :  "Please Provide the Correct Zipcode"
							});
		            	 
		            	 $("#zipcode").val($("#zipcodehidden").val());
		            }
		            else{
		            	jQuery.growl.notice({
											message :  "Check Zipcode is Correct or not if not please Provide"
										});
		            	
		            	$("#zipcode").val(results[0].address_components[j].short_name);
		            } 
		     
		        } else {
		            alert("Geocoder failed due to: " + status);
		        }
		    });
	}
	google.maps.event.addDomListener(window, 'load', initialize);

	window.onload = function() {
		setVendorMarker();
	}
</script>
<%@ include file="cms-footer.jsp"%>