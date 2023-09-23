<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>������ ��ȸ</title>
<link rel="stylesheet" href="./css/index.css">
 <style type="text/css">
     a:link { text-decoration: none; color: black; }           <!-- Ŭ���ϱ����� ������ ������ ������ -->
     a:visited { text-decoration: none; color: black; }     <!-- �湮�ѵ��� ������ ���پ��� ���� -->
     a:hover { text-decoration: underline; color:blue; } <!-- ���콺�� �ö󰥶� ������ �Ʒ����ְ� �Ķ� -->
 </style>
</head>

<body>
<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/vpap";    //  ����DB���� project�ӿ� ����!
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	request.setCharacterEncoding("euc-kr");
	//  category��(�׷캰) ��ǰ��ȸ�� ���ؼ�,  index.html  or  index.jsp�κ��� 
	//  ��ȸ�ϰ����ϴ� Ư�� ctgType���� �Ѱ� �޾ƿ�
	String conCtg = request.getParameter("conCtg");
	String[] conGenre;

    if (conCtg.equals("��ȭ")) {
		conGenre = request.getParameterValues("favoriteGenreMovie");
	}
	else if (conCtg.equals("���")) {
		conGenre = request.getParameterValues("favoriteGenreDrama");
	}
	else {
		conGenre = request.getParameterValues("favoriteGenreAnime");
	}

	String conGenreList = "";
	if(conGenre != null)
	{
		for(int i=0; i<conGenre.length; i++)
		{
			conGenreList += conGenre[i];
		}
	}
	else
		conGenreList = "�帣 ����";

	String jsql;
	PreparedStatement pstmt;

	if(conGenreList != "�帣 ����") {
		jsql = "select * from contents where conCtg = ? ";
		for (int i=0; i<conGenre.length; i++) {
			jsql += "&& conGenre LIKE ? ";
		}
		pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, conCtg);
		for (int i=0; i<conGenre.length; i++) {
			pstmt.setString(i+2, "%" + conGenre[i] + "%");
		}
	}
	else {
		jsql = "select * from contents where conCtg = ?";
		pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, conCtg);
	}

	ResultSet rs = pstmt.executeQuery();
%>
  <center>
	<font color="#fff" size='5'><b><%=conCtg%></b></font><p><br>
	<table border=0  style="font-size:10pt;font-family:���� ���">
	<tr>
		<td colspan=8> <hr></td>
	</tr>
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
		while(rs.next()) {
			String no = rs.getString("conNo");
			String title =  rs.getString("conTitle");	
			String  ctg =  rs.getString("conCtg");
			String  genre = rs.getString("conGenre");
			String nation =  rs.getString("conNation");
			String rating =  rs.getString("conRating");
			double point =  rs.getDouble("conPoint");
			String date =  rs.getString("conDate");
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
		}   //  while���� ��
%>
	<tr>
		<td colspan=8> <hr></td>
	</tr>
    </table>
<%
    } catch (Exception e) {
        	out.println(e);
}
%>
</center>
</body>
</html>
