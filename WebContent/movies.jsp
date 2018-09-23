<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movies</title>
</head>
<body>
	<%
		String city = null;
		Cookie cookies[] = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("city")) {
					city = c.getValue();
					break;
				}
			}
		}
		if (city == null)
			response.sendRedirect("selectcity.html");
	%>

	<h1>Movies</h1>
	Movies in city [<%=city%>]  <a href="selectcity.html">Change City</a>
	

</body>
</html>