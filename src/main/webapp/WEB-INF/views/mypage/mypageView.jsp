<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

<title>Green Cycle</title>
<script src="assets/js/jquery-2.1.0.min.js"></script>
<script src="assets/js/accordions.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/custom.js"></script>
<script src="assets/js/datepicker.js"></script>
<script src="assets/js/imgfix.min.js"></script>
<script src="assets/js/isotope.js"></script>
<script src="assets/js/jquery.counterup.min.js"></script>
<script src="assets/js/lightbox.js"></script>
<script src="assets/js/owl-carousel.js"></script>
<script src="assets/js/popper.js"></script>
<script src="assets/js/quantity.js"></script>
<script src="assets/js/scrollreveal.min.js"></script>
<script src="assets/js/slick.js"></script>
<script src="assets/js/waypoints.min.js"></script>

<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

<link rel="stylesheet" href="assets/css/templatemo-hexashop.css">


<style>
body {
    margin-top: 5% !important;
}

.heading {
    text-align: center;
    margin: 40px 0;
}

.form-control {
    width: 100% !important;
    padding: 10px;
    text-align: left;
}

.search-window form {
    display: flex;
    justify-content: center;
    width: 100%;
}

.table-responsive {
    margin-bottom: 40px;
}

.btn-dark, .btn-success {
    margin: 5px;
}

@media (max-width: 768px) {
    .search-window form {
        flex-direction: column;
    }
    .search-window input {
        margin-bottom: 10px;
    }
    body {
        margin-top: 10% !important;
    }
    .form-control {
        padding: .375rem .75rem !important;
    }
    footer {
        display: none !important;
    }
    #indexing {
        width: 100%;
        margin: auto !important;
    }
}

#footer {
    width: 100% !important;
}

#pagin_btn {
    margin: auto !important;
    width: 100%;
}

#indexing {
    width: 80%;
    margin: auto !important;
}

body {
    font-family: 'Arial', sans-serif;
    background: #f0f0f0;
    margin: 0;
    padding: 20px;
}

.menu {
    width: 100%;
    background: white;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
}

.menu h2 {
    font-size: 24px;
    color: black;
    margin-bottom: 20px;
    border-bottom: 1px solid #ccc;
    padding-bottom: 10px;
}

.accordion {
    background-color: #FFFFFF;
    color: black;
    cursor: pointer;
    padding: 10px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: background-color 0.3s ease;
}

.accordion:hover, .accordion.active {
    background-color: #ffffff;
}

.panel {
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
    list-style: none;
}

.panel li a {
    display: block;
    padding: 10px;
    text-decoration: none;
    color: black;
    border-bottom: 1px solid #ccc;
}

.panel li:last-child a {
    border-bottom: none;
}

.divider-custom-icon {
    text-align: center;
}

.profile-header {
    margin: auto;
    width: 100%;
}

#myImage {
    display: inline-block;
    margin: 0 auto;
}

   .profile-container {
        text-align: center;
        margin-top: 20px;
    }
    .profile-container img.profile-picture {
        border-radius: 50%;
        width: 150px;
        height: 150px;
    }
    .profile-container h1 {
        font-size: 24px;
        color: blue;
        margin-top: 10px;
    }
    .points-container {
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 20px;
        margin-top: 10px;
    }
    .points-container img {
        width: 70px;
        height: 50px;
        margin-left: -10px;
    }
</style>
</head>


