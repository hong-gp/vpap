<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>비밀번호 찾기 결과</title>
<link rel="stylesheet" href="./css/index.css">
<style type="text/css">
	.head {
		font-size: 20px;
	}
	.body a {
		color: #0064FF;
		font-weight: bold;
	}
	.body a:hover {
		color: #0064cc;
	}
</style>
</head>
<body>
<div class="nav">
	<a href="index.html">VPAP</a>
	<a href="login.jsp">로그인</a>
	<a href="insertMember.jsp">회원가입</a>
	<a href="category.jsp">카테고리</a>
</div>
<% 
try {
	request.setCharacterEncoding("euc-kr");
 	 String DB_URL="jdbc:mysql://localhost:3306/vpap";
     String DB_ID="root"; 
     String DB_PASSWORD="1234";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	 
	 String id = request.getParameter("id");
	 String name = request.getParameter("name");            
	 String joomin1 = request.getParameter("joomin1");
	 String joomin2 = request.getParameter("joomin2");
	 String joomin = joomin1 + "-" + joomin2;
	  
	 String jsql = "select memPassword from member where memId = ? and memName = ? and memJoomin = ?"; 
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1, id);
	 pstmt.setString(2, name);
	 pstmt.setString(3, joomin);
	 ResultSet rs = pstmt.executeQuery(); 

if(rs.next()) {
%>
<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
	<div class="head" style="font-weight: bold; text-align: center;">비밀번호 찾기</div>
	<br>
	<div class="body" style="background-color: #333; padding: 10px 20px; border-radius: 10px;">
		<p>
			회원님의 비밀번호는 
			<font style="color: #0064FF;"><b><%=rs.getString("memPassword")%></b></font> 입니다.
		</p>
		<p>로그인 페이지로 가시려면 <a href="login.jsp">로그인</a>을 클릭하세요</p> 
	<div>
</div>
<%
} else {
%>
<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
	<div class="head" style="font-weight: bold; text-align: center;">입력하신 정보가 틀렸습니다!</div>
	<br>
	<div class="body" style="background-color: #333; padding: 10px 20px; border-radius: 10px;">
		<p>입력하신정보를 다시 확인 해주세요!</p>
		<p>이전 페이지로 돌아가시려면 <a href="passwordFind.jsp">뒤로가기</a>를 클릭하세요</p>
		<p>회원가입 페이지로 가시려면 <a href="insertMember.jsp">회원가입</a>을 클릭하세요</p>
		<p>홈페이지 페이지로 가시려면 <a href="index.html">홈페이지</a>를 클릭하세요</p> 
	<div>
</div>
<%
    } 
}
catch (Exception e) {
    out.println(e);
}
%>
</body>
</html>