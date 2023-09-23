<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<link rel="stylesheet" href="./css/index.css">
	<style>
		button:hover {
			background-color: #bbb;
	}
	</style>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");   
	String password = request.getParameter("password");
	String name = request.getParameter("name");

	String joomin1 = request.getParameter("joomin1");
	String joomin2 = request.getParameter("joomin2");
	String joomin = joomin1 + "-" + joomin2;

	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email = email1 + "@" + email2;

	String hp1 = request.getParameter("hp1");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");
	String phone = hp1 + "-"+ hp2 + "-" + hp3;

	String gender = request.getParameter("gender");
			
	String[] favoriteGenre = request.getParameterValues("favoriteGenre");
	String favoriteGenreList = "";
	if(favoriteGenreList != null) 
	{
		for(int i=0;i<favoriteGenre.length;i++)
		{
			favoriteGenreList +=favoriteGenre[i];
			favoriteGenreList +="/";   // ���ڿ��� �������� �ʱ�ȭ
		}
	}
	else
		favoriteGenreList = "��ȣ�ϴ� �帣����";

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/vpap";  
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String jsql = "UPDATE member SET memPassword=?, memName=?, ";
	 jsql = jsql + "memJoomin=?, memEmail=?, memPhone=?, memGender=?, memFavoriteGenre=? WHERE memId=?";	

	 PreparedStatement pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1, password);
	 pstmt.setString(2, name);
	 pstmt.setString(3, joomin);
	 pstmt.setString(4, email);
	 pstmt.setString(5, phone);
	 pstmt.setString(6, gender);
	 pstmt.setString(7, favoriteGenreList);
	 pstmt.setString(8, id);
	 pstmt.executeUpdate();

	String jsql2 = "select * from member where memId=?";
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1,id);

	ResultSet rs = pstmt2.executeQuery();
	rs.next();
%>
<center>
<br><br><br>
<font color="white" size='6'><b>������ ȸ�� ���� ����</b></font><p>
	<table border=1 cellpadding=5   style="font-size:10pt;font-family:���� ���">
		<tr>
			<td width=100>ID</td>
			<td width=300><%=rs.getString("memId")%></td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td><%=rs.getString("memPassword")%></td>
		</tr>
		<tr>
			<td>����</td>
			<td><%=rs.getString("memName")%></td>
		</tr>
		<tr>
			<td>�ֹι�ȣ</td>
			<td><%=rs.getString("memJoomin")%></td>
		</tr>
		<tr>
			<td>�̸���</td>
			<td><%=rs.getString("memEmail")%></td>
		</tr>
		<tr>
			<td>�޴�����ȣ</td>
			<td><%=rs.getString("memPhone")%></td>
		</tr>
		<tr>
			<td>����</td>
			<td><%=rs.getString("memGender")%></td>
		</tr>
		<tr>
			<td>��ȣ�ϴ� �帣</td>
			<td><%=rs.getString("memFavoriteGenre")%></td>
		</tr>
	</table>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
<p>
<a href="selectAllMember.jsp"><button type="button">Ȯ ��</button></a>
<br>
</center>
</body>
</html>