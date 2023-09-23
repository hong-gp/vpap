<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>콘텐츠 상세 정보 조회</title>
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

<font color="white" size='6'><b>상품 상세정보 조회</b></font><p>
<table border="1"  style="font-size:10pt;font-family:맑은 고딕;">
		<tr>
			<td align=center>번호</td>
			<td align=center><%=no%></td>
			<td rowspan="11"  align=center ><img src="./images/contents/<%=no%>.jpeg" width="400px"></td>
	    </tr>
		<tr>
			<td align=center>제목</td>
			<td align=center><%=title%></td>
		</tr>
		<tr><td align=center>가격</td><td align=center><%=price%> 원</td></tr>
		<tr><td align=center>카테고리</td><td align=center><%=category%></td></tr>
		<tr><td align=center>장르</td><td align=center><%=genre%></td></tr>
		<tr><td align=center>국가</td><td align=center><%=nation%></td></tr>
		<tr><td align=center>시청등급</td><td align=center><%=rating%></td></tr>
		<tr><td align=center>평점</td><td align=center><%=point%></td></tr>
		<tr><td align=center>개봉날짜</td><td align=center><%=conDate%></td></tr>
		<tr><td align=center>조회수</td><td align=center><%=view%></td></tr>
		<tr><td align=center>개요</td><td style="white-space: pre-line;"><%=desc%></td></tr>
    </table><p>

<a href="updateContents.jsp?conNo=<%=no%>" align=center style="font-size:10pt;font-family:맑은 고딕">수정</a>
&nbsp;&nbsp;&nbsp;<a href="deleteContents.jsp?conNo=<%=no%>" align=center style="font-size:10pt;font-family:맑은 고딕">삭제</a>
<br><br><br>

</center>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</body>
</html>

