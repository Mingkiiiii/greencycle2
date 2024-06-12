<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>글 작성</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<script src="<c:url value="/resources/smarteditor2-2.8.2.3/js/HuskyEZCreator.js" />" ></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body id="page-top">
	<!-- 모든 페이지 상단에 들어가는 부분 -->
	<%@include file="/WEB-INF/inc/top.jsp"%>
	<!-- Contact Section-->
	<section class="page-section" id="contact">
		<div class="container" style="margin-top: 100px;">
			<!-- Contact Section Heading-->
			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">글 작성</h2>

			<!-- Contact Section Form-->
			<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-7">
					<form action="<c:url value="/sellWriteDo" />" method="post" enctype="multipart/form-data" onsubmit="return fn_check()">
						<div class="mb-3">
							<label for="salesTitle">물품명</label>
							<input class="form-control" id="salesName" name="salesName" type="text" />
						</div>
						<div class="mb-3">
							<label for="salesPrice">판매금액</label>
							<input class="form-control" id="salesPrice" name="salesPrice" type="text" />
						</div>
						<div class="mb-3">
							<label for="salesCategory">카테고리</label>
							<input class="form-control" id="salesCategory" name="salesCategory" type="text" />
						</div>
						<div class="mb-3">
							<label for="salesImage">상품사진</label>
							<input type="file" name="file" id="salesImage" class="form-control" required>
                            <input type="hidden" name="salesImage" id="salesImageHidden" class="form-control">
						</div>
						<div class="mb-3">
							<label for="salesStatus">판매/나눔 여부</label>
							<select name="salesStatus" class="form-control input-sm" style="text-align: center;">
							
							<option value="판매중">판매중</option>
							<option value="나눔♥">나눔♥</option>
						</select>
						</div>
						<div class="mb-3">
							<label for="salesAddr">거래장소</label>
							<input class="form-control" id="salesAddr" name="salesAddr" type="text" />
						</div>
						<div class="mb-3"></div>
						<!-- content input-->
						<div class="mb-3">
							<textarea class="form-control" name="salesContent" id="salesContent" style="height: 20rem"></textarea>
						</div>
						<!-- Submit Button-->
						<div class="d-flex justify-content-end">
    <button class="btn btn-primary btn-xl" type="submit">등록</button>
</div>

					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- 모든 페이지 하단에 들어가는 부분 -->
	<!-- Footer-->
	<%@include file="/WEB-INF/inc/footer.jsp"%>
	<script type="text/javascript">
	var oEditors = [];
	$(document).ready(function(){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef :oEditors
			,elPlaceHolder: "salesContent"
			,sSkinURI : "<c:url value='/resources/smarteditor2-2.8.2.3/SmartEditor2Skin.html' />"
			,htParams: {
				bUseToolbar : true // 툴바 사용여부
				,bUseVerticalResier : true // 입력창 크기 조절바 사용여부
				,bUseModeChanger : true //모드탭(html, text, editor)
				,bSkipXssFilter : true // xss공격 무시여부
				,fOnBeforeUnload : function(){
					alert("전송!");
				}
			},
			fCreator : 'createSEditor2'
		}); 
	});
	
	function fn_check(){
		oEditors.getById['salesContent'].exec("UPDATE_CONTENTS_FIELD", []);
		let contents = document.getElementById('salesContent').value;
		console.log(oEditors);
		console.log(contents);
		if(contents == '' || contents == null || contents == '&nbsp;'
			|| contents == '<p>&nbsp;</p>'){
			alert("내용을 입력하세요!!");
			return false;
		}else{
			if(confirm("전송할까요?")){
				alert("전송하였습니다.");
			}else{
				return false;
			}
		}
	}

	$(document).ready(function() {
	    // salesImage에 이미지가 업로드되면 자동으로 처리
	    $("#salesImage").on("change", function() {
	        // 이미지 파일 선택
	        var file = this.files[0];
	        if (file) {
	            // FormData 객체 생성하여 이미지 파일을 담음
	            var formData = new FormData();
	            formData.append("image", file);

	            // AJAX를 통해 Flask 서버에 이미지 전송
	            $.ajax({
	                url: "http://192.168.0.34:5000/",  
	                type: "POST",
	                data: formData,
	                processData: false,
	                contentType: false,
	                success: function(response) {
	                    // 서버로부터 받은 데이터로 제품명과 카테고리 입력란을 업데이트
	                    var productName = response.response;
	                    var productCategory = response.response2;

	                    $("#salesName").val(productName);
	                    $("#salesCategory").val(productCategory);
	                },
	                error: function(xhr, status, error) {
	                    console.error("Error: " + status + " " + error);
	                }
	            });
	        }
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
</body>
</html>
