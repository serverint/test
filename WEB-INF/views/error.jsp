<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//System.out.println("BasePath : " + basePath);
%>
<title>Something went wrong</title>


<link rel="stylesheet" href="<%=basePath%>resources/css/bootstrap.min.css"/>
<link href='https://fonts.googleapis.com/css?family=Arimo:400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="<%=basePath%>resources/css/font-awesome.min.css"/>
<link rel="stylesheet" href="<%=basePath%>resources/css/style.css"/>
<link rel="stylesheet" href="<%=basePath%>resources/css/responsive.css"/>
<script src="<%=basePath%>resources/js/jquery-1.11.3.min.js"></script>
<script src="<%=basePath%>resources/js/bootstrap.min.js"></script>
<script src="<%=basePath%>resources/js/common.js"></script>
</head>

<body>
<div class="loginBG">
	
</div>
<div class="loginBox">
   
        <div class="ltTxt"><a href="#"><img src="<%=basePath%>resources/images/404.png"  alt=""></a></div>
        <div class="message"><span><p>A problem occurred while you were trying to open the url</p></span>
		<span><a href="<%=basePath%>admin-user-login" style="color: red;">Go To Login Page</a></span>  
		</div>      
</div>
</body>
</html>
