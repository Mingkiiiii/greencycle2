<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<c:if test="${not empty msg}">
     <script>alert("${msg}");</script>
</c:if>
<head>
<title>Animated Login Form</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Poppins', sans-serif;
	overflow: hidden;
}

.wave {
	position: fixed;
	bottom: 0;
	left: 0;
	height: 100%;
	z-index: -1;
}

.container {
	width: 100vw;
	height: 100vh;
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	grid-gap: 7rem;
	padding: 0 2rem;
	align-content: center;
	justify-items: stretch;
	align-items: stretch;
	justify-content: center;
}

.img {
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

.login-content {
	display: flex;
	justify-content: flex-start;
	align-items: center;
	text-align: center;
}

.img img {
	width: 500px;
}

form {
	width: 360px;
}

.login-content img {
	height: 50px;
	width: 100%;
	border-radius: 25px;
}

}
.login-content h2 {
	margin: 15px 0;
	color: #333;
	text-transform: uppercase;
	font-size: 2.9rem;
}

.login-content .input-div {
	position: relative;
	display: grid;
	grid-template-columns: 7% 93%;
	margin: 25px 0;
	padding: 5px 0;
	border-bottom: 2px solid #d9d9d9;
}

.login-content .input-div.one {
	margin-top: 0;
}

.i {
	color: #d9d9d9;
	display: flex;
	justify-content: center;
	align-items: center;
}

.i i {
	transition: .3s;
}

.input-div>div {
	position: relative;
	height: 45px;
}

.input-div>div>h5 {
	position: absolute;
	left: 10px;
	top: 50%;
	transform: translateY(-50%);
	color: #999;
	font-size: 18px;
	transition: .3s;
}

.input-div:before, .input-div:after {
	content: '';
	position: absolute;
	bottom: -2px;
	width: 0%;
	height: 2px;
	background-color: #38d39f;
	transition: .4s;
}

.input-div:before {
	right: 50%;
}

.input-div:after {
	left: 50%;
}

.input-div.focus:before, .input-div.focus:after {
	width: 50%;
}

.input-div.focus>div>h5 {
	top: -5px;
	font-size: 15px;
}

.input-div.focus>.i>i {
	color: #38d39f;
}

.input-div>div>input {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	border: none;
	outline: none;
	background: none;
	padding: 0.5rem 0.7rem;
	font-size: 1.2rem;
	color: #555;
	font-family: 'poppins', sans-serif;
}

.input-div.pass {
	margin-bottom: 4px;
}

a {
	display: block;
	text-align: right;
	text-decoration: none;
	color: #999;
	font-size: 0.9rem;
	transition: .3s;
}

a:hover {
	color: #38d39f;
}

