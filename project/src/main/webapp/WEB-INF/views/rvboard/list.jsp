<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/webproject/resources/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$("#btn").on('click',function(){
	location.href="/webproject/rvboardwrite";
	});
});
</script>
</head>
<body>
<table border="3px">
<c:forEach items="${ rvboardlist }" var="vo">
<tr><td><a href="/webproject/rvboarddetail?rseq=${vo.rseq }">${vo.title }</a></td><td>${vo.writer }</td></tr>
</c:forEach>
</table>

<c:if test="${not empty login }">
<input type="button" value="글쓰기" id="btn">
</c:if>

<c:if test="${empty login }">
 <i class="fa fa-edit"></i> 로그인 한 사용자만 글쓰기가 가능합니다.
</c:if>

</body>
</html>