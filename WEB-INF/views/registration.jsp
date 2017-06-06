<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Peyala</title>
	
    <!-- Bootstrap -->
    <link href="resources/webmeterials/css/bootstrap.min.css" rel="stylesheet">
    <!-- page Font Css Style -->
    <link href="resources/webmeterials/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="resources/webmeterials/css/font-awesome.css" rel="stylesheet" type="text/css">
    <!-- page Css Style -->
    <link href="resources/webmeterials/css/style.css" rel="stylesheet" type="text/css">
    <link href="resources/webmeterials/css/responsive.css" rel="stylesheet" type="text/css">
    
    <link rel="stylesheet" type="text/css" href="resources/growl/css/jquery.growl.css" />
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/webmeterials/js/bootstrap.min.js"></script>
    
    <script src="resources/growl/js/jquery.growl.js" type="text/javascript"></script>
    <script src="resources/js/commonCustoms/messageDisplay.js" type="text/javascript"></script>
    <script src="resources/webmeterials/js/web-user-registration/web-user-registration.js"></script>
    
 <!-- ================Navigation================================-->
<!-- js -->
<script src="resources/webmeterials/js/jquery-1.9.1.min.js"></script>
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

  </head>
  <body style="background:url(resources/webmeterials/images/registration_bg.png) no-repeat top center;" >
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
            <a href="#" class="btn btn-primary" role="button">locations</a>
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
	<section class="regis_mainContainer">
    	<div class="registrationContainer">
        	<h2>CREATE ACCOUNT</h2>
            <div class="regis_content">
            <form method="post" id="add-registration-form">
            <div class="row">
            	<div class="col-md-6 regis_acLeft">
                	<input type="text" class="form-control regis_textBox" placeholder="First Name" id="firstName">
                    <input type="text" class="form-control regis_textBox" placeholder="Last Name" id="lastName">
                    <input type="text" class="form-control regis_textBox" placeholder="Date of Birth (DD/MM/YY)" id="dob">
                    <input type="text" class="form-control regis_textBox" placeholder="Phone Number" id="phone_no">
                    <input type="text" class="form-control regis_textBox" placeholder="Email" id="email">
                    <div class="radio">
                      <label class="radio-inline">
                      	<input type="radio" name="radiog_dark" id="radio4" class="css-checkbox" id=""/>
            			<label for="radio4" class="css-label radGroup2">Female</label>
                        <input type="radio" name="radiog_dark" id="radio5" class="css-checkbox" checked="checked" id=""/>
            			<label for="radio5" class="css-label radGroup2">Male</label>
                    </div>
                </div>
                <div class="col-md-6 regis_acLeft">
                	<input type="text" class="form-control regis_textBox" placeholder="Address" id="address">
                    <input type="text" class="form-control regis_textBox" placeholder="Postal Code" id="zipcode">
                    <input type="password" class="form-control regis_textBox" placeholder="Password" id="password">
                    <input type="password" class="form-control regis_textBox" placeholder="Confirm Password" id="password">
                </div>
            </div>
            <div class="row fregisCont">
            	<div class="col-md-6 regis_acLeft">
                <a href="#" class="btn_facebook" role="button"><i class="fa fa-facebook" aria-hidden="true"></i> CONNECT WITH FACEBOOK</a>
                </div>
                <div class="col-md-6 regis_acLeft">
<!--                 <a class="regi_accountBtn" role="button"><i class="fa fa-user" aria-hidden="true"></i> <span>CREATE ACCOUNT</span></a> -->
					<input class="regi_accountBtn" type="submit" value="CREATE ACCOUNT"/>
                </div>
            </div>
            <div class="alreadyRegisCont">
                <a href="#" class="alreadyregi">Already Registered?</a> 
                <a href="#" class="signinregi">Sign In here <i class="fa fa-angle-right" aria-hidden="true"></i> </a>
             </div>
            </form>
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
</body>
</html>