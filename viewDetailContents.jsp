<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>������ ���� ��ȸ</title></head>

<!-- js_package.js�� ���ǵ� �ڹٽ�ũ��Ʈ�Լ� ȣ�� -->
<script language="javascript" src="js.js"></script>
<link rel="stylesheet" href="./css/index.css">
<style>
body {
	margin: 0;
	padding: 0;
	background-color: black;
	color: #ccc;
}
</style>
<body>
<%
	String id = (String)session.	getAttribute("sid");

	if(id == null) {
%>
<div class="nav">
	<a href="index.html">VPAP</a>
	<a href="login.jsp">�α���</a>
	<a href="insertMember.jsp">ȸ������</a>
	<a href="category.jsp">ī�װ�</a>
</div>
<%
	}
	else {
%>
<div class="nav">
	<a href="index.jsp">VPAP</a>
	<a href="logout.jsp">�α׾ƿ�</a>
	<a href="category.jsp">ī�װ�</a>
	<a href="mypage.jsp">����������</a>
</div>
<%
	}

try{
	String DB_URL="jdbc:mysql://localhost:3306/vpap";
	String DB_ID="root";  
	String DB_PASSWORD="1234"; 
 	 
	Class.forName("org.gjt.mm.mysql.Driver"); 
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String cNo = request.getParameter("conNo");

    String jsql = "select * from contents where conNo = ?";   
	PreparedStatement pstmt  = con.prepareStatement(jsql);
	pstmt.setString(1, cNo);

	ResultSet rs = pstmt.executeQuery();
    rs.next();

	String no = rs.getString("conNo");
	String title = rs.getString("conTitle");
	String ctg = rs.getString("conCtg");
	String genre = rs.getString("conGenre");
	String nation = rs.getString("conNation");
	String rating = rs.getString("conRating");
	double point = rs.getDouble("conPoint");
	String date = rs.getString("conDate");
	int view = rs.getInt("conView");
	String desc = rs.getString("conDesc");

	java.text.DecimalFormat df = new java.text.DecimalFormat("#.##");
	String dfPoint = df.format(point);
%>
<div>
	<center>
	<div class="contentHead" style="height: 100vh; display: inline-block;">
		<div>
			<img src="./images/contents/<%=no%>.jpeg" style="height: 100%;">
		</div>
	</div>
	</center>
	<div class="contentBody" style="margin: 50px 100px; vertical-align: top;">
		<form name="contents"  method="post" style="display: hidden;">
			<input type="hidden" name="conNo" value="<%=no%>">
		</form>
		<div style="clear: both; display: inline-block;">
			<div style="color: #fff; font-size: 2em;"><%=title%></div><br>
			<div>
				# <%=genre%><br>
				# <%=nation%><br>
				# <%=rating%><br>
				# ���� <%=dfPoint%>
				<div>
					<%
						if(id != null) {
					%>
					<form name="conPoint" method="post" style="display: inline-block;">
						<input type="hidden" name="conNo" value="<%=no%>">
						<select name="point" style="width: 70px; height: 30px; border-radius: 10px; font-size: 16px;">
							<option value="0.5">0.5</option>
							<option value="1.0">1.0</option>
							<option value="1.5">1.5</option>
							<option value="2.0">2.0</option>
							<option value="2.5">2.5</option>
							<option value="3.0">3.0</option>
							<option value="3.5">3.5</option>
							<option value="4.0">4.0</option>
							<option value="4.5">4.5</option>
							<option value="5.0" selected>5.0</option>
						</select>
					</form>
					<button class="btn1" type="button" onClick=javascript:point()>�����ֱ�</button>
					<%
						}
					%>
				</div>
			</div>
			<br><br>
			<div style="white-space: pre-line;"><%=desc%></div>
		</div>
		<br><br>
		<div>
			<button class="btn1" type="button" onClick="javascript:view()">����</button>
		</div>
	</div>
</div>
<center>
<div style="margin-bottom: 20px;">
<input type="button" onClick=javascript:buy() value="�����ϱ�">
<%
	if(id == null) {
%>
		<input type="button" onClick=javascript:want() value="���ϱ�" id="wantbtn">
<%
	} else {
		String jsql2 = "SELECT * FROM wantContents WHERE memId=? AND conNo=?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, id);
		pstmt2.setString(2, no);
		ResultSet rs2 = pstmt2.executeQuery();
		if (rs2.next()) {
%>
			<input type="button" onClick=javascript:want() value="������" id="wantbtn">
<%
		} else {
%>
			<input type="button" onClick=javascript:want() value="���ϱ�" id="wantbtn">
<%
		}
	}
} catch(Exception e) {
	out.println(e);
}
%>
</div>
</center>
</body>
</html>