<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>ID and Password Recovery</title>
<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Poppins', sans-serif;
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    background: #f0f2f5;
}

.container {
    display: flex;
    flex-direction: row;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

.img-container {
    flex: 1;
    background: url('https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/bg.svg') no-repeat center center/cover;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
}

.form-container {
    flex: 1;
    padding: 50px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.form-container h2 {
    margin-bottom: 20px;
    color: #333;
    font-size: 2.5rem;
}

.input-div {
    position: relative;
    display: flex;
    align-items: center;
    margin-bottom: 25px;
    border-bottom: 2px solid #d9d9d9;
}

.input-div i {
    color: #d9d9d9;
    font-size: 1.5rem;
    margin-right: 10px;
}

.input-div input {
    width: 100%;
    border: none;
    outline: none;
    font-size: 1.2rem;
    padding: 10px 0;
    color: #555;
}

.input-div input::placeholder {
    color: #999;
}

.input-div:focus-within {
    border-bottom-color: #38d39f;
}

.input-div:focus-within i {
    color: #38d39f;
}

.btn {
    width: 100%;
    padding: 15px;
    border: none;
    border-radius: 25px;
    background-image: linear-gradient(to right, #32be8f, #38d39f, #32be8f);
    background-size: 200%;
    color: #fff;
    font-size: 1.2rem;
    cursor: pointer;
    transition: 0.5s;
    text-transform: uppercase;
    margin-bottom: 10px;
}

.btn:hover {
    background-position: right;
}

.back-btn {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    padding: 15px;
    border: none;
    border-radius: 25px;
    background-image: linear-gradient(to right, #6495ED, #1E90FF, #6495ED);
    background-size: 200%;
    color: #fff;
    font-size: 1.2rem;
    cursor: pointer;
    transition: 0.5s;
    text-transform: uppercase;
}

.back-btn:hover {
    background-position: right;
}

@media screen and (max-width: 900px) {
    .container {
        flex-direction: column;
        width: 90%;
    }

    .img-container {
        display: none;
    }

    .form-container {
        border-radius: 10px;
    }
}
</style>
</head>

<body>
    <div class="container">
        <div class="img-container"></div>
        <div class="form-container">
            <h2>Find ID or Password</h2>
            <form method="post" action="<c:url value='/recover' />">
                <div class="input-div">
                    <i class="fas fa-envelope"></i>
                    <input type="email" name="email" id="email" class="input" placeholder="Enter your email">
                </div>
                <button type="submit" class="btn">Submit</button>
                <a href="/my" class="back-btn"><i class="fas fa-arrow-left"></i> Back</a>
            </form>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>
