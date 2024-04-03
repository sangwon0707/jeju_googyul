<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Reservations and Reviews</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://kit.fontawesome.com/90da83db2d.js" crossorigin="anonymous"></script>
    <script>
	    $(document).ready(function () {
	        $(".toggle-heart").click(function () {
	            // Toggle between regular and solid heart icons
	            var heartIcon = $(this);
	            if (heartIcon.hasClass("fa-solid")) {
	                heartIcon.removeClass("fa-solid").addClass("fa-regular").css("color", "#ebebeb");
	            } else {
	                heartIcon.removeClass("fa-regular").addClass("fa-solid").css("color", "#ea4354");
	            }
	        });
	    });
    </script>
    <style>
        body {
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
        
		
		.wishlistBox {
		    /* Existing styles for .wishlistBox */
		    display: inline-block;
		    width: 30%;
		    height: 250px;
		    border-radius: 20px;
		    border: 1px solid #ddd;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5	);
		    display: inline-block;
		    margin: 0 1%;
		    margin-bottom: 30px;
		    transition: all 0.3s ease; /* Add a smooth transition for better visual effect */
		}
		.wishlistBox, tbody{
			magin:0px;
			padding: 0px;
			width: 154px;
		}
		
		/* Add a clear property to clear the inline layout after every third box */
		.wishlistBox:nth-child(3n+1) {
		    clear: left;
		}
        .wishlistBox:hover {
		    border: 5px #01d1ca solid; /* Increase border size on hover */
		    transform: scale(1.1); /* Increase size by 10% on hover */
		}
		.wishlistP_name{
			background: #01d1ca;
			with
		}
		tr{
			magin:0px;
			padding:0px;
		}
        td {
            padding: 5px;
            text-align: left;
        }

        img {
            max-width: 100%;
            height: auto;
            border-radius: 15px;
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
        
    </style>
</head>
<body>
    <div>
        <hr>
        <div>
            <h2>${name}님의 위시리스트</h2>
            <div>
              <c:forEach var="wishlist" items="${wishlistList}">
                <table class="wishlistBox">
	                <tr>
	                    <td width="150px"><a href=""><img class="wishlistImage" src="./images/${wishlist.img1}" alt="Wishlist Image"/></a></td>
	                </tr>
	                <tr>
					    <td class="wishlistP_name">
					        <b>${wishlist.p_name}</b>
					        <!-- Add a like (heart) icon here with onclick event -->
					        <i class="fa-solid fa-heart toggle-heart" style="color: #ea4354; float: right;"></i>
					        <br>
					    </td>
					</tr>
	                	 <td>평점: ${wishlist.rating}<br>
	                     가격: ${wishlist.price}
	                </tr>
                </table>
             </c:forEach>      
            </div>
            <!-- <a href=""><button>더보기</button></a> -->
        </div>
    </div>
</body>
</html>
