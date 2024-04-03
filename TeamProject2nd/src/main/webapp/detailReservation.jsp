<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GuGyul Reservation Voucher</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        .voucher {	
            max-width: 600px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .voucher-header {
            text-align: center;
            padding: 20px;
            border-bottom: 2px solid #eeeeee;
        }

        h1, h2 {
            color: #333333;
            margin: 0;
        }

        .reservation-details,
        .accommodation-details,
        .guest-details,
        .logo,
        .footer {
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .guest-details p {
            margin: 5px 0;
        }

        .logo img {
            max-width: 150px;
            max-height: 80px;
        }

        .footer {
            text-align: center;
            color: #888888;
            margin-top: 20px;
            border-top: 1px solid #dddddd; /* 바디 끝에서 5px 안쪽에 1px 상단 테두리 */
            padding-top: 5px; /* 바디 끝에서 5px 안쪽에 내부 여백 */
        }

        .print-button {
            background-color: #01d1ca;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
        }

        .print-button:hover {
            background-color: #0056b3;
        }

        .accommodation-details,
        .guest-details {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }

        .image-container {
            width: 150px;
            height: 150px;
        }

        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 8px; /* 이미지에 둥근 모서리를 주기 위해 추가 */
        }
    </style>
</head>
<body>
    <div class="voucher">
        <div class="voucher-header">
            <img src="./images/구귤2.png" alt="GuGyul Logo" style="max-width: 100px; max-height: 100px;">
            <h1>GuGyul Reservation Voucher</h1>
            <h2>(구귤 예약 확인서)</h2>
        </div>

        <div class="reservation-details">
            <h2>Reservation Details</h2>
            <table>
                <tr>
                    <th>Check-in Date</th>
                    <td>${checkIn_date}</td>
                </tr>
                <tr>
                    <th>Check-out Date</th>
                    <td>${checkOut_date}</td>
                </tr>
                <tr>
                    <th>Reservation Creation Date</th>
                    <td>${r_date}</td>
                </tr>
            </table>
        </div>

        <div class="accommodation-details">
            <div>
                <h2>Accommodation Details</h2>
                <p><strong>Name:</strong> ${p_name}</p>
                <p><strong>Contact Number:</strong> ${p_phone}</p>
                <p><strong>Address:</strong> ${addr}</p>
            </div>
            <div class="image-container">
                <img src="./images/jeju_certified.png" alt="Accommodation Image">
            </div>
        </div>

        <div class="guest-details">
            <div>
                <h2>Guest Contact Information</h2>
                <p><strong>Name:</strong> ${u_name}</p>
                <p><strong>Email:</strong> ${u_email}</p>
                <p><strong>Phone:</strong> ${u_phone}</p>
            </div>
            <div class="image-container">
                <img src="./images/gugyul_stamp.png" alt="Voucher Stamp Image">
            </div>
        </div>

        <div class="footer">
            <p>Thank you for choosing GuGyul. Have a delightful stay!</p>
            <button class="print-button" onclick="printVoucher()">Print Voucher</button>
        </div>
    </div>

    <script>
        function printVoucher() {
            window.print();
        }
    </script>
</body>
</html>

