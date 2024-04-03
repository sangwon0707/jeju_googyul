<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Password Recovery</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
        	background-color: whiteSmoke;
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

        form {
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

        [type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button[type="submit"] {
            background-color: #01d1ca; /* Cool Blue Color */
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #01d1ca; /* Darker shade of Cool Blue */
        }
    </style>
</head>
<body>
 	<header>
        <jsp:include page="header.jsp"/>
    </header>
	<form action="findPwd.do" method="post">
   	    <a href="template.jsp"><img height="50" src="./images/googyulLogo1.png"></a>
           <h2>비밀번호 찾기</h2>
           <h5>${message}</h5>
           <div class="form-group">
               <label for="email">이메일주소:</label>
               <input name="emailFind" type="email" class="form-control" required>
           </div>
           <div class="form-group">
               <label for="phone">전화번호:</label>
               <input name="telFind" type="tel" class="form-control" required>
           </div>
           <button type="submit" class="btn btn-primary btn-block">찾기</button>
           <div><br>
       	로그인 화면으로 돌아가시겠습니까?.&nbsp;&nbsp;&nbsp;<a href="login.do" >로그인 페이지</a><br>
      </div>
	</form>
   
</body>
</html>
