<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Page</title>
    <link rel="stylesheet" href="reset.css">
    <style>
    	iframe{
    		margin:0;
    	}
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            color: #333; /* Dark gray text color */
        }

        .container {
        	height: 1000px;
        	margin: 0;
            display: flex;
        }

        .menu {
            flex: 1;
            height: 2000px;
            background-color: white; /* Light gray background color */
            border-right: 1px solid #f0f0f0;
            color: #333; /* Dark gray text color */
            padding: 20px;
        }

        .menu ul {
            list-style-type: none;
            padding: 0;
        }

        .menu li {
            margin-bottom: 10px;
        }

        .menu a {
            text-decoration: none;
            color: #; /* Dark gray text color */
            font-weight: bold;
        }

        .content {
            flex: 4;
            height: 1000px;
            padding-left: 5px;
        }

        iframe {
            width: 100%;
            height: 100%;
            border: none;
        }
       	a{
       		text-decoration:none;
       		color: black;
       	}
       	
       	li{
       		
       		padding 20px;
       		
       	}
       	li:hover {
       		background: #01d1ca;
       	}
    </style>
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp"/>
	</div>
	<hr>
	<div id="content">
		<div class="container">
	        <div class="menu">
	            <ul>
	            	<h2>마이페이지</h2>
	                <li><a href="listUserData.do" target="contentFrame">내정보</a></li>
	                <li><a href="listReservation.do" target="contentFrame">예약내역</a></li>
	                <li><a href="listWishlist.do" target="contentFrame">위시리스트</a></li>
	                <li><a href="updatePassword.do" target="contentFrame">비밀번호 변경</a></li>
	                <li><a href="listMyQna.do" target="contentFrame">문의하기</a><li>
	            </ul>
	        </div>
	        <div class="content">
	            <iframe id="contentFrame" name="contentFrame" frameborder="0" scrolling="auto" src="updatePassword.do"></iframe>
	        </div>
    </div>
	</div>
	<div id="footer">
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>
