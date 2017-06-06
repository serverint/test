<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="https://sandbox.sslcommerz.com/gwprocess/v3/process.php" method="post" name="form1">
    <input type="hidden" name="store_id" value="testbox">
    <input type="hidden" name="total_amount" value="100">
    <input type="hidden" name="tran_id" value="ITEM-256372">
    <input type="hidden" name="success_url" value="http://52.6.251.159/~customweb/peyala/sslcommerz/success.php">
    <input type="hidden" name="fail_url" value="http://52.6.251.159/~customweb/peyala/sslcommerz/fail.php">
    <input type="hidden" name="cancel_url" value="http://52.6.251.159/~customweb/peyala/sslcommerz/cancel.php">
       <input type = "hidden" name = "value_a" value = "1">
            <input type = "hidden" name = "value_b" value = "1">
            <input type = "hidden" name = "value_c" value = "{{sessionId}}">
            <input type = "hidden" name = "value_d" value = "{{dateTime}}">
    <input type="submit" value="Pay with SSLCOMMERZ DEMO-Peyala" name="pay">
</form>
</body>
</html>