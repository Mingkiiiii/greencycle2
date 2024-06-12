<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="ko">
<head>
<link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="assets/css/font-awesome.css">

<link rel="stylesheet" href="assets/css/owl-carousel.css">

<link rel="stylesheet" href="assets/css/lightbox.css">

<link rel="stylesheet" href="assets/css/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="color-scheme" content="light only">
<meta name="supported-color-schemes" content="light">
<title>GreenCycle : 회원가입</title>
<style>
body {
	margin-top: 10% !important;
}

.logo-small {
	margin: auto;
}

.btn_retry {
	background-color: #09aa5c; /* 버튼 배경색 */
	color: #ffffff !important; /* 버튼 글씨 색상 */
	border: none; /* 테두리 없앰 */
	padding: 10px 20px; /* 패딩 조정 */
	border-radius: 4px; /* 버튼 모서리 둥글게 */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* 버튼 그림자 효과 추가 */
	cursor: pointer; /* 커서 모양 변경 */
	transition: background-color 0.3s; /* 배경색 변경 애니메이션 */
	text-decoration: auto !important;
}

#btnPhoneVerify {
	margin-right: -26%;
}

.auth_input {
	overflow: hidden;
	transition: max-height 0.5s ease-in-out, opacity 0.5s ease-in-out;
	max-height: 0; /* 초기 상태에서는 접혀있음 */
	opacity: 0; /* 투명하게 만들어 점차 보이게 함 */
	background-color: #f3f4f6; /* 연한 회색 배경 */
	border: 1px solid #ccc; /* 경계선 추가 */
	border-radius: 8px; /* 모서리 둥글게 처리 */
	padding: 15px; /* 안쪽 여백 추가 */
	margin-top: 10px; /* 상단 여백 추가 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
}

.auth_input.active {
	max-height: 150px; /* 활성화 상태에서 최대 높이 */
	opacity: 1; /* 완전 불투명 */
}

.input {
	width: 70%; /* 입력 필드 너비 조정 */
	padding: 8px 10px; /* 패딩 추가 */
	border-left: 2px solid #c6c6c6;
	margin-right: 10px; /* 오른쪽 마진 추가 */
}

#authCode {
	width: 80%; /* 입력 필드 너비 조정 */
	padding: 8px 10px; /* 패딩 추가 */
	border: solid 1px #c6c6c6;
	margin-right: 10px; /* 오른쪽 마진 추가 */
	border-radius: 6px;
}

.btn_retry:hover {
	background-color: #08a04a; /* 마우스 오버 시 색상 변경 */
}

#divAuthNo6 {
	overflow: hidden;
	transition: max-height 0.5s ease-in-out;
	max-height: 0; /* 초기 상태에서는 보이지 않음 */
}

#divAuthNo6.active {
	max-height: 100px; /* 활성화 상태에서 최대 높이, 필요에 따라 조절 */
}
</style>
<link rel="stylesheet" type="text/css" href="assets/css/realname.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/realname_dark.min.css" media="(prefers-color-scheme:dark)">


</head>

