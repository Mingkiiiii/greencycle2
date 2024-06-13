<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Character Selection</title>
<link rel="stylesheet" href="<c:url value='/css/style_game.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/style_game.css' />">
<style>
@font-face {
	font-family: 'PFStardust';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/PFStardust.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body, h1, p, .character-label span {
	font-family: 'PFStardust', sans-serif;
	color: white; /* 기본 글씨 색상은 흰색으로 설정 */
}

#select-button {
	z-index: 3; /* 컨텐츠가 배경 이미지 위에 표시되도록 z-index 설정 */
}

.character-label {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 0 10px; /* 캐릭터들 사이의 간격 */
	width: 100px;
	height: 200px;
	color: black !important;
}

.character-selection-content form {
	display: flex;
	justify-content: center;
	flex-wrap: nowrap; /* 한 줄에 모든 캐릭터를 줄 바꿈 없이 표시 */
	overflow: hidden; /* 슬라이드될 때 넘어가는 캐릭터들을 숨김 */
	width: 100px; /* 슬라이드 영역의 너비를 한 캐릭터 크기에 맞춤 */
	justify-content: space-evenly;
	margin-left: 46%;
}

.container {
	text-align: center;
	color: white; /* 기본 글씨 색상은 흰색으로 설정 */
	position: relative; /* 배경 이미지 위에 컨텐츠를 올리기 위해 상대 위치 지정 */
	z-index: 1; /* 컨텐츠가 배경 이미지 위에 표시되도록 z-index 설정 */
	height: 70%;
}

.back_ground_cont::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: url('<c:url value="/assets/images/home.png" />') no-repeat
		center center fixed;
	background-size: 360px 640px;
	z-index: -1; /* 배경 이미지가 컨텐츠 뒤에 표시되도록 z-index 설정 */
}

.arrow-icon {
	width: 50px !important;
	height: 50px !important;
	cursor: pointer;
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	z-index: 10; /* 가장 앞부분에 표시되도록 z-index 설정 */
}

.arrow-icon.left {
	margin-left: -15%;
}

.arrow-icon.right {
	margin-left: 11.5%;
}

.character-slider {
	display: flex;
	transition: transform 0.5s ease; /* 슬라이드 애니메이션 효과 */
	margin-top: 140%;
}

.select-button {
	margin-top: 2.3%;
	cursor: pointer;
	width: 23% !important;
}

.selectedCharacter {
	margin-top: -8%;
	margin-bottom: 3%;
}

/* 반응형 디자인을 위한 미디어 쿼리 */
@media ( max-width : 768px) {
	.container {
		width: 100%;
		height: auto;
		margin-top: 0;
	}
	.back_ground_cont::before {
		background-size: 80%;
	}
	.character-label {
		width: 80px;
		height: 80px;
	}
	.character-selection-content {
		flex-direction: column;
	}
	body, h1, p, .character-label span {
		color: black; /* 모바일 환경에서는 글씨 색상을 검정으로 변경 */
	}
	h1.mobile-title {
		display: block;
	}
	.arrow-icon {
		width: 50px !important;
		height: 50px !important;
		cursor: pointer;
		position: absolute;
		top: 50%;
		transform: translateY(50%);
		z-index: 10; /* 가장 앞부분에 표시되도록 z-index 설정 */
	}
}

@media ( max-width : 480px) {
	.character-label {
		width: 60px;
		height: 60px;
	}
	.character-selection-content {
		flex-direction: column;
	}
	body, h1, p, .character-label span {
		color: black; /* 모바일 환경에서는 글씨 색상을 검정으로 변경 */
		margin-top: -18%;
	}
	h1.mobile-title {
		display: block;
	}
	.select-button {
		margin-top: -14.7%;
		cursor: pointer;
		width: 80% !important;
		transform: translateY(98%);
	}
	.arrow-icon.left {
		margin-left: -48%;
	}
	.arrow-icon.right {
		margin-left: 36.5%;
	}
	h1.mobile-title {
		display: none;
	}
	.character-selection-content form {
		display: flex;
		justify-content: center;
		flex-wrap: nowrap;
		overflow: hidden;
		width: 100px;
		justify-content: space-evenly;
		margin-left: 38%;
	}
	.desktop-title {
		font-size: 25px;
		transform: translateY(35%);
	}
}


