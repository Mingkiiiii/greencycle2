<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>게시글 수정</title>
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
					<form action="<c:url value="/csEditDo" />" method="post" onsubmit="return fn_check()">
						<!-- title input-->
						<div class="mb-3">
							<label for="csTitle">제목</label>
							<input class="form-control" id="csTitle" name="csTitle" type="text" value="${cs.csTitle}" />
						</div>
						
						<select name="csCategory" class="form-control input-sm" style="text-align: center;">
							<option value="">--------------------- 문의현황 선택 ---------------------</option>
							<option value="문의중">문의중</option>
							<option value="문의완료">문의완료</option>
						</select>
						
						<input type="hidden" name="csNo" value="${cs.csNo}"/>
						
						<div class="mb-3">
							<label for="csPw">비밀번호</label>
							<input class="form-control" id="csPw" name="csPw" type="password" value="${cs.csPw}" />
						</div>
						
						<div class="mb-3"></div>



						<!-- content input-->
						<div class="mb-3">
							<textarea class="form-control" name="csContent" id="csContent" style="height: 20rem">${cs.csContent}</textarea>
						
						</div>
						<!-- Submit Button-->
						<button class="btn btn-primary btn-xl" type="submit">등록</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- 모든 페이지 하단에 들어가는 부분 -->
	<!-- Footer-->
	<%@include file="/WEB-INF/inc/footer.jsp"%>
</body>
<script type="text/javascript">
	var oEditors = [];
	$(document).ready(function(){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef :oEditors
			,elPlaceHolder: "csContent"
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
		oEditors.getById['csContent'].exec("UPDATE_CONTENTS_FIELD", []);
		let contents = document.getElementById('csContent').value;
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
</script>

</html>