<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>콘텐츠 테이블 내용 조회</title>
	<link rel="stylesheet" href="./css/index.css">
	<style>
		a {
			color: #0064FF;
		}
	</style>
</head>
<body>
<center>
<font color="white" size='6'><b>전체 등록콘텐츠 조회</b></font><p>
<table border="1" width=1000 style="font-size:10pt;font-family:맑은 고딕">
	<tr>
		<td align=center>번호</td>
		<td align=center>제목</td>
		<td align=center>가격</td>
		<td align=center>카테고리</td>
		<td align=center>장르</td>
		<td align=center>국가</td>
		<td align=center>시청등급</td>
		<td align=center>개봉날짜</td>
		<td align=center><b><font style="color: #0064FF">수정</font></b></td>
		<td align=center><b><font style="color: #0064FF">삭제</font></b></td>
	</tr>	

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/vpap";
     String DB_ID="root";
     String DB_PASSWORD="1234";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

     String jsql = "SELECT * FROM contents";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();

	while(rs.next()){
		String no = rs.getString("conNo");
		String title = rs.getString("conTitle");
		int price = rs.getInt("conPrice");
		String category = rs.getString("conCtg");
		String genre = rs.getString("conGenre");
		String nation = rs.getString("conNation");
		String rating = rs.getString("conRating");
		String conDate = rs.getString("conDate");
%>
<tr>      
	<td align="center"><a href="selectDetailContents.jsp?conNo=<%=no%>"><img src="./images/contents/<%=no%>.jpeg" width="90px" border=0></a></td>
	<td><%=title%></td>
	<td><%=price%></td>
	<td><%=category%></td>
	<td><%=genre%></td>
	<td><%=nation%></td>
	<td><%=rating%></td>
	<td><%=conDate%></td>
	<td><a href="updateContents.jsp?conNo=<%=no%>"><center>Yes</center></a></td>
	<td><a href="deleteContents.jsp?conNo=<%=no%>"><center>Yes</center></a></td>
</tr>
<%
	 }
%>
</table><p><br>
<a href="insertContents.jsp" align=center style="font-size:10pt;font-family:맑은 고딕">신규 콘텐츠 추가 등록</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
<a href="manager_index.jsp" style="font-size:10pt;font-family:맑은 고딕">관리자모드 메인페이지</a>
<br><br><br>
<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</body>
</html>