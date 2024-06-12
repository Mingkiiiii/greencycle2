<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>판매글</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<script src="<c:url value="/resources/smarteditor2-2.8.2.3/js/HuskyEZCreator.js" />"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<style>
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
		<div>
			<div class="container" style="margin-top: 100px;">
				<!-- Contact Section Heading-->
				<br>

				<!-- Contact Section Form-->
				<div class="row justify-content-center">
					<div class="col-lg-8 col-xl-7">
						<!-- 이미지 표시 영역 -->
						<div class="mb-3 text-center">
							<label for="sharingsImage" class="d-block"></label> 
							<img src="<c:url value='${sharing.sharingsImage}' />" alt="상품 이미지" class="img-fluid mb-3" style="width: 400px; height: 400px; object-fit: cover;" />
						</div>

						<div class="mb-3">
							<label for="salesTitle">나눔물품</label>
							<h4 class="form-control">${sharing.sharingsName}</h4>
						</div>
						<div class="mb-3">
							<label for="sharingsStatus">나눔 상태</label>
							<h4 class="form-control">${sharing.sharingsStatus}</h4>
						</div>
						<div class="mb-3">
							<label for="salesAddr">거래장소</label>
							<h4 class="form-control">${sharing.sharingsAddr}</h4>
						</div>

						<!-- Submit Button-->
						<div class="mb-3">
							<div class="form-control" style="height: 20rem">${sharing.sharingsContent}</div>
							<br>
							<c:choose>
								<c:when test="${sessionScope.login.userId == sharing.userId}">
									<!-- 현재 로그인한 사용자와 게시글 작성자가 같은 경우에만 수정 및 삭제 버튼 표시 -->
									<div class="text-center">
										<form action="<c:url value="/sharingEdit" />" method="post" style="display: inline;">
											<input type="hidden" name="sharingsNo" value="${sharing.sharingsNo}">
											<button type="submit" class="btn btn-warning">수정</button>
										</form>
										<form action="<c:url value="/sharingDel" />" method="POST" id="delForm" style="display: inline;">
											<input type="hidden" name="sharingsNo" value="${sharing.sharingsNo}">
											<button type="button" class="btn btn-danger" onclick="fn_check()">삭제</button>
										</form>
									</div>
								</c:when>
								<c:otherwise>
									<!-- 나눔인과 채팅하러 가기 버튼 -->
									<div class="text-center">
										<form action="<c:url value="/chat" />" method="get" style="display: inline;">
											<input type="hidden" name="sharerId" value="${sharing.userId}">
											<button type="submit" class="btn btn-primary">나눔인과 채팅하러 가기</button>
										</form>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
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
	<!-- Bootstrap -->
	<script src="assets/js/popper.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<!-- Global Init -->
	<script src="assets/js/custom.js"></script>
	<script>
		function fn_check() {
			// 삭제 확인 함수
			if (confirm("정말 삭제 하시겠습니까?")) {
				document.getElementById("delForm").submit(); // 삭제 폼 제출
			}
		}
	</script>
</body>
</html>
