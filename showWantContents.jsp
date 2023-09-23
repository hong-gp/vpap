<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>�� �� ������</title>
	<link rel="stylesheet" href="./css/index.css">
</head>
<body>
<center>
	<br><br>
	<font color="white" size='5'><b>�� �� ������</b></font><p><br>
	<hr style="width:75%;">
<%
try {
	String id = (String)session.getAttribute("sid");

	String DB_URL = "jdbc:mysql://localhost:3306/vpap";
	String DB_ID = "root";
	String DB_PASSWORD = "1234";

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String sql = "SELECT * FROM wantContents WHERE memId=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();

	if (!rs.next()) {
%>
		<p style="color: #fff;">�� �� �������� �����ϴ�.</p>
<%
	} else {
%>
	<table border=0  style="font-size:10pt;font-family:���� ���">
	<tr>
		<td align=center width=100 height=30><font size=2><b>��ȣ</b></font></td>
		<td align=center width=350 height=30><font size=2><b>����</b></font></td>
		<td align=center width=100 height=30><font size=2><b>ī�װ�</b></font></td>
		<td align=center width=200 height=30><font size=2><b>�帣</b></font></td>
		<td align=center width=80 height=30><font size=2><b>����</b></font></td>
		<td align=center width=100 height=30><font size=2><b>��û���</b></font></td>
		<td align=center width=80 height=30><font size=2><b>����</b></font></td>
		<td align=center width=80 height=30><font size=2><b>������¥</b></font></td>
	</tr>
	<tr>
		<td colspan=8> <hr></td>
	</tr>
<%
		String sql2 = "SELECT conNo FROM wantContents WHERE memId=?";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		pstmt2.setString(1, id);
		ResultSet rs2 = pstmt2.executeQuery();

		while(rs2.next()) {
			String conNo = rs2.getString("conNo");

			String sql3 = "SELECT * FROM contents WHERE conNo=?";
			PreparedStatement pstmt3 = con.prepareStatement(sql3);
			pstmt3.setString(1, conNo);
			ResultSet rs3 = pstmt3.executeQuery();
			rs3.next();

			String no = rs3.getString("conNo");
			String title =  rs3.getString("conTitle");	
			String ctg =  rs3.getString("conCtg");
			String genre = rs3.getString("conGenre");
			String nation =  rs3.getString("conNation");
			String rating =  rs3.getString("conRating");
			double point =  rs3.getDouble("conPoint");
			String date =  rs3.getString("conDate");
%>
   <tr>
		<td align=center><a href="viewDetailContents.jsp?conNo=<%=no%>" target="_parent"><img src="images/contents/<%=no%>.jpeg" style="width:90px;"></a></td>
		<td align=center><%=title%></td>
		<td align=center><%=ctg%></td>
		<td align=center><%=genre%></td>
		<td align=center><%=nation%></td>
		<td align=center><%=rating%></td>
		<td align=center><%=point%></td>
		<td align=center><%=date%></td>
</tr>
<%
		}
	}
} catch (Exception e) {
	out.println(e);
}
%>
    </table>
	<hr style="width:75%;">
</center>
</body>
</html>