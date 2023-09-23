<%@ page contentType="text/html;charset=euc-kr" %>
<html>
<head>
	<title>ȸ������</title>
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
	<a href="login.jsp">�α���</a>
	<a href="insertMember.jsp">ȸ������</a>
	<a href="category.jsp">ī�װ�</a>
</div>
<form name="newMem" method=post action=insertMemberResult.jsp>
	<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); margin-top: 20px;">
		<div class="head" style="font-weight: bold; text-align: center;">ȸ������</div>
		<div>
			<div class="head">���̵�</div>
			<div style="width: 350px; text-align: center;">
				<input type="text" name="id" style="width: 75%;">
				<a href="javascript:checkID()" style="text-decoration: none;">
					<button type="button" style="width: 23%; vertical-align: middle;">�ߺ�Ȯ��</span>
				</a>
			</div>
		</div>
		<div style="margin-top: 10px;">
			<div class="head">��й�ȣ</div>
			<input type="password" name="password" size=21>
		</div>
		<div style="margin-top: 10px;">
			<div class="head">����</div>
			<input type="text" name="name">
		</div>
		<div style="margin-top: 10px;">
			<div class="head">�ֹε�Ϲ�ȣ</div>
			<div style="width: 350px; text-align: center;">
				<input type=text name=joomin1 size=6 style="width: 47%;"> - <input type=password name=joomin2 size=7 style="width: 47%;">
			</div>
		</div>
		<div style="margin-top: 10px;">
			<div class="head">�̸���</div>
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
			<div class="head">�޴�����ȣ</div>
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
			<div class="head">����</div>
			<label><input type=radio name=gender value="��" checked>��</label>
			<label><input type=radio name=gender value="��">��</label>
		</div>
		<div style="margin-top: 10px;">
			<div class="head">��ȣ�ϴ� �帣</div>
			<label><input type="checkbox" name="favoriteGenre" value="�׼�">�׼�</label>&nbsp;</label>
			<label><input type="checkbox" name="favoriteGenre" value="���">���</label>&nbsp;
			<label><input type="checkbox" name="favoriteGenre" value="�ڹ̵�">�ڹ̵�</label>&nbsp;
			<label><input type="checkbox" name="favoriteGenre" value="����">����</label>&nbsp;
			<label><input type="checkbox" name="favoriteGenre" value="��Ÿ��">��Ÿ��</label>&nbsp;
		</div>
		<div style="margin-top: 10px; width: 350px; text-align: center;">
			<input type=button value="ȸ������" onClick="checkValue()" style="width: 48%;">  
			<input type=reset value="��    ��" style="width: 48%; border: 0px;">
		</div>
	</div>
</form>
</body>
</html>