<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>�����ϱ�</title>
	<link rel="stylesheet" href="./css/index.css">
<style>
	.info {
		display: inline-block;
		font-size: 18px;
		font-weight: bold;
	}
	.infodiv1 {
		margin: 5px;
	}
	.infodiv2 input {
		width: 350px;
		height: 40px;
		font-size: 16px;
	}
</style>
</head>
<script language="javascript" src="js.js"></script>
<body>
<%
	request.setCharacterEncoding("euc-kr");

	String id = (String)session.getAttribute("sid");
	
	if (id == null) {
%>
	<script>
		const a = confirm("�α����� �ʿ��� �����Դϴ�. �α��� �Ͻðڽ��ϱ�?");
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
		String conNo = request.getParameter("conNo");

		String DB_URL = "jdbc:mysql://localhost:3306/vpap";
		String DB_ID = "root";
		String DB_PASSWORD = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

		String sql2 = "SELECT * FROM payment WHERE memId=? AND conNo=?";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		pstmt2.setString(1, id);
		pstmt2.setString(2, conNo);
		ResultSet rs2 = pstmt2.executeQuery();
		
		if(rs2.next()) {
%>
			<script>
				alert("�̹� ������ �������Դϴ�.");
				history.back();
			</script>
<%
		}
		else {
			String sql = "SELECT * FROM contents WHERE conNo=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, conNo);
			ResultSet rs = pstmt.executeQuery();
			rs.next();

			String no = rs.getString("conNo");
			String title =  rs.getString("conTitle");	
			int price = rs.getInt("conPrice");
			String ctg =  rs.getString("conCtg");
			String genre = rs.getString("conGenre");
			String nation =  rs.getString("conNation");
			String rating =  rs.getString("conRating");
			double point =  rs.getDouble("conPoint");
			String date =  rs.getString("conDate");
%>
<div class="nav">
	<a href="index.jsp">VPAP</a>
	<a href="logout.jsp">�α׾ƿ�</a>
	<a href="category.jsp">ī�װ�</a>
	<a href="mypage.jsp">����������</a>
</div>
<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
	<form name="payForm" method="post" action="buyContentsResult.jsp">
	<div style="display: inline-block; margin-right: 60px;">
		<h2>���� �󼼻���</h2>
		<div>
			<a style="display: inline-block; background-color: red;" href="viewDetailContents.jsp?conNo=<%=no%>" target="_parent">
				<img src="images/contents/<%=no%>.jpeg" style="width:90px;">
			</a>
			<div style="display: inline-block; margin-top: 10px;">
				<table>
					<tr class="infodiv1" style="height: 45px;">
						<td class="info" colspan="2"><input type="hidden" name="title" value="<%=title%>"><%=title%></td>
					</tr>
					<tr class="infodiv1">
						<td class="info">������</td>
						<td><input type="hidden" name="bid" value="<%=id%>"><%=id%></td>
					</tr>
					<tr class="infodiv1">
						<td class="info">����</td>
						<td><input type="hidden" name="conPrice" value="<%=price%>"><%=price%> ��</td>
					</tr>
					<tr class="infodiv1">
						<td class="info">�帣</td>
						<td><%=genre%></td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<div style="margin-top: 50px;">
		<input type="hidden" name="conNo" value="<%=no%>">
		<div class="infodiv2">
			<div class="info">����</div><br>
			<select name="bank" style="width: 350px; height: 40px; font-size: 16px;">
				<option value="����">����</option>
				<option value="����">����</option>
				<option value="����">����</option>
				<option value="īī����ũ">īī����ũ</option>
				<option value="����">����</option>
			</select>
		</div><br>
		<div class="infodiv2">
			<div class="info">ī���ȣ</div><br>
			<input type="text" name="cardNum">
		</div><br>
		<div class="infodiv2">
			<div class="info">ī���й�ȣ</div><br>
			<input type="password" name="cardPassword">
		</div><br>
		<div class="infodiv2">
			<div class="info">�����ݾ�</div><br>
			<div style="font-size: 16px;"><input type="hidden" name="payPrice" value="<%=price%>"><%=price%> ��</div>
		</div><br>

		<button class="btn1" type="button" onclick="javascript:payment()">�����ϱ�</button>
		<button class="btn1" type="reset">��  ��</button>
	<div>
</form>
</div>
<%
			}
		} catch (Exception e) {
			out.println(e);
		}
	}
%>
</body>
</html>