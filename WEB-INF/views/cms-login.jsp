<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link href='https://fonts.googleapis.com/css?family=Arimo:400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="resources/css/font-awesome.min.css" />
<link rel="stylesheet" href="resources/css/style.css" />
<link rel="stylesheet" href="resources/css/responsive.css" />
<link rel="stylesheet" type="text/css" href="resources/growl/css/jquery.growl.css" />
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">

<script src="resources/js/jquery-1.11.3.min.js"></script>
<script src="resources/js/bootstrap/bootstrap.min.js"></script>
<script src="resources/js/editor.js"></script>
<script src="resources/js/common.js"></script>
<script src="resources/growl/js/jquery.growl.js" type="text/javascript"></script>
<script src="resources/js/admin-user/login.js" type="text/javascript"></script>
<script src="resources/js/commonCustoms/messageDisplay.js" type="text/javascript"></script>
</head>

<body>
	<div class="loginBG"></div>
	
	<div class="loginBox">
	<a href="#" class="logoLogin"><img alt="" src="resources/images/logo.png"></a>
	<div class="login_maincont">
		<h1>
			Login
		</h1>	
		<form id="admin-user-login-form" action="./admin-user-login" method="post" class="loginForm">
			<div class="form-group">
				<div class="input-group">
					<input id="email" type="text" class="form-control" placeholder="Email ID" name="email" maxlength="200"> 
					<span class="input-group-addon">
					<span class="glyphicon glyphicon-user"></span></span>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<input id="password" type="password" class="form-control" placeholder="Password" name="password" maxlength="30"> 
						<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
				</div>
			</div>
			<button class="btn btn-primary btn-lg btnLogin" type="submit">Sign In</button>
			<input type="hidden" class="success" value="${success}">
			<input type="hidden" class="error" value="${error}">

			<div class="clearfix">
				<a href="#"  class="forgot-pass pull-right" data-toggle="modal" data-target="#password-div">Forgot Password?</a>
			</div>		
		</form>
		
		<!-- Modal Start -->

		<div class="modal fade" id="password-div"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static"> 
				<div class="modal-dialog">
					<div class="modal-content">
					<div class="container" style="width:auto;">
						<form action="forget-password" id="password-form" style="margin-bottom: 0px !important;" class="form-horizontal" method="POST" >
							<div class="modal-header">
							<div class="form-group" style=" margin-bottom:0;">
								<!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> -->
								<h3 class="modal-title" id="myModalLabel">Forget Password</h3>
								</div>
							</div>
							<div class="modal-body">												
								<div class="form-group">
									<label>Email : </label> 
									<input type="text" name="fEmail" id="fEmail" class="form-control">
								</div>
							</div>
							<div class="modal-footer" style=" padding:15px 0;">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</form>
					</div>
				</div>
			  </div>
			</div>
							<!-- Modal End -->
		
		<!-- <a href="login-facebook">Facebook </a> -->
		</div>
	</div>

</body>
</html>