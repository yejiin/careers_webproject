<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  게시물 저장 결과 표시  -->
<!-- 정상적으로 저장 성공 -> 저장한 게시물 내용 출력 
저장 실패 -> 저장 오류 
--> 
<h1>${result }</h1>
<h2>${vo.title}</h2>
<h3>${vo.contents }</h3>
<h2>${vo.writer }</h2>

</body>
</html>