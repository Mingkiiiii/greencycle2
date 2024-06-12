<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>게시글</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<style>
.form-control p, .form-control div {
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
		<div class="container" style="margin-top: 50px;">
			<!-- Contact Section Form-->
			<div class="row justify-content-center" style="margin-bottom: 50px;">
				<div class="col-lg-8 col-xl-7">
					<!-- title input-->
					<br> <br>
					<div class="mb-3">
						<label for="title">제목</label>
						<h6 id="title">${board.boardTitle}</h6>
					</div>
					<div class="mb-3">
						<label for="name">작성자</label>
						<h6 id="name">${board.userName}</h6>
					</div>
					<div class="mb-3">
						<label for="">작성일</label>
						<h6 id="">${board.boardDate}</h6>
					</div>
					<!-- content input-->
					<div class="mb-3">
						<textarea readonly class="form-control bg-white" style="height: 20rem">${board.boardContent}</textarea>
					</div>
					<c:if test="${sessionScope.login.userId == board.userId }">

						<div class="col-lg-8 col-xl-7 d-flex justify-content-end">
							<form action="<c:url value="/boardEditView" />" method="post">
								<input type="hidden" name="boardNo" value="${board.boardNo}">
								<button type="submit" class="btn btn-warning me-2">수정</button>
							</form>
							<form action="<c:url value="/boardDel" />" method="post" id="delForm">
								<input type="hidden" name="boardNo" value="${board.boardNo}">
								<button type="button" class="btn btn-danger me-2" onclick="fn_check()">삭제</button>
							</form>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<!-- 모든 페이지 하단에 들어가는 부분 -->
	<!-- Footer-->
	<%@include file="/WEB-INF/inc/footer.jsp"%>
	<script>
		function fn_check() {
			if (confirm("정말 삭제 하시겠습니까?")) {
				document.getElementById("delForm").submit();
			}
		}
	</script>
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


</body>
</html>