.btn {
	display: block;
	width: 100%;
	height: 50px;
	border-radius: 25px;
	outline: none;
	border: none;
	background-image: linear-gradient(to right, #32be8f, #38d39f, #32be8f);
	background-size: 200%;
	font-size: 1.2rem;
	color: #fff;
	font-family: 'Poppins', sans-serif;
	text-transform: uppercase;
	margin: 1rem 0;
	cursor: pointer;
	transition: .5s;
}

.btn:hover {
	background-position: right;
}

@media screen and (max-width: 1050px) {
	.container {
		grid-gap: 5rem;
	}
}

@media screen and (max-width: 1000px) {
	form {
		width: 290px;
	}
	.login-content h2 {
		font-size: 2.4rem;
		margin: 8px 0;
	}
	.img img {
		width: 400px;
	}
}

@media screen and (max-width: 900px) {
	.container {
		grid-template-columns: 1fr;
	}
	.img {
		display: none;
	}
	.wave {
		display: none;
	}
	.login-content {
		justify-content: center;
	}
}

.btn, .back-btn {
	display: block;
	width: 100%;
	height: 50px;
	border-radius: 25px;
	outline: none;
	border: none;
	background-image: linear-gradient(to right, #32be8f, #38d39f, #32be8f);
	background-size: 200%;
	font-size: 1.2rem;
	color: #fff;
	font-family: 'Poppins', sans-serif;
	text-transform: uppercase;
	margin: 1rem 0;
	cursor: pointer;
	transition: .5s;
}

.btn:hover, .back-btn:hover {
	background-position: right;
}

.back-btn {
	display: flex;
	justify-content: center;
	align-items: center;
	background-image: linear-gradient(to right, #6495ED, #1E90FF, #6495ED);
	margin-top: 10px; /* 로그인 버튼과의 간격 */
	text-align: center;
	font-size: 1.2rem;
	color: #fff;
}

.link-container {
	display: flex;
	justify-content: space-between; /* 링크들 사이에 공간을 균등하게 분배 */
	margin: 10px 0; /* 상하 간격 조정 */
}

.link-container a {
	color: #999;
	text-decoration: none;
	font-size: 0.9rem;
	transition: .3s;
	text-align: center;
}

.link-container a:hover {
	color: #38d39f;
}
</style>
</head>

<body>
	<img class="wave"
		src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/wave.png">
	<div class="container">
		<div class="img">
			<img
				src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/bg.svg">
		</div>
		<div class="login-content">
			<form method="post" action="<c:url value="/loginDo" /> ">
				<img
					src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/avatar.svg">
				<h2 class="title">Welcome</h2>
				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user"></i>
					</div>
					<div class="div">
						<input type="text" name="userId" id="userId" class="input"
							placeholder="ID">
					</div>
				</div>
				<div class="input-div pass">
					<div class="i">
						<i class="fas fa-lock"></i>
					</div>
					<div class="div">
						<input type="password" name="userPw" id="userPw" class="input"
							placeholder="Password">
					</div>
				</div>
				<div class="link-container">
					<a href="/my/registView">회원가입</a> 
					<a href="/forgotPassword">비밀번호를 잃어버리셨나요?</a>
				</div>
				<div>
					<button type="submit" class="btn" value="로그인">Login</button>
				</div>
				<a
					href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=8e69821150a659375715b3ac34422db0&redirect_uri=http://192.168.0.34:9090/my/kakaoLogin">
					<img src="resources/assets/images/kakao_login_medium_wide.png">
				</a> <a href="/my" class="btn back-btn"><i class="fas fa-arrow-left"></i>뒤로가기</a>
		</div>
		<!-- 뒤로가기 버튼 추가 -->
		<div></div>
		</form>
	</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	 const response = {
	         "id": 3481448302,
	         "connected_at": "2024-05-14T05:28:06Z",
	         "properties": {
	           "nickname": "오정연",
	           "profile_image": "http://t1.kakaocdn.net/account_images/default_profile.jpeg.twg.thumb.R640x640",
	           "thumbnail_image": "http://t1.kakaocdn.net/account_images/default_profile.jpeg.twg.thumb.R110x110"
	         },
	         "kakao_account": {
	           "profile_nickname_needs_agreement": false,
	           "profile_image_needs_agreement": false,
	           "profile": {
	             "nickname": "오정연",
	             "thumbnail_image_url": "http://t1.kakaocdn.net/account_images/default_profile.jpeg.twg.thumb.R110x110",
	             "profile_image_url": "http://t1.kakaocdn.net/account_images/default_profile.jpeg.twg.thumb.R640x640",
	             "is_default_image": true,
	             "is_default_nickname": false
	           },
	           "has_email": true,
	           "email_needs_agreement": false,
	           "is_email_valid": true,
	           "is_email_verified": true,
	           "email": "joyo1115@kakao.com"
	         }
	       };

	       // 원하는 데이터 파싱
	       const nickname = response.properties.nickname;
	       const profileImage = response.properties.thumbnail_image;
	       const email = response.kakao_account.email;

	       console.log(`Nickname: ${nickname}`);
	       console.log(`Profile Image: ${profileImage}`);
	       console.log(`Email: ${email}`);
	       
	          document.getElementById('kakao-login-btn').addEventListener('click', function() {
	              // 로딩 애니메이션 표시
	              alert('카카오 로그인 중입니다...');
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