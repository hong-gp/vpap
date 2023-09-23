<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "java.sql.*" %>
<html>
<head>
	<title>회원 정보 삭제</title>
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
	
	 String key = request.getParameter("id");
	
     String jsql = "select * from member where memId = ?";       
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1, key);

  	 ResultSet rs = pstmt.executeQuery();	
	 rs.next();

	 String id = rs.getString("memId");
	 String passwd =  rs.getString("memPassword");	
	 String name = rs.getString("memName");
 	 String joomin = rs.getString("memJoomin");
	 String email = rs.getString("memEmail");
	 String phone = rs.getString("memPhone");
	 String gender = rs.getString("memGender");
	 String fg = rs.getString("memFavoriteGenre");
%>

<font color="white" size='6'><b>회원 정보 삭제(탈퇴) 확인</b></font><p>
<br><br>
<h4>다음의 회원정보를 삭제하시겠습니까?</h4>
<table border="2" cellpadding="10" style="font-size:10pt;font-family:맑은 고딕">
		<tr><td width=100>아이디</td><td width=200><%=id%></td></tr>
		<tr><td>비밀번호</td><td><%=passwd%></td></tr>
		<tr><td>성명</td><td><%=name%></td></tr>
		<tr><td>주민등록번호</td><td><%=joomin%></td></tr>
		<tr><td>이메일</td><td><%=email%></td></tr>
		<tr><td>휴대폰번호</td><td><%=phone%></td></tr>
		<tr><td>성별</td><td><%=gender%></td></tr>
		<tr><td>선호하는 장르</td><td><%=fg%></td></tr>
</table><p>

<a href="deleteMemberResult.jsp?id=<%=id%>" style="font-size:10pt;font-family:맑은 고딕">삭제</a>&nbsp;&nbsp;
<a href="selectAllMember.jsp" style="font-size:10pt;font-family:맑은 고딕">취소</a>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</center>
</body>
</html>