<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>For Tags</title>
</head>
<body>
	<h2>Table</h2>
	<form>
		Number: <input type="number" name="number" value="${param.number}" />
		From : <input type="number" name="from"  value="${param.from}"/>
		To : <input type="number" name="to"  value="${param.to}"/>
		<p />
		<input type="submit" value="Submit" />
	</form>

	<c:if test="${!empty param.number}">
		<table>
			<c:forEach var="n" begin="${param.from}" end="${param.to}">
				<tr>
					<td>${param.number}</td>
					<td>${n}</td>
					<td>${param.number * n}</td>
				</tr>

			</c:forEach>
		</table>
	</c:if>


</body>
</html>