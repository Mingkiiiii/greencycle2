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

<style>
body {
   margin-top: 5% !important;
}

.heading {
   text-align: center;
   margin: 40px 0;
}

.form-control {
   width: 100% !important;
   padding: 10px;
   text-align: left;
}

.search-window form {
   display: flex;
   justify-content: center;
   width: 100%;
}

.table-responsive {
   margin-bottom: 40px;
}

.btn-dark {
   padding: .375rem .75rem;
}

.btn-dark, .btn-success {
   margin: 5px;
}

@media (max-width: 768px) {
   .search-window form {
      flex-direction: column;
   }
   .search-window input {
      margin-bottom: 10px;
   }
   body {
      margin-top: 10% !important;
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
        font-size: 16px;
        padding: 10px;
    }
    .modal-content {
        width: 90%;
        margin: 5px auto;
    }
}

#footer {
   width: 100% !important;
}

#pagin_btn {
   margin: auto !important;
   width: 100%;
}

#indexing {
   width: 80%;
   margin: auto !important;
}

.truncate {
   max-width:70%; /* 원하는 너비로 설정 */
   white-space: nowrap; /* 텍스트가 한 줄로 유지되도록 설정 */
   overflow: hidden; /* 넘치는 텍스트를 숨김 */
   text-overflow: ellipsis; /* 넘치는 텍스트 끝에 "..."을 표시 */
   display: block; /* block 요소로 표시 */
}
</style>
</head>

