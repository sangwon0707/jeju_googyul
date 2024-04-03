<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<style type="text/css">
    	.items {
	float: left;
	padding: 10px;
}

.goods {
	width: 100px;
	height: 100px;
}

.box {
	border: 5px pink solid;
	width: 250px;
	height: 100px;
	border-radius: 10px;
	margin: 10px;
	padding: 10px;
	position: relative;
	float: left;
}

*,
*::before,
*::after {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

ul {
	display: flex;
	gap: 1rem;
	list-style: none;
	justify-content: space-around;
}

.link {
	text-decoration: none;
	color: #01d1ca;
	font-size: 22px;
	padding: 1rem 2rem;
	position: relative;
}

.link::before,
.link::after {
	content: "";
	position: absolute;
	width: 100%;
	height: 2px;
	background: #01d1ca;
	transform: scaleX(0);
	transition: all 0.6s ease;
}

.link::before {
	top: 0;
	left: 0;
	transform-origin: left;
}

.link::after {
	bottom: 0;
	left: 0;
	transform-origin: right;
}

.link:hover::before,
.link:hover::after {
	transform: scaleX(1);
}


/* content.css */
.b1 {
	margin-top: 10px;
}

.previewButton {
	position: absolute;
	/* 절대적인 위치 설정 */
	bottom: 0;
	left: 0;
	background-color: rgb(255, 255, 255);
	/* 미리보기 버튼 배경색 */
	padding: 5px;
	border-radius: 0 30px;
	/* 원하는 둥근 모서리 설정 */
	cursor: pointer;
	transition: background-color 0.3s;
	display: none;
}

.previewButton:hover {
	background-color: white;
}



#image {
	display: flex;
	justify-content: center;
}

#viewMap {
	border-radius: 48%;
	border: 1px solid #01d1ca;
	background-color: #01d1ca;
	margin-top: 50px;
	position: fixed;
	bottom: 20px;
	left: 50%;
	transform: translateX(-50%);
	width: 80px;
	height: 50px;
	padding: 10px;
	cursor: pointer;
}


/* 모달 스타일 */
.modal {
	display: none;
	/* 초기에는 숨김 상태로 설정 */
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 10000;
	width: 60%;
	max-width: 600px;
	background-color: #fff;
	padding: 20px;
	border: 1px solid #ccc;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	/* 그림자 추가 */

}

.modalBody {
	text-align: center;
}

#modalImage {
	max-width: 100%;
	/* 이미지가 모달 내에서 꽉 차도록 설정 */
	height: auto;
	/* 가로 비율을 유지하면서 높이 자동 조정 */
}

/* 모달 헤더 스타일 */
.modalHeader {
	display: flex;
	justify-content: flex-end;
	/* 우측 정렬 */
	padding: 10px;
	border-bottom: 1px solid #ccc;
}

/* 모달 닫기 버튼 스타일 */
.close {
	font-size: 24px;
	cursor: pointer;
}

body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	padding-top: 70px;
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

.productBox {
    display: inline-block;
    width: 22%; /* 네 개의 엘리먼트가 한 행에 들어갈 수 있도록 너비 조절 */
    height: 500px;
    border-radius: 20px;
    border: 1px solid #ddd;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    display: inline-block;
    margin: 0 1%;
    margin-bottom: 30px;
    transition: all 0.3s ease;
}

/* Add a clear property to clear the inline layout after every third box */
.productBox:nth-child(4n+1) {
    clear: left;
}

.productBox:hover {
    border: 5px orange solid;
    transform: scale(1.1);
}

.productP_name {
    background: orange;
    width: 300px;
    height: 150px;
}

img {
	max-width: 100%;
	height: auto;
	border-radius: 15px;
	margin-right: 10px;
}

button {
	background-color: #008489;
	color: #fff;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #006666;
}
</style>
<style>
	#productList{
		justify-content: space-around;
		align-items: center;
	}
</style>
<script>
	$(function() {
<%-- imageContainer클래스의 자식인 imageLine에 마우스가 들어가면
	 마우스가 들어간 이미지에 자식 중에서 previewButton을 찾아서 fadeIn 또는 fadeOut한다.--%>
	$(".productBox").hover(function() {
					// 이미 미리보기가 나타나지 않은 경우에만 fadeIn
					if (!$(this).find(".previewButton").is(":visible")) {
						$(this).find(".previewButton").fadeIn();
					}
				}, function() {
					// 이미 미리보기가 나타난 경우에만 fadeOut
					if ($(this).find(".previewButton").is(":visible")) {
						$(this).find(".previewButton").fadeOut();
					}
				});

				$(".wish").click(function() {
					console.log("wish clicked");
					// 클릭한 이미지의 위시리스트 아이콘을 토글
					$(this).toggleClass("wish-active");
					// 이 부분에서 위시리스트에 추가 또는 제거하는 로직을 추가할 수 있습니다.
					// 예를 들어, Ajax 요청을 사용하여 서버에 위시리스트 추가 또는 제거를 수행할 수 있습니다.
				});

				// 미리보기 버튼 클릭 이벤트 처리
				$(".previewButton").click(function() {
					var p_name = $(this).data("p_name");
					var rating = $(this).data("rating");
					var img = $(this).data("img");
					var addr = $(this).data("addr");
					var occ_max = $(this).data("occ_max");

					showPreviewModal(p_name, rating, img, addr, occ_max);
				});

				function showPreviewModal(p_name, rating, img, addr, occ_max) {
					// 모달에 이미지 소스 설정
					// 모달에 이미지 소스 설정
					$("#modalImage").attr("src", img);

					// 모달에 상품 정보 설정
					$(".modalBody h2:eq(0)").text(p_name);
					$(".modalBody p:eq(0)").text(addr);
					$(".modalBody p:eq(1)").text("평점 : " + rating);
					$(".modalBody p:eq(2)").text("최대인원 : " + occ_max);
					// 다른 정보에 대한 추가 코드...

					// 모달 열기
					$(".modal").fadeIn();
				}

				// x 버튼 클릭 시 모달 닫기
				$(".close").click(function() {
					$(".modal").fadeOut();
				});

			})
</script>
</head>
<body>
	<div>
        <ul>
            <li><a href="#" class="link">호텔</a></li>
            <li><a href="#" class="link">게스트하우스</a></li>
            <li><a href="#" class="link">펜션</a></li>
        </ul>
    </div>
    <table>
	    <tbody>
	        <c:forEach var="w" items="${wishList}">
	            <tr class="productRow">
	                <td>
	                    <a href="detailProduct.do?pno=${w.pno}">
	                        <img class="productImage" src="./images/${w.img1}" alt="${w.p_name}">
	                    </a>
	                </td>
	                <td>
	                    <div class="productP_name">
	                        <p>${w.p_name}</p>
	                        <i class="fa-solid fa-heart toggle-heart" style="color: #ea4354; float: right;"></i>
	                        <br>
	                        <p>평점: ${w.rating}</p>
	                        <p>가격: ${w.price}</p>
	                    </div>
	                </td>
	            </tr>
	        </c:forEach>
	    </tbody>
</table>
    <div id="productList">
        <c:forEach var="p" items="${mainlist}">
            <div class="productBox">
                <div>
                    <a href="detailProduct.do?pno=${p.pno}"><img class="productImage" src="./images/${p.img}"></a>
                </div>

                <div class="productP_name">
                     <p>${p.p_name}</p>
                     <i class="fa-solid fa-heart toggle-heart" style="color: #ea4354; float: right;"></i> <br>
  	                 <p>평점: ${p.rating}</p>
                     <p>가격: ${p.price}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>
