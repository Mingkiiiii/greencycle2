<%--
/**
 * <pre>
 * 1. 프로젝트명 : 스프링 웹 프로젝트
 * 2. 작성일 : 2024. 5. 27. 오전 11:01:12
 * 3. 작성자 : KimMyeongGi
 * 4. 화면ID : 화면정의서 화면ID
 * 5. 화면명 : 화면정의서의 화면명
 * 6. 설명 : 화면명과 동일하거나 기타 특이사항 기술
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>종이류 분리수거 방법</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<style>
body {
    font-family: 'Helvetica Neue', Arial, sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 0;
    color: #333;
}

header {
    background-color: #4CAF50;
    color: white;
    padding: 20px 0;
    text-align: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}

header h1 {
    margin: 0;
    font-size: 2em;
}

.content {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    margin-bottom: 20px;
}

.content h2 {
    color: #4CAF50;
    text-align: center;
    margin-top: 0;
    font-size: 1.75em;
    border-bottom: 2px solid #4CAF50;
    padding-bottom: 10px;
    margin-bottom: 20px;
}

.content h3 {
    color: #4CAF50;
    font-size: 1.25em;
    margin-top: 20px;
    margin-bottom: 10px;
}

.content ul {
    list-style-type: none;
    padding: 0;
}

.content ul li {
    margin: 10px 0;
    padding: 10px;
    background-color: #e8f5e9;
    border-left: 5px solid #4CAF50;
    border-radius: 4px;
}

.content img {
    width: 100px;
    height: auto;
    display: block;
    margin: 10px auto;
    border-radius: 8px;
}

footer {
    background-color: #4CAF50;
    color: white;
    text-align: center;
    padding: 10px 0;
    position: fixed;
    width: 100%;
    bottom: 0;
    box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
}

footer p {
    margin: 0;
    font-size: 0.9em;
}
.content img {
    display: inline-block; /* 이미지를 인라인 블록 요소로 설정하여 가로로 배치 */
    vertical-align: middle; /* 이미지를 수직으로 중앙에 정렬 */
    margin: 40px; /* 이미지 간격 설정 */
}
.big-image {
    text-align: center; /* 텍스트 가운데 정렬 */
}

.big-image img {
    width: 80%; /* 이미지 폭을 조정하여 화면에 맞게 표시 */
    height: auto; /* 이미지의 세로 비율을 유지 */
    display: block; /* 블록 요소로 설정하여 가운데 정렬 */
    margin: 0 auto; /* 수평 가운데 정렬 */
}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
<hr>
<header>
    <h1>분리수거 안내</h1>
</header>
<hr>
<div class="content">
    <h2>종이류 분리수거 방법</h2>
    <div class="big-image">
    <img src="./resources/assets/img/paper1.jpg" alt="대형 이미지">
</div>
    <hr>
    <h3>올바른 분리수거 방법:</h3>
    <ul>
        <li>박스는 테이프를 제거하여 박스류를 모아두는 곳에 버립니다.</li>
        <li>멸균팩류는 음료를 모두 비우고, 내부를 물로 깨끗이 세척한 후 분리배출해요.
        	빨대, 비닐, 플라스틱 등 다른 재질이 붙어있는 경우 재질별로 분리해서 배출해요. 플라스틱 입구 등 쉽게 분리할 수 없는 부분은 칼이나 가위로 잘라서 일반쓰레기(종량제봉투)로 버려주세요.</li>
        <li>종이컵은 내부를 깨끗하게 해야지 배출이 가능합니다. 종이팩수거함이 따로 있는 경우 종이팩 수거함으로 버려주세요.</li>
    </ul>
    <h3>주의사항:</h3>
    <ul>
        <li>오염된 종이류는 재활용이 어려우므로 깨끗한 종이를 선택합니다.</li>
        <li>이물질이 남아있지 않게 조심해주세요. 만약 제거가 불가능하다면 일반쓰레기(종량제봉투)에 버려주세요.</li>
    </ul>
    <h3>예시:</h3>
    <ul>
        <li>박스, 과자박스, 종이컵, 멸균팩류</li>
    </ul>
</div>


</body>
</html>
