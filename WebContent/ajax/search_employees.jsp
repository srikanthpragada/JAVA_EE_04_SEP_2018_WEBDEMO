<%@ page language="java" pageEncoding="ISO-8859-1"  contentType="text/plain" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:setDataSource var="oracle" driver="oracle.jdbc.driver.OracleDriver"
	url="jdbc:oracle:thin:@localhost:1521:XE" user="hr" password="hr" />

<sql:query var="result" dataSource="${oracle}">
    select first_name name, salary , job_id job, nvl(department_id,0) dept
    from employees
    where first_name like ?
    <sql:param value='%${param.name}%' ></sql:param>
</sql:query>
[
<c:forEach var="emp" items="${result.rows}" varStatus="vs">
   {"name" : "${emp.name}",
    "salary" : ${emp.salary}, 
     "job" : "${emp.job}", 
     "dept" : ${emp.dept}}
     <c:if test="${!vs.last}">,</c:if>
</c:forEach>
]