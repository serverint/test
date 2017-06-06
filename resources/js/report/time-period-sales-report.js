/**
 * 
 */
jQuery(document)
		.ready(

				function($) {

					var firstDay;
					var lastDay;
					
					$(".select2").select2();

					$("#startDate").datepicker({
						changeMonth : true,
						changeYear : true,
						dateFormat : "dd-mm-yy",
						maxDate : 0,
					});

					$("#endDate").datepicker({
						changeMonth : true,
						changeYear : true,
						dateFormat : "dd-mm-yy",
						maxDate : 0,
					});

					var weeklyDate;

					$('#monthNYear')
							.datepicker(
									{
										changeMonth : true,
										changeYear : true,
										showButtonPanel : true,
										dateFormat : 'MM yy',
										maxDate : 0,
										onClose : function(dateText, inst) {
											$(this).datepicker(
													'setDate',
													new Date(inst.selectedYear,
															inst.selectedMonth,
															1));
											weeklyDate = getWeeksInMonth(
													inst.selectedYear,
													inst.selectedMonth);
											$("#div-weekOption").show();
											$("#weekOption").html("");
											$("#weekOption")
													.html(
															'<option value="">Select</option>');
											$
													.each(
															weeklyDate,
															function(key, value) {

																$("#weekOption")
																		.append(
																				'<option value="'
																						+ dateFormat(
																								value.weekStart,
																								"dd-mm-yy")
																						+ '/'
																						+ dateFormat(
																								value.weekEnd,
																								"dd-mm-yy")
																						+ '">'
																						+ value.weekStart
																						+ ' - '
																						+ value.weekEnd
																						+ '( Week '
																						+ (key + 1)
																						+ ')'
																						+ '</option>');
															});
										}
									});

					$('#month').datepicker(
							{
								changeMonth : true,
								changeYear : true,
								showButtonPanel : true,
								dateFormat : 'MM yy',
								onClose : function(dateText, inst) {
									$(this).datepicker(
											'setDate',
											new Date(inst.selectedYear,
													inst.selectedMonth, 1));
									firstDay = moment(new Date(inst.selectedYear, inst.selectedMonth , 1),'DD-MM-YYYY').format('DD-MM-YYYY');
									lastDay = moment(new Date(inst.selectedYear, inst.selectedMonth +1, 0),'DD-MM-YYYY').format('DD-MM-YYYY');
									$("#startDate").val(firstDay);
									$("#endDate").val(lastDay);
								}
							});

					$('#quarterYear').datepicker(
							{
								changeYear : true,
								showButtonPanel : true,
								dateFormat : 'yy',
								onClose : function(dateText, inst) {
									$(this).datepicker('setDate',
											new Date(inst.selectedYear, 1));
								}
							});

					$('#year').datepicker(
							{
								changeYear : true,
								showButtonPanel : true,
								dateFormat : 'yy',
								onClose : function(dateText, inst) {
									$(this).datepicker('setDate',
											new Date(inst.selectedYear, 1));
								}
							});

					$("#weekOption").change(function() {
						var weekOption = $("#weekOption").val();
						var arr = weekOption.split("/");
						var startDate = arr[0];
						var endDate = arr[1];

						$("#startDate").val(startDate);
						$("#endDate").val(endDate);

					});

					var isFirstbranch = true;
					var isFirstForcategory = true;

					$("#branchId").change(
							function() {

								var arr = $(this).val();

								if (isFirstbranch
										&& jQuery.inArray("ALL", arr) !== -1) {
									$(this).children("option:first-child")
											.removeAttr("selected");
									isFirstbranch = false;
								} else {
									if (jQuery.inArray("ALL", arr) !== -1) {
										$(this).children(
												"option:not(:first-child)")
												.removeAttr("selected");
										isFirstbranch = true;
									} else {
										$(this).children("option:first-child")
												.removeAttr("selected");
										isFirstbranch = false;
									}
								}

								$(this).select2("destroy");

								try {
									$(this).select2();
								} catch (e) {
								}
							});
					
					

					/*$("#categoryId").change(
							function() {
								var arr = $(this).val();

								if (isFirstForcategory
										&& jQuery.inArray("ALL", arr) !== -1) {
									$(this).children("option:first-child")
											.removeAttr("selected");
									isFirstForcategory = false;
								} else {
									if (jQuery.inArray("ALL", arr) !== -1) {
										$(this).children(
												"option:not(:first-child)")
												.removeAttr("selected");
										isFirstForcategory = true;
									} else {
										$(this).children("option:first-child")
												.removeAttr("selected");
										isFirstForcategory = false;
									}
								}

								$(this).select2("destroy");

								try {
									$(this).select2();
								} catch (e) {
								}

							});
*/
					
	//================================================================================================================================				
					 $("#categoryId").change(function(e){
						 
						 var categoryId = $('#categoryId').val();
						 console.log(categoryId);
						 
						 if(categoryId!=null){
							 
							 var URL = 'get-food-item-by-category';
							 var foodOptions = '<option value="">Select</option>';
							 jQuery.ajax({
									url  	 : URL,
									type 	 : 'POST',
									data : {
										categoryId : categoryId
									},
									success	 : function(data){
										console.log(data);
										
										if(data.length > 0 ){
											$.each(data, function(key, val){
												
												foodOptions += '<option value="' + val.id + '">' 	+ val.foodItem + '</option>';
											});
										}	
										
										$("#food-combo-item").html(foodOptions);
										$("#food-combo-item").select2();
										
									},
									error 	 : function(request, status, error){
										
										$("#food-combo-item").html(foodOptions);
									}
								});	
							 
						 }else{
							 $("#food-combo-item").html("");
						 }
						 
					 });
					
	//================================================================================================================================				
					
					/*$("#month").change(function() {

						$("#startDate").val(firstDay);
						$("#endDate").val(lastDay);

					});*/

					$("#quarterly").change(function() {
						var quarterly = $("#quarterly").val();
						var quarterYear = $("#quarterYear").val();
						var startDate;
						var endDate;

						if (quarterly == 'QUARTER1') {

							startDate = '01-04-' + quarterYear;
							endDate = '30-06-' + quarterYear;
						} else if (quarterly == 'QUARTER2') {

							startDate = '01-07-' + quarterYear;
							endDate = '30-09-' + quarterYear;
						} else if (quarterly == 'QUARTER3') {

							startDate = '01-10-' + quarterYear;
							endDate = '31-12-' + quarterYear;
						} else if (quarterly == 'QUARTER4') {

							startDate = '01-01-' + quarterYear;
							endDate = '31-03-' + quarterYear;
						} else {
							alert("Please Select A Quarter!!!!");
						}

						$("#startDate").val(startDate);
						$("#endDate").val(endDate);
						// alert(startDate + '-' + endDate);

					});

					$("#year").change(function() {

						var year = $("#year").val();

						var startDate = '01-01-' + year;
						var endDate = '31-12-' + year;

						$("#startDate").val(startDate);
						$("#endDate").val(endDate);

					});
					

					$("#frequencyOption").change(function(e) {

						var frequencyOption = $("#frequencyOption").val();
						$("#startDate").val('');
						$("#endDate").val('');

						if (frequencyOption == 'HOURLY') {
							$("#div-startDate").show();
							$("#div-weekOption").hide();
							$("#div-Year").hide();
							$("#div-Quarter").hide();
							$("#div-Quarterly").hide();
							$("#div-month").hide();
							$("#div-monthNYear").hide();
							$("#div-endDate").hide();

						} else if (frequencyOption == 'DAILY') {
							$("#div-startDate").show();
							$("#div-endDate").show();
							$("#div-weekOption").hide();
							$("#div-Year").hide();
							$("#div-Quarter").hide();
							$("#div-Quarterly").hide();
							$("#div-month").hide();
							$("#div-monthNYear").hide();

						} else if (frequencyOption == 'WEEKLY') {

							$("#div-monthNYear").show();
							$("#div-startDate").hide();
							$("#div-Year").hide();
							$("#div-Quarter").hide();
							$("#div-Quarterly").hide();
							$("#div-month").hide();
							$("#div-endDate").hide();

						} else if (frequencyOption == 'MONTHLY') {

							$("#div-month").show();
							$("#div-weekOption").hide();
							$("#div-startDate").hide();
							$("#div-Year").hide();
							$("#div-Quarter").hide();
							$("#div-Quarterly").hide();
							$("#div-endDate").hide();
							$("#div-monthNYear").hide();

						} else if (frequencyOption == 'QUARTERLY') {

							$("#div-Quarter").show();
							$("#div-Quarterly").show();
							$("#div-weekOption").hide();
							$("#div-startDate").hide();
							$("#div-Year").hide();
							$("#div-month").hide();
							$("#div-endDate").hide();
							$("#div-monthNYear").hide();

						} else if (frequencyOption == 'YEARLY') {

							$("#div-Year").show();
							$("#div-weekOption").hide();
							$("#div-startDate").hide();
							$("#div-Quarter").hide();
							$("#div-Quarterly").hide();
							$("#div-endDate").hide();
							$("#div-monthNYear").hide();
							$("#div-month").hide();

						} else {
							$("#div-startDate").hide();
							$("#div-weekOption").hide();
							$("#div-Year").hide();
							$("#div-Quarter").hide();
							$("#div-Quarterly").hide();
							$("#div-month").hide();
							$("#div-monthNYear").hide();
							$("#div-endDate").hide();
						}
					});

					/**
					 * call the event on submit time period sales report
					 */
					$("#time-period-sales-report")
							.submit(
									function(e) {
										var flag = true;

										var frequencyOption = $(
												"#frequencyOption").val();
										var startDate = $("#startDate").val();
										var endDate = $("#endDate").val();
										var monthNYear = $("#monthNYear").val();
										var weekOption = $("#weekOption").val();
										var month = $("#month").val();
										var quarterYear = $("#quarterYear")
												.val();
										var quarterly = $("#quarterly").val();
										var year = $("#year").val();

										var branchId = [];
										// var sizeIdName = [];
										var categoryId = [];
										var count = 0;
										var branchId1 = $("#branchId1").val();
										
										var check = $("#check").val();
										if(check == 'ADMIN'){
											if(branchId1.length != 0)
												branchId = branchId1;
										}
										
										
										jQuery('#branchId :selected').each(
												function(i, selectedElement) {
													branchId[i] = $(
															selectedElement)
															.val();
													// sizeIdName[i] =
													// $(selectedElement).text();
												});
										
										jQuery('#categoryId :selected').each(
												function(i, selectedElement) {
													categoryId[i] = $(
															selectedElement)
															.val();
												});

										if (isBlank(frequencyOption,
												"Frequency Option")) {
											flag = false;
										}

										if (frequencyOption == 'HOURLY') {// if
											// hourly
											// selected,
											// check
											// the
											// Start
											// date
											if (isBlank(startDate, "Start Date")) {
												flag = false;
											}
										}

										if (frequencyOption == 'DAILY') {// if
											// daily
											// selected,
											// check
											// the
											// Start
											// date
											// and
											// end
											// date
											if (isBlank(startDate, "Start Date")) {
												flag = false;
											}

											if (isBlank(endDate, "End Date")) {
												flag = false;
											}
											
											if(endDate != ""){
												if (endDate < startDate) {
													massageDisplay("End Date can not be lesser than Start Date");
													flag = false;
												}
											}
										}

										if (frequencyOption == 'WEEKLY') {// if
											// WEEKLY
											// selected,
											// check
											// week

											if (isBlank(monthNYear,
													"Month and Year")) {
												flag = false;
											} else {
												if (isBlank(weekOption, "Week")) {
													flag = false;
												}
											}
										}

										if (frequencyOption == 'MONTHLY') {// if
											// month
											// selected,
											// check
											// month
											if (isBlank(month, "Month and Year")) {
												flag = false;
											}
										}

										if (frequencyOption == 'QUARTERLY') {// if
											// month
											// selected,
											// check
											// year
											// and
											// Quarter
											if (isBlank(quarterYear, "Year")) {
												flag = false;
											}

											if (isBlank(quarterly, "Quarter")) {
												flag = false;
											}
										}

										if (frequencyOption == 'YEARLY') {// if
											// year
											// selected,
											// check
											// year
											if (isBlank(year, "Year")) {
												flag = false;
											}
										}
										if (branchId.length == 0) {
											flag = false;
											massageDisplay("Branch can not be blank");
										}

										if (categoryId.length == 0) {
											flag = false;
											massageDisplay("Category can not be blank");
										}

										if (flag) {
											return true;
										}

										return false;
									});

				});

