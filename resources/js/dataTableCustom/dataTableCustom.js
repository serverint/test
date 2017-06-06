//var locationTableDataURL = "./list-location";

jQuery(document).ready(function() {

	/*
	 * $('#example') .DataTable( { responsive : true, "pagingType" :
	 * "full_numbers", language : { searchPlaceholder : "Search", "paginate" : {
	 * "previous" : "< Previous", "next" : "Next >", "first" : "< First",
	 * "last" : "Last >" } } });
	 */
	//var t = $('#dataTable').DataTable();
	var t = $('#dataTable').DataTable({
		"columnDefs" : [ 
		                
		{
			"searchable" : false,
			"orderable" : false,
			"visible" : true,
			"targets" : 0
		}, {
			"targets" : [ 1 ],
			"visible" : false
		} ],

		"order" : [ [ 1, 'desc' ] ]
	});

	t.on('order.dt search.dt', function() {
		t.column(0, {
			search : 'applied',
			order : 'applied',
			"visible" : false,
		}).nodes().each(function(cell, i) {
			cell.innerHTML = i + 1;
		});
	}).draw();

	/*
	 * var t1 = $('#dataTable1').DataTable({ "columnDefs" : [ { "searchable" :
	 * false, "orderable" : false, "visible": false, "targets" : 0 } ], "order" : [ [
	 * 1, 'asc' ] ] });
	 * 
	 * t1.on('order.dt search.dt', function() { t.column(0, { search :
	 * 'applied', order : 'applied', "visible": false,
	 * }).nodes().each(function(cell, i) { cell.innerHTML = i + 1; });
	 * }).draw();
	 */

});
