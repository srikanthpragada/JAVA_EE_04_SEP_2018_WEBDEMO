<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>For Tags</title>
</head>
<body>
<c:forEach var="n" begin="1" 
                  end="${(empty param.end) ? 10 : param.end}">
   ${n} <br/>
</c:forEach> 


</body>
</html>