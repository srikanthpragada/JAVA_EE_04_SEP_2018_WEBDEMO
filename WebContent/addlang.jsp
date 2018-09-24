<%@ page language="java" 
    contentType="text/html; charset=ISO-8859-1"
    import="java.util.LinkedHashSet"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Languages</title>
</head>
<body>
<h1>Languages</h1>
<%

  String lang = request.getParameter("lang");
  LinkedHashSet<String> langs =
		   (LinkedHashSet<String>) session.getAttribute("langs");
  if (langs == null)
  {
	  langs = new LinkedHashSet<String>(); // create new list 
	  session.setAttribute("langs", langs);
  }

  langs.add(lang);   // add lang to list 
  
  for (String l : langs)
	  out.println(l + "<br/>");
 
    
%>

</body>
</html>