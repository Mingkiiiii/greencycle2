<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="assets/css/switch_style.css">
<title>중고장터</title>

<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background: #f4f4f4;
}

.header {
	background: #fff;
	padding: 20px 0;
	text-align: center;
}

.container {
	width: 80%;
	margin: 0 auto;
}

.product-container {
	display: grid; /* !수정: flex에서 grid로 변경 */
	grid-template-columns: repeat(5, 1fr); /* !수정: 가로 5열 */
	gap: 20px;
	padding: 20px;
	box-sizing: border-box;
	justify-content: center;
}

.product {
	background: #fff;
	margin: 10px 0;
	box-shadow: 0 2px 3px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	overflow: hidden;
	transition: transform 0.2s ease-in-out;
	box-sizing: border-box;
}

.product:hover {
	transform: translateY(-5px);
}

.product img {
	width: 100%;
	display: block;
	max-width: 180px;
	max-height: 180px;
	min-width: 180px;
	min-height: 180px;
	margin: auto;
}

.product-info {
	padding: 15px;
	text-align: center;
}

.product-info h3 {
	margin-top: 0;
	color: #333;
}

.product-info p {
	color: #555;
	font-size: 16px;
}

.product-info .price {
	font-weight: bold;
	color: #10ac84;
}

.thumb_switch {
	display: flex;
	justify-content: flex-end;
	padding: 20px;
}

.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}

.switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	transition: .4s;
	border-radius: 34px;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	transition: .4s;
	border-radius: 50%;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:checked+.slider:before {
	transform: translateX(26px);
}

.form-inline {
	margin-top: 1%;
	justify-content: center;
}

element.style {
	width: 40%;
	margin: auto;
}

@media ( max-width : 768px) {
	.product-container {
		grid-template-columns: repeat(2, 1fr); /* !수정: 가로 2열 */
	}
}

@media ( max-width : 480px) {
	.product-container {
		grid-template-columns: 1fr; /* !수정: 가로 1열 */
	}
}

#view-container {
	width: 100%;
}

.sell-card {
	display: flex;
	border: 1px solid #ddd;
	border-radius: 8px;
	margin-bottom: 10px;
	padding: 15px;
	background: #fff;
	box-shadow: 0 2px 3px rgba(0, 0, 0, 0.1);
}

.sell-card img {
	max-width: 120px;
	margin-right: 20px;
}

.sell-content {
	flex: 1;
}

.sell-content h3 {
	margin: 0 0 10px;
	font-size: 18px;
}

.sell-content p {
	margin: 0;
	color: #555;
}

.sell-price {
	color: #10ac84;
	font-weight: bold;
	font-size: 18px;
}

