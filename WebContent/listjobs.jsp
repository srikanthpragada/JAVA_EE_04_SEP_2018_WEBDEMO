<%@ page language="java"
         contentType="text/html; charset=ISO-8859-1"
         import="oracle.jdbc.rowset.OracleCachedRowSet"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Of Jobs</title>
<style>
 .number {text-align: right}
 .heading { background-color:navy;color:white; font-weigth:bold}
 .tablestyles {cellpadding:5pt; font-family:verdana; font-size:11pt; width: 100%}
</style>
</head>
<body>
<h2>Jobs</h2>
<table border="1" class="tablestyles">
  <tr class="heading">
    <th>Job Id </th>
    <th>Job Title </th>
    <th>Min Salary </th>
    <th>Max Salary </th>
  </tr>
  
  <%
    OracleCachedRowSet crs = new OracleCachedRowSet();
	crs.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
	crs.setUsername("hr");
	crs.setPassword("hr");
    crs.setCommand("select * from jobs");
		
	crs.execute();
	while (crs.next()) {
		String row = 
		  String.format("<tr><td>%s</td><td>%s</td><td class='number'>%d</td><td class='number'>%d</td></tr>",
				 crs.getString(1),
				 crs.getString(2),
				 crs.getInt(3),
				 crs.getInt(4));
		out.println(row);		 
	}
	crs.close(); 
  %>
    
</table>

</body>
</html>