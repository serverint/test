/**
 * 
 */
jQuery(document)
		.ready(

				function($) {

					$("#date").datepicker({
						changeMonth : true,
						changeYear : true,
						dateFormat : "dd-mm-yy",
						maxDate : 0,
					});

					$(".select2").select2();

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

					$("#categoryId").change(
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
					
					$("#item-wise-sales-report").submit(function(e) {
						
						var flag = true;
						var date = $("#date").val();
						if (isBlank(date, " Date")) {
							flag = false;
						}
						
						if (flag) {
							return true;
						}

						return false;
					});
					
			

				});

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