<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.multi.webproject.user.UserDAO" %>

<%@ taglib 
uri="http://java.sun.com/jsp/jstl/core" 
prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>아이디: ${param.userid }</h2>
<h2>암호: ${param.userpw }</h2>


<h1>상태: ${result }</h1>

<c:set var="result" value="${result }"/>

<c:choose>
	<c:when test="${result eq '1'}">
		response.sendRedirect("../view/use/loginform.jsp?result=1");
	</c:when>
	<c:when test="${result eq '0' }">
		response.sendRedirect("../view/use/loginform.jsp?result=0");
	</c:when>
	<c:when test="${result eq '-1' }">
		response.sendRedirect("../view/use/loginform.jsp?result=-1");
	</c:when>
</c:choose>
	

</body>
</html>