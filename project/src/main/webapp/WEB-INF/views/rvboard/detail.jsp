<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/webproject/resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$("#updatebtn").on('click', function(){
		location.href="/mymvc/boardupdate?pw="+$("#pw").val();
	});
	
	$("#deletebtn").on('click', function(){
		location.href="/mymvc/boarddelete";
	});
});
</script>
<style>
td {border:2px solid green;}
</style>
</head>
<body>
<h1> 조회하신 결과는 다음과 같습니다. </h1>
<table style="color:blue;border:2px solid green">
	<tr><td>게시물번호</td><td>${rv_board.rseq }</td></tr>
	<tr><td>게시물제목</td><td>${rv_board.title }</td></tr>
	<tr><td>게시물내용</td><td>${rv_board.contents }</td></tr>
	<tr><td>작성자</td><td>${rv_board.writer }</td></tr>
	<tr><td>작성시간</td><td>${rv_board.regdate }</td></tr>
	<tr><td>조회 수 </td><td>${rv_board.viewcnt}</td></tr>
</table>

글 암호 입력 : <input type=password id="pw">
<input type=button id="updatebtn" value="수정">
<input type=button id="deletebtn" value="삭제">

<!--  수정버튼 클릭 하면 -> /boardupdate url /get방식 호출
		===> 사용자 글 암호 입력 후, 암호 확인
		Boolean BoardDAO:checkPassword(글 번호(=seq), 입력글 암호)
		select password from board where seq=1
		암호 비교해서 같을 때,
		게시물 수정 폼 출력(제목, 내용, 작성자 수정 가능)
		
		게시물 수정 폼에서 수정완료 submit 버튼 클릭 하면 -> 
		/boardupdate /post방식으로 호출 
		===> BoardDAO:updateBoard
		(번호, 수정제목, 수정내용, 수정 작성자 .... )
		
 -->
</body>
</html>