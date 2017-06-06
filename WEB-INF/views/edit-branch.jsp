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

<script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAvKbnKF0H4Wxg9ooBMtAwuIfr1kOzsS3g&libraries=places&sensor=true&v=3.exp"
    async defer></script>
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
							<c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
								<div class="form-group">
										<label>Select Country : <span class="mandatory-astric-color">*</span></label> <select
											class="form-control" name="countryId" id="countryId">
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
									</c:if>
									
								<c:if test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
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
									</c:if>	
									<c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
									<div class="form-group">
										<label>Branch Name : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 30 characters)</span></label> <input type="text"
											name="branchName" id="branchName" class="form-control" value="${branchModel.branchName}" maxlength="30">
									</div>
									</c:if>
									<c:if test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
									<div class="form-group">
										<label>Branch Name : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 30 characters)</span></label> <input type="text"
											name="branchName" id="branchName" class="form-control" value="${branchModel.branchName}" maxlength="30" disabled>
									</div>
									</c:if>
									
									<c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
									
									<div class="form-group">
										<label>Address :</label><textarea rows="" cols="" class="form-control" id="address" name="address">${branchModel.address}</textarea>
									</div>
									</c:if>
									<c:if test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
									
									<div class="form-group">
										<label>Address :</label><textarea rows="" cols="" class="form-control" id="address" name="address" disabled readonly">${branchModel.address}</textarea>
									</div>
									</c:if>
									
									
								    <c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
									
									<div class="form-group">
										<label>Contact No : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 20 digit)</span></label></label> <input type="text"
											name="contactNo" id="contactNo" class="form-control" value="${branchModel.contactNo}" maxlength="20">
									</div>
									</c:if>
									
									<c:if test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
									
									<div class="form-group">
										<label>Contact No : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 20 digit)</span></label></label> <input type="text"
											name="contactNo" id="contactNo" class="form-control" value="${branchModel.contactNo}" readonly>
									</div>
									</c:if>
									
									
									 <c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
									<div class="form-group">
										<label>Branch Radious(KM) : <span
											class="mandatory-astric-color">*</span><span
											class="mandatory-msg">(max 30 characters)</span></label> <input
											type="text" name="radious" id="radious"
											class="form-control" maxlength="30" value="${branchModel.radious}" >
									</div>
									</c:if>
									 <c:if test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
									<div class="form-group">
										<label>Branch Radious(KM) : <span
											class="mandatory-astric-color">*</span><span
											class="mandatory-msg">(max 30 characters)</span></label> <input
											type="text" name="radious" id="radious"
											class="form-control" maxlength="30" value="${branchModel.radious}" readonly disabled >
									</div>
									</c:if>
									<c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
									<div class="form-group">
										<label>Zip-Postal Code : <span class="mandatory-astric-color">*</span></label> <input type="text"
											name="zipcode" id="zipcode" class="form-control" value="${branchModel.zipcode}">
									</div>
									</c:if>
									
									<c:if test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
									<div class="form-group">
										<label>Zip-Postal Code : <span class="mandatory-astric-color">*</span></label> <input type="text"
											name="zipcode" id="zipcode" class="form-control" value="${branchModel.zipcode}" readonly disabled>
									</div>
									</c:if>
									<input type="hidden"
											name="zipcodehidden" id="zipcodehidden" class="form-control" value="${branchModel.zipcode}">
									
									<div class="accessories">
									<c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
									 <div class="acc-wrapper">
										
											<label>Dinning</label> 
									
											<input type="checkbox" id="dinning"
												name="dinning" value="1" 
												<c:if test="${branchModel.dinning == 'YES' }">checked </c:if>  /> <br />
											
									</div>
									</c:if>
									
									<c:if test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
									 <div class="acc-wrapper">
										
											<label>Dinning</label> 
									
											<input type="checkbox" id="dinning"
												name="dinning" value="1" 
												<c:if test="${branchModel.dinning == 'YES' }">checked </c:if>  /> <br />
											
									</div>
									<script type="text/javascript">
									$('#dinning').prop('disabled', true);
									</script>
									
									</c:if>
									
									
                                    <c:if test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
										<div class="acc-wrapper1">
											<label>Take Away</label>
											<c:choose>
											
											<c:when test="${branchModel.takeAwayCheckbox == 'YES' }">
											
											<input type="checkbox" id="takeAwayCheckbox"
												name="takeAwayCheckbox" value="1" checked /> <br />
											<div class="field1" >
												<label>Take Away Time</label> <input class="form-control date onlytime" type="text" id="takeaway"
													name="takeaway" value="${branchModel.takeaway}" readonly disabled/> 
											</div>
											
											<script type="text/javascript">
									            $('#takeAwayCheckbox').prop('disabled', true);
									       </script>
											
											</c:when>
											
											<c:otherwise>
											
											<input type="checkbox" id="takeAwayCheckbox"
												name="takeAwayCheckbox" value="1" /> <br />
											<div class="field1" style="display: none;" >
												<label>Take Away Time</label> <input class="form-control date onlytime" type="text" id="takeaway"
													name="takeaway" value="" readonly disabled /> 
											</div>
											<script type="text/javascript">
									            $('#takeAwayCheckbox').prop('disabled', true);
									        </script>
											
											</c:otherwise>
											
											</c:choose> 
										</div>
									</c:if>
										
										<c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
										<div class="acc-wrapper1">
											<label>Take Away</label>
											<c:choose>
											
											<c:when test="${branchModel.takeAwayCheckbox == 'YES' }">
											
											<input type="checkbox" id="takeAwayCheckbox"
												name="takeAwayCheckbox" value="1" checked /> <br />
											<div class="field1" >
												<label>Take Away Time</label> <input class="form-control date onlytime" type="text" id="takeaway"
													name="takeaway" value="${branchModel.takeaway}" /> 
											</div>
											
											</c:when>
											
											<c:otherwise>
											
											<input type="checkbox" id="takeAwayCheckbox"
												name="takeAwayCheckbox" value="1" /> <br />
											<div class="field1" style="display: none;" >
												<label>Take Away Time</label> <input class="form-control date onlytime" type="text" id="takeaway"
													name="takeaway" value="" /> 
											</div>
											
											
											</c:otherwise>
											
											</c:choose> 
										</div>
										</c:if>
										
										
										
										
                                       <c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
										<div class="acc-wrapper2">
											<label>Delivery</label> 
											
											<c:choose>
											
											<c:when test="${branchModel.deliveryCheckbox == 'YES' }">
											
											<input type="checkbox" id="deliveryCheckbox"
												name="deliveryCheckbox" value="1" checked /> <br />
											<div class="field2">
												<label>Delievery Time</label> <input class="form-control date onlytime" type="text" id="delivery"
													name="delivery" value="${branchModel.delivery}" /> 
											</div>
											
											</c:when>
											
											<c:otherwise>
											
											<input type="checkbox" id="deliveryCheckbox"
												name="deliveryCheckbox" value="1" /> <br />
											<div class="field2" style="display: none;">
												<label>Delivery Time</label> <input class="form-control date onlytime" type="text" id="delivery"
													name="delivery" value="" /> 
											</div>
											
											
											</c:otherwise>
											
											</c:choose> 
								
										</div>
										</c:if>
										
									<c:if test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
										<div class="acc-wrapper2">
											<label>Delivery</label> 
											
											<c:choose>
											
											<c:when test="${branchModel.deliveryCheckbox == 'YES' }">
											
											<input type="checkbox" id="deliveryCheckbox"
												name="deliveryCheckbox" value="1" checked /> <br />
											<div class="field2">
												<label>Delievery Time</label> <input class="form-control date onlytime" type="text" id="delivery"
													name="delivery" value="${branchModel.delivery}" disabled readonly /> 
											</div>
											<script type="text/javascript">
									            $('#deliveryCheckbox').prop('disabled', true);
									       </script>
											
											
											
											</c:when>
											
											<c:otherwise>
											
											<input type="checkbox" id="deliveryCheckbox"
												name="deliveryCheckbox" value="1" /> <br />
											<div class="field2" style="display: none;">
												<label>Delivery Time</label> <input class="form-control date onlytime" type="text" id="delivery"
													name="delivery" value="" /> 
											</div>
											<script type="text/javascript">
									            $('#deliveryCheckbox').prop('disabled', true);
									       </script>
											
											</c:otherwise>
											
											</c:choose> 
								
										</div>
									</c:if>
										
				
									</div>
									
								
                             <c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
									<div class="form-group">
										<label>Select Status <span class="mandatory-astric-color">*</span></label> 
										<select class="form-control"
											name="status" id="status">
											<option value="">Select</option>
											
											<c:forEach items="${statusDetails}" var="eStatus">

												<option value="${eStatus}"
													<c:out value="${branchModel.status == eStatus ? 'selected': ''}"/>><c:out
														value="${eStatus}" /></option>
											</c:forEach>
											
										</select>
									</div>
								</c:if>
								<c:if test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
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
									</c:if>
									
									<c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
									 <div class="col-sm-3">
										<label>Branch Start Time <span class="mandatory-astric-color">*</span></label> <input
											class="form-control date onlytime" type="text"
											name="branchStartTime" id="branchStartTime" value="${branchModel.branchStartTime}">
									 </div>
									</c:if>
									
									<c:if test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
									 <div class="col-sm-3">
										<label>Branch Start Time <span class="mandatory-astric-color">*</span></label> <input
											class="form-control date onlytime" type="text"
											name="branchStartTime" id="branchStartTime" value="${branchModel.branchStartTime}" readonly disabled>
									 </div>
									</c:if>
									
									<c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
									 <div class="col-sm-3">
										<label>Branch End Time <span class="mandatory-astric-color">*</span></label> <input
											class="form-control date onlytime" type="text"
											name="branchEndTime" id="branchEndTime" value="${branchModel.branchEndTime}">
									 </div>
									</c:if>
									
									<c:if test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
									 <div class="col-sm-3">
										<label>Branch End Time <span class="mandatory-astric-color">*</span></label> <input
											class="form-control date onlytime" type="text"
											name="branchEndTime" id="branchEndTime" value="${branchModel.branchEndTime}" readonly disabled>
									 </div>
									</c:if>
									
									
									<c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
									 <div class="col-sm-3">
										<label>Order Start Time <span class="mandatory-astric-color">*</span></label> <input
											class="form-control date onlytime" type="text"
											name="orderStartTime" id="orderStartTime" value="${branchModel.orderStartTime}">
									 </div>
									</c:if>
									<c:if test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
									 <div class="col-sm-3">
										<label>Order Start Time <span class="mandatory-astric-color">*</span></label> <input
											class="form-control date onlytime" type="text"
											name="orderStartTime" id="orderStartTime" value="${branchModel.orderStartTime}"readonly disabled>
									 </div>
						
									</c:if>
									<c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
									 <div class="col-sm-3">
										<label>Order End Time <span class="mandatory-astric-color">*</span></label> <input
											class="form-control date onlytime" type="text"
											name="orderEndTime" id="orderEndTime" value="${branchModel.orderEndTime}">
									 </div>
									</c:if>
									<c:if test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
									 <div class="col-sm-3">
										<label>Order End Time <span class="mandatory-astric-color">*</span></label> <input
											class="form-control date onlytime" type="text" name="orderEndTime" id="orderEndTime" value="${branchModel.orderEndTime}" readonly disabled>
									 </div>
									</c:if>
									
									<input
											class="form-control date onlytime" type="hidden"
											name="adminType" id="admintype" value="${sessionScope.adminUserModel.adminType}">

									<div class="form-group">
										<div class="col-sm-12">
											<div id="map-canvas" style="height: 200px;"></div>
										</div>
									</div>

									<div class="form-group clearfix">
										
										 <input type="hidden" name="latitude"
											id="latitude" class="form-control">
										 <input type="hidden" name="longitude" id="longitude"
											class="form-control">
											
										<input type="hidden" id="fullAddress"
											class="form-control" value="${fullAddress}">
										<input type="hidden" name="id" value="${branchModel.id}"
											class="form-control">
									</div>
									
									<c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
									<div class="col-sm-12">
									<div class="box-footer">
										<button class="btn btn-primary" type="submit">Submit</button>
									</div>
									</div>
									</c:if>
									
									
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

