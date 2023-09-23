<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>������ �� ���� ��ȸ</title>
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

  	 String key = request.getParameter("conNo");

	 String jsql = "SELECT * FROM contents WHERE conNo = ?";   
     PreparedStatement  pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1, key);
	 
	 ResultSet rs = pstmt.executeQuery();
	 rs.next();

	 String no = rs.getString("conNo");
	 String title = rs.getString("conTitle");
	 int price = rs.getInt("conPrice");
	 String category = rs.getString("conCtg");
	 String genre = rs.getString("conGenre");
	 String nation = rs.getString("conNation");
	 String rating = rs.getString("conRating");
	 double point = rs.getDouble("conPoint");
	 String conDate = rs.getString("conDate");
	 int view = rs.getInt("conView");
	 String desc = rs.getString("conDesc");
%>

<font color="white" size='6'><b>��ǰ ������ ��ȸ</b></font><p>
<table border="1"  style="font-size:10pt;font-family:���� ���;">
		<tr>
			<td align=center>��ȣ</td>
			<td align=center><%=no%></td>
			<td rowspan="11"  align=center ><img src="./images/contents/<%=no%>.jpeg" width="400px"></td>
	    </tr>
		<tr>
			<td align=center>����</td>
			<td align=center><%=title%></td>
		</tr>
		<tr><td align=center>����</td><td align=center><%=price%> ��</td></tr>
		<tr><td align=center>ī�װ�</td><td align=center><%=category%></td></tr>
		<tr><td align=center>�帣</td><td align=center><%=genre%></td></tr>
		<tr><td align=center>����</td><td align=center><%=nation%></td></tr>
		<tr><td align=center>��û���</td><td align=center><%=rating%></td></tr>
		<tr><td align=center>����</td><td align=center><%=point%></td></tr>
		<tr><td align=center>������¥</td><td align=center><%=conDate%></td></tr>
		<tr><td align=center>��ȸ��</td><td align=center><%=view%></td></tr>
		<tr><td align=center>����</td><td style="white-space: pre-line;"><%=desc%></td></tr>
    </table><p>

<a href="updateContents.jsp?conNo=<%=no%>" align=center style="font-size:10pt;font-family:���� ���">����</a>
&nbsp;&nbsp;&nbsp;<a href="deleteContents.jsp?conNo=<%=no%>" align=center style="font-size:10pt;font-family:���� ���">����</a>
<br><br><br>

</center>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</body>
</html>

