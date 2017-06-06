<%@ page language="java" contentType="text/html;charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
    
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Peyala</title>
   <!--  <link rel="stylesheet" href="resources/css/style.css" /> -->
    
    
	
    <!-- Bootstrap -->
    <link href="resources/webmeterials/css/bootstrap.min.css" rel="stylesheet">
    <!-- page Font Css Style -->
    <link href="resources/webmeterials/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="resources/webmeterials/css/font-awesome.css" rel="stylesheet" type="text/css">
    <!-- page Css Style -->
    <link href="resources/webmeterials/css/style.css" rel="stylesheet" type="text/css">
    <link href="resources/webmeterials/css/responsive.css" rel="stylesheet" type="text/css">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
   <!--  <script src="js/bootstrap.min.js"></script> -->
    <script src="resources/webmeterials/js/bootstrap.min.js"></script>
    
    
    
    <script>
    	/* ========================================================================
 * Bootstrap: carousel.js v3.0.0
 * http://twbs.github.com/bootstrap/javascript.html#carousel
 * ========================================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ======================================================================== */


+function ($) { "use strict";

  // CAROUSEL CLASS DEFINITION
  // =========================

  var Carousel = function (element, options) {
    this.$element    = $(element)
    this.$indicators = this.$element.find('.carousel-indicators')
    this.options     = options
    this.paused      =
    this.sliding     =
    this.interval    =
    this.$active     =
    this.$items      = null

    this.options.pause == 'hover' && this.$element
      .on('mouseenter', $.proxy(this.pause, this))
      .on('mouseleave', $.proxy(this.cycle, this))
  }

  Carousel.DEFAULTS = {
    interval: 5000
  , pause: 'hover'
  , wrap: true
  }

  Carousel.prototype.cycle =  function (e) {
    e || (this.paused = false)

    this.interval && clearInterval(this.interval)

    this.options.interval
      && !this.paused
      && (this.interval = setInterval($.proxy(this.next, this), this.options.interval))

    return this
  }

  Carousel.prototype.getActiveIndex = function () {
    this.$active = this.$element.find('.item.active')
    this.$items  = this.$active.parent().children()

    return this.$items.index(this.$active)
  }

  Carousel.prototype.to = function (pos) {
    var that        = this
    var activeIndex = this.getActiveIndex()

    if (pos > (this.$items.length - 1) || pos < 0) return

    if (this.sliding)       return this.$element.one('slid', function () { that.to(pos) })
    if (activeIndex == pos) return this.pause().cycle()

    return this.slide(pos > activeIndex ? 'next' : 'prev', $(this.$items[pos]))
  }

  Carousel.prototype.pause = function (e) {
    e || (this.paused = true)

    if (this.$element.find('.next, .prev').length && $.support.transition.end) {
      this.$element.trigger($.support.transition.end)
      this.cycle(true)
    }

    this.interval = clearInterval(this.interval)

    return this
  }

  Carousel.prototype.next = function () {
    if (this.sliding) return
    return this.slide('next')
  }

  Carousel.prototype.prev = function () {
    if (this.sliding) return
    return this.slide('prev')
  }

  Carousel.prototype.slide = function (type, next) {
    var $active   = this.$element.find('.item.active')
    var $next     = next || $active[type]()
    var isCycling = this.interval
    var direction = type == 'next' ? 'left' : 'right'
    var fallback  = type == 'next' ? 'first' : 'last'
    var that      = this
    
    if (!$next.length) {
      if (!this.options.wrap) return
      $next = this.$element.find('.item')[fallback]()
    }

    this.sliding = true

    isCycling && this.pause()

    var e = $.Event('slide.bs.carousel', { relatedTarget: $next[0], direction: direction })

    if ($next.hasClass('active')) return

    if (this.$indicators.length) {
      this.$indicators.find('.active').removeClass('active')
      this.$element.one('slid', function () {
        var $nextIndicator = $(that.$indicators.children()[that.getActiveIndex()])
        $nextIndicator && $nextIndicator.addClass('active')
      })
    }

    if ($.support.transition && this.$element.hasClass('slide')) {
      this.$element.trigger(e)
      if (e.isDefaultPrevented()) return
      $next.addClass(type)
      $next[0].offsetWidth // force reflow
      $active.addClass(direction)
      $next.addClass(direction)
      $active
        .one($.support.transition.end, function () {
          $next.removeClass([type, direction].join(' ')).addClass('active')
          $active.removeClass(['active', direction].join(' '))
          that.sliding = false
          setTimeout(function () { that.$element.trigger('slid') }, 0)
        })
        .emulateTransitionEnd(600)
    } else if(this.$element.hasClass('slide')) {
        this.$element.trigger(e)
        if (e.isDefaultPrevented()) return
        $active.animate({left: (direction == 'right' ? '100%' : '-100%')}, 600, function(){
            $active.removeClass('active')
            that.sliding = false
            setTimeout(function () { that.$element.trigger('slid') }, 0)
        })
        $next.addClass(type).css({left: (direction == 'right' ? '-100%' : '100%')}).animate({left: 0}, 600,  function(){
            $next.removeClass(type).addClass('active')
        })
    } else {
      this.$element.trigger(e)
      if (e.isDefaultPrevented()) return
      $active.removeClass('active')
      $next.addClass('active')
      this.sliding = false
      this.$element.trigger('slid')
    }

    isCycling && this.cycle()

    return this
  }


  // CAROUSEL PLUGIN DEFINITION
  // ==========================

  var old = $.fn.carousel

  $.fn.carousel = function (option) {
    return this.each(function () {
      var $this   = $(this)
      var data    = $this.data('bs.carousel')
      var options = $.extend({}, Carousel.DEFAULTS, $this.data(), typeof option == 'object' && option)
      var action  = typeof option == 'string' ? option : options.slide

      if (!data) $this.data('bs.carousel', (data = new Carousel(this, options)))
      if (typeof option == 'number') data.to(option)
      else if (action) data[action]()
      else if (options.interval) data.pause().cycle()
    })
  }

  $.fn.carousel.Constructor = Carousel


  // CAROUSEL NO CONFLICT
  // ====================

  $.fn.carousel.noConflict = function () {
    $.fn.carousel = old
    return this
  }


  // CAROUSEL DATA-API
  // =================

  $(document).on('click.bs.carousel.data-api', '[data-slide], [data-slide-to]', function (e) {
    var $this   = $(this), href
    var $target = $($this.attr('data-target') || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '')) //strip for ie7
    var options = $.extend({}, $target.data(), $this.data())
    var slideIndex = $this.attr('data-slide-to')
    if (slideIndex) options.interval = false

    $target.carousel(options)

    if (slideIndex = $this.attr('data-slide-to')) {
      $target.data('bs.carousel').to(slideIndex)
    }

    e.preventDefault()
  })

  $(window).on('load', function () {
    $('[data-ride="carousel"]').each(function () {
      var $carousel = $(this)
      $carousel.carousel($carousel.data())
    })
  })

}(window.jQuery);

    </script>
    
    
   
    
    
    
    

 <!-- ================Navigation================================-->