.form-control {
	display: block;
	width: 146% !important;
	height: calc(1.5em + .75rem + 2px);
	padding: .375rem .75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

/* 글자 */
.product-info p {
	max-width: 100;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	display: block;
}

.sell-content p {
	max-width: 70%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	display: block;
}

@media ( max-width : 800px) {
	.input-group {
		position: relative;
		display: -ms-flexbox;
		display: flex;
		-ms-flex-wrap: wrap;
		flex-wrap: wrap;
		-ms-flex-align: stretch;
		align-items: stretch;
		width: 100%;
		margin-top: 2%;
		gap: 9px !important;
		width: 55% !important;
		margin-left: 10% !important;
	}
	.shadow-none {
		box-shadow: none !important;
		width: 146% !important;
	}
	.btn-primary {
    color: #fff;
    background-color: #007bff;
    border-color: #007bff;
    margin-left: 0% !important;
}
}
</style>
</head>
<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
<body style="width: 80%; margin-left: 10%;">

	<div class="header" style="margin-top: 8%; margin: auto; padding: 10px !important; margin-top: 9%;">
		<h1>판 매 물 품</h1>
	</div>

	<!-- 검색 폼 -->
	<div class="row g-0 justify-content-md-center">
		<div class="col-auto col-sm-5 mb-3">
			<form name="search" action="sellView" method="post">
				<input type="hidden" name="curPage" value="${searchVO.curPage}">
				<input type="hidden" name="rowSizePerPage" value="${searchVO.rowSizePerPage}">
				<input type="hidden" name="searchGroup" id="searchGroup" value="${searchVO.searchGroup }">
				<div class="input-group" style="margin-top: 2%;">
					<div class="col-sm-2">
						<select id="id_searchType" name="searchType" class="form-control input-sm">
							<option value="N" ${searchVO.searchType eq "N" ? "selected='selected'" : "" }>제목</option>
							<option value="W" ${searchVO.searchType eq "W" ? "selected='selected'" : "" }>작성자</option>
							<option value="C" ${searchVO.searchType eq "C" ? "selected='selected'" : "" }>내용</option>
						</select>
					</div>
					<div class="col-sm-6">
						<input class="form-control shadow-none search" name="searchWord" type="search" placeholder="검색어" aria-label="search" value="${searchVO.searchWord}">
					</div>
					<div class="col-sm-2 text-right">
						<button type="submit" class="btn btn-primary form-control">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- 	<!-- START : 목록건수 및 새글쓰기 버튼  -->
	<!-- 	<div class="row justify-content-md-end" style="margin-right: 1%;"> -->
	<!-- 		<div class="col-sm-2"> -->
	<!-- 			<div class="input-group"> -->
	<%-- 				<label class="form-control input-sm">총 ${searchVO.totalRowCount} 건</label> --%>
	<!-- 				<select id="id_rowSizePerPage" name="rowSizePerPage" class="form-control"> -->
	<%-- 					<c:forEach var="i" begin="10" end="50" step="10"> --%>
	<%-- 						<option value="${i}" ${searchVO.rowSizePerPage eq i ? "selected='selected'" : ""}>${i}</option> --%>
	<%-- 					</c:forEach> --%>
	<!-- 				</select> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<!-- END : 목록건수 및 새글쓰기 버튼  -->

	<div class="thumb_switch">
		<label class="switch"> <input type="checkbox" id="thumb_switch"> <span class="slider"> <span class="icon"></span>
		</span>
		</label>
	</div>

	<div class="text-right mb-3">
		<a href="<c:choose>
                <c:when test="${sessionScope.login != null}">
                    <c:url value='sellWrite' />
                </c:when>
                <c:otherwise>
                    <c:url value='loginView' />
                </c:otherwise>
            </c:choose>">
			<button type="button" class="btn btn-primary" style="margin-right: 1%;">글쓰기</button>
		</a>
	</div>

	<!-- 제품 목록을 담는 컨테이너 -->
	<div id="view-container" class="container" style="display: none;">
		<div class="product-container">
			<c:forEach items="${sellList}" var="sell">
				<c:if test="${sell.salesStatus == '판매중' || empty sell.salesStatus}">
					<div class="product" onclick="window.location.href='<c:url value="/sellDetail?salesNo=${sell.salesNo}" />'">
						<img src="${pageContext.request.contextPath}${sell.salesImage}" alt="판매 이미지" onerror='this.src="assets/images/default_image.png"'>
						<div class="product-info">
							<h3>${sell.salesName}</h3>
							<p class="price">${sell.salesPrice}원</p>
							<p>거래주소: ${sell.salesAddr}</p>
							<p>거래상태: ${sell.salesStatus}</p>
							<p>판매자: ${sell.userNick}</p>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>


	<!-- sharing_stuff 보드 -->
	<div id="sharing-container" class="container">
		<div class="product-container">
			<c:forEach items="${sellList}" var="sell">
				<c:if test="${sell.salesStatus == '나눔♥'}">
					<div class="product" onclick="window.location.href='<c:url value="/sellDetail?salesNo=${sell.salesNo}" />'">
						<img src="${pageContext.request.contextPath}${sell.salesImage}" alt="판매 이미지" onerror='this.src="assets/images/default_image.png"'>
						<div class="product-info">
							<h3>${sell.salesName}</h3>
							<p class="price">${sell.salesPrice}원</p>
							<p>거래주소: ${sell.salesAddr}</p>
							<p>거래상태: ${sell.salesStatus}</p>
							<p>판매자: ${sell.userNick}</p>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>

	<!-- 페이지네이션 -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center" style="margin-top: 1%;">
			<c:if test="${searchVO.firstPage != 1}">
				<li class="page-item"><a class="page-link" href="sellView?curPage=${searchVO.firstPage-1}" data-page="${searchVO.firstPage-1}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a></li>
			</c:if>
			<c:forEach begin="${searchVO.firstPage}" end="${searchVO.lastPage}" var="i">
				<c:if test="${searchVO.curPage == i}">
					<li class="page-item active"><a class="page-link" href="#" data-page="${i}">${i}</a></li>
				</c:if>
				<c:if test="${searchVO.curPage != i}">
					<li class="page-item"><a class="page-link" href="sellView?curPage=${i}" data-page="${i}">${i}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${searchVO.lastPage != searchVO.totalPageCount}">
				<li class="page-item"><a class="page-link" href="sellView?curPage=${searchVO.lastPage+1}" data-page="${searchVO.lastPage+1}" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</a></li>
			</c:if>
		</ul>
	</nav>

	<div class="text-right mb-3">
		<a href="<c:choose>
                <c:when test="${sessionScope.login != null}">
                    <c:url value='sellWrite' />
                </c:when>
                <c:otherwise>
                    <c:url value='loginView' />
                </c:otherwise>
            </c:choose>">
			<button type="button" class="btn btn-primary">글쓰기</button>
		</a>
	</div>

	<!-- jQuery 및 기타 스크립트 로드 -->
	<script src="assets/js/jquery-2.1.0.min.js"></script>
	<script src="assets/js/popper.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
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
	<script src="assets/js/custom.js"></script>
	<script>
		let search_form = $("form[name='search']");
		let cur_page = search_form.find('input[name="curPage"]');
		// 스위치 이벤트 리스너 추가
		document.getElementById('thumb_switch').addEventListener('change',
				function() {
					// 					var viewContainer = document.getElementById('view-container');
					// 					var sharingContainer = document.getElementById('sharing-container');
					if (this.checked) {
						// 						viewContainer.style.display = 'block'; // 제품 목록 보이기
						// 						sharingContainer.style.display = 'none'; // sharing 보드 숨기기
						$("#searchGroup").val("판매중");
					} else {
						// 						viewContainer.style.display = 'none'; // 제품 목록 숨기기
						// 						sharingContainer.style.display = 'block'; // sharing 보드 보이기

						$("#searchGroup").val("나눔♥");
					}
					cur_page.val(1);
					search_form.submit();
				});

		// 초기 상태 설정
		// 		document.addEventListener('DOMContentLoaded',
		// 				function() {
		// 					var viewContainer = document
		// 							.getElementById('view-container');
		// 					var sharingContainer = document
		// 							.getElementById('sharing-container');
		// 					viewContainer.style.display = 'none'; // 제품 목록 숨기기
		// 					sharingContainer.style.display = 'block'; // sharing 보드 보이기
		// 				});

		$(document).ready(
				function() {

					if ($("#searchGroup").val() != "나눔♥") {
						$('#thumb_switch').prop('checked', true);
						$("#view-container").show();
						$("#sharing-container").hide();
					} else {
						$("#view-container").hide();
						$("#sharing-container").show();
					}

					$("#id_rowSizePerPage").change(
							function() {
								cur_page.val(1);
								search_form
										.find('input[name="rowSizePerPage"]')
										.val($(this).val());
								search_form.submit();
							});

					search_form.find("button[type='submit']").click(
							function(e) {
								e.preventDefault();
								cur_page.val(1);
								search_form.submit();
							});
					$('ul.pagination li a[data-page]').click(function(e) {
						e.preventDefault();
						cur_page.val($(this).data('page'));
						search_form.submit();
					});
				});

		$(document).ready(function() {
			$('.modal-body input').click(function(event) {
				event.stopPropagation();
			});
		});
	</script>

</body>
<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</html>
