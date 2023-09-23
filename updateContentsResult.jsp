<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>������ ���� ���� ���</title>
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
	 request.setCharacterEncoding("euc-kr");
	
	 String no = request.getParameter("no");
	 String title = request.getParameter("title");
	 int price =  Integer.parseInt(request.getParameter("price"));
	 String category = request.getParameter("category");
	 String genre = request.getParameter("genre");
	 String nation = request.getParameter("nation");
	 String rating = request.getParameter("rating");
	 double point = Double.parseDouble(request.getParameter("point"));
	 String conDate = request.getParameter("conDate");
	 int view = Integer.parseInt(request.getParameter("view"));
	 String desc = request.getParameter("desc");

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/vpap";  //  ������ DB��
     String DB_ID="root";  //  ������ ���̵�
     String DB_PASSWORD="1234"; // ������ �н�����
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  // JDBC ����̹� �ε�
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	 String jsql = "UPDATE contents SET conTitle=?, conPrice=?, conCtg=?, conGenre=?, conNation=?, conRating=?, ";
     jsql = jsql + "conPoint=?, conDate=?, conView=?, conDesc=? WHERE conNo=?";  
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, title);
	pstmt.setInt(2, price);
	pstmt.setString(3, category);
	pstmt.setString(4, genre);
	pstmt.setString(5, nation);
	pstmt.setString(6, rating);
	pstmt.setDouble(7, point);
	pstmt.setString(8, conDate);
	pstmt.setInt(9, view);
	pstmt.setString(10, desc);
	pstmt.setString(11, no);

     pstmt.executeUpdate();  

	 String jsql2 =  "SELECT * FROM contents WHERE conNo=?";  	 
	 PreparedStatement  pstmt2 = con.prepareStatement(jsql2);
	 pstmt2.setString(1, no);

	 ResultSet rs = pstmt2.executeQuery();
     rs.next();
%>

<font color="white" size='6'><b> ������ ��ǰ������ ������ �����ϴ�.</b></font><p>
<table border="2" cellpadding="10" style="font-size:10pt;font-family:���� ���">
		<tr><td>��ȣ</td><td><%=rs.getString("conNo")%></td></tr>
		<tr><td>����</td><td><%=rs.getString("conTitle")%></td></tr>
		<tr><td>����</td><td><%=rs.getInt("conPrice")%> ��</td></tr>
		<tr><td>ī�װ�</td><td><%=rs.getString("conCtg")%></td></tr>
		<tr><td>�帣</td><td><%=rs.getString("conGenre")%></td></tr>		
		<tr><td>����</td><td><%=rs.getString("conNation")%></td></tr>
		<tr><td>��û���</td><td><%=rs.getString("conRating")%></td></tr>
		<tr><td>����</td><td><%=rs.getDouble("conPoint")%></td></tr>
		<tr><td>������¥</td><td><%=rs.getString("conDate")%></td></tr>
		<tr><td>��ȸ��</td><td><%=rs.getInt("conView")%></td></tr>
		<tr><td>����</td><td style="white-space: pre-line;"><%=rs.getString("conDesc")%></td></tr>
</table><p>
<a href="selectAllContents.jsp" align=center style="font-size:10pt;font-family:���� ���">��ü ��������� ��ȸ</a>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</center>
</body>
</html>