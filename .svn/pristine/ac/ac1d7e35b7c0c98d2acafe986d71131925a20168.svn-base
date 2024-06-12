<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Loading Page</title>
<link rel="stylesheet" href="<c:url value='/assets/css/style_game.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/style_game.css' />">
<link rel="stylesheet" href="<c:url value='/assets/css/desktop_game.css' />" media="screen and (min-width: 769px)">
<link rel="stylesheet" href="<c:url value='/assets/css/mobile_game.css' />" media="screen and (max-width: 768px)">
<style>
.back_load {
	content: "";
	position: center;
	top: 0;
	left: 0;
	width: 360px;
	height: 680px;
	background-color: #5980A7;
	background-size: 360px 640px;
	z-index: -1; /* 배경 이미지가 컨텐츠 뒤에 표시되도록 z-index 설정 */
}

#loading {
	position: center;
	top: 50%;
	left: 50%;
	transform: translate(70%, 0%);
	width: 100px;
	height: 100px;
	z-index: 100; /* 로딩 이미지가 배경 이미지 위에 표시되도록 z-index 설정 */
}

.load_font {
	position: center;
	margin-top: 40%;
	font-size: 30px;
	margin-left: 4%;
	color: black;
	font-weight: bold;
	z-index: 99;
	transform: translate(-37%, 0%);
}
</style>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        setTimeout(() => {
            window.location.href = '<c:url value="/start" />';
        }, 5000);
    });
</script>
</head>
<body class="back_load">
    <img id="loading" alt="loading" src="<c:url value='/assets/images/game_loading.gif' />">
    <span class="load_font">loading...</span>
</body>
</html>
</html>