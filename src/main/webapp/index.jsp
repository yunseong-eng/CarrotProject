<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="icon" href="/image/carrotLogo.png" type="image/png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>carrot | 중고거래 FLEX</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">

<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/media.css">  --%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Font Awesome -->
</head>
<body>
	<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
	<div id="wrap" class="container">
		<header>
			<div id="header">
				<a href="/carrot"><img src="${context}/image/carrotLogo.jpg"
					class="logo"></a>
				<dl class="topnav">
					<dt class="blind">top navigation</dt>
					<!--   <dd><a href="#">고객센터</a></dd>
                  <dd><a href="#">마이페이지</a></dd>
                  <dd><a href="#">관심</a></dd>
                  <dd><a href="#">알림</a></dd> -->
					<c:if test="${user.userId == null}">
						<!-- 세션이 없으면 로그인만 표시 -->
						<dd>
							<a href="${pageContext.request.contextPath}/user/login">로그인</a>
						</dd>
					</c:if>
					<c:if test="${user.userId != null}">
						<!-- 사용자가 로그인한 상태 -->
						<dd>
							<h6>[${user.userId }] 님</h6>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/user/myinfo">마이페이지</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/user/logout">로그아웃</a>
						</dd>
					</c:if>
				</dl>
				<dl class="topnav2">
					<dt class="blind">top navigation</dt>
					<dd>
						<a href="https://www.apple.com/kr/app-store/">APP</a>
					</dd>
					<dd>
						<a
							href="https://apps.apple.com/kr/app/%EB%B2%88%EA%B0%9C%EC%9E%A5%ED%84%B0/id395672275">IOS</a>
					</dd>
					<dd>
						<a
							href="https://play.google.com/store/apps/details?id=kr.co.quicket&hl=ko&pli=1">ANDROID</a>
					</dd>
					<dd>
						<a
							href="https://png.pngtree.com/png-clipart/20220226/ourmid/pngtree-greedy-emoji-png-image_4459716.png"><img
							src="${pageContext.request.contextPath}/image/d2.png" width="20"></a>
					</dd>
				</dl>

				<h2 class="blind">main navigation</h2>
				<ul class="mainnav">
					<li><a
						href="${pageContext.request.contextPath}/board/listForm?category=전체">ALL</a></li>
					<li><a
						href="${pageContext.request.contextPath}/board/listForm?category=의류">CLOTHES</a></li>
					<li><a
						href="${pageContext.request. contextPath}/board/listForm?category=신발">SHOES</a></li>
				</ul>

				<!-- 검색창 중앙에 배치 -->
				<div class="searchForm"
					style="margin: 0 auto; display: flex; justify-content: center; position: relative; z-index: 10;">
					<form id="searchForm" method="get"
						action="${pageContext.request.contextPath}/board/search">
						<div id="searchBox"
							style="position: relative; display: flex; align-items: center;">
							<input type="text" name="search" id="search"
								placeholder="ID, 상품명, 카테고리 입력">
							<div id="search_imgbox">
								<i class="fas fa-search"></i>
								<!-- Font Awesome 돋보기 아이콘 -->
							</div>
						</div>
					</form>
				</div>

			</div>
			<!--header-->
		</header>

		<%-- 		<span class="slideshow-container">
			<div class="slidesbackground">
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/1.webp"
						class="slideshow-image">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/2.webp"
						class="slideshow-image">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/3.webp"
						class="slideshow-image">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/4.webp"
						class="slideshow-image">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/5.webp"
						class="slideshow-image">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/6.webp"
						class="slideshow-image">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/7.webp"
						class="slideshow-image">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/8.webp"
						class="slideshow-image">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/9.webp"
						class="slideshow-image">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/10.webp"
						class="slideshow-image">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/11.webp"
						class="slideshow-image">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/12.webp"
						class="slideshow-image">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/13.webp"
						class="slideshow-image">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/card0.webp"
						class="slideshow-image">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/welcome.webp"
						class="slideshow-image">
				</div>
			</div>
		</span> --%>
		<span class="slideshow-container">
			<div class="slidesbackground">
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/5.png"
						class="slideshow-image">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/1.png"
						class="slideshow-image">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/2.png"
						class="slideshow-image">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/3.png"
						class="slideshow-image">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/image/4.png"
						class="slideshow-image">
				</div>
			</div>
		</span> <br> <br> <br>
		<div class="itemcenter">
			<div class="layout">
				<img src="${pageContext.request.contextPath}/image/item1.webp"
					alt="item1">
				<dd>Carrot Draw</dd>
			</div>
			<div class="layout">
				<img src="${pageContext.request.contextPath}/image/item2.webp"
					alt="item2">
				<dd>남성 추천</dd>
			</div>
			<div class="layout">
				<img src="${pageContext.request.contextPath}/image/item3.webp"
					alt="item3">
				<dd>여성 추천</dd>
			</div>
			<div class="layout">
				<img src="${pageContext.request.contextPath}/image/item4.webp"
					alt="item4">
				<dd>색다른 추천</dd>
			</div>
			<div class="layout">
				<img src="${pageContext.request.contextPath}/image/item5.webp"
					alt="item5">
				<dd>대표 트랙탑</dd>
			</div>
			<div class="layout">
				<img src="${pageContext.request.contextPath}/image/item6.webp"
					alt="item6">
				<dd>정가 아래</dd>
			</div>
			<div class="layout">
				<img src="${pageContext.request.contextPath}/image/item7.webp"
					alt="item7">
				<dd>24FW 신상 발매</dd>
			</div>
			<div class="layout">
				<img src="${pageContext.request.contextPath}/image/item8.webp"
					alt="item8">
				<dd>구해요</dd>
			</div>
			<div class="layout">
				<img src="${pageContext.request.contextPath}/image/item9.webp"
					alt="item9">
				<dd>20만원애 아이폰</dd>
			</div>
			<div class="layout">
				<img src="${pageContext.request.contextPath}/image/item10.webp"
					alt="item10">
				<dd>러닝화 완벽 준비</dd>
			</div>
		</div>
		<br> <br> <br> <br>
		<hr>
		<br>
		<div class="logname">
			<dd>Just Dropped</dd>
			<p>발매 상품</p>
		</div>
		<div class="itemcenter">
			<div class="item">
				<img src="${pageContext.request.contextPath}/image/dropped6.webp"
					alt="dropped6">
				<dd class="name">Jordan</dd>
				<dd>Jordan 1 Retro Low OG Mocha</dd>
				<dd class="name">185,000원</dd>
				<dd class="mininame">즉시 구매가</dd>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/image/dropped2.webp"
					alt="dropped2">
				<dd class="name">BLR</dd>
				<dd>[KREAM 단독] BLR Embossed Wave Washing Wide Denim Pants Black</dd>
				<dd class="name">143,000원</dd>
				<dd class="mininame">즉시 구매가</dd>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/image/dropped3.webp"
					alt="dropped3">
				<dd class="name">Uniqlo</dd>
				<dd>Uniqlo Multi Pocket Shoulder Bag Olive</dd>
				<dd class="name">45,000원</dd>
				<dd class="mininame">즉시 구매가</dd>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/image/dropped4.webp"
					alt="dropped4">
				<dd class="name">Asics</dd>
				<dd>Asics Jog 100 S White Black - 2E Wide (Korea Exclusive)</dd>
				<dd class="name">92,000원</dd>
				<dd class="mininame">즉시 구매가</dd>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/image/dropped5.webp"
					alt="dropped5">
				<dd class="name">Asics</dd>
				<dd>Asics Gel-Kayano 14 Earthenware Pack Fjord Grey Cement Grey</dd>
				<dd class="name">211,000원</dd>
				<dd class="mininame">즉시 구매가</dd>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/image/dropped1.webp"
					alt="dropped1">
				<dd class="name">Nike</dd>
				<dd>Nike x Peaceminusone Air Force 1 Low Para-Noise 3.0 Black
					and Multicolor</dd>
				<dd class="name">432,000원</dd>
				<dd class="mininame">즉시 구매가</dd>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/image/dropped7.webp"
					alt="dropped7">
				<dd class="name">Good Smile Company</dd>
				<dd>[예약배송] Good Smile Company Max Factory Blue Archive Plamatea
					Toki</dd>
				<dd class="name">211,000원</dd>
				<dd class="mininame">즉시 구매가</dd>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/image/dropped8.webp"
					alt="dropped8">
				<dd class="name">Puma</dd>
				<dd>Puma Speedcat OG Puma Black Mauve Mist</dd>
				<dd class="name">154,000원</dd>
				<dd class="mininame">즉시 구매가</dd>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/image/dropped9.webp"
					alt="dropped9">
				<dd class="name">sansan Gear</dd>
				<dd>Sansan Gear Contrast Jacket Black</dd>
				<dd class="name">179,000원</dd>
				<dd class="mininame">즉시 구매가</dd>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/image/dropped10.webp"
					alt="dropped10">
				<dd class="name">Asics</dd>
				<dd>Asics x Above The Clouds GT-2160 Black Gunmetal</dd>
				<dd class="name">185,000원</dd>
				<dd class="mininame">즉시 구매가</dd>
			</div>

		</div>
		<div class="button-container">
			<button class="button">더보기</button>
		</div>
		<br> <br> <br> <br>
		<hr>
		<br>

		<!-----------------------------------------반복--------------------------------------->
		<div class="logname">
			<dd>Top Brand</dd>
			<p>인기 탑 브랜드</p>
		</div>
		<div class="itemcenter">
			<div class="layout">
				<img
					src="${pageContext.request.contextPath}/topbrandimage/jordan.webp"
					alt="why">
				<dd>나이키</dd>
			</div>
			<div class="layout">
				<img
					src="${pageContext.request.contextPath}/topbrandimage/adidas.webp"
					alt="w">
				<dd>아디다스</dd>
			</div>
			<div class="layout">
				<img
					src="${pageContext.request.contextPath}/topbrandimage/stussy.webp"
					alt="">
				<dd>스투시</dd>
			</div>
			<div class="layout">
				<img
					src="${pageContext.request.contextPath}/topbrandimage/chrome_hearts.webp"
					alt="">
				<dd>크롬하츠</dd>
			</div>
			<div class="layout">
				<img
					src="${pageContext.request.contextPath}/topbrandimage/iab_studio.webp"
					alt="">
				<dd>아이앱 스튜디오</dd>
			</div>
			<div class="layout">
				<img
					src="${pageContext.request.contextPath}/topbrandimage/bape.webp"
					alt="">
				<dd>베이프</dd>
			</div>
			<div class="layout">
				<img
					src="${pageContext.request.contextPath}/topbrandimage/supreme.webp"
					alt="">
				<dd>슈프림</dd>
			</div>
			<div class="layout">
				<img
					src="${pageContext.request.contextPath}/topbrandimage/palace.webp"
					alt="">
				<dd>팔라스</dd>
			</div>
			<div class="layout">
				<img
					src="${pageContext.request.contextPath}/topbrandimage/asics.webp"
					alt="">
				<dd>아식스</dd>
			</div>
			<div class="layout">
				<img
					src="${pageContext.request.contextPath}/topbrandimage/carhartt.webp"
					alt="">
				<dd>칼하트 WIP</dd>
			</div>
			<div class="layout">
				<img
					src="${pageContext.request.contextPath}/topbrandimage/salomon.webp"
					alt="">
				<dd>살로몬</dd>
			</div>
			<div class="layout">
				<img
					src="${pageContext.request.contextPath}/topbrandimage/jordan.webp"
					alt="">
				<dd>조던</dd>
			</div>
			<div class="layout">
				<img
					src="${pageContext.request.contextPath}/topbrandimage/newbalance.webp"
					alt="">
				<dd>뉴발란스</dd>
			</div>
			<div class="layout">
				<img
					src="${pageContext.request.contextPath}/topbrandimage/matinkim.webp"
					alt="">
				<dd>마땡킴</dd>
			</div>
			<div class="layout">
				<img
					src="${pageContext.request.contextPath}/topbrandimage/sansanGear.webp"
					alt="">
				<dd>산산기어</dd>
			</div>
		</div>
		<br> <br> <br> <br>
		<hr>
		<br>
		<!-----------------------------------------반복--------------------------------------->
		<div></div>

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>



<script type="text/javascript">
	var slideIndex = 0;
	showSlides();

	function showSlides() {
		var i;
		var slides = document.getElementsByClassName("mySlides");

		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slideIndex++;
		if (slideIndex > slides.length) {
			slideIndex = 1
		}
		slides[slideIndex - 1].style.display = "block";

		setTimeout(showSlides, 3000); // 3초마다 이미지가 체인지
	}
</script>

<!-- 부분-->