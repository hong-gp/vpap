<%@ page contentType="text/html;charset=euc-kr" %>
<html>
<head>
	<title>�α���</title>
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
<form name="login" method="post" action="loginOK.jsp">
	<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
		<div class="head" style="font-weight: bold; text-align: center;">�α���</div><br>
		<div>
			<div class="head">���̵�</div>
			<input type="text" name="id">
		</div>
		<div style="margin-top: 10px;">
			<div class="head">�н�����</div>
			<input type="password" name="password" onkeydown="onEnterSubmit()">
		</div>
		<br>
		<div>
			<a href="javascript:login_check()"><button type="button"><b>�α���</b></button></a>
		</div>
		<a href="idFind.jsp">���̵�ã��</a>&nbsp;
		<a href="passwordFind.jsp">��й�ȣã��</a>&nbsp;
		<a href="insertMember.jsp" style="float: right;">ȸ������</a>
	</div>
</form>                
</body>  
</html> 