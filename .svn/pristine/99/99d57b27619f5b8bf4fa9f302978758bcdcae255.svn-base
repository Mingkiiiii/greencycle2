<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

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
body {
	margin-top: 5% !important; /* 모든 방향의 마진을 10%로 설정 */
}

.heading {
	text-align: center; /* 제목을 중앙에 위치 */
	margin: 40px 0; /* 상하 여백 제공 */
}

.form-control {
	width: 100% !important; /* 입력 필드의 너비를 50%로 설정 */
	padding: 10px; /* 적절한 패딩 유지 */
	text-align: left; /* 텍스트를 왼쪽으로 정렬 */
}

.search-window form {
	display: flex;
	justify-content: center; /* 검색창과 버튼을 중앙에 배치 */
	width: 100%; /* 폼 너비를 최대로 설정 */
}

.table-responsive {
	margin-bottom: 40px; /* 테이블 아래 여백 제공 */
}

.btn-dark {
	padding: .375rem .75rem; /* 버튼 패딩 조정 */
}

.btn-dark, .btn-success {
	margin: 5px; /* 버튼 간격 조정 */
}

@media ( max-width : 768px) {
	.search-window form {
		flex-direction: column; /* 모바일에서 검색창 스택 */
	}
	.search-window input {
		margin-bottom: 10px; /* 입력 필드와 버튼 사이의 여백 */
	}
	body {
		margin-top: 10% !important; /* 모든 방향의 마진을 10%로 설정 */
	}
	.form-control {
		padding: .375rem .75rem !important;
	}
	footer {
		display: none !important;
		background-color: green !important;
	}
	#indexing {
		width: 100%;
		margin: auto !important;
	}
}

#footer {
	width: 100% !important;
}

#pagin_btn {
	margin: auto !important; /* 테이블 전체를 페이지의 중앙에 위치 */
	width: 100%; /* 또는 원하는 너비 */
}

#indexing {
	width: 80%;
	margin: auto !important;
}
</style>
</head>


<body>
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	<div class="container">
		<br>
		<h2 class="font-weight-bold text-primary heading">정보 및 인증게시판</h2>

		<div class="table-responsive">
			<table class="table" id="indexing">
				<thead>
					<tr>
						<th class="text-center">번호</th>
						<th class="text-center">제목</th>
						<th class="text-center">이름</th>
						<th class="text-center">아이디</th>
						<th class="text-center">작성일</th>
						<th class="text-center">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list }">
						<tr class="board_info">
							<td width="5%" class="text-center">${vo.no }</td>
							<td width="35%">
								<a href="../freeboard/detail.do?no=${vo.no }">${vo.subject }</a>
								&nbsp;&nbsp;
								<c:if test="${vo.rcount>0 }">
       						(${vo.rcount })
       					</c:if>
							</td>
							<td width="15%" class="text-center">${vo.id }</td>
							<td width="15%" class="text-center">${vo.name }</td>
							<td width="17%" class="text-center">${vo.dbday }</td>
							<td width="13%" class="text-center">${vo.hit }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
		<div class="container">
			<div class="search-window">
				<form action="" method="get" class="form-inline">
					<div class="form-group mx-sm-3 mb-2">
						<input type="text" class="form-control" name="fd" placeholder="검색어를 입력해주세요." aria-label="Search">
					</div>
					<button type="submit" class="btn btn-dark mb-2">검색</button>
				</form>
			</div>

			<div class="text-right mb-3">
				<a href="/my/boardWriteView" class="btn btn-primary">글쓰기</a>
			</div>
		</div>
		<table>
			<tr>
				<td>
					<c:if test="${sessionScope.id!=null }">
						<div class="wrap">
							<a href="" class="button">새글</a>
							<%--<a href="../main/main.do" class="button">홈</a> --%>
						</div>
					</c:if>
				</td>



				<td class="text-center" id="pagin_btn">
					<a href="../freeboard/list.do?&page=${curpage>1?curpage-1:curpage}" class="btn btn-sm btn-success">이전</a>
					${curpage } page / ${totalpage } pages
					<a href="../freeboard/list.do?&page=${curpage<totalpage?curpage+1:curpage}" class="btn btn-sm btn-success">다음</a>
				</td>
			</tr>
		</table>

		<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	</div>
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