var placeSearch, autocomplete;
var componentForm = {
    street_number : 'short_name',
    route : 'long_name',
    locality : 'long_name',
    administrative_area_level_1 : 'short_name',
    country : 'long_name',
    postal_code : 'short_name'
};

var autopopulate = function() {
    var place = autocomplete.getPlace();
    if(typeof place == "undefined"){
        setVendorMarker1();
        getVendorMarker();
    }
    else{
        console.log(autocomplete);
        //var place = autocomplete.getPlace();
        console.log(place.address_components[place.address_components.length-1].long_name);
       // $("#zipcode").val(place.address_components[place.address_components.length-1].short_name);
        $("#latitude").val(place.geometry.location.lat());
        $("#longitude").val(place.geometry.location.lng());
        console.log(place.address_components)
        
        var latlngnew = new google.maps.LatLng(place.geometry.location.lat(), place.geometry.location.lng());
        var geocoder2 = new google.maps.Geocoder();

        geocoder2.geocode(
                    {
                        'latLng' : latlngnew
                    },
                    function(results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            $("#zipcode").val("");
                            if (results[0]) {
                                for (j = 0; j < results[0].address_components.length; j++) {
                                    if (results[0].address_components[j].types[0] == 'postal_code')
                                        $("#zipcode").val(results[0].address_components[j].short_name);
                                }
                            }
                            if ($("#zipcode").val() == "") {

                                jQuery.growl
                                        .notice({
                                            message : "Please Provide the Correct Zipcode"
                                        });

                                jQuery.growl
                                        .notice({
                                            message : "Please Check the Country Once More"
                                        });

                            } else {
                                jQuery.growl
                                        .notice({
                                            message : "Check Zipcode is Correct or not if not please Provide"
                                        });

                                jQuery.growl
                                        .notice({
                                            message : "Please Check the Country Once More"
                                        });
                            }

                        } else {
                            alert("Geocoder failed due to: " + status);
                        }
                    });
        
       
       // setVendorMarker1();
       
        var address = null;

		address = $("#address").val();
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
					//title: title,
					draggable : true
				});
				//getVendorMarker();
				this.adas = google.maps.event.addListener(marker, 'dragend',
						getVendorMarker);

			}
		});
		var myLatlng = new google.maps.LatLng(60.631522, -106.546875);
 
    }
   
   
   
    return false;
}

