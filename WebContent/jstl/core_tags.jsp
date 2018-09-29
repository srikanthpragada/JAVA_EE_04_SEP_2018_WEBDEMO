<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Using Core Tags</title>
</head>
<body>
<h2>Using Core Tags</h2>
<c:set var="name" value="Srikanth Technologies" scope="session" />
Name = ${sessionScope.name}
<p/>
<c:remove var="name" scope="session" />
<c:if test="${empty sessionScope.name}">
  Sorry! No name found in session!
</c:if>
${sessionScope.name}
</body>
</html>