<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "java.sql.*" %>
<html>
<head>
	<title>��ǰ ���̺� ���� ����</title>
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
	 String conDate = rs.getString("conDate");
	 String desc = rs.getString("conDesc");
%>

<font color="white" size='6'><b>��ϵ� ������ ���� ����</b></font><p>
<h4> ������ ���� ��ϵ� ���������� ������ �����Ͻðڽ��ϱ�?</h4>
<table border="2" cellpadding="10" style="font-size:10pt;font-family:���� ���">
		<tr>
			<td>��ȣ</td>
			<td><%=no%></td>
			<td rowspan="11"><img src="./images/contents/<%=no%>.jpeg" width="400px"></td>
	    </tr>
		<tr>
			<td>����</td>
			<td><%=title%></td>
		</tr>
		<tr><td>����</td><td><%=price%> ��</td></tr>
		<tr><td>ī�װ�</td><td><%=category%></td></tr>
		<tr><td>�帣</td><td><%=genre%></td></tr>
		<tr><td>����</td><td><%=nation%></td></tr>
		<tr><td>��û���</td><td><%=rating%></td></tr>
		<tr><td>������¥</td><td><%=conDate%></td></tr>
		<tr><td>����</td><td style="white-space: pre-line;"><%=desc%></td></tr>
</table><p>
<a href="deleteContentsResult.jsp?conNo=<%=no%>" style="font-size:10pt;font-family:���� ���">����</a>&nbsp;&nbsp;&nbsp;
<a href="selectAllContents.jsp" style="font-size:10pt;font-family:���� ���">���</a>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</center>
</body>
</html>