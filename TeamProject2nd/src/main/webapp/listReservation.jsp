<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>My Reservations and Reviews</title>
    <style>
        body {
        	width: 760px;	
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        div {
            background-color: #fff;
            margin: 20px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            margin-bottom: 15px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 15px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
            color: black;
        }

        hr {
            border: none;
            height: 1px;
            background-color: #ddd;
            margin: 20px 0;
        }

        img {
            height: auto;
            border-radius: 8px;
            margin-right: 10px;
        }

        button {
            background-color: #01d1ca;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #006666;
        }
        
		tr{
			magin:0px;
			padding:0px;
		}
		.tableContent:hover{
			background-color: #01d1ca;
			/*border: 3px #01d1ca solid; Increase border size on hover */
		}
        .reviewImage{
        	width: 50px;
        	height: 50px;
        	box-shadow: 0 0 20px rgba(0, 0, 0, 0.7);
        }
    </style>
</head>
<body>
    <div>
        <h2>예약 내역</h2>
        <div>
        	<table>
	            <tr>
	            	<th>예약번호</th>
	                <th>날짜</th>
	                <th>숙소명</th>
	                <th>가격</th>
	                <th>인원수</th>
	            </tr>
	            <c:forEach var="reservation" items="${reservationList}">
				    <tr class="tableContent" onclick="location.href='detailReservation.do?rno=${reservation.rno}'" style="cursor: pointer;">
				        <td >${reservation.rno}</td>
				        <td>${reservation.checkin_date}</td>
				        <td>${reservation.p_name}</td>
				        <td>${reservation.saleprice}</td>
				        <td>${reservation.guest_cnt}</td>
				    </tr>
				</c:forEach>
	        </table>
        </div>
    </div>
    <hr>
    <div>
        <h2>마이 리뷰</h2>
        <div>
        	<table class="reviewlistBox">
        		<tr class="tableHeader">
        			<th>리뷰날짜</th>
        			<th>숙소사진</th>
        			<th>숙소이름</th>
        			<th>나의점수</th>
        		</tr>
	            <c:forEach var="review" items="${reviewList}">
				    <tr class="tableContent" onclick="location.href='yourReviewDetailPage.jsp?reviewId=${review.id}&pName=${review.p_name}'" style="cursor: pointer;">
				        <td>${review.re_date}</td>
				        <td><img class="reviewImage" src="./images/${review.img1}" alt="review Image"/></td>
				        <td class="reviewP_name">
				            <b>${review.p_name}</b>
				        </td>
				        <td>${review.rating}</td>
				    </tr>
				</c:forEach>
             </table>     
        </div>
    </div>
</body>
</html>
