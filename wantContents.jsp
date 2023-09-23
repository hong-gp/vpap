<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<body>
<%
	request.setCharacterEncoding("euc-kr");

	String id = (String)session.getAttribute("sid");
	String no = request.getParameter("conNo");

	if (id == null) {
%>
	<script>
		const a = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?");
		if (a)
		{
			window.open("login.jsp", "_self");
		}
		else 
		{
			history.back();
		}
	</script>
<%
	}
	else {
		try {
			String DB_URL = "jdbc:mysql://localhost:3306/vpap";
			String DB_ID = "root";
			String DB_PASSWORD = "1234";

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

			String sql3 = "SELECT * FROM payment WHERE memId=? AND conNo=?";
			PreparedStatement pstmt3 = con.prepareStatement(sql3);
			pstmt3.setString(1, id);
			pstmt3.setString(2, no);
			ResultSet rs3 = pstmt3.executeQuery();
		
			if(rs3.next()) {
			out.println("<script>");
			out.println("alert('이미 구매한 콘텐츠입니다.')");
			out.println("history.back()");
			out.println("</script>");
			}
			else {
				String sql = "SELECT * FROM wantContents WHERE memId=? AND conNo=?";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, no);
				ResultSet rs = pstmt.executeQuery();
				if (rs.next()) {
					String sql2 = "DELETE FROM wantContents WHERE memId=? AND conNo=?";
					PreparedStatement pstmt2 = con.prepareStatement(sql2);
					pstmt2.setString(1, id);
					pstmt2.setString(2, no);
					pstmt2.executeUpdate();
				}
				else {
					String sql2 = "INSERT INTO wantContents (memId, conNo) VALUES (?, ?)";
					PreparedStatement pstmt2 = con.prepareStatement(sql2);
					pstmt2.setString(1, id);
					pstmt2.setString(2, no);
					pstmt2.executeUpdate();
				}
			response.sendRedirect("showWantContents.jsp");
			}
		} catch (Exception e) {
			out.println(e);
		}
	}
%>
</body>
</html>