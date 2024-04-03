<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    .menu-btn-container {
      width: 600px;
      display: flex;
      justify-content: space-between;
    }

    .menu-btn {
      background-color: #3498db;
      color: white;
      padding: 10px;
      cursor: pointer;
      border: none;
      border-radius: 5px;
      margin: 5px;
      flex-grow: 1;
    }

    .menu-item {
      display: inline-block;
      margin: 5px;
    }

    .menu-item img {
      width: 100px;
      height: 100px;
      object-fit: cover;
      border-radius: 5px;
      cursor: pointer;
    }

    .dropdown {
      display: none;
      position: absolute;
      background-color: #f9f9f9;
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
      z-index: 1;
    }

    .dropdown a {
      color: black;
      padding: 12px 16px;
      text-decoration: none;
      display: block;
    }

    .dropdown a:hover {
      background-color: #f1f1f1;
    }
  </style>
  <title>Toggle Menu Example</title>
</head>
<body>

<div class="menu-btn-container">
  <button class="menu-btn" onclick="toggleMenu('menu1')">Button 1</button>
  <button class="menu-btn" onclick="toggleMenu('menu2')">Button 2</button>
  <button class="menu-btn" onclick="toggleMenu('menu3')">Button 3</button>
  <button class="menu-btn" onclick="toggleMenu('menu4')">Button 4</button>
  <button class="menu-btn" onclick="toggleMenu('menu5')">Button 5</button>
</div>

<div id="menu1" class="dropdown">
  <div class="menu-item" onclick="goToLink('link1.html')">
    <a href="#">
      <img src="image1.jpg" alt="Image 1">
    </a>
  </div>
  <div class="menu-item" onclick="goToLink('link1.html')">
    <a href="#">
      <img src="image1.jpg" alt="Image 1">
    </a>
  </div>
  <div class="menu-item" onclick="goToLink('link1.html')">
    <a href="#">
      <img src="image1.jpg" alt="Image 1">
    </a>
  </div>
  
  <div class="menu-item" onclick="goToLink('link1.html')">
    <a href="#">
      <img src="image1.jpg" alt="Image 1">
    </a>
  </div>
  <div class="menu-item" onclick="goToLink('link1.html')">
    <a href="#">
      <img src="image1.jpg" alt="Image 1">
    </a>
  </div>
  <div class="menu-item" onclick="goToLink('link1.html')">
    <a href="#">
      <img src="image1.jpg" alt="Image 1">
    </a>
  </div>
  <!-- 다른 이미지들을 추가하세요 -->
</div>

<script>
  function toggleMenu(menuId) {
    var menu = document.getElementById(menuId);
    menu.style.display = (menu.style.display === 'block') ? 'none' : 'block';
  }

  function goToLink(link) {
    window.location.href = link;
  }

  // 클릭 이벤트가 document 전체에 걸리게 하여 다른 영역을 클릭했을 때 메뉴가 닫히도록
  document.addEventListener('click', function (event) {
    if (!event.target.matches('.menu-btn') && !event.target.closest('.menu-item')) {
      var dropdowns = document.getElementsByClassName('dropdown');
      for (var i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.style.display === 'block') {
          openDropdown.style.display = 'none';
        }
      }
    }
  });
</script>

</body>
</html>
    