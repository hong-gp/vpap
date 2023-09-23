<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>콘텐츠 조회</title>
<link rel="stylesheet" href="./css/index.css">
 <style type="text/css">
     a:link { text-decoration: none; color: black; }           <!-- 클릭하기전의 설정은 선없고 검정색 -->
     a:visited { text-decoration: none; color: black; }     <!-- 방문한뒤의 설정은 밑줄없고 검정 -->
     a:hover { text-decoration: underline; color:blue; } <!-- 마우스가 올라갈때 설정은 아랫줄있고 파랑 -->
 </style>
</head>

<body>
<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/vpap";    //  접속DB명은 project임에 유의!
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	request.setCharacterEncoding("euc-kr");
	//  category별(그룹별) 상품조회를 위해서,  index.html  or  index.jsp로부터 
	//  조회하고자하는 특정 ctgType값을 넘겨 받아옴
	String conCtg = request.getParameter("conCtg");
	String[] conGenre;

    if (conCtg.equals("영화")) {
		conGenre = request.getParameterValues("favoriteGenreMovie");
	}
	else if (conCtg.equals("드라마")) {
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
		conGenreList = "장르 없음";

	String jsql;
	PreparedStatement pstmt;

	if(conGenreList != "장르 없음") {
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
	<table border=0  style="font-size:10pt;font-family:맑은 고딕">
	<tr>
		<td colspan=8> <hr></td>
	</tr>
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
		}   //  while문의 끝
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
