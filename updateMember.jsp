<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>ȸ�� ���� ���� </title>
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
<font color="white" size='6'><b>ȸ�� ���� ����</b></font><p>
	<form method=post action="updateMemberResult.jsp">
	<table border=1 cellpadding=5   style="font-size:10pt;font-family:���� ���">
		<tr>
			<td width=100>ID</td>
			<td><input type=hidden name="id" value="<%=id%>"><%=id%></td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td><input type=text name="password" value="<%=password%>"></td>
		</tr>
		<tr>
			<td>����</td>
			<td><input type=text name="name" value="<%=name%>"></td>
		</tr>
		<tr>
			<td>�ֹε�Ϲ�ȣ</td>
			<td>
<%
	    	String[ ]  joominArr = joomin.split("-");
%>		
		    <input type=text name="joomin1" value="<%=joominArr[0]%>" size="6"> -
			<input type=text name="joomin2" value="<%=joominArr[1]%>" size="7">
			</td>
		</tr>
		<tr>
			<td>�̸���</td>
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
			<td>�޴�����ȣ</td>
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
			<td>����</td>
			<td>
<%
		if(gender.equals("��"))
		{
%>
				<input type=radio name=gender value="��" checked>��
				<input type=radio name=gender value="��">��
<%
		}	
		else
		{
%>
				<input type=radio name=gender value="��">��
				<input type=radio name=gender value="��" checked>��
<%
	}
%>				
			</td>
		</tr>
		<tr>
			<td>��ȣ�ϴ� �帣</td>
			<td>
<%
	    	String[ ] fgArr = fg.split("/");   
			String[ ] fgChecked = new String[5];

			for(int i=0; i<fgArr.length;i++) {
				if(fgArr[i].equals("�׼�"))
				{
					fgChecked[0] = "checked";
				}
				else if(fgArr[i].equals("���"))
				{
					fgChecked[1] = "checked";
				}
				else if(fgArr[i].equals("�ڹ̵�"))
				{
					fgChecked[2] = "checked";
				}
				else if(fgArr[i].equals("����"))
				{
					fgChecked[3] = "checked";
				}
				else if(fgArr[i].equals("��Ÿ��"))
				{
					fgChecked[4] = "checked";
				}
			}
%>
			<input type="checkbox" name="favoriteGenre" value="�׼�" <%=fgChecked[0]%>> �׼�
			<input type="checkbox" name="favoriteGenre" value="���" <%=fgChecked[1]%>> ���
			<input type="checkbox" name="favoriteGenre" value="�ڹ̵�" <%=fgChecked[2]%>> �ڹ̵�
			<input type="checkbox" name="favoriteGenre" value="����" <%=fgChecked[3]%>> ����
			<input type="checkbox" name="favoriteGenre" value="��Ÿ��" <%=fgChecked[4]%>> ��Ÿ��
			</td>
		</tr>
	</table>
	<p><input type=submit value=�����Ϸ�>
	</form>
<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</center>
</body>
</html>