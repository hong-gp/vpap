<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>카테고리</title>
<link rel="stylesheet" href="./css/index.css">
<style>
	label {
		color: #ccc;
	}
</style>
</head>
<body>
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
<form method="post" action="viewContents.jsp" target="main">
	<div style="margin: 0 auto; width: 95%; margin-top: 10px;">
		<div style="margin-bottom: 15px; background-color: #333; display: inline-block; border-radius: 10px; padding: 10px;">
			<span>카테고리를 선택하세요.</span><br>
			<label><input type="radio" name="conCtg" value="영화" onClick="ctgCheck()" checked>영화</label>&nbsp;
			<label><input type="radio" name="conCtg" value="드라마" onClick="ctgCheck()">드라마</label>&nbsp;
		</div><br>

		<div style="margin-bottom: 15px; background-color: #333; display: inline-block; border-radius: 10px; padding: 10px;">
			<div id="movieGenre">
				<span>장르를 선택하세요.</span><br>
				<label><input type="checkbox" name="favoriteGenreMovie" value="액션" id="mgc">액션</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreMovie" value="드라마" id="mgc">드라마</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreMovie" value="코미디" id="mgc">코미디</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreMovie" value="범죄" id="mgc">범죄</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreMovie" value="판타지" id="mgc">판타지</label>&nbsp;
			</div>
			<div id="dramaGenre" style="display: none;">
				<span>장르를 선택하세요.</span><br>
				<label><input type="checkbox" name="favoriteGenreDrama" value="미스터리">미스터리</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="스릴러">스릴러</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="범죄">범죄</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="법정">법정</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="코미디">코미디</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="수사">수사</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="판타지">판타지</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="일상">일상</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="복수">복수</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="로맨틱코미디">로맨틱코미디</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="청춘">청춘</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="대학">대학</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="액션">액션</label>&nbsp;
			</div>
		</div>
		<br>
		<input type="submit" value="확 인" style="border: 0px; border-radius: 10px; padding: 5px 20px; font-weight: bold; cursor: hand;">
		<br>
	</div>
</form>
<center>
<hr style="background-color: white;">
<iframe src="main.jsp" id="iframe" frameborder="0" scrolling=auto name=main style="width: 100%; height: 60vh;"></iframe>
<center>
<script>
const mg = document.getElementById('movieGenre');
const dg = document.getElementById('dramaGenre');

var conCtg = document.getElementsByName('conCtg');
var conCtgChoice; // 여기에 선택된 radio 버튼의 값이 담기게 된다.

function ctgCheck() {
	for(var i=0; i<conCtg.length; i++) {
	if(conCtg[i].checked) {
		conCtgChoice = conCtg[i].value;
	}
}
	if (conCtgChoice == "영화")
	{
		mg.style.display = 'block';
		dg.style.display = 'none';
	}
	if (conCtgChoice == "드라마")
	{
		mg.style.display = 'none';
		dg.style.display = 'block';
	}
}
</script>
</body>
</html>
