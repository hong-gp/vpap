<%@ page contentType="text/html;charset=euc-kr" %>
<html>
<head>
	<title>회원가입</title>
	<link rel="stylesheet" href="./css/index.css">
	<style>
	.head {
		font-size: 20px;
	}
	input[type="text"], input[type="password"] {
		font-size: 16px;
		width: 350px;
		height: 40px;
		border-radius: 10px;
		padding-left: 10px;
	}
	button, input[type="reset"], input[type="button"] {
		font-size: 16px;
		height: 40px;
		border-radius: 10px;
		cursor: hand;
		font-weight: bold;
		margin: 0px;
	}
	button:hover, input[type="reset"]:hover {
		background-color: #bbb;
	}
	form a {
		color: #000;
		font-weight: bold;
		text-decoration: none;
	}
	input[type="button"] {
		width: 100px;
	}
	input[type="reset"] {
		width: 100px;
	}
	</style>
</head>

<script language="javascript" src="js.js"></script>

<body onLoad="idFocus()">
<div class="nav">
	<a href="index.html">VPAP</a>
	<a href="login.jsp">로그인</a>
	<a href="insertMember.jsp">회원가입</a>
	<a href="category.jsp">카테고리</a>
</div>
<form name="newMem" method=post action=insertMemberResult.jsp>
	<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); margin-top: 20px;">
		<div class="head" style="font-weight: bold; text-align: center;">회원가입</div>
		<div>
			<div class="head">아이디</div>
			<div style="width: 350px; text-align: center;">
				<input type="text" name="id" style="width: 75%;">
				<a href="javascript:checkID()" style="text-decoration: none;">
					<button type="button" style="width: 23%; vertical-align: middle;">중복확인</span>
				</a>
			</div>
		</div>
		<div style="margin-top: 10px;">
			<div class="head">비밀번호</div>
			<input type="password" name="password" size=21>
		</div>
		<div style="margin-top: 10px;">
			<div class="head">성명</div>
			<input type="text" name="name">
		</div>
		<div style="margin-top: 10px;">
			<div class="head">주민등록번호</div>
			<div style="width: 350px; text-align: center;">
				<input type=text name=joomin1 size=6 style="width: 47%;"> - <input type=password name=joomin2 size=7 style="width: 47%;">
			</div>
		</div>
		<div style="margin-top: 10px;">
			<div class="head">이메일</div>
			<div style="width: 350px; text-align: center;">
				<input type="text" name="email1" style="width: 46%;"> @ 
				<select name="email2" style="width: 46%; height: 40px; font-size: 16px; border-radius: 10px; vertical-align: middle;">
					<option value="naver.com" selected>naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
				</select>
			</div>
		</div>
		<div style="margin-top: 10px;">
			<div class="head">휴대폰번호</div>
			<div style="width: 350px; text-align: center;">
				<select name=hp1 style="width: 29%; height: 40px; font-size: 16px; border-radius: 10px;">
					<option value="010" selected>010
					<option value="011">011
					<option value="016">016
					<option value="017">017
					<option value="018">018
					<option value="019">019
				</select> -
				<input type=text name=hp2 size=4 style="width: 30%;"> - <input type=text name=hp3 size=4 style="width: 30%;">
			</div>
		</div>
		<div style="margin-top: 10px;">
			<div class="head">성별</div>
			<label><input type=radio name=gender value="남" checked>남</label>
			<label><input type=radio name=gender value="여">여</label>
		</div>
		<div style="margin-top: 10px;">
			<div class="head">선호하는 장르</div>
			<label><input type="checkbox" name="favoriteGenre" value="액션">액션</label>&nbsp;</label>
			<label><input type="checkbox" name="favoriteGenre" value="드라마">드라마</label>&nbsp;
			<label><input type="checkbox" name="favoriteGenre" value="코미디">코미디</label>&nbsp;
			<label><input type="checkbox" name="favoriteGenre" value="범죄">범죄</label>&nbsp;
			<label><input type="checkbox" name="favoriteGenre" value="판타지">판타지</label>&nbsp;
		</div>
		<div style="margin-top: 10px; width: 350px; text-align: center;">
			<input type=button value="회원가입" onClick="checkValue()" style="width: 48%;">  
			<input type=reset value="취    소" style="width: 48%; border: 0px;">
		</div>
	</div>
</form>
</body>
</html>