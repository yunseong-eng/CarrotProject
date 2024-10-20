<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/login.css">
<title>로그인페이지</title>
</head>
<body>
	<div id="login-jsp">
		<a href="/carrot/"> <img src="../image/carrotLogo.jpg" width="100"
			height="50" alt="carrot이동">
		</a>
		<div id="container">
			<div id="login">로그인</div>
			<form name="loginForm" id="loginForm">
				<table>
					<tr>
						<th class="label">아이디</th>
						<td class="input"><input type="text" name="userId"
							id="userId" placeholder="아이디 입력" />
							<div id="userIdDiv"></div></td>
					</tr>

					<tr>
						<th class="label">비밀번호</th>
						<td class="input"><input type="password" name="password"
							id="password" placeholder="비밀번호 입력" />
							<div id="passwordDiv"></div></td>
					</tr>

					<tr align="center">
						<td colspan="2" height="20">
							<button type="button" id="loginBtn">로그인</button>
							<button type="button" id="registerBtn">회원가입</button>
						</td>
					</tr>

					<tr>
						<th class="label"></th>
						<td class="input"><a id="kakaologinbtn" class="kakaologinbtn"
							href="#"> <img src="../image/kakao_login_medium_wide.png"
								alt="카카오톡 로그인" />
						</a>
							<div id="kakaoDiv"></div></td>
					</tr>


				</table>
			</form>
		</div>
	</div>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="/carrot/js/login.js"></script>
	<script type="text/javascript">
	<!-- 카카오 SDK -->
		<script src="https://developers.kakao.com/sdk/js/kakao.js">
		// 카카오 SDK 초기화
		Kakao.init('YOUR_APP_KEY'); // 여기 YOUR_APP_KEY는 카카오에서 발급받은 키입니다.

		// 로그인 버튼 클릭 이벤트
		document.getElementById('kakao-login-btn').onclick = function() {
			Kakao.Auth.login({
				success : function(authObj) {
					// 로그인 성공 시, 서버로 authObj를 보내 사용자 정보를 받아올 수 있습니다.
					console.log(authObj);
					window.location.href = '/yourapp/callback'; // 서버에서 인증 처리를 위해 리디렉션
				},
				fail : function(err) {
					console.error(err);
				},
			});
		};
	</script>
</body>
</html>

