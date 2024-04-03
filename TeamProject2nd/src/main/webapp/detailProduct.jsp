<%@page import="java.util.HashMap"%>
<%@page import="com.sist.dao.ReviewDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.hr_bold{
		border:0;
		height:3px;
		background: #c7c7c7;
	}
	#p_titleImg{
		text-align:left;
    	margin: 0 auto;
    	
	}
	
    h2 {
        padding-top: 10px;
        text-align:left;
    }
	
	/* 이미지 */
	.detail_images {
		overflow:hidden;
    	margin-top: 20px;
   	 	margin-bottom: 15px;
	}
  	.main_image, .image-gallery, .image {
    	float: left;
    	border-radius: 30px; /* Rounded corners as per request */
  	}
  
  	.main_image {
    	width: 485px;
   		height: 340px; 
    	margin-right: 20px;
  	}
  	
  	.image-gallery {
    	width: 485px; 
    	height: 350px; 
  	}
  	.image-row {
    	display: flex;
    	justify-content: space-between;
    	margin-bottom: 10px;
  	}
  	.image {
   		width: 232px; 
    	height: 165px;
    	margin-right: 20px;
  	} 
  
  	.detail_images img {
    	width: 100%;
    	height: 100%;
    	display: block;
    	border-radius: 30px;
    	padding: 5px;
    	object-fit: cover;
  	}
	
	#imageModal {
    /* ... 기타 스타일 ... */
	    display: none; /* 초기 상태에서 none이 아닌 block으로 설정 */
	    position: fixed;
	    left: 50%;
	    top: 50%;
	    transform: translate(-50%, -50%);
	    width: 700px;
	    height: 600px; /* 높이를 자동으로 조절 */
	   /*  overflow:auto; */
	    background: #fff;
	    border-radius: 30px;
	    z-index: 200;
	    padding: 20px 20px 0 20px; /* 패딩 추가 */
    	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
	}
	
	#imageModal .modalHeader {
    	display: flex;
    	justify-content: flex-end;
    	padding: 10px 30px;
	}
	
	
	
	#imageModal .imageModalContent {
	    display: flex;
	    flex-direction: column; /* 추가: 세로 방향으로 나열*/
	    justify-content: flex-start; /* 상단 정렬 */
	    align-items: center; /* 가로 중앙 정렬 */
	    max-height: 75vh; /* 최대 높이를 화면 높이의 80%로 설정 */
	    overflow-y: auto; /* 내용이 넘칠 경우 스크롤 표시 */
	    /* padding: 10px; /* 패딩 추가 */ */
	}
	
	.imageModalContent{
	
	}
	
	
	/* 이미지 모달창 닫기 버튼 */
	.closeImageModal {
	    cursor: pointer;
	    border: none;
	    background: none;
	    font-size: 24px;
	}
	
	#imageModal .imageModalContent img {
	    max-width: 600px; /* 최대 너비 */
	    width: auto; /* 자동 너비 */
	    height: auto; /* 자동 높이 */
	    display: block; /* 블록 레벨 요소로 표시 */
	}
	
	/* 상품상세/결제 영역 */
	#p_detail_cal{
		display:flex;
		gap : 19px;
		width: 100%;
		align-items : flex-start; /* 자식 요소들의 상단정렬 */
		position : relative;
		/* min-height : 100vh;	 */
	}

	/* 상품상세정보 */		
    #p_detail {
       width:530px;
    }	

	
	#p_detailName h2 {
	    margin-top: 5px;
	    margin-bottom: 4px; /* h2의 하단 마진 제거 */
	    line-height: 1; /* 행간 좁히기 */
	    text-align:left;
	}

	#p_detailName h3 {
	    margin-top: 2px; /* h3의 상단 마진 제거 */
	    margin-bottom: 8px;
	    line-height: 1; /* 행간 좁히기 */
	   	font-weight: 500;
	   	text-align:left;
	}
	
	#p_detailName h4 {
	    text-align: left; /* 별점을 왼쪽으로 정렬 */
	}
	
	#p_detailName{
		margin-top:10px;
		margin-bottom:30px;
	}		
	
    
    #p_info {
        width:485px;
        border-radius: 30px;
        margin-bottom: 30px; 
    }
	
	
	/* 결제고정네비 */
	#r_nav{
		flex-grow: 1; /* 남은 공간을 채움 */
    	width: calc(100% - 550px); /* 전체 너비에서 p_detail의 너비를 뺀 나머지 */
    	position: relative; /* navBox의 sticky 위치 기준 */	
	}
	
	
	.navBox {
		text_align : left;
	    position: sticky;
	    top: 20px; /* 상단 고정 위치 */
	    width: 350px; /* 너비 */
	    height: auto; /* 높이는 자동으로 조정 */
	    margin: auto;
	    border-radius: 20px;
	    border: 2px solid #c7c7c7;
	    padding : 20px;
	    /* 기존 navBox 스타일 유지 */
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}
	
	.navBox h2{
		font-size : 24px;
		margin : 0 0 20px 0;
	}

    .navBox .price {
        font-size: 28px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .navBox .date {
        margin-bottom: 10px;
    }

    .navBox label {
        font-size: 14px;
        color: #333;
        display: block;
        margin-bottom: 5px;
    }

    .navBox input[type="text"],
    .navBox select {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #c7c7c7;
        border-radius: 5px;
    }

    .navBox .submit {
        background-color: #01d1ca;
        color: white;
        border: none;
        padding: 10px 20px;
        text-transform: uppercase;
        font-weight: bold;
        width: 100%;
        border-radius: 5px;
        cursor: pointer;
    }

    .navBox .total {
        color: #333;
        margin-top: 20px;
        font-weight: bold;
    }
    
	.navBox h2, .navBox .price, .navBox label, .navBox{
    	text-align: left;
	}
	
	.total{
		text-align: left;
		font-size : 20px;
	}
	
	#saleprice{
		width: 240px;
	}
	
	#checkin_date, #checkout_date{
		width: 330px;
	}

	/* 편의시설 */
    #amenity {
        margin-top: 20px;
        overflow:auto;
    }
    	
	#amenity_img{	/* 편의시설 아이콘 영역*/
		width:490px;
		margin : 20px auto;
		display: flex;	
		flex-wrap: wrap;  
	    gap: 10px; 
	    list-style: none;
	    padding: 0;
	}
	#amenity_img ul {
	    list-style : none;
	    padding : 0;
	    margin : 0;
	}
	#amenity_img ul li {
	    width : 49%;
	    float : left;
	    margin-bottom : 10px;
	    margin-right: 2%;
	}
	
	/* 우측 마진제거 */
	#amenity_img ul li:nth-child(2n) {
    	margin-right: 0; 
	}
	
	#amenity_img ul li img {
	    width: 100%; 
	    height: 50px; 
	    object-fit: cover; 
	}
	
    #amenity_img > img {
        width: 240px; 
        height: 110px;  
        margin-right: 10px; 
        margin-bottom: 10px;
        border-radius: 30px;
    }
     #amenity_img::after {
        content: "";
        clear: both;
        display: table;
    }   
    
    /* 숙소정보 */
    #p_explain{
    	width: 85%;
    	margin: 30px auto; 
    	word-wrap : break-word;
    	text-align: left;

    }

	/* 숙소 리뷰 */
	.review{
	    width: 100%;
	    margin-bottom: 30px; 	
	    overflow: auto;
	    text-align:center;
	}
	
	.review-item {
	    border-bottom: 1px solid #ccc;
	    padding: 10px;
		margin-bottom: 15px;
	}
	
	.review-user {
	display: flex;
	align-items: center;
	margin-bottom: -15px;
	}
	
	.user-image {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin-right: 10px;
	}
	
	.user-name {
	font-weight: bold;
	}
	
	.review-content {
	margin-top: 10px;
	}
	
	.rating {
		color: #01d1ca; 
		font-weight: bold;
		text-align:left;
	}
	
	.review-text {
	text-align:left;
	margin-top: 5px;
	margin-bottom: 5px;
	line-height: 1.5;
	max-height : 3em;
	overflow:hidden;
	text-overflow:ellipsis;
	/* white-space:nowrap; */
	}
	
	.review-date {
	margin-top: 5px 0;
	font-size: 0.8em;
	color: #666;
	text-align:left;
	}
	
	.item{
		border: 2px solid #c7c7c7;
		width: 45%;
		height: 180px;
		border-radius: 15px;
		margin:1%;
		padding: 20px;
		float:left;
		box-sizing:border-box;
	}
	
	/* 리뷰 4개보기 상세*/
	.reviewDetail{
		text-align:left;
		text-decoration:underline;
		color:#666666;
	}
	
	
	
	
	
	.review_item{
		width : 40%;
		float : left;
		margin-right: 10%;
		margin-bottom: 10px;
		box-sizing : border-box;
	}
	
	.review_item:nth-child(2n) { /* 오른쪽 글 마진 제거 */
		margin-right:0;
	}
	
	.review_item_content {
		border : 2px solid #c7c7c7;
		padding : 10px;
		border-radius : 10px;
		background : #fff;
		margin-bottom:10px;
		overflow: hidden;
	}
	.review-count{
		font-size: 15px;
		font-weight : 400;
	}
	
	.review_meta {
		display : flex;
		justify-content : space-between;
		margin-bottok:5px;
	}
	
	.review_rating {
		display:block;
		margin-bottom:5px;
	}
	
	.review_content{
		overflow:hidden;
		text-overflow:ellipsis;
		margin-bottom:10px;
	}
	
	.review_more{
		text-align: left;
		color: #000;
		display:block;
		text-decoration: none;
	}
	
	.review_more button {
	    padding: 10px 20px;
	    background-color: #01d1ca;
		border : 2px solid #01d1ca;
	    border-radius: 10px;
	    cursor: pointer;
	}
	
	
	
	
	
	
	
	/* 리뷰 모달창 */
	#modal {
	    display: none;
	    position: fixed;
	    left: 50%;
	    top: 50%;
	    transform: translate(-50%, -50%);
	    width: 700px;
	    height: 600px;
	    background: #fff;
	    border-radius: 30px;
	    z-index: 200;
	}
	
	#closeModal{
		text-align : right;
	}
	
	.close-modal {
	    cursor: pointer;
	    border: none;
	    background: none;
	    font-size: 24px;
	}

	.modalReviewHeader {
		text-align:left;
	    display: flex;
	    justify-content: space-between;
	    padding: 30px 30px 10px 30px;

	}
	
	#modalContent{
		padding: 0px 30px 10px 30px;
	}
	
	#modalContent h1 {
		text-align: left;
		margin-bottom : 0px;
	}
	
	#modalContent h2 {
		margin-top: 0;
	}
	
	.modal-backdrop {
	    display: none;
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background: rgba(0, 0, 0, 0.3);
	    z-index: 100; /* 모달 뒤에 위치 */
	}	

	/* 모달창 내 목록 */
	
	
	/* 지도 목록 */
	#detail_map{
		margin-top:30px;
	}
	
	#map{
		width:100%;
		height:400px;
		margin-top:30px;
		margin-bottom:50px;		
	}
	
	/* 결제 네비게이션  */
	input[type="date"] {
	    padding: 10px; /* 패딩을 늘려서 입력 필드의 크기를 조정 */
	    font-size: 16px; /* 폰트 크기를 조정 */
	    border: 1px solid #ccc; /* 테두리 스타일을 지정 */
	    border-radius: 4px; /* 둥근 모서리를 적용 */
	    width : 80%;
	}	

	

	
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fa8699608123bb81a55935414cdb2b89"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">

