<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Member Information</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
body {
	margin: 0;
	font-family: 'Arial', sans-serif;
	background-color: #ffffff; /* Airbnb-like background color */
}

form {
	max-width: 500px;
	width: 100%;
	margin: auto;
	margin-top: 50px;
	padding: 30px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

h2 {
	color: #333;
	border-bottom: 2px solid #3498db; /* Airbnb-like blue color */
	padding-bottom: 10px;
	margin-bottom: 30px;
}

h5 {
	text-align: center;
    color: red;
}

input[type="text"], input[type="email"], input[type="tel"] {
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

button {
            background-color: #01d1ca;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
}
/* Responsive styles */
@media ( max-width : 576px) {
	form {
		padding: 20px;
	}
}


</style>

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<form id="userInfoForm" class="needs-validation" novalidate action="updateUser.do"
		method="post">
		<h2 class="text-center">회원정보</h2>
		<h5>${msg}</h5>
		<div>
			<div class="form-group">
				<label for="name">이름:</label> <input type="text"
					class="form-control" id="name" name="name" value="${name}" readonly>
			</div>
			<div class="form-group">
				<label for="nickname">닉네임:</label> <input type="text"
					class="form-control" id="nickname" name="nickname"
					value="${nickname}" required>
			</div>
			<div class="form-group">
				<label for="phone">전화번호:</label> <input type="tel"
					class="form-control" id="phone" name="phone" value="${phone}"
					required>
			</div>
			<div class="form-group">
				<label for="email">이메일:</label> <input type="email"
					class="form-control" id="email" name="email" value="${email}"
					readonly>
			</div>
		</div>
		<button type="submit">변경하기</button>
	</form>
</body>
</html>
