<title>Peyala</title>
<!---------- header start -------->
<%@ include file="cms-header.jsp"%>
<!---------- header end -------->
<!---------- top navigation start -------->
<%@ include file="cms-navigation-header.jsp"%>
<!---------- top navigation end -------->

<!-- Sidebar -->
<!---------- left menu start -------->
<%@ include file="cms-menu.jsp"%>
<!---------- left menu end -------->
<!-- sidebar -->


<script>
 jQuery(document).ready(function($) {
	 
	    var is_safari = navigator.userAgent.indexOf("Safari") > -1;
	    var is_chrome = navigator.userAgent.indexOf('Chrome') > -1;
	    var is_explorer = navigator.userAgent.indexOf('MSIE') > -1;
	    var is_firefox = navigator.userAgent.indexOf('Firefox') > -1;
	    var is_safari = navigator.userAgent.indexOf("Safari") > -1;
	    var is_opera = navigator.userAgent.toLowerCase().indexOf("op") > -1;
	    if ((is_chrome)&&(is_safari)) {is_safari=false;}
	    if ((is_chrome)&&(is_opera)) {is_chrome=false;}
	 

if(!is_safari){
	 var getUrl = window.location;
	 
	 if (window.history && window.history.pushState) {
	     
		 window.history.pushState('', null, './dashboard');
	     
	     $(window).on('popstate', function() {
	        
	         document.location.href = getUrl;
	     });
	 }
} 

});

</script>

<script src="resources/js/common.js"></script>
<script src="resources/js/sidebar_menu.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Dashboard</h1>
				</div>
				
				<br>
				<br>
			<div class="page-content">
 <!-- -----------------Widget 1----------------------- -->
<!-- 				<div class="row">
			        /.col
			        <div class="col-md-4 col-sm-6 col-xs-12">
			          <div class="info-box">
			            <span class="info-box-icon bg-green"><i class="fa fa-flag-o"></i></span>
			
			            <div class="info-box-content">
			              <span class="info-box-text">Bookmarks</span>
			              <span class="info-box-number">410</span>
			              <a href="#" class="dashreadmore">Read More</a>
			            </div>
			            /.info-box-content
			          </div>
			          /.info-box
			        </div>
			        /.col
			        <div class="col-md-4 col-sm-6 col-xs-12">
			          <div class="info-box">
			            <span class="info-box-icon bg-yellow"><i class="fa fa-files-o"></i></span>
			
			            <div class="info-box-content">
			              <span class="info-box-text">Uploads</span>
			              <span class="info-box-number">13,648</span>
			              <a href="#" class="dashreadmore">Read More</a>
			            </div>
			            /.info-box-content
			          </div>
			          /.info-box
        	</div>
        	/.col
        	
		        <div class="col-md-4 col-sm-6 col-xs-12">
		          <div class="info-box">
		            <span class="info-box-icon bg-red"><i class="fa fa-star-o"></i></span>
		
		            <div class="info-box-content">
		              <span class="info-box-text">Likes</span>
		              <span class="info-box-number">93,139</span>
		              <a href="#" class="dashreadmore">Read More</a>
		            </div>
		            /.info-box-content
		          </div>
		          /.info-box
		        </div>
		        /.col
		      </div> -->
    <!-- -----------------Widget 2----------------------- -->
<!--       <div class="row">
      	<div class="col-md-4 col-sm-6 col-xs-12">
      		<div class="info-box bg-green">
            <span class="info-box-icon"><i class="fa fa-thumbs-o-up"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Likes</span>
              <span class="info-box-number">41,410</span>

              <div class="progress">
                <div style="width: 70%" class="progress-bar"></div>
              </div>
                  <a href="#" class="progressmore">Read More</a>
            </div>
            /.info-box-content
          </div>
      	</div>
      	<div class="col-md-4 col-sm-6 col-xs-12">
      		<div class="info-box bg-yellow">
            <span class="info-box-icon"><i class="fa fa-calendar"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Events</span>
              <span class="info-box-number">41,410</span>

              <div class="progress">
                <div style="width: 70%" class="progress-bar"></div>
              </div>
                  <a href="#" class="progressmore">Read More</a>
            </div>
            /.info-box-content
          </div>
      	</div>
      	<div class="col-md-4 col-sm-6 col-xs-12">
      		<div class="info-box bg-red">
            <span class="info-box-icon"><i class="fa fa-comments-o"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Comments</span>
              <span class="info-box-number">41,410</span>

              <div class="progress">
                <div style="width: 70%" class="progress-bar"></div>
              </div>
                  <a href="#" class="progressmore">Read More</a>
            </div>
            /.info-box-content
          </div>
      	</div>
      </div> -->
