<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
				</table>
			</form>
		</div>
	</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="/carrot/js/login.js"></script>
</body>
</html>

