<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>콘텐츠 테이블 내용 삭제 완료</title></head>
<body>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/vpap"; 
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	 String key = request.getParameter("conNo");
	 
     String jsql = "DELETE FROM contents WHERE conNo=?";        
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1, key);
	
 	 pstmt.executeUpdate();
%>
 <jsp:forward page="selectAllContents.jsp"/>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</body>
</html>