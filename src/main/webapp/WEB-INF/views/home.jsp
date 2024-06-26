<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<c:if test="${not empty msg}">
	<script>
		alert("${msg}");
	</script>
</c:if>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

<link rel="stylesheet" href="<c:url value='/assets/css/desktop_Main.css' />" media="screen and (min-width: 769px)">
<link rel="stylesheet" href="<c:url value='/assets/css/mobile_Main.css' />" media="screen and (max-width: 768px)">

<title>Green Cycle</title>


<!-- Additional CSS Files -->
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

<link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

<link rel="stylesheet" href="assets/css/owl-carousel.css">

<link rel="stylesheet" href="assets/css/lightbox.css">

<link rel="stylesheet" href="assets/css/">
<!--

TemplateMo 571 Hexashop

https://templatemo.com/tm-571-hexashop

-->
<style>
/* 슬라이드 이미지에 둥근 모서리 추가 */
.owl-carousel .item img {
    border-radius: 10px;
}

/* 모바일에서 네비게이션 버튼 숨기기 */
@media (max-width: 800px) {
    .owl-prev, .owl-next {
        display: none;
    }
    
    
.section-heading h2 {
    font-size: 34px;
    font-weight: 700;
    color: #2a2a2a;
    transform: translate(-9%, -15%)!important;
    text-align: center!important;
}


.section-heading span {
    font-size: 14px;
    color: #a1a1a1;
    font-style: italic;
    font-weight: 400;
    margin-left: 9%;
}


}

</style>
</head>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" />
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" />


<!-- 나눔 Slick CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick-theme.css" />





<!-- 중고 물품 슬릭슬라이더 추가 -->
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Owl Carousel CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

<!-- Owl Carousel JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>




<body>

    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  

	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

	<!-- ***** 중고 물품 영역 ***** -->
	<section class="section" id="sharing_stuff">
		<!-- <div class="col-lg-6"> -->
		<div class="section-heading" style="transform: translate(9%, 10%);">
			<h2>Hot!!/중고장터</h2>
			<span>사용하지않는 물품을 판매하는 공간입니다.</span>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12" style="transform: translate(-14px, -40px);">
					<div class="sharing_stufff-item-carousel">
						<div class="owl-sharing_stuff-item owl-carousel">
							<c:forEach items="${sellList}" var="sell">
								<div class="item" onclick="window.location.href='<c:url value="/sellDetail?salesNo=${sell.salesNo}" />'">
									<div class="thumb">
										<img src="${pageContext.request.contextPath}${sell.salesImage }" alt="판매 이미지" onerror='this.src="assets/images/default_image.png"'>
									</div>
									<div class="down-content">
										<h4 class="text-center">${sell.salesName }</h4>
										<span class="text-center">${sell.salesPrice }원</span>
									</div>

								</div>
							</c:forEach>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ***** 소셜 미디어 Ends ***** -->

	<!-- ***** Subscribe Area Starts ***** -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

	<!-- jQuery -->
	<script src="assets/js/jquery-2.1.0.min.js"></script>
	<!-- 나눔 jQuery (필요한 경우) -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<!-- Bootstrap -->
	<script src="assets/js/popper.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>

	<!-- Plugins -->
	<script src="assets/js/owl-carousel.js"></script>
	<script src="assets/js/accordions.js"></script>
	<script src="assets/js/datepicker.js"></script>
	<script src="assets/js/scrollreveal.min.js"></script>
	<script src="assets/js/waypoints.min.js"></script>
	<script src="assets/js/jquery.counterup.min.js"></script>
	<script src="assets/js/imgfix.min.js"></script>
	<script src="assets/js/slick.js"></script>
	<script src="assets/js/lightbox.js"></script>
	<script src="assets/js/isotope.js"></script>

	<!-- Global Init -->
	<script src="assets/js/custom.js"></script>
	<script>
		$(function() {
			var selectedClass = "";
			$("p").click(function() {
				selectedClass = $(this).attr("data-rel");
				$("#portfolio").fadeTo(50, 0.1);
				$("#portfolio div").not("." + selectedClass).fadeOut();
				setTimeout(function() {
					$("." + selectedClass).fadeIn();
					$("#portfolio").fadeTo(50, 1);
				}, 500);

			});
		});
	</script>

	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
	<!-- Slick JS -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
	<script>
	$(document).ready(function() {
	    var owl = $('.owl-sharing_stuff-item');
	    owl.owlCarousel({
	        items: 3,
	        loop: true,
	        margin: 10,
	        nav: false,
	        dots: false,
	        autoplay: true,
	        autoplayTimeout: 5000,
	        autoplayHoverPause: true,
	        smartSpeed: 250,
	        responsive: {
	            0: {
	                items: 1
	            },
	            600: {
	                items: 2
	            },
	            1000: {
	                items: 3
	            }
	        }
	    });

	    var slideBy = 1; // 이동할 슬라이드 수

	    $('.custom-prev-btn').click(function() {
	        owl.trigger('prev.owl.carousel', [slideBy]);
	    });

	    $('.custom-next-btn').click(function() {
	        owl.trigger('next.owl.carousel', [slideBy]);
	    });
	});
	</script>




</body>
</html>