function getWeeksInMonth(year, month) {

	var monthStart = moment().year(year).month(month).date(1);
	var monthEnd = moment().year(year).month(month).endOf('month');
	var numDaysInMonth = moment().year(year).month(month).endOf('month').date();

	// calculate weeks in given month
	var weeks = Math.ceil((numDaysInMonth + monthStart.day()) / 7);
	var weekRange = [];
	var weekStart = moment().year(year).month(month).date(1);
	var i = 0;

	while (i < weeks) {
		var weekEnd = moment(weekStart);

		if (weekEnd.endOf('week').date() <= numDaysInMonth
				&& weekEnd.month() == month) {
			weekEnd = weekEnd.endOf('week').format('LL');
		} else {
			weekEnd = moment(monthEnd);
			weekEnd = weekEnd.format('LL')
		}

		weekRange.push({
			'weekStart' : weekStart.format('LL'),
			'weekEnd' : weekEnd
		});

		weekStart = weekStart.weekday(7);
		i++;
	}

	return weekRange;
}

function f() {
	var date = new Date();
	var firstDay = new Date(date.getFullYear(), date.getMonth() - 1, 1);
	var lastDay = new Date(date.getFullYear(), date.getMonth(), 0);
	alert(firstDay + "===" + lastDay);
}

function isBlank(string, field) {
	if (string == null || string == '') {
		jQuery.growl.error({
			message : field + " can not be blank"
		});

		return true;
	}
	return false;
}

function massageDisplay(massage) {
	jQuery.growl.error({
		message : massage
	});
	return true;
}