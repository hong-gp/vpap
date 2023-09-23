<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>시청</title>
	<link rel="stylesheet" href="./css/index.css">
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");

	String id = (String)session.getAttribute("sid");
	String no = request.getParameter("conNo");

	try {
		String DB_URL = "jdbc:mysql://localhost:3306/vpap";
		String DB_ID = "root";
		String DB_PASSWORD = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

		String psql = "SELECT * FROM payment WHERE memId=? AND conNo=?";
		PreparedStatement ppstmt = con.prepareStatement(psql);
		ppstmt.setString(1, id);
		ppstmt.setString(2, no);
		ResultSet prs = ppstmt.executeQuery();
		if(!prs.next()) {
%>
			<script>
				alert("콘텐츠를 구매해야 합니다.");
				history.back();
			</script>
<%
		}
		else {
		String sql = "SELECT * FROM history WHERE memId=? AND conNo=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, no);
		ResultSet rs = pstmt.executeQuery();
		if(!rs.next()) {
			String sql2 = "INSERT INTO history (memId, conNo) VALUES (?, ?)";
			PreparedStatement pstmt2 = con.prepareStatement(sql2);
			pstmt2.setString(1, id);
			pstmt2.setString(2, no);
			pstmt2.executeUpdate();
		}
		int count = 0;

		String sql3 = "SELECT * FROM history WHERE conNo=?";
		PreparedStatement pstmt3 = con.prepareStatement(sql3);
		pstmt3.setString(1, no);
		ResultSet rs3 = pstmt3.executeQuery();
		while(rs3.next()) {
			count += 1;
		}

		String sql4 = "UPDATE contents SET conView=? WHERE conNo=?";
		PreparedStatement pstmt4 = con.prepareStatement(sql4);
		pstmt4.setInt(1, count);
		pstmt4.setString(2, no);
		pstmt4.executeUpdate();
%>
		<center>
		<video width='1080'height="720" controls preload> 
    			<source src="video/<%=no%>.mkv" type='video/mp4'>
    			<source src="video/<%=no%>.ogv" type="video/ogg">
			<source src="video/<%=no%>.webm" type="video/webm">
			<source src="video/<%=no%>.mp4" type='video/mp4'>
		</video>
		</center>
<%
		}
	} catch (Exception e) {
		out.println(e);
	}
%>
</body>
</html>