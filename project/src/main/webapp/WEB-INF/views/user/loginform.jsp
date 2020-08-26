<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content='text/html; charset=UTF-8'>
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<script src="/webproject/resources/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btnlogin").on('click', function() {
			var id = $("#id").val();
			var pw = $("#pw").val();
			if (id == "") {
				alert("아이디를 입력하세요.");
				$("#id").focus;
				return;
			}
			if (pw == "") {
				alert("비밀번호를 입력하세요.");
				$("#pw").focus;
				return;
			}
		})
		$("#btnsignup").on('click', function() {
			location.href = "/webproject/usersignup";
		});
	});
</script>
<style type="text/css">
.container {
	height: 100vh;
	text-aglin: center;
}

.row {
	height: 100vh;
	margin: auto;
}

.col-md-3 {
	margin: auto;
}
</style>

</head>

<body>


	<!-- 로그인폼 -->

	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="login-box">
					<form role="form" action="./login" method="post">
						<legend>Login</legend>
						<div class="form-group">
							<label>아이디</label> <input type="text" name="userid" id="id"
								class="form-control" placeholder="아이디를 입력하세요">
						</div>
						<div class="form-group">
							<label>비밀번호</label> <input type="password" name="userpw" id="pw"
								class="form-control" placeholder="비밀번호를 입력하세요">
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-default btn-login-submit"
								value="login" id="btnlogin"> <input type=button
								value="회원가입" id="btnsignup" class="btn btn-primary">

						</div>

					</form>
				</div>
			</div>
		</div>
	</div>


	<%
		String msg = request.getParameter("result");
		if (msg != null && msg.equals("1")) {
			response.sendRedirect("../webproject/");
		} else if (msg != null && msg.equals("0")) {
			out.println("<br>");
			out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
		} else if (msg != null && msg.equals("-1")) {
			out.println("<br>");
			out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
		}
	%>


</body>

</html>