<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>牢扁 能刨明</title>
	<link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/index.css">
</head>
<body>
<div id="porpularity" class="carousel slide" data-bs-ride="false" style="margin: 100px;">
        <h2>牢扁 能刨明</h2>
        <div class="carousel-inner" style="height: 500px; margin-top: -60px;">
            <div class="carousel-item active text-center" style="line-height: 500px;">
<%
	try {
		String DB_URL="jdbc:mysql://localhost:3306/vpap";
		String DB_ID="root";  
		String DB_PASSWORD="1234"; 
 	 
		Class.forName("org.gjt.mm.mysql.Driver"); 
		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		String jsql = "SELECT * FROM contents ORDER BY conView DESC LIMIT 5";   
		PreparedStatement pstmt  = con.prepareStatement(jsql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
%>
                <a href="viewDetailContents.jsp?conNo=<%=rs.getString("conNo")%>" target="_parent" style="text-decoration: none;">
					<img src="./images/contents/<%=rs.getString("conNo")%>.jpeg">
				</a>
<%
		}
%>
            </div>
            <div class="carousel-item text-center" style="line-height: 500px;">
<%
		String jsql2 = "SELECT * FROM contents ORDER BY conView DESC LIMIT 5, 5";   
		PreparedStatement pstmt2  = con.prepareStatement(jsql2);
		ResultSet rs2 = pstmt2.executeQuery();
		while(rs2.next()) {
%>
                <a href="viewDetailContents.jsp?conNo=<%=rs2.getString("conNo")%>" target="_parent" style="text-decoration: none;">
					<img src="./images/contents/<%=rs2.getString("conNo")%>.jpeg">
				</a>
<%
		}
%>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#porpularity" data-bs-slide="prev" style="width: 50px; height: 100px; margin: auto 70px;">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#porpularity" data-bs-slide="next" style="width: 50px; height: 100px; margin: auto 70px;">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
        </button>
    </div>
<%
	} catch (Exception e) {
		out.println(e);
	}
%>

    <script src="./js/jquery.js"></script>
    <script src="./js/bootstrap.min.js"></script>
</body>
</html>