<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %> 
<html>
<head>
	<title>������ ��� ó�� ���</title>
	<link rel="stylesheet" href="./css/index.css">
	<style>
		a {
			color: #0064FF;
		}
	</style>
</head>
<body>

<% 
	request.setCharacterEncoding("euc-kr");

	String no = request.getParameter("no");
	String title = request.getParameter("title");
	int price =  Integer.parseInt(request.getParameter("price"));
	String category = request.getParameter("category");
	String genre = request.getParameter("genre");
	String nation = request.getParameter("nation");
	String rating = request.getParameter("rating");
	String conDate = request.getParameter("conDate");
	String desc = request.getParameter("desc");

try {
	String DB_URL="jdbc:mysql://localhost:3306/vpap";
	String DB_ID="root";
	String DB_PASSWORD="1234";

	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
     
    String jsql = "INSERT INTO contents (conNo, conTitle, conPrice, conCtg, conGenre, ";
	jsql = jsql + "conNation, conRating, conPoint, conDate, conView, conDesc)  VALUES  (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; 
      
	PreparedStatement pstmt = con.prepareStatement(jsql); 

    pstmt.setString(1, no); 
	pstmt.setString(2, title); 
    pstmt.setInt(3, price);
	pstmt.setString(4, category);
	pstmt.setString(5, genre);
	pstmt.setString(6, nation);
	pstmt.setString(7, rating);
	pstmt.setDouble(8, 0);
	pstmt.setString(9, conDate);
	pstmt.setInt(10, 0);
	pstmt.setString(11, desc);
	pstmt.executeUpdate();
%>
<center>
<font color="white" size='6'><b>��ϵ� ������ ����</b></font><p>
	<table border="2" cellpadding="10"  style="font-size:10pt;font-family:���� ���">
		<tr>
			<td width="100">��ȣ</td>
			<td width="300"><%=no%></td>
		</tr>
		<tr>
			<td width="100">����</td>
			<td width="300"><%=title%></td>
		</tr>
		<tr>
			<td width="100">����</td>
			<td width="300"><%=price%> ��</td>
		</tr>
		<tr>
			<td width="100">ī�װ�</td>
			<td width="300"><%=category%></td>
		</tr>
		<tr>
			<td width="100">�帣</td>
			<td width="300"><%=genre%></td>
		</tr>
		<tr>
			<td width="100">����</td>
			<td width="300"><%=nation%></td>
		</tr>
		<tr>
			<td width="100">��û���</td>
			<td width="300"><%=rating%></td>
		</tr>
		<tr>
			<td width="100">������¥</td>
			<td width="300"><%=conDate%></td>
		</tr>
		<tr>
			<td width="100">����</td>
			<td width="300"><%=desc%></td>
		</tr>
	</table><p>
<% 
  } catch(Exception e) { 
		out.println(e);
}
%>
<p>
<a href = "selectAllContents.jsp" style="font-size:10pt;font-family:���� ���">��ü ��������� ��ȸ</a><br><br>
</center>
</body>
</html>