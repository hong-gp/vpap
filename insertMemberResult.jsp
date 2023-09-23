<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<link rel="stylesheet" href="./css/index.css">
	<style>
		button:hover {
			background-color: #bbb;
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
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");   
	String password = request.getParameter("password");
	String name = request.getParameter("name");

	String joomin1 = request.getParameter("joomin1");
	String joomin2 = request.getParameter("joomin2");
	String joomin = joomin1 + "-" + joomin2;

	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email = email1 + "@" + email2;

	String hp1 = request.getParameter("hp1");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");
	String phone = hp1 + "-"+ hp2 + "-" + hp3;

	String gender = request.getParameter("gender");
			
	String[ ] favoriteGenre = request.getParameterValues("favoriteGenre");
	String favoriteGenreList = "";
	if(favoriteGenreList != null) 
	{
		for(int i=0;i<favoriteGenre.length;i++) 	
		{
			favoriteGenreList +=favoriteGenre[i];
			favoriteGenreList +="/";   // 문자열을 공백으로 초기화
		}
	}
	else
		favoriteGenreList = "선호하는 장르없음";

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/vpap";  
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String jsql = "INSERT INTO member (memId, memPassword, memName, ";
	 jsql = jsql + "memJoomin, memEmail, memPhone, memGender, memFavoriteGenre) VALUES (?,?,?,?,?,?,?,?)";	

	 PreparedStatement pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1, id);
	 pstmt.setString(2, password);
	 pstmt.setString(3, name);
	 pstmt.setString(4, joomin);
	 pstmt.setString(5, email);
	 pstmt.setString(6, phone);
	 pstmt.setString(7, gender);
	 pstmt.setString(8, favoriteGenreList);
	 pstmt.executeUpdate();
  } catch(Exception e) { 
		out.println(e);
}
%>
<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
	<div class="head" style="font-weight: bold;">축하합니다. 회원 가입 되었습니다!</div><br>
	<a href="login.jsp"><button type="button" style="cursor: hand; padding: 5px 20px; border-radius: 10px;"><b>로그인</b></button></a>
</div>
</body>
</html>