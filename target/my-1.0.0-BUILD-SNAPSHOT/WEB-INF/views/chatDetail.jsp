<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>chat</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="assets/css/chat.css">
    
</head>
<body>
     <div id="container">
         <aside>
             <header>
              	
                <input type="text" placeholder="search">
             </header>
             <ul>
             <c:forEach items="${roomList}" var="room">
   <li onclick="window.location.href='<c:url value="/chatDetail?roomNo=${room.roomNo}&buyerId=${room.buyerId}" />'">
    	<c:if test="${sessionScope.login.userProfile == room.sellerProfile}">
                <img class="profile-img" src="${pageContext.request.contextPath}${room.buyerProfile}" alt="">
            </c:if>
            <!-- userNick와 sellerNick가 다른 경우 -->
            <c:if test="${sessionScope.login.userProfile != room.sellerProfile}">
                <img class="profile-img" src="${pageContext.request.contextPath}${room.sellerProfile}" alt="">
            </c:if>
            
        <div>
            <!-- userNick와 sellerNick가 같은 경우 -->
            <c:if test="${sessionScope.login.userNick == room.sellerNick}">
                <h2>${room.buyerNick}</h2>
            </c:if>
            <!-- userNick와 sellerNick가 다른 경우 -->
            <c:if test="${sessionScope.login.userNick != room.sellerNick}">
                <h2>${room.sellerNick}</h2>
            </c:if>
            <h3>판매물건: ${room.salesName }</h3>
        </div>
    </li>
</c:forEach>
       
            </ul>
        </aside>
        <main>
            <header>
            <c:set var="room" value="${roomList[0]}" />
            <c:if test="${sessionScope.login.userProfile == room.sellerProfile}">
                <img class="profile-img" src="${pageContext.request.contextPath}${room.buyerProfile}" alt="">
            </c:if>
            <c:set var="room" value="${roomList[0]}" />
            <c:if test="${sessionScope.login.userProfile != room.sellerProfile}">
                <img class="profile-img" src="${pageContext.request.contextPath}${room	.sellerProfile}" alt="">
            </c:if>	
           
                <div>
                	<c:set var="room" value="${roomList[0]}" />
                    <c:if test="${sessionScope.login.userNick == room.sellerNick}">
                <h2>${room.buyerNick}</h2>
            </c:if>
            <c:set var="room" value="${roomList[0]}" />
            <c:if test="${sessionScope.login.userNick != room.sellerNick}">
                <h2>${room.sellerNick}</h2>
            </c:if>
            
<!--                     <h3>already 1902 messages</h3> -->
                </div>
                <img src="resources/assets/img/back.png" alt="Back" onclick="history.back()" style="cursor: pointer; float: right;">
<!--                 <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_star.png" alt=""> -->
            </header>
            <ul id="chat">
                <c:forEach items="${chat}" var="message">
                	<input type="hidden" value="${message.roomNo} ">
                    <c:choose>
                        <c:when test="${sessionScope.login.userId == message.userId}">
                            <li class="me">
                                <div class="entete">
                                    <span class="status blue"></span>
                                    <h2>${sessionScope.login.userNick }</h2>
                                    <h3>${message.sendTime}</h3>
                                </div>
                                <div class="triangle"></div>
                                <div class="message">
                                    ${message.messageContent}
                                </div>
                            </li>
                        </c:when>
                       <c:otherwise>
    <li class="you">
        <div class="entete">
            <span class="status green"></span>
            <c:choose>
                <c:when test="${sessionScope.login.userNick == message.sellerNick}">
                    <h2>${message.buyerNick}</h2>
                </c:when>
                <c:otherwise>
                    <h2>${message.sellerNick}</h2>
                </c:otherwise>
            </c:choose>
            <h3>${message.sendTime}</h3>
        </div>
        <div class="triangle"></div>
        <div class="message">
            ${message.messageContent}
        </div>
    </li>
</c:otherwise>

                    </c:choose>
                </c:forEach>
            </ul>
            <footer>
    <textarea id="messageInput" placeholder="메세지를 입력하세요."></textarea>
    <button id="sendButton">전송</button>
</footer>

        </main>
    </div>
    

</body>
<script src="${pageContext.request.contextPath }/js/sockjs.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script>

var userId = "${sessionScope.login.userId}";
var userNick = '${sessionScope.login.userNick}'; // 로그인한 사용자의 닉네임


$(function() {
    var socket = new SockJS('${pageContext.request.contextPath }/endpoint');
    var stompClient = Stomp.over(socket);
    

    stompClient.connect({}, function(frame) {
        console.log('Connected: ' + frame);
        stompClient.subscribe('/subscribe/chat/{roomNo}', function(message) {
            var chatMessage = JSON.parse(message.body);
            showMessage(chatMessage);
        });
    });

    function showMessage(message) {
    	<c:set var="message" value="${chat[0]}" />
    		var buyerNick = "${message.buyerNick}";
    		<c:set var="message" value="${chat[0]}" />
    		var sellerNick = "${message.sellerNick}";
    		
        var isCurrentUser = message.userId === userId; // 현재 사용자가 메시지를 보낸 경우
        var userNick = '${sessionScope.login.userNick}';
        var chatBubble = '<li class="' + (isCurrentUser ? 'me' : 'you') + '">' +
            '<div class="entete">' +
            '<span class="status ' + (isCurrentUser ? 'blue' : 'green') + '"></span>' +
            '<h2>' + (isCurrentUser ? '${sessionScope.login.userNick}' : (userNick === buyerNick ? sellerNick : buyerNick)) + '</h2>'+


            '<h3>' + message.sendTime + '</h3>' +
            '</div>' +
            '<div class="triangle"></div>' +
            '<div class="message">' + message.messageContent + '</div>' +
            '</li>';
        $('#chat').append(chatBubble);
    }



	    function sendMessage(roomNo, buyerId) {
	    	<c:forEach items="${roomList}" var="room">
	    	var roomNo = "<c:out value='${room.roomNo}'/>";
	    	var buyerId = "<c:out value='${room.buyerId}'/>";
	    	</c:forEach>
	        var messageContent = $('#messageInput').val().trim();
	        if (messageContent !== '') {
	            var message = {
	                buyerId: buyerId,
	                roomNo: roomNo,
	                userId: userId,
	                messageContent: messageContent,
	                sender: 'me', // 변경이 필요한 경우 유저 식별자로 대체
	                receiver: 'you', // 변경이 필요한 경우 유저 식별자로 대체
	                sendTime: new Date().toLocaleTimeString() // 변경이 필요한 경우 서버 시간으로 대체
	            };
	            stompClient.send("/app/hello/" + roomNo, {}, JSON.stringify(message));
	            $('#messageInput').val('');
	        }
	    }


    $('#sendButton').click(function() {
        sendMessage();
    });

    $('#messageInput').keydown(function(event) {
        if (event.key === 'Enter' && !event.shiftKey) {
            event.preventDefault();
            sendMessage();
        }
    });
});



</script>
</html>
