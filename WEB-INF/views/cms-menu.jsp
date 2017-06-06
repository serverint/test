<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<div id="sidebar-wrapper">
	<ul class="sidebar-nav nav-stacked menu" id="menu">

		<%-- <!-- Dashboard Menu -->
		<c:if test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
		 <li><a href="./list-order"> <i class="fa fa-dashboard"></i>Dashboard
		</a></li>
		</c:if> --%>
		
		
		
		<c:if test="${sessionScope.adminUserModel.adminType == 'SUPER_ADMIN'}">
				
			<li><a href="./dashboard"> <i class="fa fa-home"></i>Dashboard
			</a></li>
			
			<!-- User Management Menu -->
			
				<li><a href="#"> <i class="fa fa-user-plus" aria-hidden="true"></i>App User Management
			</a>
				<ul>
					<li><a href="./list-user"><i class="fa fa-fighter-jet" aria-hidden="true"></i>List User</a></li>
				</ul></li>
			
			
			<li><a href="#"> <i class="fa fa-map-marker" aria-hidden="true"></i>Branch
					Management
			</a>
				<ul>
				    <li><a href="./add-country"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Add Country </a></li>
					<li><a href="./list-country"><i class="fa fa-fighter-jet" aria-hidden="true"></i>List Country</a></li>
					<li><a href="./add-branch"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Add Branch</a></li>
					<li><a href="./list-branch"><i class="fa fa-fighter-jet" aria-hidden="true"></i>List Branch</a></li>
					<li><a href="./add-admin-user"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Add Branch User</a></li>
					<li><a href="./list-admin-user"><i class="fa fa-fighter-jet" aria-hidden="true"></i>List Branch User</a></li>
				</ul></li>

			

			<!-- Minimum Order Amount Menu -->
			
			<li><a href="#"> <i class="fa fa-wrench"
					aria-hidden="true"></i>Setting Management
			</a>
				<ul>
					<li><a href="./peyala-cash"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Peyala Cash</a></li>
					<li><a href="./add-orderprice"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Minimum Order Amount </a></li>
				</ul></li>

			
			<li><a href="#"> <i class="fa fa-medium" aria-hidden="true"></i>
					Master Data Management
			</a>
				<ul>
				   <li><a href="list-category"><i class="fa fa-fighter-jet" aria-hidden="true"></i>List Category</a></li>
				    <li><a href="./add-type"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Add Type</a></li>
					<li><a href="./list-type"><i class="fa fa-fighter-jet" aria-hidden="true"></i>List Type</a></li>
					<li><a href="./add-size"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Add Food Size</a></li>
					<li><a href="./list-size"><i class="fa fa-fighter-jet" aria-hidden="true"></i>List Food Size</a></li>
					<li><a href="./add-addon"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Add Addon</a></li>
					<li><a href="./list-addon"><i class="fa fa-fighter-jet" aria-hidden="true"></i>List Addon</a></li>
					<li><a href="./add-tax"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Add Tax</a></li>
					<li><a href="./list-tax"><i class="fa fa-fighter-jet" aria-hidden="true"></i>List Tax</a></li>
				</ul></li>
			
			

			<!-- Food Item Management Menu  <i class="fa fa-product-hunt"></i>-->
			
			<li><a href="#"> <i class="fa fa-foursquare" aria-hidden="true"></i>Food
					Item Management
			</a>
				<ul>
					<li><a href="./add-food-item"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Add Food Item</a></li>
					<li><a href="./list-food-item"><i class="fa fa-fighter-jet" aria-hidden="true"></i>List Food Item</a></li>
				</ul></li>
			
			<!-- Combo Item Management Menu fa-copyright-->
			
			<li><a href="#"> <i class="fa fa-contao"
					aria-hidden="true"></i>Combo Item Management
			</a>
				<ul>
					<li><a href="./add-combo-item"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Add Combo Item</a></li>
					<li><a href="./list-combo-item"><i class="fa fa-fighter-jet" aria-hidden="true"></i>List Combo Item</a></li>
				</ul></li>
			

			<!-- Roaster Management Menu -->
			
			<li><a href="#"> <i class="fa fa-registered"
					aria-hidden="true"></i>Roster Management
			</a>
				<ul>
					<li><a href="./add-roaster"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Add Roster</a></li>
					<li><a href="./list-roaster"><i class="fa fa-fighter-jet" aria-hidden="true"></i>List Roster</a></li>
				</ul></li>
			
			<!-- Notification Management Menu -->
			
			<li><a href="#"> <i class="fa fa-picture-o"
					aria-hidden="true"></i>Notification Management
			</a>
				<ul>
					<li><a href="./add-notification"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Add Notification</a></li>
					<li><a href="./list-notification"><i class="fa fa-fighter-jet" aria-hidden="true"></i>List Notification</a></li>
				</ul></li>
			
			<li><a href="#"> <i class="fa fa-shopping-cart"
					aria-hidden="true"></i>Content Management
			</a>
				<ul>
					<li><a href="./add-faq"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Add Faq</a></li>
					<li><a href="./list-faq"><i class="fa fa-fighter-jet" aria-hidden="true"></i>List Faq</a></li>
				    <li><a href="./add-banner"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Add Banner</a></li>
					<li><a href="./list-banner"><i class="fa fa-fighter-jet" aria-hidden="true"></i>List Banner</a></li>
					<li><a href="./add-happening"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Add Happening</a></li>
					<li><a href="./list-happening"><i class="fa fa-fighter-jet" aria-hidden="true"></i>List Happening</a></li>
					<li><a href="./add-aboutus"><i class="fa fa-fighter-jet" aria-hidden="true"></i>About-Us </a></li>
					<li><a href="./add-contactus"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Contact-Us </a></li>
				</ul></li>
				
				<!-- Delivery Management Menu -->
			<!-- <li><a href="#"> <i class="fa fa-truck" aria-hidden="true"></i>Delivery Management
			</a>
				<ul>
					<li><a href="./add-deliveryperson"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Add Delivery Person</a></li>
					<li><a href="./list-deliveryperson"><i class="fa fa-fighter-jet" aria-hidden="true"></i>List Delivery Person</a></li>
					<li><a href="./add-distance"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Add Distance</a></li>
					<li><a href="./list-distance"><i class="fa fa-fighter-jet" aria-hidden="true"></i>List Distance</a></li>
				</ul></li> -->
		
		
		</c:if>

		<!-- Order Management Menu -->
		
		<li><a href="#"> <i class="fa fa-phone-square"
				aria-hidden="true"></i>Order Management
		</a>
			<ul>
				<li><a href="./list-order"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Today's Order</a></li>
				<li><a href="./list-old-order"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Old List Order</a></li>
			</ul></li>
	
	<c:if test="${sessionScope.adminUserModel.adminType == 'ADMIN'}">
		
		<li><a href="#"> <i class="fa fa-shopping-cart"
					aria-hidden="true"></i>Content Management
			</a>
				<ul>
					<li><a href="./add-happening"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Add Happening</a></li>
					<li><a href="./list-happening"><i class="fa fa-fighter-jet" aria-hidden="true"></i>List Happening</a></li>
				</ul></li>
			
		</c:if>

			<li>
				<a href="#"> 
					<i class="fa fa-bar-chart"></i>Report Management
				</a>
				<ul>
					<li><a href="./time-period-sales-report"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Time period Sales Report</a></li>
					<li><a href="./profile-wise-sales-report"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Profile Wise Sales Report</a></li> 
					<li><a href="./sales-summary-report"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Sales Summary Report</a></li>
					<li><a href="./item-wise-sales-report"><i class="fa fa-fighter-jet" aria-hidden="true"></i>Item Wise Sales Report</a></li>
					
				</ul>
			</li>
			
			



	</ul>