<!-- js -->
<!-- <script src="resources/webmeterials/js/jquery-1.9.1.min.js"></script> -->
<script src="resources/webmeterials/js/modernizr.custom.js"></script>
<script>
    $(document).ready(function(){
        $("#nav-mobile").html($("#nav-main").html());
        $("#nav-trigger span").click(function(){
            if ($("nav#nav-mobile ul").hasClass("expanded")) {
                $("nav#nav-mobile ul.expanded").removeClass("expanded").slideUp(250);
                $(this).removeClass("open");
            } else {
                $("nav#nav-mobile ul").addClass("expanded").slideDown(250);
                $(this).addClass("open");
            }
        });
    });
</script>
<!-- ================end of Navigation================================-->
    <!-- ================Bx Slider================================-->
<link href="resources/webmeterials/css/jquery.bxslider.css" rel="stylesheet" type="text/css">
<script src="resources/webmeterials/js/jquery.bxslider.js"></script>
<script>
	$(document).ready(function(){
  $('.slider4').bxSlider({
    slideWidth: 300,
    minSlides: 1,
    maxSlides: 3,
    moveSlides: 1,
    slideMargin: 10,
	auto: true
  });
});
</script>
    <!-- =============End of Bx Slider================================-->
     <!-- =============Fancy Box================================-->
 <script type="text/javascript" src="resources/webmeterials/js/jquery.fancybox.pack.js"></script>
<link rel="stylesheet" type="text/css" href="resources/webmeterials/css/jquery.fancybox.css" media="screen" />
<script type="text/javascript">
    $(document).ready(function() {
        $('.fancybox').fancybox();
    });
