<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<body>
<%
	request.setCharacterEncoding("euc-kr");

	String id = (String)session.getAttribute("sid");
	String no = request.getParameter("conNo");
	double point = Double.parseDouble(request.getParameter("point"));

	try {
		String DB_URL = "jdbc:mysql://localhost:3306/vpap";
		String DB_ID = "root";
		String DB_PASSWORD = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

		String sql = "SELECT * FROM payment WHERE memId= ? AND conNo=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, no);
		ResultSet rs = pstmt.executeQuery();
		if(!rs.next()) {
%>
			<script>
				alert("콘텐츠를 구매해야 합니다.");
				history.back();
			</script>
<%
		}
		else {
		String sql2 = "SELECT * FROM point WHERE memId= ? AND conNo=?";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		pstmt2.setString(1, id);
		pstmt2.setString(2, no);
		ResultSet rs2 = pstmt2.executeQuery();
		if(rs2.next()) {
			String sql3 = "UPDATE point SET conPoint=? WHERE memId=? AND conNo=?";
			PreparedStatement pstmt3 = con.prepareStatement(sql3);
			pstmt3.setDouble(1, point);
			pstmt3.setString(2, id);
			pstmt3.setString(3, no);
			pstmt3.executeUpdate();
		}
		else {
			String sql3 = "INSERT INTO point (memId, conNo, conPoint) VALUES (?, ?, ?)";
			PreparedStatement pstmt3 = con.prepareStatement(sql3);
			pstmt3.setString(1, id);
			pstmt3.setString(2, no);
			pstmt3.setDouble(3, point);
			pstmt3.executeUpdate();
		}

		double totalPoint = 0;
		int count = 0;

		String sql4 = "SELECT * FROM point WHERE conNo=?";
		PreparedStatement pstmt4 = con.prepareStatement(sql4);
		pstmt4.setString(1, no);
		ResultSet rs4 = pstmt4.executeQuery();
		while(rs4.next()) {
			totalPoint += rs4.getDouble("conPoint");
			count += 1;
		}
		double resultPoint = totalPoint / count;

		String sql5 = "UPDATE contents SET conPoint=? WHERE conNo=?";
		PreparedStatement pstmt5 = con.prepareStatement(sql5);
		pstmt5.setDouble(1, resultPoint);
		pstmt5.setString(2, no);
		pstmt5.executeUpdate();
%>
<script>
	alert("평점을 줬습니다.");
	history.back();
</script>
<%
		}
	} catch (Exception e) {
		out.println(e);
	}
%>
</body>
</html>