<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>����������</title>
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
	<a href="login.jsp">�α���</a>
	<a href="insertMember.jsp">ȸ������</a>
	<a href="category.jsp">ī�װ�</a>
</div>
<%
	}
	else {
%>
<div class="nav">
	<a href="index.jsp">VPAP</a>
	<a href="logout.jsp">�α׾ƿ�</a>
	<a href="category.jsp">ī�װ�</a>
	<a href="mypage.jsp">����������</a>
</div>
<%
	}
%>
<div style="width: 80%; margin: 20px auto;">
	<h2>����������</h2>
	<a href="paymentContents.jsp" target="myContents">���� ������ ������</a><br>
	<a href="showWantContents.jsp" target="myContents">�� �� ������</a><br>
	<a href="historyContents.jsp" target="myContents">��û�� ������</a>
</div>
<hr>
<center>
	<div>
		<iframe name="myContents" frameborder="0" style="width: 100%; height: 60vh;"></iframe>
	</div>
</center>
</body>
</html>
