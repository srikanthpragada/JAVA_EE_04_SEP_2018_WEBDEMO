<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
  String cityname = request.getParameter("city");
  Cookie c = new Cookie("city", cityname);
  c.setMaxAge(7 * 24 * 60 * 60);  // 7 days 
  response.addCookie(c);
  response.sendRedirect("movies.jsp");

%>

</body>
</html>