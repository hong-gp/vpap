<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>찜 한 콘텐츠</title>
	<link rel="stylesheet" href="./css/index.css">
</head>
<body>
<center>
	<br><br>
	<font color="white" size='5'><b>찜 한 콘텐츠</b></font><p><br>
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
		<p style="color: #fff;">찜 한 콘텐츠가 없습니다.</p>
<%
	} else {
%>
	<table border=0  style="font-size:10pt;font-family:맑은 고딕">
	<tr>
		<td align=center width=100 height=30><font size=2><b>번호</b></font></td>
		<td align=center width=350 height=30><font size=2><b>제목</b></font></td>
		<td align=center width=100 height=30><font size=2><b>카테고리</b></font></td>
		<td align=center width=200 height=30><font size=2><b>장르</b></font></td>
		<td align=center width=80 height=30><font size=2><b>국가</b></font></td>
		<td align=center width=100 height=30><font size=2><b>시청등급</b></font></td>
		<td align=center width=80 height=30><font size=2><b>평점</b></font></td>
		<td align=center width=80 height=30><font size=2><b>개봉날짜</b></font></td>
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