<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Factors</title>
</head>
<body>
    <h2>Factors</h2>
	<form>
		Number : <input type="number" 
		                name="num" 
		                value="${param.num}" />
		           
           <input type="submit" value="Factors" />
	</form>
	
	<%
	    String snum = request.getParameter("num");
	    if (snum == null)
	    	return; // stop jsp 
	    
	    	
    	int num = Integer.parseInt(snum);
    	for(int i = 2; i <= num/2; i ++)
    		if(num % i == 0)
    			out.println(i + "<br/>");
	    
	%>

</body>
</html>