<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>ȸ�� ���̺� ���� ��ȸ   </title>
<link rel="stylesheet" href="./css/index.css">
<style>
	a { color: #0064FF; }
</style>
</head>
<body>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/vpap"; 
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

     String jsql = "select * from member";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();
%>

<center>
<font color="white" size='6'><b>��ü ȸ�� ��ȸ</b></font><p>
<table border="2" cellpadding="10" style="font-size:10pt;font-family:���� ���">
	<tr>
		<td>ID</td>
		<td>��й�ȣ</td>
		<td>����</td>
		<td>�ֹι�ȣ</td>
		<td>�̸���</td>	
		<td>�޴�����ȣ</td>
		<td>����</td>
		<td>��ȣ�ϴ� �帣</td>
		<td><b>[����]</b></td>
		<td><b>[����]</b></td>
	</tr>	

<%
		while(rs.next()){
			String id = rs.getString("memId");   //  ���� �� �Լ����� �μ����� ���̺��� �� �ʵ�����
    		String password =  rs.getString("memPassword");
			String name = rs.getString("memName");
    		String joomin =  rs.getString("memJoomin");	
			String email = rs.getString("memEmail");
    		String phone =  rs.getString("memPhone");	
			String gender = rs.getString("memGender");
			String fg = rs.getString("memFavoriteGenre");
%>
   <tr>                     <!--  �������� ��Ÿ�� ������ ��ũ�κп� ȸ�� ���̵� �Բ� �Ѱ��� -->
 	  <td><%=id%></td>
      <td><%=password%></td>
	  <td><%=name%></td>
	  <td><%=joomin%></td>
	  <td><%=email%></td>	
 	  <td><%=phone%></td>
	  <td><%=gender%></td>
	  <td><%=fg%></td>
	  <td align=center><a href="updateMember.jsp?id=<%=id%>">Yes</a></td>
  	  <td align=center><a href="deleteMember.jsp?id=<%=id%>">Yes</a></td>
  </tr>
<%
		}  // while���� ��
%>
</table><p>
<br>
<a href="manager_index.jsp" style="font-size:10pt;font-family:���� ���">�����ڸ�� ����������</a>
<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</body>
</html>