</style>
</head>
<body class="back_ground_cont">
	<div class="container">
		<div class="character-selection-content">
			<img src="<c:url value='/assets/images/left_icon.png' />" alt="Left Arrow" class="arrow-icon left" onclick="slideLeft()"> <img src="<c:url value='/assets/images/right_icon.png' />" alt="Right Arrow" class="arrow-icon right" onclick="slideRight()">
			<h1 class="desktop-title" style="font-size: 25px">Select Your Character</h1>
			<c:if test="${tamagotchi == null}">
				<c:if test="${damainfoNo == null}">
					<form id="characterForm" action="<c:url value='/gameMain' />" method="post">
						<input type="hidden" name="userId" value="${sessionScope.userId}" />
						<input type="hidden" name="characterType" id="characterType" value="" />
						<div class="character-slider" id="damainfoChar">
							<label class="character-label" data-character="bear_white"> <img src="<c:url value='/assets/images/bear_white.png' />" alt="Bear White"> <input type="radio" name="selectedCharacter" value="bear_white"> <span>Bear White</span>
							</label> <label class="character-label" data-character="bear_brown"> <img src="<c:url value='/assets/images/bear_brown.png' />" alt="Bear Brown"> <input type="radio" name="selectedCharacter" value="bear_brown"> <span>Bear Brown</span>
							</label> <label class="character-label" data-character="cat_white"> <img src="<c:url value='/assets/images/cat_white.png' />" alt="Cat White"> <input type="radio" name="selectedCharacter" value="cat_white"> <span>Cat White</span>
							</label> <label class="character-label" data-character="dog_brown"> <img src="<c:url value='/assets/images/dog_brown.png' />" alt="Dog Brown"> <input type="radio" name="selectedCharacter" value="dog_brown"> <span>Dog Brown</span>
							</label> <label class="character-label" data-character="dog_white"> <img src="<c:url value='/assets/images/dog_white.png' />" alt="Dog White"> <input type="radio" name="selectedCharacter" value="dog_white"> <span>Dog White</span>
							</label>
						</div>

					</form>
					<img src="<c:url value='/assets/images/select.png' />" alt="Select Button" class="select-button" onclick="selectCharacter()">
				</c:if>
				<c:if test="${tamagotchi != null}">
					<p>You already have a Tamagotchi. Proceed to game or reset it.</p>
					<form action="<c:url value='/gameMain' />" method="get">
						<button type="submit">Proceed to Game</button>
					</form>
					<form action="<c:url value='/reset' />" method="post">
						<button type="submit">Reset Tamagotchi</button>
					</form>
				</c:if>
			</c:if>
		</div>
	</div>
	<script>
        let currentIndex = 0;

        function slideLeft() {
            const slider = document.getElementById('damainfoChar');
            const width = window.innerWidth;
            const translateValue = width <= 768 ? 80 : 120; // 모바일 환경에서는 80px, 데스크탑에서는 120px
            if (currentIndex > 0) {
                currentIndex--;
                slider.style.transform = 'translateX(' + (-currentIndex * translateValue) + 'px)';
                updateCharacterType();
            }
        }

        function slideRight() {
            const slider = document.getElementById('damainfoChar');
            const width = window.innerWidth;
            const translateValue = width <= 768 ? 80 : 120; // 모바일 환경에서는 80px, 데스크탑에서는 120px
            if (currentIndex < slider.children.length - 1) {
                currentIndex++;
                slider.style.transform = 'translateX(' + (-currentIndex * translateValue) + 'px)';
                updateCharacterType();
            }
        }

        function updateCharacterType() {
            const slider = document.getElementById('damainfoChar');
            const currentCharacter = slider.children[currentIndex].getAttribute('data-character');
            document.getElementById('characterType').value = currentCharacter;
            console.log("characterType: " + currentCharacter);
        }

        function selectCharacter() {
            const selectedCharacter = document.querySelector('input[name="selectedCharacter"]:checked');
            if (selectedCharacter) {
                document.getElementById('characterType').value = selectedCharacter.value;
                document.getElementById('characterForm').submit();
                alert("캐릭터가 선택되었습니다 메인화면으로 돌아갑니다!!!.");
            } else {
                alert("캐릭터가 선택되지 않았습니다.");
            }
        }

        document.addEventListener('DOMContentLoaded', () => {
            updateCharacterType();
        });
    </script>
</body>
</html>