<%@ page contentType="text/html;charset=euc-kr" %>
<html>
<head>
	<title>������ ���</title>
	<link rel="stylesheet" href="./css/index.css">
	<style>
		a {
			color: #0064FF;
		}
	</style>
</head>
<body>
<center>
<font color="white" size="6"><b>������ ���</b></font>
<form method="post" action="insertContentsResult.jsp" >
<table border="2" cellpadding="10"  style="font-size:10pt;font-family:���� ���">
		<tr>
			<td>��ȣ</td>
			<td><input type="text" name="no"></td>
		</tr>
		<tr>
			<td>����</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td>����</td>
			<td><input type="text" name="price"></td>
		</tr>
		<tr>
			<td>ī�װ�</td>
			<td>
				<label><input type="radio" name="category" value="��ȭ"> ��ȭ </label>
				<label><input type="radio" name="category" value="���"> ��� </label>
			</td>
		</tr>
		<tr>
			<td>�帣</td>
			<td><input type="text" name="genre"></td>
		</tr>
		<tr>
			<td>����</td>
			<td><input type="text" name="nation"></td>
		</tr>
		<tr>
			<td>��û���</td>
			<td><input type="text" name="rating"></td>
		</tr>
		<tr>
			<td>������¥</td>
			<td><input type="text" name="conDate"></td>
		</tr>
		<tr>
			<td>����</td>
			<td><textarea name="desc" rows="30" cols="100"></textarea></td>
		</tr>
</table>
<p>
<input type="submit" value="�� ��">
<input type="reset" value="�� ��">
</form>
</center>
</body>
</html>

