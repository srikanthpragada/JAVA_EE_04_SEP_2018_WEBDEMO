<%@ page language="java"
         contentType="text/html; charset=ISO-8859-1"
         import="java.time.*"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Today</title>
</head>
<body>
<h1>
  <%
     out.println("Today = " + LocalDate.now());
  %>
  
  <hr/>
  
  <%
     out.println("Now  = " + LocalTime.now());
  %>

</h1>

</body>
</html>