<body id="page-top">
    <jsp:include page="/WEB-INF/inc/top.jsp" />
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-8">
                <section class="profile-section bg-white shadow rounded p-4" style="transform: translateY(0%) translateX(13%);">
                    <div class="profile-header mb-3">
                        <h4 class="profile-title font-weight-bold text-primary" style="text-align: center; font-size: 30px">정보 수정</h4>
                        <br>
                        <div class="divider-custom-icon">
                            <c:if test="${sessionScope.login.userProfile == null}">
                                <img src="<c:url value='/assets/images/non.png'/>" id="userProfile" class="rounded-circle img-thumbnail shadow-sm" width="200px" style="cursor: pointer;" onerror='this.src="assets/images/default_image.png"'>
                            </c:if>
                            <c:if test="${sessionScope.login.userProfile != null}">
                                <img src="<c:url value='${sessionScope.login.userProfile}'/>" id="userProfile" class="rounded-circle img-thumbnail shadow-sm" width="200px" style="cursor: pointer;"onerror='this.src="assets/images/default_user.png"'>
                            </c:if>
                            <form id="profileForm" enctype="multipart/form-data">
                                <input type="file" name="uploadImage" id="uploadImage" accept="image/*" style="display: none;">
                            </form>
                            <input type="hidden" name="userProfile" id="userProfile" value="">
                            <input type="file" name="user_image_file" id="user_image_file" onChange="userImageUpload();" style="display: none;">
                        </div>
                        <div class="points-container">
                        <span>나의 포인트: ${sessionScope.login.userPoint} 포인트</span>
                        <img src="<c:url value='/assets/images/coin.png' />" alt="Price">
                    </div>
                        
                    </div>
                    <form method="post" action="<c:url value='updateDo'/>" onsubmit="return validateForm()">
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" id="userId" name="userId" class="form-control" value="${sessionScope.login.userId}" readonly>
                        </div>
                        <div class="form-group">
                            <label>나의 주소 *</label>
                            <input type="address" class="form-control" value="${sessionScope.login.userAddr}${sessionScope.login.userSubaddr} ${sessionScope.login.userDetailaddr}" readonly>
                        </div>
                        <div class="form-group">
                            <label>이름 *</label>
                            <input type="text" name="userName" id="userName" class="form-control" value="${sessionScope.login.userName}" readonly>
                        </div>
                        <div class="form-group">
                            <label>전화번호 *</label>
                            <input type="text" class="form-control" value="${sessionScope.login.userPhone}">
                        </div>
                        <div class="form-group">
                            <label>닉네임 *</label>
                            <input type="text" name="userNick" id="userNick" class="form-control" value="${sessionScope.login.userNick}">
                        </div>
                        <button type="submit" class="btn btn-success">수정</button>
                    </form>
                </section>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/inc/footer.jsp" />
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script>
        function validateForm() {
            var userName = document.getElementById('userName').value.toLowerCase();
            var userNick = document.getElementById('userNick').value.toLowerCase();
            var forbiddenWords = ['관리자', '어드민', 'admin', '운영자', '운영진', '👨‍'];
            for (var word of forbiddenWords) {
                if (userName.includes(word) || userNick.includes(word)) {
                    alert(`이름과 닉네임에 사용할 수 없는 단어가 포함되어 있습니다: ${word}`);
                    return false;
                }
            }
            return true;
        }

        document.querySelectorAll('.accordion').forEach(button => {
            button.addEventListener('click', () => {
                const panel = button.nextElementSibling;
                button.classList.toggle('active');
                if (panel.style.maxHeight) {
                    panel.style.maxHeight = null;
                } else {
                    panel.style.maxHeight = panel.scrollHeight + "px";
                }
            });
        });

        $(document).ready(function(){
            $("#userProfile").click(function(){
                $("#uploadImage").click();
            });
            $("#uploadImage").on("change", function(){
                let file = $(this)[0].files[0];
                if(file){
                    let fileType = file['type'];
                    let valTypes = ['image/gif', 'image/jpeg', 'image/png', 'image/jpg'];
                    if(!valTypes.includes(fileType)){
                        alert("유효한 이미지 타입이 아닙니다!!");
                        $(this).val('') //파일 초기화
                    } else {
                        let formData = new FormData($('#profileForm')[0]);
                        console.log(formData);
                        $.ajax({
                            url : "<c:url value='/files/upload' />",
                            type : "POST",
                            data: formData,
                            dataType: 'json',
                            processData: false,
                            contentType: false,
                            success: function(res){
                                console.log(res);
                                if(res.message == 'success'){
                                    $("#userProfile").attr('src', '${pageContext.request.contextPath}' + res.imgPath);   
                                }
                            },
                            error: function(e){
                                console.log(e);
                            }
                        });
                    }
                }
            });
        });
    </script>
</body>
</html>