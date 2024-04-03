<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Q&A List</title>
    <!-- Bootstrap CSS Link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #white;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;	
        }

        table {
            width: 650px;
            border-collapse: collapse;
            max-width: 700px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            overflow: scorll;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
            color: #black;
        }
		
        

        tr:hover{
		 background-color: #01d1ca;
		}
        
        #qnaForm {
            max-width: 700px;
            margin: 50px auto;
            margin-top: 20px;
            margin-bottom: 	0px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2); /* 그림자 색상을 더 짙게 조절 */
        }
        
        #qnaList {
            max-width: 700px;
            margin: 50px auto;
            margin-top: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2); /* 그림자 색상을 더 짙게 조절 */
        }

        h2 {
            color: #black;
            margin-bottom: 20px;
        }

        form {
            max-width: 600px;
            margin: 0;
        }

        label {
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"] {
            width: 100%;
            max-width: 600px;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        textarea {
            width: 100%;
            max-width: 600px;
            height: 200px; /* 고정된 높이값 */
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            overflow-y: auto; /* 세로 스크롤 추가 */
            resize: none; /* textarea 크기 조절 비활성화 */
        }
		button[type="submit"]{
			background-color: #01d1ca;
		}
		
		button:hover {
            background-color: #0056b3;
        }
        
        button {
            background-color: #01d1ca;
            color: #fff;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
    </style>
</head>
<body>

		<div id="qnaForm">
	        <form action="insertQna.do" method="post">
	            <br>
	            <h2>문의하기</h2>
	            <hr>
	            <div class="mb-3">
	                <label for="q_title" class="form-label">제목:</label>
	                <input type="text" id="q_title" name="q_title" class="form-control">
	            </div>
	            <div class="mb-3">
	                <label for="q_content" class="form-label">내용:</label>
	                <textarea id="q_content" name="q_content" class="form-control"></textarea>
	            </div>
	            <button type="submit">Submit</button>
	            <br>
	        </form>
	    </div>
	    
		<div id="qnaList">
		<br>
		<h2>나의 문의 리스트</h2>
		<hr>
		    <table>
			    <thead>
			        <tr>
			            <th>NO</th>
			            <th>제목</th>
			            <th>문의날짜</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach var="myQna" items="${qnaList}">
			            <tr onclick="location.href='detailQna.do?qno=${myQna.qno}'">
			                <td>${myQna.qno}</td>
			                <td>${myQna.q_title}</td>
			                <td>${myQna.q_date}</td>
			  			</tr>
			        </c:forEach>
			    </tbody>
			</table>
	    </div>
</body>
</html>