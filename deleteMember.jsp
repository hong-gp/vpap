<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "java.sql.*" %>
<html>
<head>
	<title>ȸ�� ���� ����</title>
	<link rel="stylesheet" href="./css/index.css">
	<style>
		a {
			color: #0064FF;
		}
	</style>
</head>
<body><center>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/vpap";  
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	 String key = request.getParameter("id");
	
     String jsql = "select * from member where memId = ?";       
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1, key);

  	 ResultSet rs = pstmt.executeQuery();	
	 rs.next();

	 String id = rs.getString("memId");
	 String passwd =  rs.getString("memPassword");	
	 String name = rs.getString("memName");
 	 String joomin = rs.getString("memJoomin");
	 String email = rs.getString("memEmail");
	 String phone = rs.getString("memPhone");
	 String gender = rs.getString("memGender");
	 String fg = rs.getString("memFavoriteGenre");
%>

<font color="white" size='6'><b>ȸ�� ���� ����(Ż��) Ȯ��</b></font><p>
<br><br>
<h4>������ ȸ�������� �����Ͻðڽ��ϱ�?</h4>
<table border="2" cellpadding="10" style="font-size:10pt;font-family:���� ���">
		<tr><td width=100>���̵�</td><td width=200><%=id%></td></tr>
		<tr><td>��й�ȣ</td><td><%=passwd%></td></tr>
		<tr><td>����</td><td><%=name%></td></tr>
		<tr><td>�ֹε�Ϲ�ȣ</td><td><%=joomin%></td></tr>
		<tr><td>�̸���</td><td><%=email%></td></tr>
		<tr><td>�޴�����ȣ</td><td><%=phone%></td></tr>
		<tr><td>����</td><td><%=gender%></td></tr>
		<tr><td>��ȣ�ϴ� �帣</td><td><%=fg%></td></tr>
</table><p>

<a href="deleteMemberResult.jsp?id=<%=id%>" style="font-size:10pt;font-family:���� ���">����</a>&nbsp;&nbsp;
<a href="selectAllMember.jsp" style="font-size:10pt;font-family:���� ���">���</a>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</center>
</body>
</html>