<body>
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	<div class="container">
		<div class="inner">
			<a href="http://naver.com/" class="link">
				<span class="blind">GreenCycle</span>
			</a>

			<div class="content">
				<a href="/my" class="logo-small">
					<img src="assets/images/logo.png">
				</a>
				<form id="join_form" method="post" action="<c:url value="registDo" />" class="form">
					<input type="hidden" id="token_sjoin" name="token_sjoin" value="5ODkb1W1uFuuQu10">
					<input type="hidden" id="nid_kb2" name="nid_kb2" value="">
					<input type="hidden" id="joinMode" name="joinMode" value="joinIdentity">
					<input type="hidden" id="encPswd" name="encPswd" value="">
					<input type="hidden" id="encKey" name="encKey" value="">
					<input type="hidden" id="telecom" name="telecom" value="">
					<input type="hidden" id="birthday" name="birthday" value="">

					<div class="form_content">
						<div class="form_section">
							<div class="form_list">
								<div class="form_item email" id="divEmail">
									<span class="placeholder_prefix">[선택]</span>
									<input type="email" id="userId" name="userId" placeholder="이메일주소 (아이디)" class="input" value="" maxlength="100">
									<button type="button" class="btn_retry" id="btnEmailVerify">이메일 인증</button>
									<span id="emailStatus" style="color: green; display: none;"></span>
									<!-- 이메일 상태 메시지 -->
								</div>
								<!-- 인증번호 입력 필드, 기존에 숨겨진 상태로 존재 -->
								<div class="auth_input" id="emailAuthInput" style="display: none;">
									<input type="text" id="authCode" name="authCode" placeholder="인증번호 입력" class="input" maxlength="6">
									<button type="button" class="btn_retry" id="btnVerify" onclick="verifyCode()">인증 확인</button>
								</div>

								<div class="form_item lock password" id="divPasswd">
									<input type="password" id="userPw" name="userPw" placeholder="비밀번호" class="input" value="" maxlength="20" autocomplete="new-password">
									<div class="password_info">
										<em class="how_secure" id="secureLevel"></em>
									</div>
								</div>
								<div class="form_item lock password" id="divPasswdConfirm">
									<input type="password" id="userPwConfirm" name="userPwConfirm" placeholder="비밀번호 확인" class="input" value="" maxlength="20" autocomplete="new-password">
								</div>
								<div class="form_item user" id="divId">
									<input type="text" id="userNick" name="userNick" placeholder="닉네임을 입력하세요" class="input" value="" maxlength="20" autocapitalize="off">
								</div>

							</div>
							<div class="error_text item_style" id="idMsg" style="display: none"></div>
							<div class="error_text item_style" id="pswd1Msg" style="display: none"></div>
							<div class="error_text item_style" id="emailMsg" style="display: none"></div>

							<div class="form_list">

								<div class="form_item user" id="divName">
									<input type="text" id="userName" name="userName" placeholder="이름" class="input" value="" maxlength="40">
								</div>
								<div class="form_item calendar" id="divBirthday">
									<input type="text" id="userPhone" name="userPhone" placeholder="전화번호" class="input" value="" maxlength="11">
								</div>

								<div class="form_item user" id="divaddress">
									<input type="text" id="userPost" name="userPost" placeholder="우편번호" class="input" maxlength="100" readonly required>
									<button type="button" class="btn_retry" id="btn_address" onclick="sample6_execDaumPostcode();">주소찾기 버튼</button>
								</div>

								<div class="form_item user" id="divaddress">
									<input type="text" id="userAddr" name="userAddr" placeholder="주소" class="input" maxlength="100" readonly>
									<br>
								</div>

								<div class="form_item user" id="divaddress">
									<input type="text" id="userSubaddr" name="userSubaddr" placeholder="" class="input" maxlength="100" readonly>
									<br>
								</div>

								<div class="form_item user" id="divaddress">
									<input type="text" id="userDetailaddr" name="userDetailaddr" placeholder="상세주소" class="input" maxlength="100" required>
								</div>


					</div>
					<div class="error_text item_style" id="nameMsg" style="display: none"></div>
					<div class="error_text item_style" id="birthdayMsg" style="display: none"></div>
					<div class="error_text item_style" id="telecomMsg" style="display: none"></div>
					<div class="error_text item_style" id="genderMsg" style="display: none"></div>
					<div class="error_text item_style" id="foreignerMsg" style="display: none"></div>
					<div class="error_text item_style" id="phoneNoMsg" style="display: none"></div>



				</div>
				</div>

				<div class="btn_submit_wrap" id="divBtnAuth">
				<button type="submit" class="btn_submit" id="btnSend">회원가입</button>
				</div>

	</form>
	</div>
	</div>
	</div>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	document.getElementById('btnEmailVerify').addEventListener('click', function() {
	    var email = document.getElementById('userId').value;
	    var emailAuthInput = document.getElementById('emailAuthInput');
	    if (email !== '') {
	        // 서버에 이메일 중복 검사 요청
	        checkExistingEmail(email, function(msg) {
	            if (msg=="이미 존재하는 이메일입니다.") {
	                // 이메일이 이미 존재할 경우
	                alert('이미 존재하는 이메일입니다.');
	            } else {
	                // 이메일이 존재하지 않을 경우
	                alert('사용 가능한 이메일입니다.');
	                emailAuthInput.style.display = 'block'; // 인증번호 입력 필드 보이기
	                setTimeout(() => { emailAuthInput.classList.add('active'); }, 10); // 애니메이션 효과 적용
	                sendVerificationCode(email); // 인증번호 발송
	            }
	        });
	    } else {
	        alert('이메일을 입력하세요.');
	    }
	});

	function checkExistingEmail(userId, callback) {
	    $.ajax({
	        type: "GET",
	        url: "<c:url value='/checkExistingEmail' />", // 이메일 중복 확인을 처리할 서버의 URL
	        data: { userId: userId },
	        success: function(response) {
	            // 서버에서 true/false로 응답을 받음
	            callback(response.msg); // 응답에서 이메일 존재 여부를 확인
	            
	        },
	        error: function(xhr, status, error) {
	            console.error("Error: " + error);
	            alert('서버 오류, 다시 시도해주세요.');
	        }
	    });
	}

	function sendVerificationCode(email) {
	    if (!email) {
	        alert("이메일을 입력하세요.");
	        return;
	    }

	    $.ajax({
	        type: "POST",
	        url: "<c:url value='/sendEmail' />", // Ensure the URL matches your server configuration
	        data: { email: email },
	        success: function(response) {
	            console.log("Response from server:", response);
	            if(response.code === "Y") {
	                alert(response.msg); // Show success message
	                // Optionally, display or activate the input for the verification code
	                document.getElementById('emailAuthInput').style.display = 'block';
	                setTimeout(() => { document.getElementById('emailAuthInput').classList.add('active'); }, 10);
	            } else {
	                alert(response.msg); // Show error message
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("Error sending verification code:", error);
	            alert('인증번호 발송 실패: ' + xhr.responseText);
	        }
	    });
	}

	// 인증번호 확인 
function verifyCode() {
    var userCode = document.getElementById('authCode').value;
    $.ajax({
        type: "POST",
        url: "<c:url value='/verifyCode' />",
        data: { code: userCode },  // Ensure the parameter name matches with server-side
        success: function(response) {
            if (response.code === "Y") {
                alert('인증번호가 정확합니다.');
            } else {
                alert('인증번호가 일치하지 않습니다. 다시 시도해주세요.');
            }
        },
        error: function(xhr, status, error) {
            alert('인증 확인 실패: ' + xhr.responseText);
        }
    });

}
	
	//인증번호 확인 
	
	// 지도 관련 스크릡트
	function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("userSubaddr").value = extraAddr;

							} else {
								document.getElementById("userSubaddr").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('userPost').value = data.zonecode;
							document.getElementById("userAddr").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("userDetailaddr")
									.focus();
						}
					}).open();
		}
	
	document.getElementById('join_form').addEventListener('submit', function(event) {
	    var password = document.getElementById('userPw').value;
	    var confirmPassword = document.getElementById('userPwConfirm').value;

	    if (password !== confirmPassword) {
	        alert('비밀번호가 일치하지 않습니다.');
	        event.preventDefault(); // Prevent form from submitting
	    }
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