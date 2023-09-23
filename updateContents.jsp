<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>콘텐츠 정보 수정</title>
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
 	String DB_URL="jdbc:mysql://localhost:3306/vpap";  //  접속할 DB명
    String DB_ID="root";  //  접속할 아이디
    String DB_PASSWORD="1234"; // 접속할 패스워드
 	 
	Class.forName("org.gjt.mm.mysql.Driver");  // JDBC 드라이버 로딩
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

 	String key = request.getParameter("conNo");

	String jsql = "SELECT * FROM contents WHERE conNo = ?";       
	PreparedStatement  pstmt  = con.prepareStatement(jsql);
	pstmt.setString(1, key);

	ResultSet rs = pstmt.executeQuery();//SQL문 실행	
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

<font color="white" size='6'><b>콘텐츠 정보 수정</b></font><p>
<form method="post" action="updateContentsResult.jsp">
<table border="2" cellpadding="10"  style="font-size:10pt;font-family:맑은 고딕">		
	<tr>
		<td>번호</td>
		<td><input type="hidden" name="no" value="<%=no%>"><%=no%></td>
		<td rowspan="11"><img src="./images/contents/<%=no%>.jpeg" width="400"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" value="<%=title%>"></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input type="text" name="price" value="<%=price%>"></td>
	</tr>
	<tr>
		<td>카테고리</td>
		<td><input type="text" name="category" value="<%=category%>"></td>
	</tr>
	<tr>
		<td>장르</td>
		<td><input type="text" name="genre" value="<%=genre%>"></td>
	</tr>
	<tr>
		<td>국가</td>
		<td><input type="text" name="nation" value="<%=nation%>"></td>
	</tr>
	<tr>
		<td>시청등급</td>
		<td><input type="text" name="rating" value="<%=rating%>"></td>
	</tr>
	<tr>
		<td>평점</td>
		<td><input type="text" name="point" value="<%=point%>"></td>
	</tr>
	<tr>
		<td>개봉날짜</td>
		<td><input type="text" name="conDate" value="<%=conDate%>"></td>
	</tr>
	<tr>
		<td>조회수</td>
		<td><input type="text" name="view" value="<%=view%>"></td>
	</tr>
	<tr>
		<td>개요</td>
		<td><textarea rows="30" cols="100" name="desc"><%=desc%></textarea></td>
	</tr>
</table><p> 
<br><br><br>

<input type="submit" value="수정완료">
</form>
<br><br><br>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</center>
</body>
</html>