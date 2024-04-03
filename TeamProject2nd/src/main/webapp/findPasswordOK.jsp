<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 확인</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-image: url(./images/login.png);
            background-repeat: no-repeat;
            background-size: cover;
            font-family: 'Arial', sans-serif;
            background-color: #f8f8f8;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0; /* To remove default body margin */
        }

        #findPwd{
            max-width: 400px;
            width: 100%;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            border-bottom: 2px solid #01d1ca; /* Cool Blue Color */
            padding-bottom: 5px;
            margin-bottom: 20px;
        }

        .findPwd {
            background: white;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	 <header>
        <jsp:include page="header.jsp"/>
    </header>
    <div id="findPwd">
        <a href="template.jsp"><img height="50" src="./images/googyulLogo1.png"></a>
        <h2>비밀번호 확인</h2><br>
        <p>${u_email}의 비밀번호는 ${pwd} 입니다.</p><br>
        <div>
            로그인 화면으로 돌아가시겠습니까?&nbsp;&nbsp;&nbsp;<a href="login.do">로그인 페이지</a><br>
        </div>
    </div>
</body>
</html>
