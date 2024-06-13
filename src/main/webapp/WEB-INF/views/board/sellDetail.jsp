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
/* 텍스트가 박스를 벗어나지 않도록 자동 줄바꿈 설정 */

.form-control {
    display: flex;
    flex-wrap: nowrap;
    overflow-x: auto; /* 가로 스크롤이 가능하도록 설정 */
    gap: 10px;
}

.form-control img {
    width: 200px!important;
    height: 400px!important;
    object-fit: cover!important;
    cursor: pointer; /* 클릭할 수 있도록 커서 변경 */
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
        <div>
            <div class="container" style="margin-top: 100px;">
                <!-- Contact Section Heading-->
                <br>

                <!-- Contact Section Form-->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <!-- 이미지 표시 영역 -->
                        <div class="mb-3 text-center">
                            <label for="salesImage" class="d-block"></label> 
                            <img src="<c:url value='${sell.salesImage}' />" alt="상품 이미지" class="img-fluid mb-3" style="width: 400px; height: 400px; object-fit: cover;" />
                        </div>

                        
                        <div class="mb-3">
                            <label for="salesTitle">판매물품</label>
                            <h4 class="form-control">${sell.salesName}</h4>
                        </div>
                        <div class="mb-3">
                            <label for="salesPrice">판매금액</label>
                            <h4 class="form-control">${sell.salesPrice}</h4>
                        </div>
                        <div class="mb-3">
                            <label for="salesPrice">판매상태</label>
                            <h4 class="form-control">${sell.salesStatus}</h4>
                        </div>

                        <div class="mb-3">
                            <label for="salesAddr">거래장소</label>
                            <h4 class="form-control">${sell.salesAddr}</h4>
                        </div>

                        <!-- Submit Button-->
                        <div class="mb-3">
                            <div class="form-control">${sell.salesContent}</div>
                            <br>
                            
                            <c:choose>
                                <c:when test="${sessionScope.login.userId == sell.userId}">
                                    <!-- 현재 로그인한 사용자와 게시글 작성자가 같은 경우에만 수정 및 삭제 버튼 표시 -->
                                    <div class="text-center">
                                        <form action="<c:url value="/sellEdit" />" method="post" style="display: inline;">
                                            <input type="hidden" name="salesNo" value="${sell.salesNo}">
                                            <button type="submit" class="btn btn-warning">수정</button>
                                        </form>
                                        <form action="<c:url value="/sellDel" />" method="POST" id="delForm" style="display: inline;">
                                            <input type="hidden" name="salesNo" value="${sell.salesNo}">
                                            <button type="button" class="btn btn-danger" onclick="fn_check()">삭제</button>
                                        </form>
                                    </div>
                                    
                                </c:when>
                                <c:otherwise>
                                    <!-- 판매자와 채팅하러 가기 버튼 -->
                                    <div class="text-center">
                                        <form action="<c:url value="/chatMake" />" method="post" enctype="multipart/form-data" style="display: inline;">
                                            <input type="hidden" name="userId" value="${sessionscope.userId}">
                                            <input type="hidden" name="salesNo" value="${sell.salesNo}">
                                            <input type="hidden" name="roomNo" value="${sell.salesNo}">
                                            <button type="submit" class="btn btn-primary">채팅하기</button>
                                        </form>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            
<!--                             댓글 아이콘 -->
<%-- 							<button type="button" class="btn btn-primary" onclick="toggleReply(${reply.reNo})">댓글 보기/숨기기</button> --%>

<!-- 								댓글 목록 -->
<%-- 								<div id="reply_card${reply.reNo}" class="collapse"> --%>
<!-- 								    <section class="modal-section"> -->
<!-- 								        <div class="card card-body"> -->
<!-- 								            댓글 목록 -->
<%-- 								            <div class="reply-list reply-list${reply.reNo}"> --%>
<!-- 								                댓글이 목록이 들어가는 곳 -->
<!-- 								            </div> -->
<!-- 								            댓글 작성 => 로그인한 상태여야만 댓글작성 칸이 나온다. -->
<%-- 								            <c:if test="${not empty sessionScope.userId}"> --%>
<!-- 								                <div class="row reply_write"> -->
<!-- 								                    <div class="col-1"> -->
<%-- 								                        <a href="other_profile.do?other_nick=${reply.userId }"> --%>
<!-- 								                            <img id="write_reply_profileImage" -->
<%-- 								                                src="./upload/profile/${sessionScope.profile }" /> --%>
<!-- 								                        </a> -->
<!-- 								                    </div> -->
<!-- 								                    <div class="col-8" class="input_reply_div"> -->
<%-- 								                        <input class="w-100 form-control" id="input_reply${reply.reNo}" --%>
<!-- 								                            type="text" placeholder="댓글입력..."> -->
<!-- 								                    </div> -->
<!-- 								                    <div class="col-3 "> -->
<%-- 								                        <button type="button" idx="${tmp.no }" --%>
<!-- 								                            class="btn btn-success mb-1 write_reply">댓글&nbsp;달기</button> -->
<!-- 								                    </div> -->
<!-- 								                </div> -->
<%-- 								            </c:if> --%>
<!-- 								        </div> -->
<!-- 								    </section> -->
<!-- 								</div> -->
						                            
                            
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
    <script src="assets/js/slick.js">
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
        
        function showImageModal(src) {
            $('#modalImage').attr('src', src);
            $('#imageModal').modal('show');
        }
    </script>
</body>
</html>
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
        
        function showImageModal(src) {
            $('#modalImage').attr('src', src);
            $('#imageModal').modal('show');
        }
        
        
//         function toggleReply(no) {
//             var replyCard = document.getElementById("reply_card" + no);
//             if (replyCard.classList.contains("show")) {
//                 replyCard.classList.remove("show");
//             } else {
//                 replyCard.classList.add("show");
//             }
//         }
    </script>
</body>
</html>

