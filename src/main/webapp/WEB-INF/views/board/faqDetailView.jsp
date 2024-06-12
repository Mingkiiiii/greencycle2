<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>자주묻는질문</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<style>
.board-control-btn {
	text-align: center;
	display: flex;
	justify-content: center;
	gap: 0 5px;
	margin: 30px 0;
}

.board-control-btn button {
	padding: 8px 25px;
	font-size: 1.4rem;
	border-radius: 2px;
}

.board-control-btn .modify-btn {
	background-color: #44894f;
	color: #fff;
}

.board-control-btn .remove-btn {
	background-color: #972d2d;
	color: #fff;
}

/* .btn-primary:hover { */
/* 	color: #fff; */
/* 	background-color: green; */
/* 	border-color: green; */
/* } */
#content-fix{
	color: #fff;
	background-color: #0e970e;
	border-color: #0e970e;
}

#content-del{
	color: #fff;
	background-color: #dd0000;
	border-color: #dd0000;
}

#content-fix:hover {
	color: #fff;
	background-color: green;
	border-color: green;
}

#content-del:hover {
	color: #fff;
	background-color: #cd1c1c;
	border-color: #cd1c1c;
	text-align: right
}

.form-control p,
.form-control div {
    word-wrap: break-word !important; /* 긴 단어를 줄바꿈 */
    word-break: break-all !important; /* 단어가 박스를 넘길 때 모든 위치에서 줄바꿈 */
    white-space: normal !important; /* 공백 문자를 처리하여 줄바꿈 허용 */
    overflow-wrap: break-word !important; /* 긴 단어를 줄바꿈 (새로운 CSS 속성) */
}

.form-control {
    overflow: visible; /* 내용이 박스를 벗어나지 않도록 숨김 처리 */
    height: auto !important; /* 내용에 따라 박스 높이 자동 조절 */
}
</style>
</head>
<body id="page-top">
	<!-- 모든 페이지 상단에 들어가는 부분 -->
	<%@include file="/WEB-INF/inc/top.jsp"%>
	<!-- Contact Section-->
	<section class="page-section" id="contact">
		<div class="container" style="margin-top: 100px;">
			<!-- Contact Section Heading-->

			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">자주묻는질문</h2>
			<br>
			<!-- Contact Section Form-->
			<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-7">


					<!-- title input-->
					<div class="mb-3">

						<h4 class="form-control" type="text" />${faq.faqTitle }</h4>
					</div>



					<div class="mb-3"></div>



					<!-- content input-->

					<div class="mb-3">
						<div class="form-control" style="height: 20rem">${faq.faqContent }</div>

						<br>
						<div class="board-control-btn">
							<c:if test="${sessionScope.login.userId == faq.userId}">
								<form action="<c:url value="/faqEditView" />" method="post">
									<input type="hidden" name="faqNo" value="${faq.faqNo}">
									<button type="submit" class="btn btn-primary" id="content-fix">수정</button>
								</form>
								<form action="<c:url value="faqDel" />" method="post" id="delForm">
									<input type="hidden" name="faqNo" value="${faq.faqNo}">
									<button type="button" class="btn btn-primary" id="content-del" onclick="fn_check()">삭제</button>
								</form>
							</c:if>
						</div>
					</div>
				</div>
			</div>
	</section>
	<!-- 모든 페이지 하단에 들어가는 부분 -->
	<!-- Footer-->
	<%@include file="/WEB-INF/inc/footer.jsp"%>
	<!-- jQuery -->
	<script src="assets/js/jquery-2.1.0.min.js"></script>

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
	function fn_check(){
		if(confirm("정말 삭제 하시겠습니까?")){
			document.getElementById("delForm").submit();
		}
	}		
	</script>
</body>


</html>