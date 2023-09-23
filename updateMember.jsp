<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>회원 정보 수정 </title>
	<link rel="stylesheet" href="./css/index.css">
</head>
<body>
<%	 
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/vpap";  
     String DB_ID="root";  
     String DB_PASSWORD="1234";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	
	 String key = request.getParameter("id");
	 String jsql = "select * from member where memId = ?";
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,key);

	 ResultSet rs = pstmt.executeQuery();
	 rs.next();
			
	 String id = rs.getString("memId");
   	 String password = rs.getString("memPassword");
	 String name = rs.getString("memName");
	 String joomin = rs.getString("memJoomin");
	 String email = rs.getString("memEmail");
	 String phone = rs.getString("memPhone");
	 String gender = rs.getString("memGender");
	 String fg = rs.getString("memFavoriteGenre");
%>

<center>
<font color="white" size='6'><b>회원 정보 수정</b></font><p>
	<form method=post action="updateMemberResult.jsp">
	<table border=1 cellpadding=5   style="font-size:10pt;font-family:맑은 고딕">
		<tr>
			<td width=100>ID</td>
			<td><input type=hidden name="id" value="<%=id%>"><%=id%></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type=text name="password" value="<%=password%>"></td>
		</tr>
		<tr>
			<td>성명</td>
			<td><input type=text name="name" value="<%=name%>"></td>
		</tr>
		<tr>
			<td>주민등록번호</td>
			<td>
<%
	    	String[ ]  joominArr = joomin.split("-");
%>		
		    <input type=text name="joomin1" value="<%=joominArr[0]%>" size="6"> -
			<input type=text name="joomin2" value="<%=joominArr[1]%>" size="7">
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
<%
	String[] emailArr = email.split("@");
	String[] emailSelected = new String[3];

	if(emailArr[1].equals("naver.com")) {
		emailSelected[0] = "selected";
	}
	else if(emailArr[1].equals("daum.net")) {
		emailSelected[1] = "selected";
	}
	else if(emailArr[1].equals("gmail.com")) {
		emailSelected[2] = "selected";
	}
%>
				<input type="text" name="email1" value="<%=emailArr[0]%>"> @ 
				<select name="email2">
					<option value="naver.com" <%=emailSelected[0]%>>naver.com</option>
					<option value="daum.net" <%=emailSelected[1]%>>daum.net</option>
					<option value="gmail.com" <%=emailSelected[2]%>>gmail.com</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>휴대폰번호</td>
			<td>
<%
	    	String[ ] hpArr  = phone.split("-");  
			String[ ]  hpSelected = new String[6];

			if(hpArr[0].equals("010"))
			{
				hpSelected[0] = "selected";
			}  
			else if(hpArr[0].equals("011"))
			{
				hpSelected[1] = "selected";
			}
			else if(hpArr[0].equals("016"))
			{
				hpSelected[2] = "selected";
			}
			else if(hpArr[0].equals("017"))
			{
				hpSelected[3] = "selected";
			}
			else if(hpArr[0].equals("018"))
			{
				hpSelected[4] = "selected";
			}
			else if(hpArr[0].equals("019"))
			{
				hpSelected[5] = "selected";
			}

%>
			<select name="hp1">      
				<option value="010" <%=hpSelected[0]%>>010
				<option value="011" <%=hpSelected[1]%>>011
				<option value="016" <%=hpSelected[2]%>>016
				<option value="017" <%=hpSelected[3]%>>017
				<option value="018" <%=hpSelected[4]%>>018
				<option value="019" <%=hpSelected[5]%>>019
			</select> -	
		    <input type=text name="hp2" value="<%=hpArr[1]%>" size="4"> -
		    <input type=text name="hp3" value="<%=hpArr[2]%>" size="4">
			</td>	
		</tr>
		<tr>
			<td>성별</td>
			<td>
<%
		if(gender.equals("남"))
		{
%>
				<input type=radio name=gender value="남" checked>남
				<input type=radio name=gender value="여">여
<%
		}	
		else
		{
%>
				<input type=radio name=gender value="남">남
				<input type=radio name=gender value="여" checked>여
<%
	}
%>				
			</td>
		</tr>
		<tr>
			<td>선호하는 장르</td>
			<td>
<%
	    	String[ ] fgArr = fg.split("/");   
			String[ ] fgChecked = new String[5];

			for(int i=0; i<fgArr.length;i++) {
				if(fgArr[i].equals("액션"))
				{
					fgChecked[0] = "checked";
				}
				else if(fgArr[i].equals("드라마"))
				{
					fgChecked[1] = "checked";
				}
				else if(fgArr[i].equals("코미디"))
				{
					fgChecked[2] = "checked";
				}
				else if(fgArr[i].equals("범죄"))
				{
					fgChecked[3] = "checked";
				}
				else if(fgArr[i].equals("판타지"))
				{
					fgChecked[4] = "checked";
				}
			}
%>
			<input type="checkbox" name="favoriteGenre" value="액션" <%=fgChecked[0]%>> 액션
			<input type="checkbox" name="favoriteGenre" value="드라마" <%=fgChecked[1]%>> 드라마
			<input type="checkbox" name="favoriteGenre" value="코미디" <%=fgChecked[2]%>> 코미디
			<input type="checkbox" name="favoriteGenre" value="범죄" <%=fgChecked[3]%>> 범죄
			<input type="checkbox" name="favoriteGenre" value="판타지" <%=fgChecked[4]%>> 판타지
			</td>
		</tr>
	</table>
	<p><input type=submit value=수정완료>
	</form>
<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</center>
</body>
</html>