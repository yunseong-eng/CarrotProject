<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
/* 헤더 스타일 */
#header {
    display: flex;
    align-items: center;
    justify-content: space-between; /* 좌우 배치: 로고 왼쪽, 검색창 오른쪽 */
    padding: 10px;
    background-color: white;
}
#header img {
    height: 80px; /* 로고 크기 */
    margin-right: 20px; /* 로고와 메뉴 간격 */
    margin-left: 30px; /* 로고를 오른쪽으로 이동 */
}
#header a {
    text-decoration: none;
    color: black;
    margin-right: 30px;
    font-size: 18px;
    padding-top: 10px; /* 메뉴 글씨 위치 위로 이동 */
}
#header a:hover {
    text-decoration: underline;
}

/* 검색창 스타일 */
.searchForm {
    display: flex;
    align-items: center;
    border: 2px solid red;
    border-radius: 3px;
    padding: 5px;
}

#searchBox {
    margin-right: 10px;
    position: relative; /* 아이콘을 검색창 안에 배치하기 위해 position 속성 사용 */
}

#search {
    padding: 5px;
    font-size: 16px;
    width: 250px;
    border: none;
    outline: none;
}

#search::placeholder {
    color: #888;
}

/* 돋보기 아이콘 스타일 */
#search_imgbox {
    position: absolute;
    top: 50%;
    right: 10px;
    transform: translateY(-50%);
    font-size: 16px;
}

#search_imgbox i {
    cursor: pointer;
    color: black;
}
</style>
<!-- Font Awesome 아이콘 라이브러리 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <!-- 헤더 -->
    <div id="header">
        <!-- 로고 및 메뉴 링크 -->
        <div>
            <a href="${pageContext.request.contextPath}/">
                <img src="${pageContext.request.contextPath}/image/carrotLogo.jpg" alt="로고">
            </a>
            <a href="${pageContext.request.contextPath}/board/listForm?category=전체">ALL</a>
            <a href="${pageContext.request.contextPath}/board/listForm?category=의류">CLOTHES</a>
            <a href="${pageContext.request.contextPath}/board/listForm?category=신발">SHOES</a>
        </div>

        <!-- 검색창 -->
        <div class="searchForm">
            <form id="searchForm" method="get" action="${pageContext.request.contextPath}/board/search">
                <div id="searchBox">
                    <input type="text" name="search" id="search" placeholder="ID, 상품명, 카테고리 입력">
                    <div id="search_imgbox">
                        <i class="fas fa-search"></i> <!-- Font Awesome 돋보기 아이콘 -->
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
