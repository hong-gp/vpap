<%@ page contentType="text/html;charset=euc-kr" %>

<html>
<head>
<title>������ �α��� ���</title>
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
<h2> VPAP : ������ ��� </h2>
<p>���Ӱ����� ID : <%=id%></p>
<p>���� �ð� : <%=curDate %></p>
<a href="member.html"><b>ȸ�� ����</b></a><br><br>
<a href="contents.html"><b>������ ����</b></a>
<br><br><br><br><br>

<a href="logout.jsp" target=_parent  style="font-size:10pt;font-family:���� ���">������ �α׾ƿ�</a>
<br><br><br><br><br>

</center>
</body>
</html>