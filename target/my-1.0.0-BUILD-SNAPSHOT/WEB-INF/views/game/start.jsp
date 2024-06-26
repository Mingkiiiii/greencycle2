<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/style_game.css' />">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Start Tamagotchi Game</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #000;
        }
        .container {
            position: relative;
            text-align: center;
        }
        .container img {
            width: 100%;
            height: auto;
        }
        .start-button {
            position: absolute;
            top: 0px;
            left: 50%;
            transform: translateX(-50%);
            padding: 10px 20px;
            font-size: 24px;
            cursor: pointer;
            background: none;
            border: none;
        }
        .start-button img {
            width: 300px; /* 원하는 크기로 조정 */
            height: auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="<c:url value='/assets/images/start.gif' />" alt="Green Cycle Start Image" style="width:360px !important; height:640px !important;">
        <c:choose>
            <c:when test="${empty damainfo}">
                <button class="start-button" onclick="startGame()">
                    <img src="<c:url value='/assets/images/start_btn.png' />" alt="Start Button" style="margin-top: 130% !important;">
                </button>
            </c:when>
            <c:otherwise>
                <button class="start-button" onclick="window.location.href='<c:url value='/gameMain' />'">
                    <img src="<c:url value='/assets/images/start_btn.png' />" alt="Start Button" style="margin-top: 130% !important;">
                </button>
            </c:otherwise>
        </c:choose>
    </div>
    <script>
        function startGame() {
            // userId 값을 가져와서 URL에 포함
            var userId = "${sessionScope.userId}".trim(); // 공백 제거
            var url = '<c:url value="/select" />' + '?userId=' + userId;
            window.location.href = url;
        }
    </script>
    
</body>
</html>