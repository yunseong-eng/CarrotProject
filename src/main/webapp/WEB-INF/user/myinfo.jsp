<%-- CarrotProject/src/main/webapp/WEB-INF/user/myinfo.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/carrotLogo.png" type="image/png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/myinfo.css">
<title>회원정보수정</title>
</head>
<body>
	<div id="myinfo-jsp">
		<div id="right">
			<a href="/carrot"><img
				src="${pageContext.request.contextPath}/image/carrotLogo.jpg"
				class="logo"></a> </a> <input type="hidden" name="checkpwd"
				id="checkpwd" value="${user.password }">
			<div id="container">
				<div id="myinfo">회원정보수정</div>
				<form id="myinfoForm" name="myinfoForm">
					<table>
						<!-- 아이디 -->
						<tr>
							<th class="label"><label for="userId">아이디</label></th>
							<td class="input"><input type="text" name="userId"
								id="userId" value="${user.userId }" readonly>
								<div id="userIdDiv"></div></td>
						</tr>

						<!-- 현재 비밀번호-->
						<tr>
							<th class="label"><label for="nowpwd">현재 비밀번호</label></th>
							<td class="input"><input type="password" name="nowpwd"
								id="nowpwd">
								<div id="nowpwdDiv"></div></td>
						</tr>

						<tr>
							<th class="label"><label for="password">수정할 비밀번호</label></th>
							<td class="input"><input type="password" name="password"
								id="password">
								<div id="passwordDiv"></div></td>
						</tr>

						<tr>
							<th class="label"><label for="repwd">비밀번호 확인</label></th>
							<td class="input"><input type="password" name="repwd"
								id="repwd">
								<div id="repwdDiv"></div></td>
						</tr>

						<!-- 이름 -->
						<tr>
							<th class="label"><label for="name"> 이름</label></th>
							<td class="input"><input type="text" name="name" id="name"
								maxlength="10" value="${user.name }">
								<div id="nameDiv"></div></td>
						</tr>

						<!-- 핸드폰 -->
						<tr>
							<th class="label"><label for="tel">핸드폰</label></th>
							<td class="input"><select id="tel1" name="tel1"
								class="input-tel" value="${user.tel1 }">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="019">019</option>
							</select> - <input type="text" id="tel2" name="tel2" size="4"
								maxlength="4" value="${user.tel2 }" class="input-tel"> -
								<input type="text" id="tel3" name="tel3" size="4" maxlength="4"
								value="${user.tel3 }" class="input-tel"></td>
						</tr>

						<!-- 성별 -->
						<tr>
							<th class="label"><label for="gender">성별</label></th>
							<td class="input"><label><input type="radio"
									id="male" name="gender" value="M"
									${user.gender == 'M' ? 'checked' : ''}> 남자 </label> <label><input
									type="radio" id="female" name="gender" value="F"
									${user.gender == 'F' ? 'checked' : ''}> 여자</label></td>
						</tr>

						<!-- 주소 -->
						<tr>
							<th class="label"><label for="zipcode">주소</label></th>
							<td><input type="text" name="zipcode" id="zipcode" size="6" />
								<input type="button" value="우편번호 검색" onclick="checkPost()"><br>
								<input type="text" id="addr1" name="addr1"
								value="${user.addr1} " style="width: 300px;" readonly><br>
								<input type="text" id="addr2" name="addr2"
								value="${user.addr2} " style="width: 300px;"><br></td>
						</tr>

						<!-- 이메일 -->
						<tr>
							<th class="label"><label for="email"><i
									class="fa-solid fa-envelope"></i> 이메일</label></th>
							<td class="input"><input type="text" name="email1"
								id="email1" class="input-email" value="${user.email1 }">
								@ <input type="text" name="email2" id="email2"
								class="input-email" value="${user.email2 }"> <select
								id="emailSelect" name="emailSelect" class="input-email">
									<option value="">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
							</select></td>
						</tr>


						<tr>
							<td colspan="3" align="center">
								<button type="button" id="myinfoBtn">회원정보 수정</button>
								<button type="reset" id="resetBtn">수정 취소</button>
								<button type="button" id="deleteBtn">탈퇴</button> <!-- <button type="button" id="deleteBtn" style="font-size: 10px !important; padding: 0px; width: 40px !important; height: 20px !important; background: gray !important; color: lightgray !important; float: right; white-space: nowrap">탈퇴</button> -->
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
	<script type="text/javascript" src="/carrot/js/myinfo.js"></script>
</body>
</html>