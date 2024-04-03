<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://kit.fontawesome.com/90da83db2d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="header.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.1/css/ion.rangeSlider.min.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.1/js/ion.rangeSlider.min.js"></script>
    <style>
        .image-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .image-container a {
            flex-basis: calc(33.33% - 10px); /* 3 images per row with 10px spacing */
            margin-bottom: 10px;
        }

        .image-container img {
            width: 100%;
            height: auto;
        }
        a{
        	text-decoration: none;
        }
        
        #loginModule{
        	width: 130px;
        }
    </style>
    <script>
        function showMenu() {
            $('#menu').toggle();
        }

        function showBar() {
            $('#bar').toggle();
        }

        $(document).ready(function () {
            $('.nav_detail').hover(function () {
                var className = $(this).attr('class').split(' ')[1];
                $('.' + className).addClass('hovered');
            }, function () {
                $('.nav_detail, .nav_blank').removeClass('hovered');
            });

            let isBarVisible = false;

            function toggleBar() {
                isBarVisible = !isBarVisible;
                $('#bar').toggle(isBarVisible);
            }

            $('.bar').click(function (e) {
                e.stopPropagation();
                toggleBar();
            });

            $(document).click(function () {
                if (isBarVisible) {
                    $('#bar').hide();
                    isBarVisible = false;
                }
            });

            $('#bar').click(function (e) {
                e.stopPropagation();
            });

            // Initialize the ion-rangeslider
            $("#rangeSlider").ionRangeSlider({
                type: "double",
                min: 0,
                max: 1000000,
                from: 100000,
                to: 900000,
                step: 1,
                prettify_enabled: true,
                prettify_separator: ",",
                onStart: function (data) {
                    $("#sliderValues").text(numberWithCommas(data.from) + ' - ' + numberWithCommas(data.to));
                },
                onChange: function (data) {
                    $("#sliderValues").text(numberWithCommas(data.from) + ' - ' + numberWithCommas(data.to));
                }
            });

            // Function to add commas for better readability of large numbers
            function numberWithCommas(x) {
                return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }
        });
        
        $(document).ready(function () {
            $('#increment').click(function (e) {
                e.stopPropagation();
                var input = $('#quantity');
                input.val(parseInt(input.val()) + 1);
            });

            $('#decrement').click(function (e) {
                e.stopPropagation();
                var input = $('#quantity');
                if (parseInt(input.val()) > 1) {
                    input.val(parseInt(input.val()) - 1);
                }
            });
        });
        
        $('.image-container a').click(function () {
            // Remove 'selected' class from all images
            $('.image-container a').removeClass('selected');

            // Add 'selected' class to the clicked image
            $(this).addClass('selected');

            // Get the src attribute of the selected image and set it to the input field
            var selectedImageSrc = $(this).find('img').attr('src');
            $('#selectedImageInput').val(selectedImageSrc);
        });
        
        $(document).ready(function () {
            // ... your existing code ...

            // Function to handle image selection
            $('.image-container a').click(function () {
                // Toggle the 'selected' class for the clicked image
                $(this).toggleClass('selected');

                // Remove 'selected' class from all other images
                $('.image-container a').not(this).removeClass('selected');

                // Get the data-area attribute of the selected image
                var selectedArea = $(this).data('area');

                // Set the value to the input field in the "Location" section
                $('.location input').val(selectedArea);
            });
        });
        
        $("#checkinDatepicker").datepicker({
            dateFormat: 'yy-mm-dd',
            onSelect: function (date) {
                updateDateRange();
            }
        });

        $("#checkoutDatepicker").datepicker({
            dateFormat: 'yy-mm-dd',
            onSelect: function (date) {
                updateDateRange();
            }
        });

        function updateDateRange() {
            var checkinDate = $("#checkinDatepicker").datepicker("getDate");
            var checkoutDate = $("#checkoutDatepicker").datepicker("getDate");

            if (checkinDate && checkoutDate) {
                var dateRange = $.datepicker.formatDate("yy-mm-dd", checkinDate) +
                    " - " + $.datepicker.formatDate("yy-mm-dd", checkoutDate);

                $("#dateRangeInput").val(dateRange);
            }
        }
        
 
    </script>
</head>
<body>
    <div class="header">
		<div id="logo">
		    <a href="listProduct.do"><img height="50" src="./images/googyulLogo1.png"></a>
		</div>
        <div class="bar" onclick="showBar()">
            <div class="location">
                <p>Location</p>
                <input type="text" placeholder="Where are you going?" style="text-align: center;">
            </div>
            <div class="period">
			    <p>CheckIn / CheckOut</p>
				<input type="text" id="periodCheckinInput" placeholder="Add dates" style="text-align: center;">
			</div>
            <div class="price">
                <p>price</p>
                <input type="text" placeholder="Add price" style="text-align: center;">
            </div>
            <div class="guests">
                <p>Guests</p>
                <input type="text" placeholder="Add guests" style="text-align: center;"> 
                <span><i class="fa-solid fa-magnifying-glass fa-bounce"></i></span>
            </div>
            
            <form>
            <div id="bar" class="nav-list">
                <div class="image-container">
			        <a href="#" data-area="Area1"><img width="100" src="./images/image.png" alt="Image 1"></a>
			        <a href="#" data-area="Area2"><img width="100" src="./images/image2.png" alt="Image 2"></a>
			        <a href="#" data-area="Area3"><img width="100" src="./images/image3.png" alt="Image 3"></a>
			        <a href="#" data-area="Area4"><img width="100" src="./images/image4.png" alt="Image 4"></a>
			        <a href="#" data-area="Area5"><img width="100" src="./images/image5.png" alt="Image 5"></a>
			        <a href="#" data-area="Area6"><img width="100" src="./images/image6.png" alt="Image 6"></a>
			    </div>
			    <input type="hidden" id="selectedImageInput" name="selectedImage">
                <div class="input-container">
				    체크인: <input type="date" id="checkinInput">
				</div>
				<div class="input-container">
				    체크아웃: <input type="date" id="checkoutInput">
				</div>
                <div class="range-slider-container">
                    <input type="text" id="rangeSlider" name="range" value="10000,500000" />
                    <span id="sliderValues">20,000 - 300,000</span>
                </div>
                <div class="number-input-container">
				    <button id="decrement">-</button>
				    <input type="text" id="quantity" value="1">
				    <button id="increment">+</button>
				</div>
				<button id="searchSubmit" type="submit">검색하기</button>
            </div>
            </form>
        </div> 
		 <div id="loginModule">
	        <c:if test="${userID == null}">
	            <a href="login.do"><b>로그인</b></a>&nbsp;&nbsp;
	            <a href="joinMember.do"><b>회원가입</b></a>
	        </c:if>
	        <div>
	        <c:if test="${userID != null}">
	            <button class="round-button" onclick="showMenu()">${userID }
	            </button>
	            <div id="menu" class="menu-list">
	                <a href="userInfo.do"><b>개인정보</b></a> 
					<a href="userInfo2.jsp"><b>예약내역</b></a>
	                <a href="userInfo3.jsp"><b>위시리스트</b></a> 
	                <a href="userInfo4.jsp"><b>문의하기</b></a>
	                <a href="logoutOK.do"><b>로그아웃</b></a>
	            </div>
	        </c:if>
        </div>
    </div>
    </div>
</body>
</html>
