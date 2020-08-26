<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<!-- Bootstrap -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="/webproject/resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#signupbtn").on('click', function() {
			if (!$("#id").val()) {
				alert("아이디를 입력하세요.");
				$("#id").focus();
				return false;
			} else if (!$("#pw").val()) {
				alert("비밀번호를 입력하세요.");
				$("#pw").focus();
				return false;
			} else if ($("#pw").val() != $("#ckpw").val()) {
				alert("비밀번호가 일치하지 않습니다.")
				$("#ckpw").focus();
				return false;
			} else if (!$("#name").val()) {
				alert("이름을 입력하세요.");
				$("#name").focus();
				return false;
			}else if (!$("#birth").val()) {
				alert("생년월일을 입력하세요.");
				$("#birth").focus();
				return false;
			}
		});
	});
</script>
</head>

<body>

	<div class="container">
		<form class="form-horizontal" role="form" method="post"
			action="./usersignup">
			<legend>회원가입</legend>
			<div class="form-group">
				<div class="form-group" id="divId">
					<label for="inputId" class="col-lg-2 control-label">아이디</label>
					<div class="col-lg-10">
						<input type="text" name=userid id="id"
							class="form-control onlyAlphabetAndNumber" id="id"
							data-rule-required="true"
							placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30">
					</div>
				</div>
				<div class="form-group" id="divPassword">
					<label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
					<div class="col-lg-10">
						<input type="password" name=userpw id="pw" class="form-control"
							id="password" name="excludeHangul" data-rule-required="true"
							placeholder="비밀번호" maxlength="30">
					</div>
				</div>
				<div class="form-group" id="divPasswordCheck">
					<label for="inputPasswordCheck" class="col-lg-2 control-label">비밀번호
						확인</label>
					<div class="col-lg-10">
						<input type="password" name=ckuserpw id="ckpw"
							class="form-control" data-rule-required="true"
							placeholder="비밀번호 확인" maxlength="30">
					</div>
				</div>
				<div class="form-group" id="divName">
					<label for="inputName" class="col-lg-2 control-label">이름</label>
					<div class="col-lg-10">
						<input type="text" name=username id="name"
							class="form-control onlyHangul" data-rule-required="true"
							placeholder="한글만 입력 가능합니다." maxlength="15">
					</div>
				</div>
				<div class="form-group" id="divName">
					<label for="inputName" class="col-lg-2 control-label">생년월일</label>
					<div class="col-lg-10">
						<input type="text" name=userbirth id="birth" class="form-control onlyNumber"
							data-rule-required="true" placeholder="생년월일(yymmdd)"
							maxlength="15">
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<button type="submit" id="signupbtn" class="btn btn-primary">Sign up</button>
					</div>
				</div>
			</div>
		</form>
	</div>


 	<script>
		$(function() {
			//모달을 전역변수로 선언
			var modalContents = $(".modal-contents");
			var modal = $("#defaultModal");

			$('.onlyAlphabetAndNumber').keyup(function(event) {
				if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
					var inputVal = $(this).val();
					$(this).val($(this).val().replace(/[^_a-z0-9]/gi, '')); //_(underscore), 영어, 숫자만 가능
				}
			});

			$(".onlyHangul").keyup(function(event) {
				if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[a-z0-9]/gi, ''));
				}
			});

			$(".onlyNumber").keyup(function(event) {
				if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^0-9]/gi, ''));
				}
			});

			//------- 검사하여 상태를 class에 적용
			$('#id').keyup(function(event) {

				var divId = $('#divId');

				if ($('#id').val()=="") {
					divId.removeClass("has-success");
					divId.addClass("has-error");
				} else {
					divId.removeClass("has-error");
					divId.addClass("has-success");
				}
			});

			$('#pw').keyup(function(event) {

				var divPassword = $('#divPassword');

				if ($('#pw').val() == "") {
					divPassword.removeClass("has-success");
					divPassword.addClass("has-error");
				} else {
					divPassword.removeClass("has-error");
					divPassword.addClass("has-success");
				}
			});

			$('#ckpw').keyup(function(event) {

				var passwordCheck = $('#ckpw').val();
				var password = $('#pw').val();
				var divPasswordCheck = $('#divPasswordCheck');

				if ((passwordCheck == "") || (password != passwordCheck)) {
					divPasswordCheck.removeClass("has-success");
					divPasswordCheck.addClass("has-error");
				} else {
					divPasswordCheck.removeClass("has-error");
					divPasswordCheck.addClass("has-success");
				}
			});

			$('#name').keyup(function(event) {

				var divName = $('#divName');

				if ($.trim($('#name').val()) == "") {
					divName.removeClass("has-success");
					divName.addClass("has-error");
				} else {
					divName.removeClass("has-error");
					divName.addClass("has-success");
				}
			}); 

			//------- validation 검사
		/* 	$("#signupbtn").click(
					function(event) {
						var divId = $('#divId');
						var divPassword = $('#divPassword');
						var divPasswordCheck = $('#divPasswordCheck');
						var divName = $('#divName');
	


						//아이디 검사
						if ($('#id').val() == "") {
							modalContents.text("아이디를 입력하여 주시기 바랍니다.");
							modal.modal('show');

							divId.removeClass("has-success");
							divId.addClass("has-error");
							$('#id').focus();
							return false;
						} else {
							divId.removeClass("has-error");
							divId.addClass("has-success");
						}

						//패스워드 검사
						if ($('#pw').val() == "") {
							modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
							modal.modal('show');

							divPassword.removeClass("has-success");
							divPassword.addClass("has-error");
							$('#pw').focus();
							return false;
						} else {
							divPassword.removeClass("has-error");
							divPassword.addClass("has-success");
						}

						//패스워드 확인
						if ($('#ckpw').val() == "") {
							modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
							modal.modal('show');

							divPasswordCheck.removeClass("has-success");
							divPasswordCheck.addClass("has-error");
							$('#ckpw').focus();
							return false;
						} else {
							divPasswordCheck.removeClass("has-error");
							divPasswordCheck.addClass("has-success");
						}

						//패스워드 비교
						if ($('#pw').val() != $('#ckpw').val()
								|| $('#ckpw').val() == "") {
							modalContents.text("패스워드가 일치하지 않습니다.");
							modal.modal('show');

							divPasswordCheck.removeClass("has-success");
							divPasswordCheck.addClass("has-error");
							$('#ckpw').focus();
							return false;
						} else {
							divPasswordCheck.removeClass("has-error");
							divPasswordCheck.addClass("has-success");
						}

						//이름
						if ($('#name').val() == "") {
							modalContents.text("이름을 입력하여 주시기 바랍니다.");
							modal.modal('show');

							divName.removeClass("has-success");
							divName.addClass("has-error");
							$('#name').focus();
							return false;
						} else {
							divName.removeClass("has-error");
							divName.addClass("has-success");
						}

						
					}); */

		}); 
	</script> 

</body>
</html>