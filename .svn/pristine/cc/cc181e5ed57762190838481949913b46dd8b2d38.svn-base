<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>chat</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
* {
	box-sizing: border-box;
}

body {
	background-color: #F6F6F6;
	font-family: Arial;
}

#container {
	width: 750px;
	height: 800px;
	background: #eff3f7;
	margin: 0 auto;
	font-size: 0;
	border-radius: 5px;
	overflow: hidden;
}

aside {
	width: 260px;
	height: 800px;
	background-color: #3b3e49;
	display: inline-block;
	font-size: 15px;
	vertical-align: top;
}

main {
	width: 490px;
	height: 800px;
	display: inline-block;
	font-size: 15px;
	vertical-align: top;
}

aside header {
	padding: 30px 20px;
}

aside input {
	width: 100%;
	height: 50px;
	line-height: 50px;
	padding: 0 50px 0 20px;
	background-color: #5e616a;
	border: none;
	border-radius: 3px;
	color: #fff;
	background-image:
		url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_search.png);
	background-repeat: no-repeat;
	background-position: 170px;
	background-size: 40px;
}

aside input::placeholder {
	color: #fff;
}

aside ul {
	padding-left: 0;
	margin: 0;
	list-style-type: none;
	overflow-y: scroll;
	height: 690px;
}

aside li {
	padding: 10px 0;
}

aside li:hover {
	background-color: #5e616a;
}

h2, h3 {
	margin: 0;
}

aside li img {
	border-radius: 50%;
	margin-left: 20px;
	margin-right: 8px;
}

aside li div {
	display: inline-block;
	vertical-align: top;
	margin-top: 12px;
}

aside li h2 {
	font-size: 14px;
	color: #fff;
	font-weight: normal;
	margin-bottom: 5px;
}

aside li h3 {
	font-size: 12px;
	color: #7e818a;
	font-weight: normal;
}

.status {
	width: 8px;
	height: 8px;
	border-radius: 50%;
	display: inline-block;
	margin-right: 7px;
}

.green {
	background-color: #58b666;
}

.orange {
	background-color: #ff725d;
}

.blue {
	background-color: #6fbced;
	margin-right: 0;
	margin-left: 7px;
}

main header {
	height: 110px;
	padding: 30px 20px 30px 40px;
}

main header>* {
	display: inline-block;
	vertical-align: top;
}

main header img:first-child {
	border-radius: 50%;
}

main header img:last-child {
	width: 24px;
	margin-top: 8px;
}

main header div {
	margin-left: 10px;
	margin-right: 145px;
}

main header h2 {
	font-size: 16px;
	margin-bottom: 5px;
}

main header h3 {
	font-size: 14px;
	font-weight: normal;
	color: #7e818a;
}

#chat {
	padding-left: 0;
	margin: 0;
	list-style-type: none;
	overflow-y: scroll;
	height: 535px;
	border-top: 2px solid #fff;
	border-bottom: 2px solid #fff;
}

#chat li {
	padding: 10px 30px;
}

#chat h2, #chat h3 {
	display: inline-block;
	font-size: 13px;
	font-weight: normal;
}

#chat h3 {
	color: #bbb;
}

#chat .entete {
	margin-bottom: 5px;
}

#chat .message {
	padding: 20px;
	color: #fff;
	line-height: 25px;
	max-width: 90%;
	display: inline-block;
	text-align: left;
	border-radius: 5px;
}

#chat .me {
	text-align: right;
}

#chat .you .message {
	background-color: #47C83E;
}

#chat .me .message {
	background-color: #6799FF;
}

#chat .triangle {
	width: 0;
	height: 0;
	border-style: solid;
	border-width: 0 10px 10px 10px;
}

#chat .you .triangle {
	border-color: transparent transparent #58b666 transparent;
	margin-left: 15px;
}

#chat .me .triangle {
	border-color: transparent transparent #6fbced transparent;
	margin-left: 375px;
}

main footer {
	height: 155px;
	padding: 20px 30px 10px 20px;
}

main footer textarea {
	resize: none;
	border: none;
	display: block;
	width: 100%;
	height: 80px;
	border-radius: 3px;
	padding: 20px;
	font-size: 13px;
	margin-bottom: 13px;
}

main footer textarea::placeholder {
	color: #ddd;
}

main footer img {
	height: 30px;
	cursor: pointer;
}

main footer a {
	text-decoration: none;
	text-transform: uppercase;
	font-weight: bold;
	color: #6fbced;
	vertical-align: top;
	margin-left: 333px;
	margin-top: 5px;
	display: inline-block;
}

.profile-img {
	width: 50px; /* 원하는 크기로 조절 */
	height: 50px; /* 원하는 크기로 조절 */
	object-fit: cover; /* 이미지의 비율을 유지하면서 크기에 맞게 자름 */
}

#sendButton {
    background-color: #4CAF50; /* Green background */
    border: none; /* Remove borders */
    color: white; /* White text */
    padding: 10px 15px; /* Some padding */
    text-align: center; /* Centered text */
    text-decoration: none; /* Remove underline */
    display: inline-block; /* Make the button inline-block */
    font-size: 16px; /* Increase font size */
    margin: 4px 2px; /* Add some margin */
    cursor: pointer; /* Pointer/hand icon on hover */
    border-radius: 12px; /* Rounded corners */
    white-space: nowrap; /* Prevent text from wrapping */
    writing-mode: horizontal-tb; /* Ensure horizontal text display */
}

footer {
    display: flex;
    flex-direction: column; /* Stack items vertically */
    align-items: flex-end; /* Align items to the right */
    padding: 10px;
}





