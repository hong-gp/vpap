<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>��й�ȣ ã�� ���</title>
<link rel="stylesheet" href="./css/index.css">
<style type="text/css">
	.head {
		font-size: 20px;
	}
	.body a {
		color: #0064FF;
		font-weight: bold;
	}
	.body a:hover {
		color: #0064cc;
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
<% 
try {
	request.setCharacterEncoding("euc-kr");
 	 String DB_URL="jdbc:mysql://localhost:3306/vpap";
     String DB_ID="root"; 
     String DB_PASSWORD="1234";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	 
	 String id = request.getParameter("id");
	 String name = request.getParameter("name");            
	 String joomin1 = request.getParameter("joomin1");
	 String joomin2 = request.getParameter("joomin2");
	 String joomin = joomin1 + "-" + joomin2;
	  
	 String jsql = "select memPassword from member where memId = ? and memName = ? and memJoomin = ?"; 
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1, id);
	 pstmt.setString(2, name);
	 pstmt.setString(3, joomin);
	 ResultSet rs = pstmt.executeQuery(); 

if(rs.next()) {
%>
<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
	<div class="head" style="font-weight: bold; text-align: center;">��й�ȣ ã��</div>
	<br>
	<div class="body" style="background-color: #333; padding: 10px 20px; border-radius: 10px;">
		<p>
			ȸ������ ��й�ȣ�� 
			<font style="color: #0064FF;"><b><%=rs.getString("memPassword")%></b></font> �Դϴ�.
		</p>
		<p>�α��� �������� ���÷��� <a href="login.jsp">�α���</a>�� Ŭ���ϼ���</p> 
	<div>
</div>
<%
} else {
%>
<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
	<div class="head" style="font-weight: bold; text-align: center;">�Է��Ͻ� ������ Ʋ�Ƚ��ϴ�!</div>
	<br>
	<div class="body" style="background-color: #333; padding: 10px 20px; border-radius: 10px;">
		<p>�Է��Ͻ������� �ٽ� Ȯ�� ���ּ���!</p>
		<p>���� �������� ���ư��÷��� <a href="passwordFind.jsp">�ڷΰ���</a>�� Ŭ���ϼ���</p>
		<p>ȸ������ �������� ���÷��� <a href="insertMember.jsp">ȸ������</a>�� Ŭ���ϼ���</p>
		<p>Ȩ������ �������� ���÷��� <a href="index.html">Ȩ������</a>�� Ŭ���ϼ���</p> 
	<div>
</div>
<%
    } 
}
catch (Exception e) {
    out.println(e);
}
%>
</body>
</html>