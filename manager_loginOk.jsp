<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>�α��� ó��/�Ǻ�</title>
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
<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">
<div class="nav">
	<a href="index.html">VPAP</a>
	<a href="login.jsp">�α���</a>
	<a href="insertMember.jsp">ȸ������</a>
	<a href="category.jsp">ī�װ�</a>
</div>
<%
 	 String DB_URL="jdbc:mysql://localhost:3306/vpap";
     String DB_ID="root"; 
     String DB_PASSWORD="1234";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

    String id = request.getParameter("id");
    String password = request.getParameter("password");

    String jsql = "select * from manager where managerID = ? "; 
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, id);

    ResultSet rs = pstmt.executeQuery(); 

    if( rs.next() )
    {
        if (password.equals(rs.getString("managerPassword")))
        {
             session.setAttribute("sid", id);

             response.sendRedirect("manager_index.jsp");
		 } else {
%>
<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
	<div class="head" style="font-weight: bold; text-align: center;">�Է��Ͻ� ������ Ʋ�Ƚ��ϴ�!</div>
	<br>
	<div class="body" style="background-color: #333; padding: 10px 20px; border-radius: 10px;">
		<p>��й�ȣ�� �߸� �Ǿ����ϴ�. �ٽ� Ȯ���� �ּ���!</p>
		<p>�α��� �������� ���ư��÷��� <a href="manager_login.jsp">�α���</a>�� Ŭ���ϼ���</p>
		<p>������������ ���÷��� <a href="index.html">����������</a>�� Ŭ���ϼ���</p>
	<div>
</div>
<%       
        }
    } else {
 %>
<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
	<div class="head" style="font-weight: bold; text-align: center;">�Է��Ͻ� ������ Ʋ�Ƚ��ϴ�!</div>
	<br>
	<div class="body" style="background-color: #333; padding: 10px 20px; border-radius: 10px;">
		<p>���̵� �������� �ʽ��ϴ�. �ٽ� Ȯ���� �ּ���!</p>
		<p>�α��� �������� ���ư��÷��� <a href="manager_login.jsp">�α���</a>�� Ŭ���ϼ���</p>
		<p>������������ ���÷��� <a href="index.html">����������</a>�� Ŭ���ϼ���</p>
	<div>
</div>
<%
   }
%>

</body>
</html>

