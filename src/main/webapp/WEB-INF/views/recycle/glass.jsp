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
<title>유리병 분리수거 방법</title>
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
    <h2>유리병 분리수거 방법</h2>
    <div class="big-image">
    <img src="./resources/assets/img/glass1.jpg" alt="대형 이미지">
</div>
    <hr>
    <h3>올바른 분리수거 방법:</h3>
    <ul>
        <li>유리병 내부를 비워 내용물을 제거합니다.</li>
        <li>라벨 등 부착물을 제거합니다.</li>
        <li>유리병 본체와 뚜껑은 분리해서 유리병 본체는 유리병  분리수거로, 유리병 뚜껑은 캔류 분리수거 등 재질에 맞게 분리배출해요.</li>
        <li>색깔별로 유리병 배출장소가 나뉘어져 있으면 색깔에 맞춰 분리배출해요.</li>
    </ul>
    <h3>주의사항:</h3>
    <ul>
        <li>유리 파편이나 가공되지 않은 유리는 다른 쓰레기와 분리하여 처리합니다.</li>
        <li>유리병을 다룰 때는 주의하여 깨지지 않도록 합니다.</li>
        <li>깨진 유리병, 유리컵, 자기 그릇, 거울, 전구 등 병류가 아닌 유리제품은 유리로 분리수거가 안돼요. 불에 타지 않는 생활쓰레기를 버리는 불연성 종량제 봉투에 담아서 버려주세요.</li>	
    </ul>
    <h3>예시:</h3>
    <ul>
        <li>음료용 유리병, 조미료용 유리병 등</li>
    </ul>
    <h3>팁:</h3>
    <ul>
        <li>소주병, 맥주병 등은 편의점이나 마트에서 돈으로 바꿀 수 있어서 많이 모아서 바꾸는것을 추천해요.</li>
    </ul>
</div>


</body>
</html>