</style>
<script src="${pageContext.request.contextPath }/js/sockjs.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>
	var socket = null; 
	var stompClient= null;
	var roomNo;
	var buyerId;
	var loginId = "${sessionScope.login.userId}";
	var userNick = '${sessionScope.login.userNick}';
	var sellerNick;
	var buyerNick;
	
	$(document).ready(function(){
		var chatUrl = '<c:url value="/chatDetail" />';  
		$(".roomInfo").click(function(){
			disconnect();
			roomNo = $(this).attr("data-id");
			buyerId = $(this).attr("data-buyerId");
				$.ajax({
					url : chatUrl,
					type : 'post',
					data : {
						 roomNo : roomNo
						,buyerId : buyerId
					},
					success : function(res) { // controllor에서 list를 return 받았음
						if(res.length > 0){
							
							sellerNick = res[0].sellerNick;
							buyerNick =  res[0].buyerNick;
						} else{
							sellerNick = sellerNick;
							buyerNick = buyerNick;
						}
						fn_messageView(res);
						fn_scrollDown();
						init(roomNo);
					},
					error : function(e) {
						console.log(e);
					}
				});
		});
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
	//qkd
	function init(no){
		
	    socket = new SockJS('${pageContext.request.contextPath }/endpoint');
	    stompClient = Stomp.over(socket);

	    stompClient.connect({}, function(frame) {
	        console.log('Connected: ' + frame);
	        stompClient.subscribe('/subscribe/chat/'+ no, function(message) {
	            var chatMessage = JSON.parse(message.body);
	            showMessage(chatMessage);
	        });
	     });
	   }
	
	   function showMessage(message) {
	    		
	        var isCurrentUser = message.userId === loginId; // 현재 사용자가 메시지를 보낸 경우
	        var chatBubble = '<li class="' + (isCurrentUser ? 'me' : 'you') + '">' +
	            '<div class="entete">' +
	            '<span class="status ' + (isCurrentUser ? 'blue' : 'green') + '"></span>' +
	            '<h2>' + (isCurrentUser ? '${sessionScope.login.userNick}' : ('${sessionScope.login.userNick}' === buyerNick ?sellerNick : buyerNick)) + '</h2>'+
	            '<h3>' + message.sendTime + '</h3>' +
	            '</div>' +
	            '<div class="triangle"></div>' +
	            '<div class="message">' + message.messageContent + '</div>' +
	            '</li>';
	        $('#chat').append(chatBubble);
	        
	        fn_scrollDown();
	   }
	   
	   
	  function sendMessage() {
	        var messageContent = $('#messageInput').val().trim();
	        if (messageContent !== '') {
	            var message = {
	                buyerId: buyerId,
	                roomNo: roomNo,
// 	                buyerNick: userNick,
// 	                sellerNick: sellerNick,
	                userId: loginId,
	                messageContent: messageContent,
	                sender: 'me', // 변경이 필요한 경우 유저 식별자로 대체
	                receiver: 'you', // 변경이 필요한 경우 유저 식별자로 대체
	                sendTime: new Date().toLocaleTimeString() // 변경이 필요한 경우 서버 시간으로 대체
	            };
	            stompClient.send("/app/hello/" + roomNo, {}, JSON.stringify(message));
	            $('#messageInput').val('');
	        }
	    }

	  
	  
	function fn_messageView(data){
		var str = "";
		$(data).each(function(i, v){
			if(v.userId == loginId){
				str+='<li class="me">';
				str+='	<div class="entete">';
				str+='		<span class="status blue"></span>';
				str+='		<h2>${sessionScope.login.userNick }</h2>';
				str+='		<h3>'+v.sendTime+'</h3>';
				str+='	</div>';
				str+='	<div class="triangle"></div>';
				str+='	<div class="message">'+v.messageContent+'</div>';
				str+='</li>';
			}else{
				str+='<li class="you">';
				str+='	<div class="entete">';
				str+='		<span class="status green"></span>';
				str+='				<h2>'+v.buyerNick+'</h2>';
				str+='				<h2>'+v.sellerNick+'</h2>';
				str+='		<h3>'+v.sendTime+'</h3>';
				str+='	</div>';
				str+='	<div class="triangle"></div>';
				str+='	<div class="message">'+v.messageContent+'</div>';
				str+='</li>';
			}
		});
		$("#chat").html(str);
		
	}
	function fn_scrollDown(){
		$('#chat').scrollTop($('#chat')[0].scrollHeight);
	}

    function disconnect() {
        if (stompClient !== null) {
            stompClient.disconnect(function() {
                console.log("Disconnected");
            });
        }
        socket = null;
        stompClient = null;
        $('#chat').empty(); // Optional: Clear chat messages
    }
    
    
</script>
</head>
<body>
	<div id="container">
		<aside>
			<header>
				<input type="text" placeholder="search">
			</header>
			<ul>
				<c:forEach items="${roomList}" var="room">
					<li data-id="${room.roomNo}" data-buyerId="${room.buyerId }" class="roomInfo">
						<c:if test="${sessionScope.login.userProfile == room.sellerProfile}">
							<img class="profile-img" src="${pageContext.request.contextPath}${room.buyerProfile}"alt="">
						</c:if> <!-- userNick와 sellerNick가 다른 경우 --> 
							<c:if	test="${sessionScope.login.userProfile != room.sellerProfile}">
							<img class="profile-img" src="${pageContext.request.contextPath}${room.sellerProfile}"	alt="">
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
		<main id="chatView">
			<header>
			
			
			</header>
			<ul id="chat">
				
			</ul>
			<footer>
				<textarea id="messageInput" placeholder="메세지를 입력하세요."></textarea>
				
				<button id="sendButton">전송</button>
			</footer>
		</main>
	</div>
</body>
</html>
