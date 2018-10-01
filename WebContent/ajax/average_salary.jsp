<%@ page language="java" pageEncoding="ISO-8859-1"  contentType="text/plain" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource var="oracle" driver="oracle.jdbc.driver.OracleDriver"
	url="jdbc:oracle:thin:@localhost:1521:XE" user="hr" password="hr" />
<sql:query var="result" dataSource="${oracle}">
    select to_char(avg(salary),'99,999.00') avgsal  
    from employees
</sql:query>
${result.rows[0].avgsal}