</script>
    <!-- ============End of Fancy Box================================--> 
  </head>
  <body id="location">
  <section class="header">
  	<div class="container clearfix">
    	<a href="#" class="logo"><img src="resources/webmeterials/images/logo.png"></a>
        <div class="navigation_cont">
        <div id="nav-trigger">
            <span><i class="fa fa-bars" aria-hidden="true"></i></span>
        </div>
        <div class="navbar clearfix">
        	<nav id="nav-main" class="clearfix">
        	<ul>
            	<li><a href="#" class="active">Home</a></li>
                <li><a href="#">Menu </a></li>
                <li><a href="#">Peyala Promise</a></li>
                <li><a href="#">Peyala cash </a></li>
                <li><a href="#">what's happening</a></li>
                <li><a href="#">my profile</a> 
                <span class="profile">1</span></li>
            </ul>
            
            </nav>
        </div>
         <nav id="nav-mobile"></nav>
        <div class="headerBtnCont">
        	<a href="#" class="btn btn-primary" role="button"><img src="resources/webmeterials/images/search_icon.png"></a>
            <a  href="#inline1" class="btn btn-primary fancybox" role="button">locations</a>
            <a href="#" class="btn btn-primary" role="button">ORDER NOW</a>
            <a href="#" class="header_signin"><span><i class="fa fa-unlock-alt" aria-hidden="true"></i></span> Sign In </a>
            
            <div class="btn-group lamguage_cont">
              <a href="#" class="lamguage_content dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="resources/webmeterials/images/flug_icon.png"> <b><i class="fa fa-angle-down" aria-hidden="true"></i></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li><a href="#">Separated link</a></li>
              </ul>
            </div>
        </div>
        </div>
    </div>
  </section>
<div class="banner_cont">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="resources/webmeterials/images/banner.png">
        <div class="slider_maincont">
            	<h2>Chittagonian Beef Bhuna</h2>
                <p>A Flavor Trip to the Port city- Chittagong</p>
                <a class="btn btn-primary" href="#" role="button">order now meaty wraps </a>
            </div>
      </div>

      <div class="item">
        <img src="resources/webmeterials/images/banner.png">
        	<div class="slider_maincont">
            	<h2>Chittagonian Beef Bhuna</h2>
                <p>A Flavor Trip to the Port city- Chittagong</p>
                <a class="btn btn-primary" href="#" role="button">order now meaty wraps </a>
            </div>
      </div>
    
      <div class="item">
        <img src="resources/webmeterials/images/banner.png">
        <div class="slider_maincont">
            	<h2>Chittagonian Beef Bhuna</h2>
                <p>A Flavor Trip to the Port city- Chittagong</p>
                <a class="btn btn-primary" href="#" role="button">order now meaty wraps </a>
            </div>
      </div>

      <div class="item">
        <img src="resources/webmeterials/images/banner.png">
        <div class="slider_maincont">
            	<h2>Chittagonian Beef Bhuna</h2>
                <p>A Flavor Trip to the Port city- Chittagong</p>
                <a class="btn btn-primary" href="#" role="button">order now meaty wraps </a>
            </div>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="slider_leftbtn"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="slider_rightbtn"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

	

</div>
	<section class="hapenig_maincont">
    	<div class="container">
        	<h2>WHATâS HAPPENING</h2>
            
            
            
           <div class="slider4 hapening_slidercont">
  <div class="slide">
  	<img src="resources/webmeterials/images/food1.png"><div class="awsmeTxtcont">Awesome <br/> combo meal deal</div>
  </div>
  <div class="slide">
  	<img src="resources/webmeterials/images/food2.png"><div class="awsmeTxtcont">know your coffee <br/>
with peyala</div>
  </div>
  <div class="slide">
  	<img src="resources/webmeterials/images/food3.png"><div class="awsmeTxtcont">Get the App for FREE and  <br/>
Order on the Go! </div>
  </div>
