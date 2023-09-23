<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>구매 완료</title>
	<link rel="stylesheet" href="./css/index.css">
	<style>
        table {
            width: 100%;
            border-top: 1px solid #ccc;
            border-collapse: collapse;
        }
        th, td {
            border-bottom: 1px solid #ccc;
            padding: 10px;
            height: 50px;
            padding: 0;
        }
        button {
            width: 50%;
            border: 0;
            height: 100%;
            margin: 0;
			cursor: hand;
			font-weight: bold;
        }
		.back:hover {
			background-color: #bbb !important;
		}
		.mypage:hover {
			background-color: #999 !important;
		}
        .th {
            padding: 0 15px;
        }
		.td {
			color: #ccc;
			padding: 0 15px;
		}
    </style>
</head>
<script language="javascript" src="js.js"></script>
<body>
<%
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("bid");
	String no = request.getParameter("conNo");
	java.util.Date date = new java.util.Date();
    String payDay = date.toLocaleString();
	String bank = request.getParameter("bank");
	String cardNum = request.getParameter("cardNum");
	String cardPassword = request.getParameter("cardPassword");
	int price = Integer.parseInt(request.getParameter("payPrice"));
	String title = request.getParameter("title");

	try {
		String DB_URL = "jdbc:mysql://localhost:3306/vpap";
		String DB_ID = "root";
		String DB_PASSWORD = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

		String sql = "INSERT INTO payment (memId, conNo, payDay, payBank, payCardNum, payCardPw, payPrice) VALUES (?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, no);
		pstmt.setString(3, payDay);
		pstmt.setString(4, bank);
		pstmt.setString(5, cardNum);
		pstmt.setString(6, cardPassword);
		pstmt.setInt(7, price);
		pstmt.executeUpdate();

		String sql2 = "SELECT * FROM wantContents WHERE memId=? AND conNo=?";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		pstmt2.setString(1, id);
		pstmt2.setString(2, no);
		ResultSet rs2 = pstmt2.executeQuery();
		if(rs2.next()) {
			String sql3 = "DELETE FROM wantContents WHERE memId=? AND conNo=?";
			PreparedStatement pstmt3 = con.prepareStatement(sql3);
			pstmt3.setString(1, id);
			pstmt3.setString(2, no);
			pstmt3.executeUpdate();
		}
%>
<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
	<div style="text-align: center;">
		결제가 완료되었습니다.<br>
		결제목록은 마이페이지에서 조회 가능합니다.
	</div>
	<br>
	<table style="background-color: #333;">
		<tr>
			<td class="th">결제콘텐츠</td>
			<td class="td"><%=title%></td>
		</tr>
		<tr>
			<td class="th">결제날짜</td>
			<td class="td"><%=payDay%></td>
		</tr>
		<tr>
			<td class="th">결제금액</td>
			<td class="td"><%=price%> 원</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="viewDetailContents.jsp?conNo=<%=no%>">
					<button class="back" type="button" style="float: left; background-color: #ccc;">돌아가기</button>
				</a>
				<a href="mypage.jsp">
					<button class="mypage" type="button" style="float: right; background-color: #aaa;">마이페이지</button>
				</a>
			</td>
		</tr>
	</table>
</div>
<%
	} catch (Exception e) {
		out.println(e);
	}
%>
</body>
</html>