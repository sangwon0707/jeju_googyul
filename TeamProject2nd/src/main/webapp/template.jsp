<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>GooGyul - 제주도로 떠나는 나의 환타지</title>
    <style>
        body, header, footer, article, section, nav, h1, h2, h3, h4, h5, h6, p, a, img, ul, ol, li, form, fieldset, legend, label {
            margin: 0;
            padding: 0;
            border: 0;
        }

        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
        }

        header {
            position: fixed;
            top: 0;
            left: 0;
            height: 80px;
            width: 100%;
        }

        main {
        	flex: 4;
        	height: 1700px;
            margin: 0px;
            width: 100%;
        }

        footer {
            clear: both;
            margin-top: 20px;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            left: 0;
            height: 100px;
            width: 100%;
            background-color: whitesmoke;
        }
        iframe {
            width: 100%;
            height: 100%;
            border: none;
        }
    </style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 	
	<script>
	    $(document).ready(function() {
	        // Check if viewPage is empty
	        if (!"${viewPage}") {
	            // Set viewPage to the default value
	            "${viewPage}" = "listProduct.do";
	        }
	
	        // Set the iframe source attribute
	        $("#mainFrame").attr("src", "${viewPage}");
	    });
	</script>
</head>
<body>
    <header>
        <jsp:include page="header.jsp"/>
    </header>
    <hr>
    <main>
    <hr>
		<iframe id="mainFrame" name="mainFrame" width="100%" height="100%" src="${viewPage}" sandbox="allow-same-origin" ></iframe>
    </main>
    <footer>
        <jsp:include page="footer.jsp"/>
    </footer>
</body>
</html>