</div> 
            
          <div class="seemore"><button type="button" class="btn btn-primary"><strong>See More</strong></button></div>
        </div>
    </section>
	<section class="footeruppaerCont">
    	<div class="container">
        	<h2>Find the nearest PEYALA!</h2>
            <div class="nearestPCont">
               <input type="text" class="nearest_txt" placeholder="Enter City, State or Zip code" >
              <button type="button" class="btn btn-nearest">Submit</button>
            </div>
        </div>
    </section>
	<section class="footer">
    	<div class="container clearfix">
			<div class="footer_left">
            <div class="footer_contact">
            	<h4>Contact  us</h4>
                <p>Dhaka, Bangladesh  | Tel: 880 1841-604040 / +880 1841-604041</p>
                <p>Mail: <a href="#" class="email">info@peyalacafe.com</a> / <a href="#" class="email">sales@peyalacafe.com</a></p>
            </div>
            <div class="footer_contact">
            	<h4> Connect with PEYALA </h4>
                <a href="#" class="socialface"></a>
                <a href="#" class="socialtwi"></a>
                <a href="#" class="socialgoogle"></a>
                <a href="#" class="socialinsta"></a>
                <a href="#" class="socialyoutube"></a>
                
            </div>
            </div>
            <div class="footer_right">
            	<div class="footer_contact clearfix">
                	<h4>subscribe to our email</h4>
                    <div class="subscribetxt clearfix">
                    	<input name="" type="text" class="substxt" placeholder="Enter Your Email Address">
                        <button class="subsbtn"><img src="resources/webmeterials/images/subs_right.png"></button>
                    </div>
                </div>
                <div class="footer_contact">
                	<p class="unsubscribe">Enter your email address to receive future updates from PEYALA.<br/>You can unsubscribe any time </p>
                    <p class="copy"> &copy; 2016 Peyala Cafe  Ltd  All Rights Reserved
</p>
                </div>
            </div>
            
        </div>
    </section>
    
    
    <div id="inline1" style="display: none; width:1030px; overflow-x:hidden" class="home_locationCont">
		<h2>Allow PEYALA to use my location!</h2>
		<div class="homeLocationContent">
			
     <div class="btn-group secect_countryCont" role="group">
     
     <label>Select Country : <span class="mandatory-astric-color">*</span></label>
											 <select class="form-control" name="countryId" id="countryId">
											 		<option value="">Select</option>	
												 <c:if test="${not empty  countryModels}">
												 	<c:forEach items="${countryModels}" var="data">
														<option value="${data.countryId}" data-thumbnail="image-draw?imageName=${data.imageName}&fileType=image&viewType=view&imageType=country">${data.countryName}</option>
													</c:forEach>
												 </c:if>	
											</select>
     
     
     
     
     
     
    <%-- <button type="button" class="select_country" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Select Country  
      <i class="fa fa-angle-down" aria-hidden="true"></i>
    </button>
    <ul class="dropdown-menu">
      <c:forEach items="${countryModels}" var="data">
											    <li><a href="${data.countryId}">${data.countryName}</a></li>
											   <option value="${data.countryId}" data-thumbnail="image-draw?imageName=${data.imageName}&fileType=image&viewType=view&imageType=country">${data.countryName}</option>
											</c:forEach>
    
    
    
    
      <!-- <li><a href="#">Dropdown link</a></li>
      <li><a href="#">Dropdown link</a></li> -->
    </ul> --%>
  </div>
  
  <div class="btn-group secect_cityCont" role="group">
  
  <label>Select Location : <span class="mandatory-astric-color">*</span></label>
											 <select class="form-control" name="locationId" id="locationId">
											 		<option value="">Select</option>												 	
											</select>
  
  
  
  
   <!--  <button type="button" class="select_city" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Select Location  
      <i class="fa fa-angle-down" aria-hidden="true"></i>
    </button>
    <ul class="dropdown-menu">
      <li><a href="#">Dropdown link</a></li>
      <li><a href="#">Dropdown link</a></li>
    </ul> -->
  </div>
  <div class="btn-group currentLocationcont" role="group">
   <button type="button" id="currentLocationId" class="btn btn-default currentLocation">Current Location <img src="resources/webmeterials/images/map_point.png"></button>   
   </div>  
		</div>
	</div>
</body>
<script type="text/javascript">

$("#countryId").change(function(e){
	var countryId = $("#countryId").val();
	
	if(countryId != ""){
		
		var url = 'get-branch-details-with-country-web';
		var options = '<option value="">Select</option>';
		
		jQuery.ajax({
			url  	 : url,
			type 	 : 'POST',
			dataType : 'json',
			data 	 : {countryId : countryId},
			success	 : function(data){
				
				if(data.length > 0 ){
					$.each(data, function(key, val){
						options+= '<option value="' + val.id + '">' + val.branchName + '</option>';
					});
				}	
				
				$("#locationId").html(options);
				
			},
			error 	 : function(request, status, error){
				$("#locationId").html(options);
			}
		});			
	} else {
		$("#locationId").html(options);
	}
});

$("#currentLocationId").on("click", function(e){			
	alert("naru");
	if(navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var latitude = position.coords.latitude;
            alert(latitude);
            var longitude = position.coords.longitude;
            alert(longitude);
        });
    }
	
	
});








</script>






</html>