function initAutocomplete() {
    // Create the autocomplete object, restricting the search to geographical
    // location types.
    autocomplete = new google.maps.places.Autocomplete(
    /** @type {!HTMLInputElement} */
    (document.getElementById('address')), {
        types : [ 'geocode' ]
    });
    // When the user selects an address from the dropdown, populate the address
    // fields in the form.
    autocomplete.addListener('place_changed', autopopulate);
}
 

function geolocate() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var geolocation = {
                lat : position.coords.latitude,
                lng : position.coords.longitude
            };
            var circle = new google.maps.Circle({
                center : geolocation,
                radius : position.coords.accuracy
            });
            //autocomplete.setBounds(circle.getBounds());
        });
    }
}

</script>






<script type="text/javascript">
	 $(document).ready(function () {
	 //initialize the javascript
	/*  App.init(); */
	 
/* 	 $(".onlytime").datetimepicker({
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
	  */
	
	
	
	 $('#branchStartTime').timepicki({
		   show_meridian:false,
		   min_hour_value:0,
		   max_hour_value:23,
		   step_size_minutes:05,
		   overflow_minutes:true,
		   increase_direction:'up',
		   disable_keyboard_mobile: true,
		   start_time: ["09", "30"]
		   
	 });
	
	 $('#branchEndTime').timepicki({
		   show_meridian:false,
		   min_hour_value:0,
		   max_hour_value:23,
		   step_size_minutes:05,
		   overflow_minutes:true,
		   increase_direction:'up',
		   disable_keyboard_mobile: true,
		   start_time: ["22", "30"]
		   
	 });
	 
	 $('#orderStartTime').timepicki({
		   show_meridian:false,
		   min_hour_value:0,
		   max_hour_value:23,
		   step_size_minutes:05,
		   overflow_minutes:true,
		   increase_direction:'up',
		   disable_keyboard_mobile: true,
		   start_time: ["10", "30"]
		   
	 });
	 
	 $('#orderEndTime').timepicki({
		   show_meridian:false,
		   min_hour_value:0,
		   max_hour_value:23,
		   step_size_minutes:05,
		   overflow_minutes:true,
		   increase_direction:'up',
		   disable_keyboard_mobile: true,
		   start_time: ["21", "30"]
		   
	 });		 

	
	  $('#takeaway').timepicki({
			show_meridian:false,
			min_hour_value:0,
			max_hour_value:5,
			step_size_minutes:05,
			overflow_minutes:true,
			increase_direction:'up',
			disable_keyboard_mobile: true,
			start_time: ["01", "00"]
	  });
	 
	 $('#delivery').timepicki({
			show_meridian:false,
			min_hour_value:0,
			max_hour_value:5,
			step_size_minutes:05,
			overflow_minutes:true,
			increase_direction:'up',
			disable_keyboard_mobile: true,
			start_time: ["01", "00"]
	  });
	 
	 
/* 	 $('form').parsley(); */
	 }); 
 
	var map;
	var marker = null;
	var admintype = $("#admintype").val();
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

		//address = country + ', ' + state;
		address = $("#fullAddress").val();
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				map.setCenter(results[0].geometry.location);
				if (marker)
					marker.setMap(null);
				if(admintype == 'ADMIN'){
					marker = new google.maps.Marker({
						map : map,
						position : results[0].geometry.location,
						draggable :false
					});
				}
				else{
					marker = new google.maps.Marker({
						map : map,
						position : results[0].geometry.location,
						draggable : true
					});
				}
				
				
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
	//google.maps.event.addDomListener(window, 'load', initialize);

	window.onload = function() {
		initAutocomplete();
        initialize();
        setVendorMarker();
	}
</script>
<%@ include file="cms-footer.jsp"%>