$(function() {

    // 체크인 날짜 선택 시 실행되는 함수
    $("#checkin_date").on("change", function() {
        calculateDateDifference();
    });

    // 체크아웃 날짜 선택 시 실행되는 함수
    $("#checkout_date").on("change", function() {
        calculateDateDifference();
    });
 	
 	
    function calculateDateDifference() {
    	 var checkInDate = new Date($("#checkin_date").val());
         var checkOutDate = new Date($("#checkout_date").val());

        // null 체크와 유효성 확인
        if (checkInDate && checkOutDate && !isNaN(checkInDate) && !isNaN(checkOutDate)) {
            // 두 날짜의 차이를 밀리초로 계산
            var timeDiff = checkOutDate.getTime() - checkInDate.getTime();

            // 밀리초를 일로 변환 (1일 = 24시간 * 60분 * 60초 * 1000밀리초)
            var daysDiff = Math.ceil(timeDiff / (1000 * 60 * 60 * 24));

            // id 선택자를 문자열로 감싸 주세요.
            $("#saleprice").val(daysDiff*${pd.price});
        }
    }
 	
 	
});
    
    
    


$(document).ready(function() {
    // 모달과 모달 오픈 버튼 선택
    var modal = $('#modal');
    var modalBackdrop = $('<div class="modal-backdrop"></div>').appendTo('body');
    var modalOpenButton = $('.modalOpenButton');
    var closeModalButton = $('#closeModal');

    // 모달창 열기 이벤트
    $('.modalOpenButton').click(function() {
	    var buttonType = $(this).data('type');
	
	    if (buttonType === 'review') {
	        // 리뷰 데이터 가져오기
	        var reviews = [
	            { userName: "사용자 1", rating: "4.5", text: "리뷰 내용 1", date: "2023-01-10" },
	            // ... 다른 리뷰 데이터
	        ];
	
	        var reviewListHtml = createReviewListHtml(reviews); // 이 함수는 리뷰 데이터를 HTML로 변환합니다.
	
	        var modalHtml = `
	            <div id="modalReviewHeader">
	                <span> ★ 4.5 </span>
	            </div>
	            <div id="modalReview">
	                <h2>전체 리뷰 <span class="review-count">(${reviews.length}개)</span></h2>
	                <hr>
	                ${reviewListHtml}
	            </div>`;
	
	        $('#modalContent').html(modalHtml);
		    $('#modal').show();
		    modalBackdrop.show(); //   백드롭 표시
		} else {
			// 다른 버튼 유형에 대한 처리
			$('#modalContent').html('다른 내용');
			$('#modal').show();
			modalBackdrop.show(); // 모달 백드롭 표시
		}
		
	});
    
    
    // "더보기" 버튼 클릭 이벤트
    $(".review").on("click","reviewDetail",function(){
    	var reno = $(this).data("reno");
    	
    });
    
    
    //리뷰 모달창 - 전체 리뷰리스트 추가
    function createReviewListHtml(reviews) {
    var html = "";
    reviews.forEach(function(review) {
        html += 
            `<div class="item">
                <div class="review-user">
                    <div class="user-name">${review.userName}</div>
                </div>
                <div class="review-content">
                    <div class="rating">평점: ★ ${review.rating}</div>
                    <div class="review-text">${review.text}</div>
                    <div class="review-date">${review.date}</div>
                    <div class="reviewDetail">더보기</div>
                </div>
            </div>`;
    });
    return html;
	}
 
 	
 	// 리뷰 모달창 열기
    $('.modalOpenButton').click(function() {
        // 리뷰 모달창 내용
        var modalHtml = '<div>리뷰 내용이 여기에 표시됩니다.</div>';
        $('#reviewModalContent').html(modalHtml);
        $('#reviewModal').show();
        $('.modal-backdrop').show();
    });

 	// 리뷰 모달창 닫기 버튼 이벤트 핸들러
    $('#closeModal').click(function() {
        $('#modal').hide(); // 리뷰 모달창 숨기기
        $('#modalContent').empty(); // 모달 내용 비우기
        modalBackdrop.hide(); // 백드롭 숨기기
    });
    
    
    
 	// 이미지 클릭 시 이미지 모달창 열기
    $('.detail_images img').click(function() {
        // 모달 내용을 비웁니다.
        $('#imageModal .imageModalContent').empty();

        // 모든 이미지를 순회하며 모달에 추가합니다.
        $('.detail_images img').each(function() {
            var src = $(this).attr('src');
            // 이미지를 모달에 추가합니다.
            $('#imageModal .imageModalContent').append(
                $('<img>').attr('src', src).css({
                    'width': '100%',
                    'height': 'auto',
                    'display': 'block',
                    'margin-bottom': '40px'
                })
            );
        });

        // 모달과 백드롭을 표시합니다.
        $('#imageModal').show();
        $('.modal-backdrop').show();
    });

 	// 이미지 모달창 닫기 이벤트
    $('.closeImageModal').click(function() {
        $('#imageModal').hide(); // 이미지 모달창 숨기기
        $('#imageModal .imageModalContent').empty(); // 이미지 내용 비우기
        $('.modal-backdrop').hide(); // 백드롭 숨기기
    });
 	
 	

 	// 이미지 모달창 닫기 이벤트
    $('.closeImageModal').click(function() {
        $('#imageModal').hide(); // 이미지 모달창 숨기기
        $('.imageModalContent').empty(); // 이미지 내용 비우기
        modalBackdrop.hide(); // 백드롭 숨기기
    });

 	// 모달 백드롭 클릭 이벤트
    modalBackdrop.click(function() {
        $('#modal, #imageModal').hide(); // 모든 모달창 숨기기
        $('#modalContent, .imageModalContent').empty(); // 모달 내용 비우기
        $(this).hide(); // 백드롭 숨기기
    });

});
  
  	//닫기버튼
	closeModalButton.click(function() {
    	modal.hide();
    	modalBackdrop.hide();
	});
  /* 지도 좌표 */
	window.onload = function(){
	  var position = new kakao.maps.LatLng(37.55655, 126.9196);
	  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = { 
      	center: position, // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성
	var map = new kakao.maps.Map(mapContainer, mapOption); 
               
         
	// 마커를 생성
	var marker = new kakao.maps.Marker({
		position: position
	});
         
    // 마커가 지도 위에 표시되도록 설정
	marker.setMap(map);
	}      

  
</script>	

</head>
<body>

<!-- 리뷰 모달창 -->
<div id="modal" class="hidden">
	<div class="modalReviewHeader">
		<button type="button" id="closeModal" class="close-modal">X</button>
	</div>
	<div id="modalContent">
	<!-- 리뷰 내용 들어갈곳 -->
	</div>
</div>

<!-- 이미지 모달창 -->
<div id="imageModal" class="hidden">
    <div class="modalHeader">
        <button type="button" class="closeImageModal close-modal">X</button>
    </div>
    <div class="imageModalContent">
        <!-- 이미지 내용 들어갈곳 -->
    </div>
</div>



<!-- 컨텐트 1 : 상품명, 이미지 -->
<!-- 상품이미지-->		
<div class="detail_images">
	<div class="main_image">
		<img src="images/${imageList.img1 }" alt="메인 이미지">
	</div>
	<div class="image-gallery">
		<div class="image-row">
			<div class="image">
	        <img src="images/${imageList.img2 }" alt="이미지 1">
		</div>
		<div class="image">
			<img src="images/${imageList.img3 }" alt="이미지 2">
		</div>
	    </div>
	    <div class="image-row">
	      <div class="image">
	        <img src="images/${imageList.img4 }" alt="이미지 3">
	      </div>
	      <div class="image">
	        <img src="images/${imageList.img5 }" alt="이미지 4">
	      </div>
	    </div>
	</div>
</div>
	

	
	
		
		<!-- 컨텐트 2 : 상품상세정보, 결제창-->
<form action="insertReservation.do" method="post">
<div id = "p_detail_cal">	
	<div id = "p_detail">
		<div id = "p_detailName">
		<h1>${pd.p_name } &nbsp;</h1>
		<h3> 최대 인원 ${pd.occ_max }명</h3>
		<h4> ★ ${pd.rating }</h4>
		<input type="hidden" value="${pd.p_name }" name="p_name">
		<input type="hidden" value="${pd.occ_max }" name="OCC_MAX">
		<input type="hidden" value="${pd.rating }" name="rating">
	</div>		
			
	<hr class = "hr_bold">
	<div id = "amenity">
		<h2>편의시설</h2>
		<hr>	
		<div id = "amenity_img">
			<ul>
				<li><img src = "images/wifi.jpg"></li>
				<li><img src = "images/wm.jpg"></li>
				<li><img src = "images/parking.jpg"></li>
				<li><img src = "images/cooking.jpg"></li>
<!-- 				<li><img src = "images/ac.jpg"></li> -->
			</ul>
		</div>
	</div>
	
	<hr class = "hr_bold">		
	<div id = "p_info">
		<h2> 숙소 정보 </h2>
		<hr>
		<div id = "p_explain">
			${pd.p_explain }

		</div>	
			
	</div>
	<hr class = "hr_bold">
			
	</div>
	
	<!-- 네비게이터 -->
	<div id = r_nav>
		<div class="navBox">
			<div class="price">${pd.price }원 / 박</div>
			<input type="hidden" name="price" value="${pd.price}">
			<div class="date">
				<label">체크인 날짜</label>
				<input type="date" id="checkin_date" name="checkin_date">
			</div>
	    	<div class="date">
				<label>체크아웃 날짜</label>
	        	<input type="date" id="checkout_date" name="checkout_date">
	    	</div>
	    	<div class="date">
	 			<label for="guests">인원 수 선택</label>
	    		<select id="guests" name="guests">
			      <option value="1">1 인</option>
			      <option value="2">2 인</option>
			      <option value="3">3 인</option>
			      <option value="4">4 인</option>
			      <option value="5">5 인</option>
			    </select>
			</div>
			<div class="total">총 합계 : <input id="saleprice" name="saleprice" type="text"></div>
	    	<button class="submit">예약하기</button>	    	
		</div>
	</div>
</div>
</form>		
	

	
	<!--  평점 / 리뷰 -->
 <div class = review>
	<h2> 평점&nbsp;/&nbsp;리뷰 <span class="review-count">(8개)</span></h2>
	<br>
	<div class="item">
        <div class="review-user">
            <div class="user-name">사용자 1</div>
        </div>
        <div class="review-content">
            <div class="rating">평점: ★ 4.5</div>
            <div class="review-text">매우 만족스러운 숙박이었습니다. 위치가 좋고, 숙소가 깨끗해요.wjawjarlfjdwu 겆멎머미아러님ㅇ나ㅣㅓ ㄹㅁ아ㅣ 호오오오아어라넝라노아론ㅇ라ㅗㄴ </div>
            <div class="review-date">2023-01-10</div>
            <div class="reviewDetail">더보기</div>
        </div>
	</div>
 </div>


	 
 <div class="review">

    <h2>평점&nbsp;/&nbsp;리뷰 <span class="review-count">(${reviewCount}개)</span></h2>
    <br>
    <c:forEach var="review" items="${reviews }"  varStatus="status">
        <c:if test="${status.count <= 6}">
            <div class="item">
                <div class="review-user">
                    <div class="user-name"><c:out value="${review.nickname}"/></div>
                </div>
                <div class="review-content">
                    <div class="rating">평점: ★ <c:out value="${review.rating}"/></div>
                    <div class="review-text"><c:out value="${review.re_content}"/></div>
                    <div class="review-date"><fmt:formatDate value="${review.re_date}" pattern="yyyy-MM-dd"/></div>
                    <div class="reviewDetail">더보기</div>
                </div>
            </div>
        </c:if>
    </c:forEach> 
 
 <!--리뷰 - 데이터베이스  -->   

	

			<!-- 리뷰 더보기 버튼 -->
		<div class="review_more">
			<button type="button" class="modalOpenButton" data-type="review">
				리뷰 더보기
			</button>
		</div>	

	</div>

	
		<!-- 위치 지도 --> 
	<div id = detail_map>
		<h2> 위치 지도 </h2>
		<hr class = "hr_bold">
			
		<div id="map"></div>
	</div>	
		
		<!— 맛집추천 —>
	
</body>
</html>

