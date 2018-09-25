<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.util.TreeMap"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Of Jobs</title>
<style>
.number {
	text-align: right
}

.heading {
	background-color: maroon;
	color: yellow;
	font-weigth: bold
}

.tablestyles {
	cellpadding: 5pt;
	font-family: verdana;
	font-size: 11pt;
	width: 100%
}
</style>
</head>
<body>
	<h2>Jobs</h2>
	<table border="1" class="tablestyles">
		<tr class="heading">
			<th>Job Id</th>
			<th>Job Title</th>
		</tr>

		<%
			TreeMap<String,String>  jobs = 
			    (TreeMap<String,String>) application.getAttribute("jobs");
		    for(String id : jobs.keySet())
		    {
		%>

		<tr>
			<td><%=id%></td>
			<td><%=jobs.get(id)%></td>
		</tr>

		<%
			}
		%>

	</table>

</body>
</html>