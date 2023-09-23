<%@ page contentType="text/html;charset=euc-kr" %>

<html>
<head>
<title>관리자 로그인 결과</title>
<link rel="stylesheet" href="./css/index.css">
<style>
	a {
		color: #0064FF;
	}
</style>
</head>
<body>
<center>
<%
	String id = (String)session.getAttribute("sid");    

	java.util.Date date = new java.util.Date();
	String curDate = date.toLocaleString();
 %>
<h2> VPAP : 관리자 모드 </h2>
<p>접속관리자 ID : <%=id%></p>
<p>접속 시각 : <%=curDate %></p>
<a href="member.html"><b>회원 관리</b></a><br><br>
<a href="contents.html"><b>콘텐츠 관리</b></a>
<br><br><br><br><br>

<a href="logout.jsp" target=_parent  style="font-size:10pt;font-family:맑은 고딕">관리자 로그아웃</a>
<br><br><br><br><br>

</center>
</body>
</html>