<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- <meta http-equiv="Refresh" content="10">     -->
<title>Game Main</title>
<link rel="stylesheet" href="<c:url value='/css/style_game.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/style_game.css' />">
<link rel="stylesheet" href="<c:url value='/assets/css/gameMain_pc.css' />" media="screen and (min-width: 769px)">
<link rel="stylesheet" href="<c:url value='/assets/css/gameMain_mobile.css' />" media="screen and (max-width: 768px)">
<style>

.back_ground_cont::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: url('<c:url value="/assets/images/home.png" />') no-repeat center center fixed;
    background-size: 360px 640px;
    z-index: -1; /* 배경 이미지가 컨텐츠 뒤에 표시되도록 z-index 설정 */
}

</style>
</head>
<body class="back_ground_cont">

    <div class="container">
        <div class="character-selection-content">
            <c:if test="${not empty damainfo}">
                <img id="end_icon" src="assets/images/end_icon.png" alt="End Icon" class="end-icon">
                <img id="info_icon" src="assets/images/info_icon.png" alt="Info Icon" class="info-icon">
                <img id="hamber_icon" src="assets/images/hamber_icon.png" alt="Hamber Icon" class="hamber-icon">
                <img id="camera_icon" src="assets/images/camera_icon.png" alt="Camera Icon" class="camera-icon">
                <img id="broom_icon" src="assets/images/Broom_icon.png" alt="Broom Icon" class="broom-icon">
                

                <div class="container">
                    <img id="characterImg" src="<c:url value='/assets/images/${damainfo.damainfoChar}.png' />" alt="${damainfo.damainfoChar}" class="character-img character">
                    <div id="barContainer">
                        <img id="bar_hp" src="<c:url value='/assets/images/bar_hp.png' />" alt="bar_hp"> <span id="damainfoHp" class="bar-text-hp">${damainfo.damainfoHp}</span>
                        <img id="bar_coin" src="<c:url value='/assets/images/bar_coin.png' />" alt="bar_coin"> <span class="bar-text-coin">${damainfo.userPoint}</span> <img id="bar_food" src="<c:url value='/assets/images/bar_food.png' />" alt="bar_food"> <span id="damainfoFood" class="bar-text-food">${damainfo.damainfoFood}</span>
                        <img id="bar_happy" src="<c:url value='/assets/images/bar_happy.png' />" alt="bar_happy"> <span id="damainfoHappniess" class="bar-text-happy">${damainfo.damainfoHappniess}</span>
                        <img id="bar_clean" src="<c:url value='/assets/images/bar_clean.png' />" alt="bar_clean"> <span id="damainfoClean" class="bar-text-clean">${damainfo.damainfoClean}</span>
                        <img id="bar_medicine" src="<c:url value='/assets/images/bar_medicine.png' />" alt="bar_medicine"> <span id="damainfoIll" class="bar-text-medicine">${damainfo.damainfoIll}</span>
                        <img id="bar_reset" src="<c:url value='/assets/images/bar_reset.png' />" alt="bar_reset">
                    </div>
                </div>
            </c:if>
            <c:if test="${empty damainfo}">
                <!-- 계정이 없다고 판별 -->
            </c:if>
        </div>
        <div class="menu-container">
            <div style="position: relative;">
                <img class="menu_btn" id="food" alt="food" src="<c:url value='/assets/images/menu_btn.png' />"> <span class="menu_text">Food</span>
            </div>
            <div style="position: relative;">
                <img class="menu_btn" id="fun" alt="fun" src="<c:url value='/assets/images/menu_btn.png' />"> <span class="menu_text">Fun</span>
            </div>
            <div style="position: relative;">
                <img class="menu_btn" id="medicine" alt="medicine" src="<c:url value='/assets/images/menu_btn.png' />"> <span class="menu_text">Medicine</span>
            </div>
        </div>
        <div id="item_section" class="item-section">
            <div class="item-header">
                <img id="back_icon" src="<c:url value='/assets/images/back_icon.png' />" alt="Back Icon" class="back-icon"> <span id="item_title" class="item-title"></span>
            </div>
            <div id="items_container" class="items-container"></div>
        </div>

        <form id="confirmModalForm" action="<c:url value='confirmModal' />" method="post">
            <div id="confirmModal" class="modal">
                <div class="modal-content">
                    <span class="close" id="closeModal">&times;</span>
                    <h2>아이템 구매 확인</h2>
                    <div id="modalItemDetails">
                        <img id="modalItemImage" src="" alt="Item Image" style="width: 50px; height: 50px;">
                        <div class="item-details">
                            <img src="<c:url value='/assets/images/coin.png' />" alt="Price"> <span id="modalItemPrice"></span> <img id="modalItemIcon" src="<c:url value='/assets/images/heart_small.png' />" alt="Hearts"> <span id="modalItemHearts"></span>
                        </div>
                    </div>
                    <p>이 아이템을 구매하여 먹이시겠습니까?</p>
                    <div class="button-container">
                        <button type="button" class="btn" id="confirmButton">확인</button>
                        <button type="button" class="btn" id="cancelButton">취소</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <div id="confirmationMessage">밥을 맛있게 먹었습니다!</div>
    <div id="confirmationMessage1">장난감을 사줘서 기뻐합니다!</div>
    <div id="confirmationMessage2">약을 먹어서 건강이 조금 회복되었습니다!</div>
    
    <script>
        // 서버로 새로운 스탯을 전송하는 함수
        function sendStatsToServer(hp, food, happiness, clean, ill) {
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "<c:url value='/updateStats' />", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    console.log("Stats updated successfully");
                }
            };

            xhr.send("hp=" + (hp !== null ? hp : 0) +
                     "&food=" + (food !== null ? food : 0) +
                     "&happiness=" + (happiness !== null ? happiness : 0) +
                     "&clean=" + (clean !== null ? clean : 0) +
                     "&ill=" + (ill !== null ? ill : 0));
        }

        // 아이템 구매 정보를 서버로 비동기 전송하는 함수
        function sendPurchaseToServer(item, price, hearts) {
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "<c:url value='/purchaseItem' />", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    console.log("Purchase completed successfully");
                }
            };

            xhr.send("item=" + item + "&price=" + price + "&hearts=" + hearts);
        }

        // 아이템 버튼을 추가하고 클릭 이벤트를 처리하는 함수
        function addItemButton(imgSrc, altText, price, hearts, iconSrc) {
            const itemButton = document.createElement('div');
            itemButton.classList.add('item-button');

            const itemImage = document.createElement('img');
            itemImage.src = imgSrc;
            itemImage.alt = altText;
            itemImage.classList.add('item-img');

            const itemInfo = document.createElement('div');
            itemInfo.classList.add('item-info');

            const priceIcon = document.createElement('img');
            priceIcon.src = 'assets/images/coin.png';
            priceIcon.alt = 'Price';

            const priceText = document.createElement('span');
            priceText.textContent = price;

            const heartIcon = document.createElement('img');
            heartIcon.src = iconSrc;
            heartIcon.alt = 'Hearts';

            const heartText = document.createElement('span');
            heartText.textContent = hearts;

            itemInfo.appendChild(priceIcon);
            itemInfo.appendChild(priceText);
            itemInfo.appendChild(heartIcon);
            itemInfo.appendChild(heartText);

            itemButton.appendChild(itemImage);
            itemButton.appendChild(itemInfo);

            document.getElementById("items_container").appendChild(itemButton);

            // 새로 생성된 아이템 버튼에 클릭 이벤트 리스너를 추가
            itemButton.addEventListener('click', () => {
                const modalItemImage = document.getElementById("modalItemImage");
                const modalItemPrice = document.getElementById("modalItemPrice");
                const modalItemHearts = document.getElementById("modalItemHearts");
                const modalItemIcon = document.getElementById("modalItemIcon");
                const confirmModal = document.getElementById("confirmModal");
                const confirmButton = document.getElementById("confirmButton");
                const itemTitle = document.getElementById("item_title");
                const confirmationMessage = document.getElementById("confirmationMessage");
                const confirmationMessage1 = document.getElementById("confirmationMessage1");
                const confirmationMessage2 = document.getElementById("confirmationMessage2");
                const characterImg = document.getElementById("characterImg");

                modalItemImage.src = imgSrc;
                modalItemPrice.textContent = price;
                modalItemHearts.textContent = hearts;
                modalItemIcon.src = iconSrc;

                confirmModal.style.display = 'block';

                // 확인 버튼 클릭 시 실행되는 로직
                confirmButton.onclick = () => {
                    if (decreaseUserPoints(price) >= 0) {
                        if (itemTitle.textContent === 'Food Items') {
                            updateStat("damainfoFood", hearts);
                        } else if (itemTitle.textContent === 'Fun Items') {
                            updateStat("damainfoHappniess", hearts);
                        } else if (itemTitle.textContent === 'Medicine Items') {
                            updateStat("damainfoIll", hearts); // change this line to update ill instead of clean
                        }

                        // 서버로 구매 정보를 전송
                        sendPurchaseToServer(altText, price, hearts);

                        // 모달 창을 숨김
                        document.getElementById("item_section").style.display = 'none';
                        confirmModal.style.display = 'none';

                        // 캐릭터 이미지를 웃는 얼굴 이미지로 변경
                        const originalCharacterImgSrc = characterImg.src;
                        const smilingCharacterImgSrc = '<c:url value="/assets/images/dog_white_smail.png" />';
                        characterImg.src = smilingCharacterImgSrc;

                        // 메시지를 표시하고 애니메이션 적용
                        let message;
                        let animationClass;
                        if (itemTitle.textContent === 'Food Items') {
                            message = confirmationMessage;
                            animationClass = 'eat';
                        } else if (itemTitle.textContent === 'Fun Items') {
                            message = confirmationMessage1;
                            animationClass = 'eat';
                        } else if (itemTitle.textContent === 'Medicine Items') {
                            message = confirmationMessage2;
                            animationClass = 'eat';
                        }
                        message.style.display = 'block';

                        characterImg.classList.add(animationClass);

                        // 2초 후 메시지를 숨기고 원래 상태로 복원
                        setTimeout(() => {
                            message.style.display = 'none';
                            characterImg.src = originalCharacterImgSrc;
                            characterImg.classList.remove(animationClass);
                            document.getElementById("item_section").style.display = 'flex';
                        }, 2000);
                    } else {
                        alert("포인트가 부족합니다.");
                    }
                };

            });
        }

        // 스탯을 업데이트하는 함수
        function updateStat(statId, value) {
            let statElement = document.getElementById(statId);
            let newStatValue = Math.min(100, parseInt(statElement.innerText) + value);
            statElement.innerText = newStatValue;
        }

        // 포인트를 차감하는 함수
        function decreaseUserPoints(price) {
            let userPointsElement = document.querySelector('.bar-text-coin');
            let currentPoints = parseInt(userPointsElement.innerText.replace(/,/g, '')); // 쉼표 제거 후 정수로 변환
            if (currentPoints >= price) {
                userPointsElement.innerText = (currentPoints - price).toLocaleString();
                return currentPoints - price;
            } else {
                return -1;
            }
        }

        // 메뉴 버튼 클릭 시 itemSection 모달을 표시
        const buttons = document.querySelectorAll('.menu_btn');
        buttons.forEach(button => {
            button.addEventListener('click', () => {
                const itemSection = document.getElementById("item_section");
                const itemTitle = document.getElementById("item_title");
                const itemsContainer = document.getElementById("items_container");

                const buttonRect = button.getBoundingClientRect();
                itemSection.style.top = `${buttonRect.bottom}px`;
                itemSection.style.display = 'flex';

                setTimeout(() => {
                    itemsContainer.innerHTML = '';
                    if (button.id === 'food') {
                        itemTitle.textContent = 'Food Items';
                        addItemButton('assets/images/food1.png', 'Food 1', 100, 5, 'assets/images/food_icon.png');
                        addItemButton('assets/images/food2.png', 'Food 2', 150, 10, 'assets/images/food_icon.png');
                        addItemButton('assets/images/food3.png', 'Food 3', 200, 15, 'assets/images/food_icon.png');
                        addItemButton('assets/images/food4.png', 'Food 4', 250, 20, 'assets/images/food_icon.png');
                    } else if (button.id === 'fun') {
                        itemTitle.textContent = 'Fun Items';
                        addItemButton('assets/images/fun1.png', 'Fun 1', 100, 5, 'assets/images/heart_small.png');
                        addItemButton('assets/images/fun2.png', 'Fun 2', 150, 10, 'assets/images/heart_small.png');
                        addItemButton('assets/images/fun3.png', 'Fun 3', 200, 15, 'assets/images/heart_small.png');
                        addItemButton('assets/images/fun4.png', 'Fun 4', 250, 20, 'assets/images/heart_small.png');
                    } else if (button.id === 'medicine') {
                        itemTitle.textContent = 'Medicine Items';
                        addItemButton('assets/images/medicine1.png', 'Medicine 1', 100, 5, 'assets/images/medicine3.png');
                        addItemButton('assets/images/medicine2.png', 'Medicine 2', 150, 10, 'assets/images/medicine3.png');
                        addItemButton('assets/images/medicine3.png', 'Medicine 3', 200, 15, 'assets/images/medicine3.png');
                        addItemButton('assets/images/medicine4.png', 'Medicine 4', 250, 30, 'assets/images/medicine3.png');
                    }
                }, 300);
            });
        });

        const cancelButton = document.getElementById("cancelButton");
        cancelButton.addEventListener('click', () => {
            const confirmModal = document.getElementById("confirmModal");
            confirmModal.style.display = 'none';
        });

        const closeModal = document.getElementById("closeModal");
        closeModal.addEventListener('click', () => {
            const confirmModal = document.getElementById("confirmModal");
            confirmModal.style.display = 'none';
        });

        const backIcon = document.getElementById("back_icon");
        backIcon.addEventListener('click', () => {
            const itemSection = document.getElementById("item_section");
            itemSection.style.display = 'none';
        });

        const hamberIcon = document.getElementById('hamber_icon');
        const barContainer = document.getElementById('barContainer');

        hamberIcon.addEventListener('click', () => {
            barContainer.style.display = barContainer.style.display === 'none' ? 'block' : 'none';
        });

        const cameraIcon = document.getElementById('camera_icon');
        cameraIcon.addEventListener('click', () => {
            window.location.href = '<c:url value="/recycling" />';
        });
        
        const broomIcon = document.getElementById('broom_icon');
        broomIcon.addEventListener('click', () => {
            const cleanElement = document.getElementById('damainfoClean');
            let newCleanValue = Math.min(100, parseInt(cleanElement.innerText) + 5);
            cleanElement.innerText = newCleanValue;
            sendStatsToServer(null, null, null, newCleanValue, null);
        });

        //fetch
        function fetchStats() {
            const xhr = new XMLHttpRequest();
            xhr.open("GET", "<c:url value='/game/fetchData.jsp' />", true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        const data = JSON.parse(xhr.responseText);
                        document.getElementById('damainfoHp').innerText = data.damainfoHp;
                        document.getElementById('damainfoFood').innerText = data.damainfoFood;
                        document.getElementById('damainfoHappniess').innerText = data.damainfoHappniess;
                        document.getElementById('damainfoClean').innerText = data.damainfoClean;
                        document.getElementById('damainfoIll').innerText = data.damainfoIll;
                    } else {
                        console.error('Error fetching stats:', xhr.statusText);
                    }
                }
            };
            xhr.send();
        }

        // 페이지가 로드될 때 fetchStats 함수 호출 및 5초마다 호출
        document.addEventListener('DOMContentLoaded', () => {
            fetchStats();
            setInterval(fetchStats, 5000); // 5초마다 데이터 갱신
        });

        // End Icon 클릭 시 home.jsp로 이동
        const endIcon = document.getElementById('end_icon');
        endIcon.addEventListener('click', () => {
            alert('홈화면으로 이동합니다');
            window.location.href = '<c:url value="/" />';
        });
        
        
        
        
        //리셋 버튼 
        // bar_reset 클릭 이벤트
        var userId = "${sessionScope.login.userId}".trim();
        const barReset = document.getElementById('bar_reset');
        barReset.addEventListener('click', () => {
            if (confirm('정말로 다마고치를 초기화하시겠습니까?')) {
                fetch('<c:url value="/resetTamagotchi" />', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ userId: userId })
                })
                .then(response => response.text())
                .then(data => {
                    console.log('Response:', data); // 디버깅 메시지 추가
                    if (data === 'Success') {
                        alert(' ${sessionScope.login.userId} has been reset.');
                        window.location.href = '<c:url value="/" />';
                    } else {
                        alert('Failed to reset Tamagotchi.');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('An error occurred while resetting Tamagotchi.');
                });
            }
        });

        // Other existing scripts
    </script>
</body>
</html>