<!-- -----------------Widget 3----------------------- -->
    <div class="row">
      <!-- 	<div class="col-md-4 col-sm-6 col-xs-12">
	      	<div class="small-box bg-green">
	            <div class="inner">
	              <h3>67<sup style="font-size: 20px">%</sup> </h3>
	
	              <p>Cart</p>
	            </div>
	            <div class="icon">
	              <i class="fa fa-shopping-cart" aria-hidden="true"></i>
	            </div>
	            <a class="small-box-footer" href="#">
	              More info <i class="fa fa-arrow-circle-right"></i>
	            </a>
	          </div>      	
      	 </div> --> 
      	 <div class="col-md-4 col-sm-6 col-xs-12">
      		<div class="small-box bg-yellow">
            <div class="inner">
              <h2>User Details</h2>
              <p>Total User: ${totalUser}</p>
              <p>Total Active User: ${activeUser}</p>

            </div>
            <div class="icon">
              <i class="fa fa-user-plus" aria-hidden="true"></i>
            </div>
            <a class="small-box-footer" href="./list-user">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>      	
      	 </div>
      	  <div class="col-md-4 col-sm-6 col-xs-12">
      		<div class="small-box bg-yellow">
            <div class="inner">
              <h2>Branch Details</h2>
              <p>Total Branch: ${totalBranch}</p>
              <p>Total Active Branch: ${activeBranch}</p>
            </div>
            <div class="icon">
              <i class="fa fa-map-marker" aria-hidden="true"></i>
            </div>
            <a class="small-box-footer" href="./list-branch">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>      	
      	 </div>
      	 <div class="col-md-4 col-sm-6 col-xs-12">
	      	<div class="small-box bg-yellow">
	            <div class="inner">
	              <h2>Order Details<!-- <sup style="font-size: 20px">%</sup> --></h2>
	
	              <p>Delivered Orders : ${deliveredOrder}</p>
	              <p>Confirmed Orders : ${confirmedOrder}</p>
	              <p>Payment Orders   : ${paymentOrder}</p>
	            </div>
	            <div class="icon">
	              <i class="fa fa-phone-square" aria-hidden="true"></i>
	            </div>
	            <a class="small-box-footer" href="${baseUrl}/list-order">
	              More info <i class="fa fa-arrow-circle-right"></i>
	            </a>
	          </div>      	
      	 </div>
      	 
      	 
    </div>
    
    <br>
    
    <!-- -----------------Widget 3----------------------- -->
    <div class="row">
          	 <div class="col-md-4 col-sm-6 col-xs-12">
	      		<div class="small-box bg-yellow">
	            <div class="inner">
	              <h2>Active Food</h2>	
	              <p>Food Item Count : ${activeFoodCount} </p>
	              <p>Combo Item Count : ${activeCombo} </p>	             
	            </div>
	            <div class="icon">
	              <i class="fa fa-foursquare" aria-hidden="true"></i>
	            </div>
	            <a class="small-box-footer" href="${baseUrl}/list-food-item">
	              More info <i class="fa fa-arrow-circle-right"></i>
	            </a>
	          </div>      	
      	 </div>      	 
      	   <div class="col-md-4 col-sm-6 col-xs-12">
	      		<div class="small-box bg-yellow">
	            <div class="inner">
	              <h2>Today's Roaster Details</h2>	
	              <p>Food Item Count : ${activeRoasterFood} </p>
	              <p>Combo Item Count : ${activeRoasterCombo} </p>	           
	            </div>
	            <div class="icon">
	              <i class="fa fa-registered" aria-hidden="true"></i>
	            </div>
	            <a class="small-box-footer" href="${baseUrl}/list-roaster">
	              More info <i class="fa fa-arrow-circle-right"></i>
	            </a>
	          </div>      	
      	 </div>
      	 
      	 <div class="col-md-4 col-sm-6 col-xs-12">
      		<div class="small-box bg-yellow">
            <div class="inner">
              <h2>Banner Details</h2>
              <p>Total Banner: ${totalBanner}</p>
              <p>Total Active Banner: ${activeBanner}</p>

            </div>
            <div class="icon">
              <i class="fa fa-shopping-cart" aria-hidden="true"></i>
            </div>
            <a class="small-box-footer" href="./list-banner">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>      	
      	 </div>
    </div>
     
     <!-- -----------------Widget 4----------------------- -->
				<!--     <div class="row">
				      	<div class="col-md-4 col-sm-6 col-xs-12">
				      		<div class="box box-widget widget-user-2 no-padding">
				            Add the bg color to the header using any of the bg-* classes
				            <div class="widget-user-header bg-yellow">
				              <div class="widget-user-image">
				                <img alt="User Avatar" src="resources/images/profile.jpg" class="img-circle">
				              </div>
				              /.widget-user-image
				              <h3 class="widget-user-username">Nadia Carmichael</h3>
				              <h5 class="widget-user-desc">Lead Developer</h5>
				            </div>
				            <div class="box-footer no-padding">
				              <ul class="nav nav-stacked">
				                <li><a href="#">Projects <span class="pull-right badge bg-blue">31</span></a></li>
				                <li><a href="#">Completed Projects <span class="pull-right badge bg-green">12</span></a></li>
				                <li><a href="#">Followers <span class="pull-right badge bg-red">842</span></a></li>
				              </ul>
				            </div>
				          </div>
				    	</div>
				    	<div class="col-md-4 col-sm-6 col-xs-12">
				      		<div class="box box-widget widget-user  no-padding">
				            Add the bg color to the header using any of the bg-* classes
				            <div class="widget-user-header bg-aqua-active">
				              <h3 class="widget-user-username">Alexander Pierce</h3>
				              <h5 class="widget-user-desc">Founder &amp; CEO</h5>
				            </div>
				            <div class="widget-user-image">
				              <img alt="User Avatar" src="resources/images/profile.jpg" class="img-circle">
				            </div>
				            <div class="box-footer">
				              <div class="row">
				                <div class="col-sm-4 border-right">
				                  <div class="description-block">
				                    <h5 class="description-header">3,200</h5>
				                    <span class="description-text">SALES</span>
				                  </div>
				                  /.description-block
				                </div>
				                /.col
				                <div class="col-sm-4 border-right">
				                  <div class="description-block">
				                    <h5 class="description-header">13,000</h5>
				                    <span class="description-text">FOLLOWERS</span>
				                  </div>
				                  /.description-block
				                </div>
				                /.col
				                <div class="col-sm-4">
				                  <div class="description-block">
				                    <h5 class="description-header">35</h5>
				                    <span class="description-text">PRODUCTS</span>
				                  </div>
				                  /.description-block
				                </div>
				                /.col
				              </div>
				              /.row
				            </div>
				          </div>
				      		
				    	</div>
				    	<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="box box-widget">
				            <div class="box-header with-border">
				              <div class="user-block">
				                <img alt="User Image" src="resources/images/profile.jpg" class="img-circle">
				                <span class="username"><a href="#">Jonathan Burke Jr.</a></span>
				                <span class="description">Shared publicly - 7:30 PM Today</span>
				              </div>
				              /.user-block
				              <div class="box-tools">
				                <button data-widget="remove" class="btn btn-box-tool" type="button"><i class="fa fa-times"></i></button>
				              </div>
				              /.box-tools
				            </div>
				            /.box-header
				            <div class="box-body">
				              post text
				              <p>Far far away, behind the word mountains, far from the
				                countries Vokalia and Consonantia, there live the blind
				                texts.the word mountainsthe word mountains.</p>
				            /.box-footer
				            <div class="box-footer">
				              <form method="post" action="#">
				                <div class="img-push">
				                  <input type="text" placeholder="Press enter to post comment" class="form-control input-sm">
				                </div>
				              </form>
				            </div>
				            /.box-footer
				          </div>      		
				
				
				    	</div>
					</div>  	
				</div> -->
			</div>
		</div>
	</div>
</div>
<%@ include file="cms-footer.jsp"%>