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
<title>형광등 분리수거 방법</title>
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
    <h2>형광등 분리수거 방법</h2>
    <div class="big-image">
    <img src="./resources/assets/img/lamp1.jpg" alt="대형 이미지">
</div>
    <hr>
    <h3>올바른 분리수거 방법:</h3>
    <ul>
        <li>형광등을 부드럽게 다루어 깨지지 않도록 합니다.</li>
        <li>아파트단지 내 또는 가까운 주민센터 등에 설치된 형광등 전용 수거함에 버려주세요.</li>
        <li>만약 형광등이 깨졌다면 불연성 쓰레기 봉투에 담아 버려주시고, 깨진 형광등이 수거하는 사람을 다치게 할 수 있으니 쓰레기 봉투가 찢어지지 않게 신문지 등으로 잘 싸서 버려주세요.</li>
    </ul>
    <h3>주의사항:</h3>
    <ul>
        <li>형광등 내부의 수은은 인체에 매우 유해한 물질입니다. 수은이 공기 중으로 유출되지 않도록 깨지지 않게 버려주세요.</li>
        <li>불연성 쓰레기 봉투는 지역 내 마트, 주민센터, 철물점 등에서 살 수 있어요. 하지만 안파는 곳도 많으니 판매여부를 미리 확인하고 방문하세요.</li>
        <li>불연성 쓰레기 봉투는 해당 지자체에 따라 불연재 쓰레기 봉투, 생활 폐기물 봉투, 특수 종량제 봉투 등으로 이름이 조금씩 다를 수 있어요. 모두 타지 않는 쓰레기를 담는 종량제 봉투라는 것과 마대 재질로 만들어졌다는 것을 기억해주세요.</li>
    </ul>
    <h3>예시:</h3>
    <ul>
        <li>형광등, 형광등 관련 소형 전구</li>
    </ul>
    <hr>
    <h2>백열전구 버리는 방법</h2>
    <div class="big-image">
    <img src="./resources/assets/img/lamp2.jpg" alt="대형 이미지">
</div>
    <hr>
    <h3>올바른 버리는 방법:</h3>
    <ul>
        <li>전구는 재활용이 불가능하고 불에 타지 않는 쓰레기이기 때문에 불연성 쓰레기 봉투(마대)에 넣어서 버려주세요.</li>
        <li>불연성 쓰레기 봉투는 지역 내 마트, 주민센터, 철물점 등에서 살 수 있어요. 하지만 안파는 곳도 많으니 판매여부를 미리 확인하고 방문하세요.</li>
    </ul>
    <h3>주의사항:</h3>
    <ul>
        <li>깨진 전구는 수거할 때 사람을 다치게 할 수 있어요. 쓰레기 봉투가 찢어지지 않게 신문지 등으로 싸서 버려주세요.</li>
        <li>불연성 쓰레기 봉투는 해당 지자체에 따라 불연재 쓰레기 봉투, 생활 폐기물 봉투, 특수 종량제 봉투 등으로 이름이 조금씩 다를 수 있어요. 모두 타지 않는 쓰레기를 담는 종량제 봉투라는 것과 마대 재질로 만들어졌다는 것을 기억해주세요.</li>
    </ul>
    <h2>LED 버리는 방법</h2>
    <div class="big-image">
    <img src="./resources/assets/img/lamp3.jpg" alt="대형 이미지">
</div>
    <hr>
    <h3>올바른 분리수거 방법:</h3>
    <ul>
        <li>LED 전구나 LED 전등은 일반쓰레기(종량제봉투)로 버려요.</li>
        <li>LED 조명은 대부분 플라스틱 재질이 쓰이지만 만약 유리가 포함되어 있다면 깨져서 수거하는 사람이 다칠 수 있으니 쓰레기 봉투가 찢어지지 않게 신문지 등으로 잘 싸서 버려주세요.</li>
    </ul>
    <h3>주의사항:</h3>
    <ul>
        <li>LED는 내부의 반도체 칩을 통해 작동하기 때문에 플라스틱 뿐만 아니라 알루미늄, 구리, 은 등 재활용 가치가 높은 유가금속을 포함하고 있어요.</li>
        <li>아직 회수 방법이 없어서 재활용되지 못하고 일반쓰레기로 버려지고 있지만 경기도 등 몇몇 지자체에서 시범적으로 재활용 사업을 진행하고 있습니다.</li>
        <li>LED는 전자 회로, 전원 등 전자기적인 문제가 없는 한 10년 이상 쓸 수 있기 때문에 제품의 수명보단 이용자의 필요에 의해 버려지는 경우가 훨씬 많습니다. LED 제품 구입시 오랫동안 쓸 수 있는 제품으로 신중하게 선택하는 것도 쓰레기를 줄이는 데 큰 도움이 됩니다.</li>
    </ul>
   
</div>



</body>
</html>