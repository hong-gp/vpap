<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>로그인 처리/판별</title>
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
<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">
<div class="nav">
	<a href="index.html">VPAP</a>
	<a href="login.jsp">로그인</a>
	<a href="insertMember.jsp">회원가입</a>
	<a href="category.jsp">카테고리</a>
</div>
<%
 	 String DB_URL="jdbc:mysql://localhost:3306/vpap";
     String DB_ID="root"; 
     String DB_PASSWORD="1234";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

    String id = request.getParameter("id");
    String password = request.getParameter("password");

    String jsql = "select * from manager where managerID = ? "; 
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, id);

    ResultSet rs = pstmt.executeQuery(); 

    if( rs.next() )
    {
        if (password.equals(rs.getString("managerPassword")))
        {
             session.setAttribute("sid", id);

             response.sendRedirect("manager_index.jsp");
		 } else {
%>
<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
	<div class="head" style="font-weight: bold; text-align: center;">입력하신 정보가 틀렸습니다!</div>
	<br>
	<div class="body" style="background-color: #333; padding: 10px 20px; border-radius: 10px;">
		<p>비밀번호가 잘못 되었습니다. 다시 확인해 주세요!</p>
		<p>로그인 페이지로 돌아가시려면 <a href="manager_login.jsp">로그인</a>을 클릭하세요</p>
		<p>메인페이지로 가시려면 <a href="index.html">메인페이지</a>를 클릭하세요</p>
	<div>
</div>
<%       
        }
    } else {
 %>
<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
	<div class="head" style="font-weight: bold; text-align: center;">입력하신 정보가 틀렸습니다!</div>
	<br>
	<div class="body" style="background-color: #333; padding: 10px 20px; border-radius: 10px;">
		<p>아이디가 존재하지 않습니다. 다시 확인해 주세요!</p>
		<p>로그인 페이지로 돌아가시려면 <a href="manager_login.jsp">로그인</a>을 클릭하세요</p>
		<p>메인페이지로 가시려면 <a href="index.html">메인페이지</a>를 클릭하세요</p>
	<div>
</div>
<%
   }
%>

</body>
</html>

