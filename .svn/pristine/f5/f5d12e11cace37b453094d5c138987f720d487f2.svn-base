<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<title>Green Cycle</title>

<!-- Additional CSS Files -->
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/css/font-awesome.css">
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
	
	.form-control, .btn, select {
        font-size: 16px; /* 텍스트 크기 조정 */
        padding: 10px; /* 더 큰 패딩 */
    }
    .modal-content {
        width: 90%; /* 모달 창 너비 조정 */
        margin: 5px auto; /* 중앙 정렬 */
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
		<h2 class="font-weight-bold text-primary heading">FAQ</h2>
		<!-- START : 목록건수 및 새글쓰기 버튼  -->
		<!-- 목록의 건수를 표시하고 페이지당 보여질 항목 수를 선택 -->
				<div class="row justify-content-md-end">
					<div class="col-sm-2">
							<div class="input-group">
						 <!-- 총 항목 수를 표시하는 레이블. -->
                		 <!-- ${searchVO.totalRowCount}는 JSP에서 전달된 검색 결과의 총 행 수입니다. -->
							<label class="form-control input-sm">총 ${searchVO.totalRowCount} 건</label>
							<select id="id_rowSizePerPage"	name="rowSizePerPage" class="form-control">
							<!-- 페이지당 항목 수를 선택할 수 있는 드롭다운 메뉴입니다. -->
                				<!-- forEach 반복문을 사용하여 10부터 50까지 10씩 증가하는 옵션들을 생성합니다. -->
								<c:forEach var="i" begin="10" end="50" step="10">
								   <!-- 선택된 페이지당 항목 수와 일치하는 경우 해당 옵션을 선택 상태로 설정합니다. -->
    								<option value="${i}"
            						${searchVO.rowSizePerPage eq i ? "selected='selected'" : ""}
            						>
        							${i}
    								</option>
							</c:forEach>
							</select>
						</div>	
					</div>
				</div>
				<!-- END : 목록건수 및 새글쓰기 버튼  -->
				
			<table class="table" id="indexing">
				<thead>
					<tr>
						<th class="text-center">번호</th>
						<th class="text-center">제목</th>
						<th class="text-center">이름</th>
						<th class="text-center">작성일</th>
						
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${faqList}" var="faq">
						
						<tr class="board_info" onclick="window.location.href='<c:url value="/faqDetailView?faqNo=${faq.faqNo}" />'"  onmouseover="this.style.backgroundColor='#f5f5f5';" onmouseout="this.style.backgroundColor='';" style="cursor: pointer;">
							<td class="text-center">${faq.faqNo}</td>
							<td class="text-center">${faq.faqTitle}</td>	
							<td class="text-center">${faq.userNick}</td>
							<td class="text-center">${faq.faqDate}</td>
							
						</tr>
					</c:forEach>
				</tbody>
				
			</table>

			

		</div>
		<table>
			<tr>
		<!-- START : 페이지네이션  -->
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<!-- 이전 페이지 -->
					<c:if test="${searchVO.firstPage !=1 }">
						<li class="page-item">
							<a class="page-link" href="FAQ?curPage=${searchVO.firstPage-1 }"
							 data-page="${searchVO.firstPage-1}" aria-label="Previous"> 
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>	
					<!-- 이전 페이지 -->
					<!-- paging -->
					<c:forEach begin="${searchVO.firstPage}" end="${searchVO.lastPage}" var="i">
					    <c:if test="${searchVO.curPage == i }">
					        <li class="page-item active">
					            <a class="page-link" href="#" data-page="${i}" >${i}</a>
					        </li>
					    </c:if>    
					    <c:if test="${searchVO.curPage != i }">
					        <li class="page-item">
					            <a class="page-link" href="FAQ?curPage=${i}" data-page="${i}" >${i}</a>
					        </li>
					    </c:if>
					</c:forEach>	
					<!-- paging -->
					
					<!-- 다음  페이지  -->
					<c:if test="${searchVO.lastPage != searchVO.totalPageCount }">
						<li class="page-item">
							<a class="page-link" href="FAQ?curPage=${searchVO.lastPage+1}" 
								data-page="${searchVO.lastPage+1}" aria-label="Next"> 
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
				<!-- 다음  페이지  -->
				</ul>
			</nav>
			<!-- END : 페이지네이션  -->
			
			<div class="text-right mb-3">
				<a href="/my/faqWriteView" class="btn btn-primary">글쓰기</a>
			</div>
			</tr>
			
		</table>
		<br>
		
		
		<!-- START : 검색 폼  -->
				<div class="row g-0 justify-content-md-center">
					<div class="col-auto col-sm-5 mb-3">
						<form name="search" action="FAQ" method="post">
							<input type="hidden" name="curPage" value="${searchVO.curPage}">
							<input type="hidden" name="rowSizePerPage" value="${searchVO.rowSizePerPage }">
							<div class="input-group">
								<div class="col-sm-2">
										<select id="id_searchType" name="searchType" class="form-control input-sm">
										    <option value="T" ${searchVO.searchType eq "T" ? "selected='selected'" : "" }>제목</option>
										    <option value="W" ${searchVO.searchType eq "W" ? "selected='selected'" : "" }>작성자</option>
										    <option value="C" ${searchVO.searchType eq "C" ? "selected='selected'" : "" }>내용</option>
										</select>
								</div>
								<%-- <div class="col-sm-2">
									<select id="id_searchCategory" name="searchCategory" class="form-control input-sm">
										<option value="">-- 전체 --</option>
										<c:forEach items="${comList }" var="code">
											<option value="${code.commCd}" ${searchVO.searchCategory eq code.commCd ? "selected='selected'" : ""}>${code.commNm}</option>
										</c:forEach>
										
									</select>
								</div> --%>
								<div class="col-sm-6">
									<!-- 검색바 -->
									<input class="form-control shadow-none search" name="searchWord" type="search" placeholder="검색어" aria-label="search" value="${searchVO.searchWord }" />
								</div>
								<div class="col-sm-2 text-right">
									<button type="submit" class="btn btn-primary form-control">
										<i class="fa fa-search"></i></button>
								</div>
							</div>
						</form>
					</div>
				</div>
		<!-- END : 검색 폼  -->
				
				
				

		<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
	let search_form = $("form[name='search']");
	let cur_page = search_form.find('input[name="curPage"]');
	$(document).ready(function(){
		// 10,20,30,40,50 select box 변경시 선택 행으로 출력되도록
		$("#id_rowSizePerPage").change(function(){
			cur_page.val(1);
			search_form.find('input[name="rowSizePerPage"]').val($(this).val());
			search_form.submit();
		});
		
		search_form.find("button[type='submit']").click(function(e){
			e.preventDefault(); // 디폴트 행동취소
			cur_page.val(1);
			search_form.submit();
		});
		$('ul.pagination li a[data-page]').click(function(e){
			e.preventDefault();
			cur_page.val($(this).data('page'));
			search_form.submit();
		});
	});
	</script>

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
	</div>
</body>
</html>