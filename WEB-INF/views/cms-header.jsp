<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> --%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title><c:out value="${title}" /></title>

<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link href='https://fonts.googleapis.com/css?family=Arimo:400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="resources/css/font-awesome.min.css" />

<link rel="stylesheet" href="resources/css/style.css" />
<link rel="stylesheet" href="resources/css/responsive.css" />
<link rel="stylesheet" href="resources/css/editor.css" type="text/css" />
<link rel="stylesheet" media="screen" href="resources/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" type="text/css" href="resources/growl/css/jquery.growl.css"/>
<link href="resources/css/simple-sidebar.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/jquery-ui-1.12.0.css">
<link rel="stylesheet" href="resources/css/timepicki.css">
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">

<script src="resources/js/jquery-1.11.3.min.js"></script>
 <script src="resources/js/jquery-ui-1.12.0.js"></script>   
<script src="resources/js/bootstrap/bootstrap.min.js"></script>
<script src="resources/js/editor.js"></script>
<script src="resources/js/timepicki.js"></script>
<!-- for date picker -->


<!-- for growl -->
<script type="text/javascript" src="resources/growl/js/jquery.growl.js"></script>



<!-- select 2 -->
<link rel="stylesheet" href="resources/css/select2.min.css" />
<script type="text/javascript" src="resources/js/select2.min.js"></script>


<script src="resources/js/commonCustoms/messageDisplay.js" type="text/javascript"></script>

	<script src="resources/js/ckeditor/ckeditor.js"></script>
	<script src="resources/js/ckeditor/samples/js/sample.js"></script>
	<link rel="stylesheet" href="resources/js/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css"> 

<!-- <script src="resources/js/common.js"></script> -->
<!-- <script src="resources/js/sidebar_menu.js"></script> -->

</head>
<body>
<div id="wrapper">
<input type="hidden" class="success" value="${success}">
<input type="hidden" class="error" value="${error}">