<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>ī�װ�</title>
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
<form method="post" action="viewContents.jsp" target="main">
	<div style="margin: 0 auto; width: 95%; margin-top: 10px;">
		<div style="margin-bottom: 15px; background-color: #333; display: inline-block; border-radius: 10px; padding: 10px;">
			<span>ī�װ��� �����ϼ���.</span><br>
			<label><input type="radio" name="conCtg" value="��ȭ" onClick="ctgCheck()" checked>��ȭ</label>&nbsp;
			<label><input type="radio" name="conCtg" value="���" onClick="ctgCheck()">���</label>&nbsp;
		</div><br>

		<div style="margin-bottom: 15px; background-color: #333; display: inline-block; border-radius: 10px; padding: 10px;">
			<div id="movieGenre">
				<span>�帣�� �����ϼ���.</span><br>
				<label><input type="checkbox" name="favoriteGenreMovie" value="�׼�" id="mgc">�׼�</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreMovie" value="���" id="mgc">���</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreMovie" value="�ڹ̵�" id="mgc">�ڹ̵�</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreMovie" value="����" id="mgc">����</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreMovie" value="��Ÿ��" id="mgc">��Ÿ��</label>&nbsp;
			</div>
			<div id="dramaGenre" style="display: none;">
				<span>�帣�� �����ϼ���.</span><br>
				<label><input type="checkbox" name="favoriteGenreDrama" value="�̽��͸�">�̽��͸�</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="������">������</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="����">����</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="����">����</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="�ڹ̵�">�ڹ̵�</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="����">����</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="��Ÿ��">��Ÿ��</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="�ϻ�">�ϻ�</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="����">����</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="�θ�ƽ�ڹ̵�">�θ�ƽ�ڹ̵�</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="û��">û��</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="����">����</label>&nbsp;
				<label><input type="checkbox" name="favoriteGenreDrama" value="�׼�">�׼�</label>&nbsp;
			</div>
		</div>
		<br>
		<input type="submit" value="Ȯ ��" style="border: 0px; border-radius: 10px; padding: 5px 20px; font-weight: bold; cursor: hand;">
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
var conCtgChoice; // ���⿡ ���õ� radio ��ư�� ���� ���� �ȴ�.

function ctgCheck() {
	for(var i=0; i<conCtg.length; i++) {
	if(conCtg[i].checked) {
		conCtgChoice = conCtg[i].value;
	}
}
	if (conCtgChoice == "��ȭ")
	{
		mg.style.display = 'block';
		dg.style.display = 'none';
	}
	if (conCtgChoice == "���")
	{
		mg.style.display = 'none';
		dg.style.display = 'block';
	}
}
</script>
</body>
</html>
