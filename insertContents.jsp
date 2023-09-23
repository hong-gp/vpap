<%@ page contentType="text/html;charset=euc-kr" %>
<html>
<head>
	<title>콘텐츠 등록</title>
	<link rel="stylesheet" href="./css/index.css">
	<style>
		a {
			color: #0064FF;
		}
	</style>
</head>
<body>
<center>
<font color="white" size="6"><b>콘텐츠 등록</b></font>
<form method="post" action="insertContentsResult.jsp" >
<table border="2" cellpadding="10"  style="font-size:10pt;font-family:맑은 고딕">
		<tr>
			<td>번호</td>
			<td><input type="text" name="no"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="text" name="price"></td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td>
				<label><input type="radio" name="category" value="영화"> 영화 </label>
				<label><input type="radio" name="category" value="드라마"> 드라마 </label>
			</td>
		</tr>
		<tr>
			<td>장르</td>
			<td><input type="text" name="genre"></td>
		</tr>
		<tr>
			<td>국가</td>
			<td><input type="text" name="nation"></td>
		</tr>
		<tr>
			<td>시청등급</td>
			<td><input type="text" name="rating"></td>
		</tr>
		<tr>
			<td>개봉날짜</td>
			<td><input type="text" name="conDate"></td>
		</tr>
		<tr>
			<td>개요</td>
			<td><textarea name="desc" rows="30" cols="100"></textarea></td>
		</tr>
</table>
<p>
<input type="submit" value="등 록">
<input type="reset" value="취 소">
</form>
</center>
</body>
</html>

