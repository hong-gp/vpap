<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>회원 테이블 내용 조회   </title>
<link rel="stylesheet" href="./css/index.css">
<style>
	a { color: #0064FF; }
</style>
</head>
<body>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/vpap"; 
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

     String jsql = "select * from member";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();
%>

<center>
<font color="white" size='6'><b>전체 회원 조회</b></font><p>
<table border="2" cellpadding="10" style="font-size:10pt;font-family:맑은 고딕">
	<tr>
		<td>ID</td>
		<td>비밀번호</td>
		<td>성명</td>
		<td>주민번호</td>
		<td>이메일</td>	
		<td>휴대폰번호</td>
		<td>성별</td>
		<td>선호하는 장르</td>
		<td><b>[수정]</b></td>
		<td><b>[삭제]</b></td>
	</tr>	

<%
		while(rs.next()){
			String id = rs.getString("memId");   //  다음 각 함수들의 인수들은 테이블의 각 필드명들임
    		String password =  rs.getString("memPassword");
			String name = rs.getString("memName");
    		String joomin =  rs.getString("memJoomin");	
			String email = rs.getString("memEmail");
    		String phone =  rs.getString("memPhone");	
			String gender = rs.getString("memGender");
			String fg = rs.getString("memFavoriteGenre");
%>
   <tr>                     <!--  상세정보를 나타낼 페이지 링크부분에 회원 아이디를 함께 넘겨줌 -->
 	  <td><%=id%></td>
      <td><%=password%></td>
	  <td><%=name%></td>
	  <td><%=joomin%></td>
	  <td><%=email%></td>	
 	  <td><%=phone%></td>
	  <td><%=gender%></td>
	  <td><%=fg%></td>
	  <td align=center><a href="updateMember.jsp?id=<%=id%>">Yes</a></td>
  	  <td align=center><a href="deleteMember.jsp?id=<%=id%>">Yes</a></td>
  </tr>
<%
		}  // while문의 끝
%>
</table><p>
<br>
<a href="manager_index.jsp" style="font-size:10pt;font-family:맑은 고딕">관리자모드 메인페이지</a>
<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</body>
</html>