<body>
   <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
   <div class="container">
      <br>
      <h2 class="font-weight-bold text-primary heading">1:1 문의게시판</h2>

      <div class="table-responsive">
         <!-- START : 목록건수 및 새글쓰기 버튼  -->
         <div class="row justify-content-md-end">
            <div class="col-sm-2">
               <div class="input-group">
                  <label class="form-control input-sm">총 ${searchVO.totalRowCount} 건</label>
                  <select id="id_rowSizePerPage" name="rowSizePerPage" class="form-control">
                     <c:forEach var="i" begin="10" end="50" step="10">
                        <option value="${i}" ${searchVO.rowSizePerPage eq i ? "selected='selected'" : ""}>
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
                  <th width="10%" class="text-center">번호</th>
                  <th width="30%" class="text-center">제목</th>
                  <th width="10%" class="text-center">이름</th>
                  <th width="20%" class="text-center">작성일</th>
                  <th width="10%" class="text-center">암호여부</th>
                  <th width="20%" class="text-center">문의상태</th>
               </tr>
            </thead>
            <tbody>
            <c:forEach items="${csView}" var="cs">
               <c:choose>
                  <c:when test="${empty cs.csPw || sessionScope.login.isAdmin eq 'Y'}">
                     <tr onclick="window.location.href='<c:url value='/csDetailView?csNo=${cs.csNo}' />'" onmouseover="this.style.backgroundColor='#f5f5f5';" onmouseout="this.style.backgroundColor='';" style="cursor: pointer;">
                        <td class="text-center">${cs.csNo}</td>
                        <td><div class="truncate">${cs.csTitle}</div></td>
                        <td class="text-center">${cs.userNick}</td>
                        <td class="text-center">${cs.csDate}</td>
                        <td class="text-center">
                           <c:choose>
                              <c:when test="${not empty cs.csPw && sessionScope.login.isAdmin ne 'Y'}">
                                 <img src="assets/img/Lock.png" alt="Lock Icon">
                              </c:when>
                              <c:otherwise>
                                 <img src="assets/img/Unlock.png" alt="Unlock Icon">
                              </c:otherwise>
                           </c:choose>
                        </td>
                        <td class="text-center">${cs.csCategoryNm}</td>
                     </tr> 
                  </c:when>
                  <c:otherwise>
                     <tr onclick="showPasswordModal(${cs.csNo}, '${cs.csTitle}');" data-toggle="modal" data-target="#passwordModal${cs.csNo}">
                        <td class="text-center">${cs.csNo}</td>
                        <td><div class="truncate">${cs.csTitle}</div></td>
                        <td class="text-center">${cs.userNick}</td>
                        <td class="text-center">${cs.csDate}</td>
                        <td class="text-center">
                           <c:choose>
                              <c:when test="${not empty cs.csPw && sessionScope.login.userId ne 'admin'}">
                                 <img src="assets/img/Lock.png" alt="Lock Icon">
                              </c:when>
                              <c:otherwise>
                                 <img src="assets/img/Unlock.png" alt="Unlock Icon">
                              </c:otherwise>
                           </c:choose>
                        </td>
                        <td class="text-center">${cs.csCategoryNm}</td>
                     </tr>

                     <!-- Modal -->
                     <div class="modal fade" id="passwordModal${cs.csNo}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                           <div class="modal-content">
                              <div class="modal-header">
                                 <h5 class="modal-title" id="exampleModalLabel">Enter Password for ${cs.csTitle}</h5>
                                 <button type="button" class="close" data-dismiss="modal"    >
                                    <span aria-hidden="true">&times;</span>
                                 </button>
                              </div>
                              <div class="modal-body">
                                 <input type="password" id="passwordInput${cs.csNo}" class="form-control" placeholder="Enter Password">
                                 <div id="passwordError${cs.csNo}" class="text-danger d-none">Incorrect password</div>
                              </div>
                              <div class="modal-footer">
                                 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                 <button type="button" class="btn btn-primary" id="checkPasswordButton" onclick="checkBoardPassword(${cs.csNo});">Submit</button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </c:otherwise>
               </c:choose>
            </c:forEach>
            </tbody>
         </table>
      </div>
      
      <!-- 페이지네이션 -->
      <nav aria-label="Page navigation example">
         <ul class="pagination justify-content-center">
            <c:if test="${searchVO.firstPage != 1}">
               <li class="page-item">
                  <a class="page-link" href="csView?curPage=${searchVO.firstPage-1}" data-page="${searchVO.firstPage-1}" aria-label="Previous">
                     <span aria-hidden="true">&laquo;</span>
                  </a>
               </li>
            </c:if>
            <c:forEach begin="${searchVO.firstPage}" end="${searchVO.lastPage}" var="i">
               <c:if test="${searchVO.curPage == i}">
                  <li class="page-item active">
                     <a class="page-link" href="#" data-page="${i}">${i}</a>
                  </li>
               </c:if>
               <c:if test="${searchVO.curPage != i}">
                  <li class="page-item">
                     <a class="page-link" href="csView?curPage=${i}" data-page="${i}">${i}</a>
                  </li>
               </c:if>
            </c:forEach>
            <c:if test="${searchVO.lastPage != searchVO.totalPageCount}">
               <li class="page-item">
                  <a class="page-link" href="csView?curPage=${searchVO.lastPage+1}" data-page="${searchVO.lastPage+1}" aria-label="Next">
                     <span aria-hidden="true">&raquo;</span>
                  </a>
               </li>
            </c:if>
         </ul>
      </nav>
      
      <!-- 글쓰기 버튼 -->
      <div class="text-right mb-3">
         <a href="/my/csWriteView" class="btn btn-primary">글쓰기</a>
      </div>
      
      <!-- 검색 폼 -->
      <div class="row g-0 justify-content-md-center">
         <div class="col-auto col-sm-5 mb-3">
            <form name="search" action="csView" method="post">
               <input type="hidden" name="curPage" value="${searchVO.curPage}">
               <input type="hidden" name="rowSizePerPage" value="${searchVO.rowSizePerPage}">
               <div class="input-group">
                  <div class="col-sm-2">
                     <select id="id_searchType" name="searchType" class="form-control input-sm">
                        <option value="T" ${searchVO.searchType eq "T" ? "selected='selected'" : "" }>제목</option>
                        <option value="W" ${searchVO.searchType eq "W" ? "selected='selected'" : "" }>작성자</option>
                        <option value="C" ${searchVO.searchType eq "C" ? "selected='selected'" : "" }>내용</option>
                     </select>
                  </div>
                  <div class="col-sm-2">
                     <select id="id_searchCategory" name="searchCategory" class="form-control input-sm">
                        <option value="">-- 전체 --</option>
                        <c:forEach items="${comList}" var="code">
                           <option value="${code.commCd}" ${searchVO.searchCategory eq code.commCd ? "selected='selected'" : ""}>${code.commNm}</option>
                        </c:forEach>
                     </select>
                  </div>
                  <div class="col-sm-6">
                     <input class="form-control shadow-none search" name="searchWord" type="search" placeholder="검색어" aria-label="search" value="${searchVO.searchWord}">
                  </div>
                  <div class="col-sm-2 text-right">
                     <button type="submit" class="btn btn-primary form-control">
                        <i class="fa fa-search"></i> &nbsp;검&nbsp;색
                     </button>
                  </div>
               </div>
            </form>
         </div>
      </div>
      
      <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
      <script>
      function showPasswordModal(csNo, csTitle) {
          $('#checkPasswordButton').data('csNo', csNo);
          $('#checkPasswordButton').data('csTitle', csTitle);
          $('#passwordModal' + csNo).modal('fade');
      }
      
      function checkBoardPassword(csNo) {
          var password = $('#passwordInput' + csNo).val();
          $.ajax({
              url: '<c:url value="/checkBoardPassword" />',
              type: 'POST',
              contentType: 'application/json',
              dataType: 'json',
              data: JSON.stringify({ csNo: csNo, csPw: password }),
              success: function(response) {
                  console.log(response);
                  if (response.valid) {
                      window.location.href = '<c:url value="/csDetailView" />' + '?csNo=' + csNo;
                  } else {
                      $('#passwordError' + csNo).removeClass('d-none');
                      alert('비밀번호가 일치하지 않습니다! 다시 확인하여 입력하여 주세요!');
                  }
              },
              error: function(xhr, status, error) {
                  console.error('비밀번호 확인 요청 실패: ' + error);
              }
          });
      }
      
      let search_form = $("form[name='search']");
      let cur_page = search_form.find('input[name="curPage"]');
      $(document).ready(function(){
         $("#id_rowSizePerPage").change(function(){
            cur_page.val(1);
            search_form.find('input[name="rowSizePerPage"]').val($(this).val());
            search_form.submit();
         });
         
         search_form.find("button[type='submit']").click(function(e){
            e.preventDefault();
            cur_page.val(1);
            search_form.submit();
         });
         $('ul.pagination li a[data-page]').click(function(e){
            e.preventDefault();
            cur_page.val($(this).data('page'));
            search_form.submit();
         });
      });
      $(document).ready(function(){
          $('.modal-body input').click(function(event){
              event.stopPropagation();
          });
      });
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
   </div>
</body>
</html>
