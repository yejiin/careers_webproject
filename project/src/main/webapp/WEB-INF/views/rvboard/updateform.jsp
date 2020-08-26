<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 게시물 수정 </h1>
<form action="/webproject/rvboardupdate"method="post">
<input type=hidden name="rseq" value="${ rseq }">
제목 <input type=text name="title" > <br>
내용 <textarea rows=5 cols=50 name="contents">
</textarea>
<input type="submit" value="수정완료">

</form>

</body>
</html>