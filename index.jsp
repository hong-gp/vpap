<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>vpap</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/index.css">
</head>
<body>
<%
	String id = (String)session.getAttribute("sid");
%>
<div class="nav">
	<a href="index.jsp">VPAP</a>
	<a href="logout.jsp">로그아웃</a>
	<a href="category.jsp">카테고리</a>
	<a href="mypage.jsp">마이페이지</a>
</div>
    <div id="keyimage" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <a href="viewDetailContents.jsp?conNo=1" class="carousel-item active" id="keyimage1">
                <div id="keyimage-description">
                    <h1>범죄도시2</h1>
                    <small>&nbsp;&nbsp;범죄 / 액션</small><br><br>
                    <p>
                        &nbsp;나쁜 놈들 잡는 데 국경 없다!<br>
                        &nbsp;통쾌하고 화끈한 범죄 소탕 작전이 다시 펼쳐진다!
                    </p>
                </div>
            </a>
            <a href="viewDetailContents.jsp?conNo=2" class="carousel-item" id="keyimage2">
                <div id="keyimage-description">
                    <h1>탑건 : 매버릭</h1>
                    <small>&nbsp;&nbsp;액션</small><br><br>
                    <p>
                        &nbsp;한순간의 실수도 용납되지 않는 하늘 위,<br>
                        &nbsp;가장 압도적인 비행이 시작된다!
                    </p>
                </div>
            </a>
            <a href="viewDetailContents.jsp?conNo=3" class="carousel-item" id="keyimage3">
                <div id="keyimage-description">
                    <h1>한산 : 용의 출현</h1>
                    <small>&nbsp;&nbsp;액션</small><br><br>
                    <p>
                        &nbsp;1592년 여름, 음력 7월 8일 한산도 앞바다,<br>
                        &nbsp;압도적인 승리가 필요한 조선의 운명을 건 해상 최고의 해전이 펼쳐진다.
                    </p>
                </div>
            </a>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#keyimage" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#keyimage" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
        </button>
    </div>

    <iframe src="popularity.jsp" scrolling="no" style="width: 100%; height: 600px;"></iframe>
   
    <script src="./js/jquery.js"></script>
    <script src="./js/bootstrap.min.js"></script>
</body>
</html>