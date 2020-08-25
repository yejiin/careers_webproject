<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  제목 내용 작성자 글암호 => 4개 입력 폼
번호 - db입력최번호 + 1, 
작성시간 - sysdate, 
조회수 - 0
insert into board values((select max(seq))+1,?,?,?,sysdate,?,0)
  -->
<form action="/webproject/rvboardwrite" method="post">
	제목<input type=text name="title"> <br>
	내용<textarea name="contents" rows=5 cols=50></textarea><br>
	작성자<input type=text name="writer"> <br>
	<input type=submit value="글쓰기 완료">
</form>
</body>
</html>