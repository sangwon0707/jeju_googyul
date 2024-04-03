<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Password Change</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: whitesmoke;
        }

        form {
            max-width: 500px;
        	width: 760px;
            margin: auto;
            margin-top: 50px;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
            margin-bottom: 30px;
        }
		        h5 {
			text-align: center;
		    color: red;
		}

        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .btn-block {
            display: block;
            width: 100%;
        }

        /* Responsive styles */
/*         @media (max-width: 576px) {
            form {
                padding: 20px;
            }
        } */
        
        button {
            background-color: #01d1ca;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
       <%--  $(document).ready(function() {
            $("#passwordChangeForm").submit(function(event) {
                var currentPassword = $("#currentPassword").val();
                var newPassword = $("#newPassword").val();
                var confirmNewPassword = $("#confirmNewPassword").val();

                if (currentPassword === "" || newPassword === "" || confirmNewPassword === "") {
                    alert("모든 입력란을 채워주세요..");
                    event.preventDefault();
                } else if (newPassword !== confirmNewPassword) {
                    alert("새로운 패스워드가 일치하지 않습니다.");
                    event.preventDefault();
                }
            });
        });
        
        <% if (request.getAttribute("passwordChangeSuccess") != null) { %>
        Display an alert if the attribute is set
        alert("<%= request.getAttribute("passwordChangeSuccess") %>");
    	<% } %> --%>
    </script>
</head>
<body>
    <form action="updatePasswordOK.do" method="post" id="passwordChangeForm" class="needs-validation" novalidate method="post">
        <h2 class="text-center">비밀번호 변경</h2>
        <h5>${msg}</h5>
        <div>
            <div class="form-group">
                <label for="currentPassword">현재 비밀번호:</label>
                <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
            </div>
            <div class="form-group">
                <label for="newPassword">새로운 비밀번호:</label>
                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
            </div>
            <div class="form-group">
                <label for="confirmNewPassword">새로운 비밀번호 확인:</label>
                <input type="password" class="form-control" id="confirmNewPassword" name="confirmNewPassword" required>
            </div>
            <button type="submit">비밀번호 변경</button>
        </div>
    </form>
</body>
</html>