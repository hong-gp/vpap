<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>���� ������ ������</title>
<link rel="stylesheet" href="./css/index.css">
 <style type="text/css">
     a:link { text-decoration: none; color: black; }           <!-- Ŭ���ϱ����� ������ ������ ������ -->
     a:visited { text-decoration: none; color: black; }     <!-- �湮�ѵ��� ������ ���پ��� ���� -->
     a:hover { text-decoration: underline; color:blue; } <!-- ���콺�� �ö󰥶� ������ �Ʒ����ְ� �Ķ� -->
 </style>
</head>

<body>
<center>
	<font color="white" size='5'><b>���� ������ ������</b></font><p><br>
	<hr style="width: 75%;">
<%
try {
	String id = (String)session.getAttribute("sid");

 	 String DB_URL="jdbc:mysql://localhost:3306/vpap";    //  ����DB���� project�ӿ� ����!
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	request.setCharacterEncoding("euc-kr");

	String jsql = "SELECT * FROM payment WHERE memId=?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	if(!rs.next()) {
%>
	<p style="color: #fff;">������ �������� �����ϴ�.</p>
<%
	}
	else {
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
		String conNo = rs.getString("conNo");

		String jsql2 = "SELECT * FROM payment WHERE memId=?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, id);
		ResultSet rs2 = pstmt2.executeQuery();
		while(rs2.next()) {
			String jsql3 = "SELECT * FROM contents WHERE conNo=?";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1, rs2.getString("conNo"));
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
   <tr style="color: #ccc;">
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
%>
    </table>
	<hr style="width: 75%;">
<%
	}
} catch (Exception e) {
	out.println(e);
}
%>
</center>
</body>
</html>
