<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>마이페이지</title>
<link rel="stylesheet" href="./css/index.css">
 <style type="text/css">
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
<div style="width: 80%; margin: 20px auto;">
	<h2>마이페이지</h2>
	<a href="paymentContents.jsp" target="myContents">내가 구매한 콘텐츠</a><br>
	<a href="showWantContents.jsp" target="myContents">찜 한 콘텐츠</a><br>
	<a href="historyContents.jsp" target="myContents">시청한 콘텐츠</a>
</div>
<hr>
<center>
	<div>
		<iframe name="myContents" frameborder="0" style="width: 100%; height: 60vh;"></iframe>
	</div>
</center>
</body>
</html>
