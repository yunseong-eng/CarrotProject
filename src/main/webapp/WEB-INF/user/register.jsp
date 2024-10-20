<%-- CarrotProject/src/main/webapp/WEB-INF/user/register.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/register.css">
<title>회원가입</title>
</head>
<body>
	<div id="register-jsp" class="register-jsp">
		<div id="right">
			<a href="/carrot/"> <img src="../image/carrotLogo.jpg" width="100"
				height="50" alt="carrot이동">
			</a>
			<div id="container">
				<div id="register">회원가입</div>
				<form name="registerForm" id="registerForm">
					<table>
						<!-- 아이디 -->
						<tr>
							<th class="label"><label for="userId">아이디</label></th>
							<td class="input"><input type="text" name="userId"
								id="userId" placeholder="아이디 입력" />
								<div id="userIdDiv"></div></td>
						</tr>
						<!-- 비밀번호 -->
						<tr>
							<th class="label"><label for="password">비밀번호</label></th>
							<td class="input"><input type="password" name="password"
								id="password" placeholder="비밀번호 입력" />
								<div id="passwordDiv"></div></td>
						</tr>
						<!-- 비밀번호 확인 -->
						<tr>
							<th class="label"><label for="repassword">비밀번호 확인</label></th>
							<td class="input"><input type="password" id="repassword"
								name="repassword" placeholder="비밀번호 재입력">
								<div id="repasswordDiv"></div></td>
						</tr>

						<!-- 이름 -->
						<tr>
							<th class="label"><label for="name">이름</label></th>
							<td class="input"><input type="text" name="name" id="name"
								placeholder="이름 입력" />
								<div id="nameDiv"></div></td>
						</tr>

						<!-- 핸드폰 -->
						<tr>
							<th class="label"><label for="tel1">핸드폰</label></th>
							<td class="input"><select id="tel1" name="tel1"
								class="input-tel">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
							</select> - <input type="text" id="tel2" name="tel2" placeholder="입력"
								class="input-tel" maxlength="4"> - <input type="text"
								id="tel3" name="tel3" placeholder="입력" class="input-tel"
								maxlength="4">
								<div id="telDiv"></div></td>
						</tr>

						<!-- 성별 -->
						<tr>
							<th class="label"><label for="gender"> 성별</label></th>
							<td class="input"><label><input type="radio"
									id="male" name="gender" value="M"> 남자</label> <label><input
									type="radio" id="female" name="gender" value="F"> 여자</label>
								<div id="genderDiv"></div></td>
						</tr>

						<!-- 주소 -->
						<tr>
							<th class="label"><label for="zipcode">주소</label></th>
							<td><input type="text" name="zipcode" id="zipcode" size="6" />
								<input type="button" value="우편번호 검색" onclick="checkPost()"><br>
								<input type="text" id="addr1" name="addr1" placeholder="주소"
								style="width: 300px;" readonly> <input type="text"
								id="addr2" name="addr2" placeholder="상세주소" style="width: 300px;"><br></td>
						</tr>

						<!-- 이메일 -->
						<tr>
							<th class="label"><label for="email1">이메일</label></th>
							<td class="input"><input type="text" id="email1"
								name="email1" placeholder="이메일 입력" class="input-email">
								@ <input type="text" id="email2" name="email2"
								placeholder="직접입력" class="input-email"> <select
								id="emailSelect" name="emailSelect" class="input-email"
								onchange="change()">
									<option value="">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
							</select>
								<div id="emailDiv"></div></td>
						</tr>
						<!-- 이메일 인증용 -->
						<tr>
							<th class="label"><label for="email1">이메일 인증</label></th>
							<td class="input"><input  type="email" id="email"
								name="email" class="form-control" placeholder="이메일 입력" 
								 autofocus>
								<input type="button" value="인증하기" class="btn-primary"
									id="emailAuth"><input type="text" id="authCode"
								name="authCode" class="form-control" placeholder="인증코드 입력"
								maxlength="6" disabled="disabled" autofocus> <span id="emailAuthWarn"></span>
						</td></tr>

						<tr align="center">
							<td colspan="2" height="20">
								<button type="button" id="registerBtn">회원가입</button>
								<button type="reset" id="resetBtn">초기화</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="/carrot/js/register.js"></script>
</body>
</html>