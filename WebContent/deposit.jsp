<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Interest Calculation</title>
</head>
<body>

	<jsp:useBean id="depositBean" class="beans.DepositBean" scope="page">
	</jsp:useBean>

	<jsp:setProperty property="*" name="depositBean" />

	<h3> Interest = ${depositBean.interest}	</h3>


</body>
</html>