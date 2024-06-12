<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Game Main</title>
<link rel="stylesheet" href="<c:url value='/assets/css/style_game.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/style_game.css' />">
<link rel="stylesheet" href="<c:url value='/assets/css/desktop_game.css' />" media="screen and (min-width: 769px)">
<link rel="stylesheet" href="<c:url value='/assets/css/mobile_game.css' />" media="screen and (max-width: 768px)">
<style>
.back_ground_cont::before {
   content: "";
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   background: url('<c:url value="/assets/images/recycling_back2.png" />') no-repeat center center fixed;
   background-size: 360px 640px;
   z-index: -1; /* 배경 이미지가 컨텐츠 뒤에 표시되도록 z-index 설정 */
}

#selectedImageContainer {
   text-align: center;
   margin-top: 20px;
   display: none; /* 이미지 컨테이너 초기 상태 숨김 */
}



#backButtonContainer {
   text-align: center;
   margin-top: 20px;
   display: none; /* 초기 상태 숨김 */
   position: relative;
   width: 300px;
   margin: 0 auto;
}

#backButton {
   width: 100%;
   cursor: pointer;
   transform: translateY(-30%);
   position: relative;
   z-index: 30;
   transition: transform 0.1s ease, box-shadow 0.1s ease;
}

#backButton:active {
   transform: translateY(-30%) scale(0.95);
   box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}

#backButtonText {
   position: absolute;
   top: 18%;
   left: 50%;
   transform: translate(-50%, -50%);
   color: white;
   font-size: 16px;
   font-weight: bold;
   z-index: 31;
   pointer-events: none; /* 텍스트 클릭이 버튼 클릭을 방해하지 않도록 설정 */
}

#resultImageContainer {
   text-align: center;
   margin-top: 20px;
   display: none;
   position: relative;
   overflow: hidden;
   transform: translateY(-53px);
}

@keyframes slideDown {
   0% {
      transform: translateY(-100%);
   }
   100% {
      transform: translateY(0);
   }
}





@keyframes typing {
   0% {
      width: 0;
      opacity: 1;
   }
   100% {
      width: 100%;
      opacity: 1;
   }
}

