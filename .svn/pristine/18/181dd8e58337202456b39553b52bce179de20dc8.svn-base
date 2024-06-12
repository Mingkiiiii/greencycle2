<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Favicon-->


<script src="assets/js/jquery-2.1.0.min.js"></script>

<script src="assets/js/accordions.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/custom.js"></script>
<script src="assets/js/datepicker.js"></script>
<script src="assets/js/imgfix.min.js"></script>
<script src="assets/js/isotope.js"></script>
<script src="assets/js/jquery.counterup.min.js"></script>
<script src="assets/js/lightbox.js"></script>
<script src="assets/js/owl-carousel.js"></script>
<script src="assets/js/popper.js"></script>
<script src="assets/js/quantity.js"></script>
<script src="assets/js/scrollreveal.min.js"></script>
<script src="assets/js/slick.js"></script>
<script src="assets/js/waypoints.min.js"></script>



<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">



<link rel="stylesheet" href="assets/css/templatemo-hexashop.css">


<link rel="stylesheet" href="assets/css/owl-carousel.css">


<link rel="stylesheet" href="assets/css/lightbox.css">


<link rel="stylesheet" href="assets/css/flex-slider.css">




<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<!-- <script src="js/scripts.js"></script> -->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script> -->
<!-- Navigation-->

<style>
/* 햄버거 메뉴 스타일 */
.menu-trigger {
    display: none;
    cursor: pointer;
}

.menu-trigger span {
    display: block;
    width: 25px;
    height: 3px;
    margin: 5px auto;
    background-color: #333;
}

@media (max-width: 767px) {
    .menu-trigger {
        display: block;
    }

    .nav {
        display: none;
        text-align: center;
    }

    .nav.show {
        display: block;
    }
}
</style>

<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky">
	<div class="container" style="text-align: center !important;">
		<div class="row">
			<div class="col-12">
				<nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="/my" class="logo">
                        <img src="assets/images/logo.png" alt="Logo">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
<!--                         <li class="scroll-to-section" style="text-align: center !important;"><a href=""></a></li> -->
                        <li class="submenu"><a href="javascript:;">나눔/판매</a>
                            <ul>
                                <li><a href="<c:url value='/about' />">About Us</a></li>
                                <li><a href="<c:url value='/sharingView' />">나눔 상품</a></li>
                                <li><a href="<c:url value='/sellView' />">판매 상품</a></li>
                                <li><a href="<c:url value='/qna' />">Contact Us</a></li>
                            </ul>
                        </li>
                        <li class="submenu"><a href="javascript:;">게시판 및 서비스</a>
                            <ul>
                                <li><a href="<c:url value='/csView' />">1:1문의</a></li>
                                <li><a href="<c:url value='/FAQ' />">자주 물어보는 질문</a></li>
                                <li><a href="<c:url value='/user_board' />">정보 및 인증게시판</a></li>
                            </ul>
                        </li>
                        <c:if test="${sessionScope.login == null}">
                            <li><a href="<c:url value='/loginView' />" class="logo">로그인</a></li>
                            <li><a href="/my/registView">회원가입</a></li>
                        </c:if>
                        <c:if test="${sessionScope.login != null}">
                            <li class="scroll-to-section"><a href="<c:url value='/start' />" class="logo">게임하러가기</a></li>
                            <li class="scroll-to-section"><a href="<c:url value='/mypageView' />" class="logo">${sessionScope.login.userNick } 님</a></li>
                            <c:if test="${sessionScope.login != null && sessionScope.login.isAdmin eq 'Y'}">
                                <li class="scroll-to-section"><a href="<c:url value='/memdataView' />">회원 정보 서비스</a></li>
                            </c:if>
                            <li><a href="<c:url value='/logoutDo' />">로그아웃</a></li>
                            <li><a href="<c:url value='/chat' />">채팅</a></li>
                        </c:if>
                    </ul>
                    <a class="menu-trigger">
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>

			</div>
		</div>

	</div>
	
	<script>
    $(document).ready(function() {
        $('.menu-trigger').click(function() {
            $('.nav').toggleClass('show');
        });
    });
	
	</script>

</header>
<!-- ***** Header Area End ***** -->