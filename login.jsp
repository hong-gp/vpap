<%@ page contentType="text/html;charset=euc-kr" %>
<html>
<head>
	<title>로그인</title>
	<link rel="stylesheet" href="./css/index.css">
<style>
	.head {
		font-size: 20px;
	}
	input {
		font-size: 16px;
		width: 350px;
		height: 40px;
		border-radius: 10px;
		padding-left: 10px;
	}
	button {
		font-size: 16px;
		width: 350px;
		height: 40px;
		border-radius: 10px;
		cursor: hand;
	}
	button:hover {
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
<script language="javascript" src="js.js"></script>
<body onLoad="login_focus()">
<%
	String id = (String)session.getAttribute("sid");

	if(id == null) {
%>
<div class="nav">
	<a href="index.html">VPAP</a>
	<a href="login.jsp">로그인</a>
	<a href="insertMember.jsp">회원가입</a>
	<a href="category.jsp">카테고리</a>
</div>
<%
	}
	else {
%>
<div class="nav">
	<a href="index.jsp">VPAP</a>
	<a href="logout.jsp">로그아웃</a>
	<a href="category.jsp">카테고리</a>
	<a href="mypage.jsp">마이페이지</a>
</div>
<%
	}
%>
<form name="login" method="post" action="loginOK.jsp">
	<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
		<div class="head" style="font-weight: bold; text-align: center;">로그인</div><br>
		<div>
			<div class="head">아이디</div>
			<input type="text" name="id">
		</div>
		<div style="margin-top: 10px;">
			<div class="head">패스워드</div>
			<input type="password" name="password" onkeydown="onEnterSubmit()">
		</div>
		<br>
		<div>
			<a href="javascript:login_check()"><button type="button"><b>로그인</b></button></a>
		</div>
		<a href="idFind.jsp">아이디찾기</a>&nbsp;
		<a href="passwordFind.jsp">비밀번호찾기</a>&nbsp;
		<a href="insertMember.jsp" style="float: right;">회원가입</a>
	</div>
</form>                
</body>  
</html> 