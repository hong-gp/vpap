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
	<a href="logout.jsp">�α׾ƿ�</a>
	<a href="category.jsp">ī�װ�</a>
	<a href="mypage.jsp">����������</a>
</div>
    <div id="keyimage" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <a href="viewDetailContents.jsp?conNo=1" class="carousel-item active" id="keyimage1">
                <div id="keyimage-description">
                    <h1>���˵���2</h1>
                    <small>&nbsp;&nbsp;���� / �׼�</small><br><br>
                    <p>
                        &nbsp;���� ��� ��� �� ���� ����!<br>
                        &nbsp;�����ϰ� ȭ���� ���� ���� ������ �ٽ� ��������!
                    </p>
                </div>
            </a>
            <a href="viewDetailContents.jsp?conNo=2" class="carousel-item" id="keyimage2">
                <div id="keyimage-description">
                    <h1>ž�� : �Ź���</h1>
                    <small>&nbsp;&nbsp;�׼�</small><br><br>
                    <p>
                        &nbsp;�Ѽ����� �Ǽ��� �볳���� �ʴ� �ϴ� ��,<br>
                        &nbsp;���� �е����� ������ ���۵ȴ�!
                    </p>
                </div>
            </a>
            <a href="viewDetailContents.jsp?conNo=3" class="carousel-item" id="keyimage3">
                <div id="keyimage-description">
                    <h1>�ѻ� : ���� ����</h1>
                    <small>&nbsp;&nbsp;�׼�</small><br><br>
                    <p>
                        &nbsp;1592�� ����, ���� 7�� 8�� �ѻ굵 �չٴ�,<br>
                        &nbsp;�е����� �¸��� �ʿ��� ������ ����� �� �ػ� �ְ��� ������ ��������.
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