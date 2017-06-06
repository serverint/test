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

<!-- <script type="text/javascript"
    src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script> -->

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAvKbnKF0H4Wxg9ooBMtAwuIfr1kOzsS3g&libraries=places&sensor=true&v=3.exp"
	async defer></script>
<script src="resources/js/contact-us/contact-us-validation.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Add Contact Us</h1>
			</div>
	
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body abcd">
								<form action="add-contactus" id="add-contactus-form" method="post">

									<div class="form-group">
										<label>Address :</label>
										<textarea rows="" cols="" class="form-control" id="address"
											name="address">${contactUsModel.address}</textarea>
									</div>

									<div class="form-group" style="width: 95%;">
										<label>Mobile: <span class="mandatory-astric-color">*</span></label>
										<c:choose>
											<c:when test="${contactUsModel.mobileModels.size() > 0 }">
													<c:forEach var="mobile" items="${contactUsModel.mobileModels}" varStatus="loop">
													<c:choose>
														<c:when test="${loop.index == 0}">
															<div class="col-lg-12">
																<div class="col-lg-10">
																	<input type="text" value="${mobile.contactNo }" name="mobiles" id="mobiles" class="form-control">
																</div>
																<div class="col-lg-2">
																	<input type="button" value="Add Mobile" class="addRow btn btn-primary btn-sm">
																</div>
															</div>
														</c:when>
														<c:otherwise>
															<div class="col-lg-12">
																<div class="col-lg-10">
																	<input type="text" value="${mobile.contactNo }" name="mobiles" id="mobiles" class="form-control">
																</div>
																<div class="col-lg-2">
																	<input type="button" value="Delete Mobile" class="deleteRow btn btn-danger btn-sm">
																</div>
															</div>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<div class="col-lg-12">
																<div class="col-lg-10">
																	<input type="text" value="" name="mobiles" id="mobiles" class="form-control">
																</div>
																<div class="col-lg-2">
																	<input type="button" value="Add Mobile" class="addRow btn btn-primary btn-sm">
																</div>
															</div>
											</c:otherwise>
										</c:choose>
										
										
									</div>
									<div class="form-group" style="width: 95%;">
										<label>Email : <span class="mandatory-astric-color">*</span></label>
										<c:choose>
											<c:when test="${contactUsModel.emailModels.size() > 0 }">
													<c:forEach var="email" items="${contactUsModel.emailModels}" varStatus="loop">
													<c:choose>
														<c:when test="${loop.index == 0}">
															<div class="col-lg-12">
																<div class="col-lg-10">
																	<input type="text" value="${email.email }" name="emails" id="emails" class="form-control">
																</div>
																<div class="col-lg-2">
																	<input type="button" value="Add Email" class="addRow btn btn-primary btn-sm">
																	<br>
																</div>
															</div>
														</c:when>
														<c:otherwise>
															<div class="col-lg-12">
																<div class="col-lg-10">
																	<input type="text" value="${email.email }" name="emails" id="emails" class="form-control">
																</div>
																<div class="col-lg-2">
																	<input type="button" value="Delete Email" class="deleteRow btn btn-danger btn-sm">
																	<br>
																</div>
															</div>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:when>
											<c:otherwise>
											<div class="col-lg-12">
																<div class="col-lg-10">
																	<input type="text" value="" name="emails" id="emails" class="form-control">
																</div>
																<div class="col-lg-2">
																	<input type="button" value="Add Email" class="addRow btn btn-primary btn-sm">
																	<br>
																</div>
															</div>
											</c:otherwise>
										</c:choose>
										
										
									</div>
								
									<div class="form-group swapnashis">
										<label>Zip-Postal Code: 
										<!-- <span
											class="mandatory-astric-color">*</span> -->
											</label> <input type="text"
											name="zipcode" id="zipcode" value="${contactUsModel.zipcode}" class="form-control">
									</div>

									<div class="form-group">
										<div class="col-sm-12" style="padding: 0;">
											<div id="map-canvas"
												style="height: 200px; border: 1px solid #ccc; margin-bottom: 10px;"></div>
										</div>
									</div>

									<div class="form-group">

										<input type="hidden" name="latitude" id="latitude"
											class="form-control"> <input type="hidden"
											name="longitude" id="longitude" class="form-control">
									</div>

									<div class="box-footer">
										<button class="btn btn-primary submitForm" type="submit">Submit</button>
									</div>
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
	$('.addRow').click(
		function() {
			var addDiv = $(this).parent().parent();
			var htmlTemplate = '<div class="col-lg-12">'+addDiv.html().replace("Add ", "Delete ").replace("btn-primary", "btn-danger").replace("addRow", "deleteRow")+'</div>';
			htmlTemplate = htmlTemplate.replace(/type=\"text\" value=\".*?\"/, 'type=\"text\" value=\"\"')
			addDiv.parent().append(htmlTemplate);
		});
	
	
	$(document).on('click', '.deleteRow', function() {
		$(this).parent().parent().remove();
	});

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
		if (typeof place == "undefined") {
			setVendorMarker1();
			getVendorMarker();
		} else {
			console.log(autocomplete);
			//var place = autocomplete.getPlace();
			console
					.log(place.address_components[place.address_components.length - 1].long_name);
			// $("#zipcode").val(place.address_components[place.address_components.length-1].short_name);
			$("#latitude").val(place.geometry.location.lat());
			$("#longitude").val(place.geometry.location.lng());
			console.log(place.address_components)

			var latlngnew = new google.maps.LatLng(place.geometry.location
					.lat(), place.geometry.location.lng());
			var geocoder2 = new google.maps.Geocoder();

			geocoder2
					.geocode(
							{
								'latLng' : latlngnew
							},
							function(results, status) {
								if (status == google.maps.GeocoderStatus.OK) {
									//alert("1");
									$("#zipcode").val("");
									if (results[0]) {
										for (j = 0; j < results[0].address_components.length; j++) {
											if (results[0].address_components[j].types[0] == 'postal_code')
												$("#zipcode")
														.val(
																results[0].address_components[j].short_name);
										}
									}
									if ($("#zipcode").val() == "") {

										jQuery.growl
												.notice({
													message : "Please Provide the Correct Zipcode"
												});

									

									} else {
										jQuery.growl
												.notice({
													message : "Check Zipcode is Correct or not if not please Provide"
												});

										
									}

								} else {
									alert("Geocoder failed due to: " + status);
								}
							});

			setVendorMarker1();

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
	$(document)
			.ready(
					function() {

						$address = $("#address");
						/* autocomplete2 = new google.maps.places.Autocomplete($address.get(0), {}); */

						/* $("#address").blur(function() {
						    autopopulate();
						});
						 */
						$("#countryId").change(function() {

							var e1 = document.getElementById("countryId");
							var selectedOp = e1.options[e1.selectedIndex].text;
							var selectedCountry = selectedOp;

							setVendorMarkerCountryChanges(selectedCountry);

						});

						//..........Function to reflect in Map when Changes in the Country.............//

						function setVendorMarkerCountryChanges(selectedCountry) {

							var address = null;

							address = selectedCountry;

							var geocoder = new google.maps.Geocoder();
							geocoder
									.geocode(
											{
												'address' : address
											},
											function(results, status) {
												if (status == google.maps.GeocoderStatus.OK) {
													map
															.setCenter(results[0].geometry.location);
													if (marker)
														marker.setMap(null);
													marker = new google.maps.Marker(
															{
																map : map,
																position : results[0].geometry.location,
																draggable : true
															});
													getVendorMarkerCountryChanges();
													this.adas = google.maps.event
															.addListener(
																	marker,
																	'dragend',
																	getVendorMarkerCountryChanges);

												}
											});
							var myLatlng = new google.maps.LatLng(60.631522,
									-106.546875);

						}

						function getVendorMarkerCountryChanges() {
							$("#latitude").val(marker.getPosition().lat());
							$("#longitude").val(marker.getPosition().lng());

							$.ajax({
										url : 'addressThroughLatLong?latitude='
												+ marker.getPosition().lat()
												+ "&longitude="
												+ marker.getPosition().lng(),
										cache : true,
										type : "GET",
										success : function(result) {
										
											var data = result;
											$("#address").val(data);
											jQuery.growl
													.notice({
														message : "Please Check the address is proper or not"
													});

											var markup = "";

										},
										error : function(reponse) {
										}
									});

							var latlng = new google.maps.LatLng(marker
									.getPosition().lat(), marker.getPosition()
									.lng());
							var geocoder1 = new google.maps.Geocoder();

							geocoder1
									.geocode(
											{
												'latLng' : latlng
											},
											function(results, status) {
												if (status == google.maps.GeocoderStatus.OK) {
													//alert("2");
													$("#zipcode").val("");
													if (results[0]) {
														for (j = 0; j < results[0].address_components.length; j++) {
															if (results[0].address_components[j].types[0] == 'postal_code')
																$("#zipcode")
																		.val(
																				results[0].address_components[j].short_name);
														}
													}
													if ($("#zipcode").val() == "") {

														jQuery.growl
																.notice({
																	message : "Please Provide the Correct Zipcode"
																});

													} else {
														jQuery.growl
																.notice({
																	message : "Check Zipcode is Correct or not if not please Provide"
																});
													}

												} else {
													alert("Geocoder failed due to: "
															+ status);
												}
											});

						}

						//...... END ......


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

		var state = 'Dhaka';
		var address1 = 'Bangladesh';
		var address = null;
		address = address1 + ', ' + state;
		
		<c:if test="${contactUsModel.address != null}">
			address = '${contactUsModel.address}';
		</c:if>
		

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
					draggable : true

				});
				/* google.maps.event.trigger(marker, 'click',
					      
					    (function()                        //Adding Click Function
					    {
					        alert("naru");
					    })); */
				getVendorMarker();
				this.adas = google.maps.event.addListener(marker, 'dragend',
						getVendorMarker);
				// this.adas = google.maps.event.addListener(marker, "click", heldClick);

			}
		});
		/*  google.maps.event.addListener(marker, "click", function() {
		 	   alert("Naru");
		 	}); */

		var myLatlng = new google.maps.LatLng(60.631522, -106.546875);

	}

	/*  function heldClick(){
	 	alert("Naru");
	 } */

	// Duplicate method for change in address field
	function setVendorMarker1() {

		var state = 'Dhaka';
		var address1 = 'Bangladesh';
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
					draggable : true
				});
				//getVendorMarker();
				this.adas = google.maps.event.addListener(marker, 'dragend',
						getVendorMarker);

			}
		});
		var myLatlng = new google.maps.LatLng(60.631522, -106.546875);

	}
	 
	 var isFirst = true;

	function getVendorMarker() {
		$("#latitude").val(marker.getPosition().lat());
		$("#longitude").val(marker.getPosition().lng());

		$.ajax({
			url : 'addressThroughLatLong?latitude='
					+ marker.getPosition().lat() + "&longitude="
					+ marker.getPosition().lng(),
			cache : true,
			type : "GET",
			success : function(result) {
				var data = result;
				if (data != "")
					$("#address").val(data);
				var markup = "";

			},
			error : function(reponse) {
			}
		});

		var latlng = new google.maps.LatLng(marker.getPosition().lat(), marker
				.getPosition().lng());
		var geocoder1 = new google.maps.Geocoder();

		geocoder1
				.geocode(
						{
							'latLng' : latlng
						},
						function(results, status) {
							if (status == google.maps.GeocoderStatus.OK) {
								if(!isFirst){
									$("#zipcode").val("");
									isFirst = false;
								}
								if (results[0]) {
									for (j = 0; j < results[0].address_components.length; j++) {
										if (results[0].address_components[j].types[0] == 'postal_code')
												$("#zipcode")
												.val(
														results[0].address_components[j].short_name);
												
												
									}
								}
								
								if ($("#zipcode").val() == "") {

									jQuery.growl
											.notice({
												message : "Please Provide the Correct Zipcode"
											});

									

								} else {
									jQuery.growl
											.notice({
												message : "Check Zipcode is Correct or not if not please Provide"
											});

									
								}
								

							} else {
								alert("Geocoder failed due to: " + status);
							}
						});

	}
	/* google.maps.event.addDomListener(window, 'load', initialize); */

	window.onload = function() {
		initAutocomplete();
		initialize();
		setVendorMarker();
	}

	/* window.oncontextmenu = function () {
	   
	    jQuery.growl.error({
	        message :  "Please dont use right click button"
	    });
	   
	   
	       return false;
	    } */

	/* google.maps.event.addDomListener(window, 'load', initAutocomplete); */
</script>








<%@ include file="cms-footer.jsp"%>