.typing {
   animation: typing 4s steps(30, end) forwards;
   white-space: nowrap;
   overflow: hidden;
   border-right: 3px solid black; /* Optional: to simulate the cursor */
}
</style>
</head>
<body class="back_ground_cont">

    <div class="container">
        <div id="selectedImageContainer">
            <img id="selectedImage" src="#" alt="Selected Image">

            <div id="backButtonContainer">
                <img id="backButton" src="<c:url value='assets/images/btn_back.png' />" alt="Back Button">
                <div id="backButtonText">포인트로 전환</div>
            </div>
            <div id="resultImageContainer">
                <img id="resultImage" src="<c:url value='assets/images/text_section.png' />" alt="Result Image">
                <div id="resultText" class="resultText"></div>
            </div>
        </div>

        <label for="cam_input" class="cam-input"> <img id="cam_btn" src="assets/images/cam_btn.png" alt="Cam Btn" class="cam-btn">
        </label>
        <input type="file" id="cam_input" accept="image/*" capture="camera">

        <label for="album_input" class="album-input"> <img id="album_icon" src="assets/images/album_icon.png" alt="Album Icon">
        </label>
        <input type="file" id="album_input" accept="image/*">
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script>
        document.getElementById('cam_btn').addEventListener('click', function() {
            document.getElementById('album_input').value = ''; // 다른 입력 초기화
        });

        document.getElementById('album_icon').addEventListener('click', function() {
            document.getElementById('cam_input').value = ''; // 다른 입력 초기화
        });

        document.getElementById('cam_input').addEventListener('change', function() {
            readURL(this);
        });

        document.getElementById('album_input').addEventListener('change', function() {
            readURL(this);
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('selectedImage').src = e.target.result;
                    document.getElementById('selectedImageContainer').style.display = 'block'; // 이미지 컨테이너 표시
                    document.getElementById('backButtonContainer').style.display = 'block'; // 버튼 컨테이너 표시
                }
                reader.readAsDataURL(input.files[0]);
            }
        }


        document.getElementById('backButton').addEventListener('click', function() {
            var formData = new FormData();
            var fileInput = document.getElementById('cam_input').files[0] || document.getElementById('album_input').files[0];
            if (fileInput) {
                formData.append('file', fileInput);
                $.ajax({
                    url: 'http://192.168.0.34:5001/predict', // Flask 서버의 IP 주소와 포트를 명시
                    type: 'POST',
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function(response) {
                        var predictionResult = response.prediction;
                        var resultText = '';
                        var points = 50; // 포인트 값 설정

                        switch (predictionResult) {
                            case "유리병":
                                resultText = "해당 제품은 유리병입니다. \n포인트로 전환 후 게임화면으로 돌아갑니다. \n +50pt";
                                break;
                            case "건전지":
                                resultText = "해당 제품은 건전지입니다. \n포인트로 전환 후 게임화면으로 돌아갑니다.\n +50pt";
                                break;
                            case "금속캔":
                                resultText = "해당 제품은 금속캔입니다. \n포인트로 전환 후 게임화면으로 돌아갑니다.\n +50pt";
                                break;
                            case "형광등":
                                resultText = "해당 제품은 형광등입니다. \n포인트로 전환 후 게임화면으로 돌아갑니다.\n +50pt";
                                break;
                            case "종이":
                                resultText = "해당 제품은 종이입니다. \n포인트로 전환 후 게임화면으로 돌아갑니다.\n +50pt";
                                break;
                            case "페트병":
                                resultText = "해당 제품은 페트병입니다. \n포인트로 전환 후 게임화면으로 돌아갑니다. \n +50pt";
                                break;
                            case "플라스틱":
                                resultText = "해당 제품은 플라스틱입니다. \n포인트로 전환 후 게임화면으로 돌아갑니다.\n +50pt";
                                break;
                            case "비닐":
                                resultText = "해당 제품은 비닐입니다. \n포인트로 전환 후 게임화면으로 돌아갑니다.\n +50pt";
                                break;
                            case "스티로폼":
                                resultText = "해당 제품은 스티로폼입니다. \n포인트로 전환 후 게임화면으로 돌아갑니다.\n +50pt";
                                break;
                            default:
                                resultText = "알 수 없음";
                                points = 0; // 알 수 없는 경우 포인트 증가 없음
                        }

                        document.getElementById('resultText').innerText = resultText;
                        document.getElementById('resultImageContainer').style.display = 'block'; // 결과 이미지 컨테이너 표시
                        document.getElementById('backButtonContainer').style.display = 'none'; // 백 버튼 컨테이너 숨김

                        setTimeout(function() {
                            document.getElementById('resultText').classList.add('typing');
                        }, 2000); // text_section.png 애니메이션이 끝난 후 실행

                        // 포인트 증가 요청
                        $.ajax({
                            url: '/my/increaseUserPoint', // 포인트 증가 요청을 처리하는 서버 엔드포인트
                            type: 'POST',
                            data: JSON.stringify({ points: points }),
                            contentType: 'application/json',
                            success: function(response) {
                                console.log('전송한 포인트:', points);
                                console.log('응답 메시지:', response);
                                
                            },
                            error: function(xhr, status, error) {
                                console.error('포인트 증가 중 오류 발생:', error);
                                console.error('상태 코드:', status);
                                console.error('응답 텍스트:', xhr.responseText);
                                
                            }
                        });

                        // 5초 후 /gameMain 화면으로 이동
                        setTimeout(function() {
                            window.location.href = '/my/select';
                        }, 9000); // 텍스트 타이핑 애니메이션(4초) + 5초 = 9초 후 이동

                        // 클릭 이벤트 비활성화
                        document.querySelector('body').style.pointerEvents = 'none';
                    },
                    error: function(xhr, status, error) {
                        console.error("Error:", error);
                        alert('이미지 예측 중 오류 발생: ' + error);
                    }
                });
            } else {
                alert('이미지를 먼저 업로드하세요.');
            }
        });
        </script>
</body>
</html>