<%@ page contentType = "text/html; charset=euc-kr" %>
<html>
<head>
	<title>���̵� ã��</title>
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
	<a href="login.jsp">�α���</a>
	<a href="insertMember.jsp">ȸ������</a>
	<a href="category.jsp">ī�װ�</a>
</div>
<form method="post" action = "passwordOk.jsp">
	<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
		<div class="head" style="font-weight: bold; text-align: center;">��й�ȣ ã��</div><br>
		<div>
			<div class="head">���̵�</div>
			<input type="text" name="id" style="width: 350px;">
		</div>
		<div style="margin-top: 10px;">
			<div class="head">�̸�</div>
			<input type="text" name="name" style="width: 350px;">
		</div>
		<div style="margin-top: 10px;">
			<div class="head">�ֹε�Ϲ�ȣ</div>
			<div style="width: 350px; text-align: center;">
				<input type="text" name="joomin1" size="7" maxlength="6" style="width: 47%;"> -
				<input type="password" name="joomin2" size="7" maxlength="7" style="width: 47%;">
			</div>
		</div>
		<br>
		<input type="submit" value="��й�ȣ ã��" style="width: 100%; font-weight: bold;">
	</div>
</form>
</body>
</html>