</div>

<style>
.seletedali{
background-color:#FF7F50 !important;
}
.supratim{
display: block !important;
}
</style>
<script type="text/javascript">
  $(document).ready(function(){
	 // alert(window.location.pathname);
	  var pathNameArr = window.location.pathname.replace(/edit|view/, "list").replace("-details", "").split("/");
	  //alert(pathNameArr);
	  var path = pathNameArr[pathNameArr.length -1];
	 // alert(path)
	  /* if(path.includes("edit")){
		  alert("Naru");
		  var editpatharr = path.split("-");
		  var editpathval = editpatharr[editpatharr.length -1];
		  var concatval = "list-"+editpathval+"";
		  var editselectedTag = $("a[href$='"+ concatval +"']");
		  editselectedTag.closest("ul").parent().addClass("current");
		  editselectedTag.closest("li").addClass("seletedali");
		  editselectedTag.closest("ul").addClass("supratim");
	  } */
	  
	  
	  var atag = $("a[href$='"+ path +"']");
	  //current
	 if(path.indexOf("dashboard") != -1){
		 atag.closest("li").addClass("current"); 
	 }
	 else{
		 
		 atag.closest("li").addClass("seletedali");
		  setTimeout(function(){
			  atag.closest("ul").parent().find("a").click();
		  }, 150, atag);
	 }
	  
	  
  });
</script>
