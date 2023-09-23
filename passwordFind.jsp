<%@ page contentType = "text/html; charset=euc-kr" %>
<html>
<head>
	<title>아이디 찾기</title>
	<link rel="stylesheet" href="./css/index.css">
	<style>
	.head {
		font-size: 20px;
	}
	input {
		font-size: 16px;
		height: 40px;
		border-radius: 10px;
		padding-left: 10px;
	}
	input[type="submit"] {
		font-size: 16px;
		width: 350px;
		height: 40px;
		border-radius: 10px;
		cursor: hand;
	}
	input[type="submit"]:hover {
		background-color: #bbb;
	}
	a {
		color: #ccc;
		text-decoration: none;
	}
	a:hover {
		color: #fff;
	}
</style>
</head>
<body>
<div class="nav">
	<a href="index.html">VPAP</a>
	<a href="login.jsp">로그인</a>
	<a href="insertMember.jsp">회원가입</a>
	<a href="category.jsp">카테고리</a>
</div>
<form method="post" action = "passwordOk.jsp">
	<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
		<div class="head" style="font-weight: bold; text-align: center;">비밀번호 찾기</div><br>
		<div>
			<div class="head">아이디</div>
			<input type="text" name="id" style="width: 350px;">
		</div>
		<div style="margin-top: 10px;">
			<div class="head">이름</div>
			<input type="text" name="name" style="width: 350px;">
		</div>
		<div style="margin-top: 10px;">
			<div class="head">주민등록번호</div>
			<div style="width: 350px; text-align: center;">
				<input type="text" name="joomin1" size="7" maxlength="6" style="width: 47%;"> -
				<input type="password" name="joomin2" size="7" maxlength="7" style="width: 47%;">
			</div>
		</div>
		<br>
		<input type="submit" value="비밀번호 찾기" style="width: 100%; font-weight: bold;">
	</div>
</form>
</body>
</html>