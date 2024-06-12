<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>문의내용</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

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
		<div class="container" style="margin-top: 100px;">
			<!-- Contact Section Heading-->

			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">1:1문의</h2>
			<br>
			<!-- Contact Section Form-->
			<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-7">


					<!-- title input-->
					<div class="mb-3">
						<h4 class="form-control"/>${cs.csTitle }</h4>
					</div>



					<div class="mb-3"></div>



					<!-- content input-->

					<div class="mb-3">
						<div class="form-control" style="height: 20rem">${cs.csContent }</div>

						<br> 
					<c:if test="${sessionScope.login.userId == cs.userId or sessionScope.login.isAdmin eq 'Y'}">
				    <!-- 현재 로그인한 사용자가 게시글 작성자이거나 관리자인 경우에만 수정 및 삭제 버튼 표시 -->
				    <!-- 여기에 수정 및 삭제 버튼 HTML 추가 -->  
				  <tr>
				    <td colspan="3" class="text-center" style="text-align: center;">
					    <form action="<c:url value="/csEditView" />" method="post" style="display: inline;">
					        <input type="hidden" name="csNo" value="${cs.csNo}">
					        <button type="submit" class="btn btn-warning">수정</button>
					    </form>
					    <form action="<c:url value="/csDel" />" method="POST" id="delForm" style="display: inline;">
					        <input type="hidden" name="csNo" value="${cs.csNo}">
					        <button type="button" class="btn btn-danger" onclick="fn_check()">삭제</button>
					    </form>
					</td>
				 </tr>
					 </c:if>
				
               
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

	 <script>
        function fn_check() {
            // 삭제 확인 함수
            if (confirm("정말 삭제 하시겠습니까?")) {
                document.getElementById("delForm")	.submit(); // 삭제 폼 제출
            }
    function confirmDelete(csNo) {
        if (confirm("정말로 삭제하시겠습니까?")) {
            window.location.href = '/my/csDelete?csId=' + csId;
	
    function confirmDelete(csNo) {
        if (confirm("정말로 삭제하시겠습니까?")) {
            window.location.href = '/my/csDelete?csId=' + csId;
        }
    </script>
</body>
</html>