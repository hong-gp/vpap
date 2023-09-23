<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "java.sql.*" %>
<html>
<head>
	<title>상품 테이블 내용 삭제</title>
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

<font color="white" size='6'><b>등록된 콘텐츠 정보 삭제</b></font><p>
<h4> 다음과 같이 등록된 콘텐츠정보 내용을 삭제하시겠습니까?</h4>
<table border="2" cellpadding="10" style="font-size:10pt;font-family:맑은 고딕">
		<tr>
			<td>번호</td>
			<td><%=no%></td>
			<td rowspan="11"><img src="./images/contents/<%=no%>.jpeg" width="400px"></td>
	    </tr>
		<tr>
			<td>제목</td>
			<td><%=title%></td>
		</tr>
		<tr><td>가격</td><td><%=price%> 원</td></tr>
		<tr><td>카테고리</td><td><%=category%></td></tr>
		<tr><td>장르</td><td><%=genre%></td></tr>
		<tr><td>국가</td><td><%=nation%></td></tr>
		<tr><td>시청등급</td><td><%=rating%></td></tr>
		<tr><td>개봉날짜</td><td><%=conDate%></td></tr>
		<tr><td>개요</td><td style="white-space: pre-line;"><%=desc%></td></tr>
</table><p>
<a href="deleteContentsResult.jsp?conNo=<%=no%>" style="font-size:10pt;font-family:맑은 고딕">삭제</a>&nbsp;&nbsp;&nbsp;
<a href="selectAllContents.jsp" style="font-size:10pt;font-family:맑은 고딕">취소</a>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</center>
</body>
</html>