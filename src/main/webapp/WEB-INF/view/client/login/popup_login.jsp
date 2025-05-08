<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng nhập</title>
    <style>
        body {
            font-family: sans-serif;
        }

        .popup_login_bg {
            z-index: 2000;
            background-color: #f2f2f2;
            width: 100%;
            height: 100vh;
            display: flex;
            justify-content: center;
        }

        .popup_login {
            display: grid;
            grid-template-columns: 1fr 1fr;
            align-items: center;
            background-color: white;
            border-radius: 30px;
            padding: 50px;
            margin-top: 5%;
            width: 50%;
            height: fit-content;
        }

        .popup_login img {
            width: 50%;
            object-fit: cover;
        }

        .popup__login__input {
            text-align: center;
        }

        .popup__login__input h1 {
            font-size: 50px;
            font-weight: bold;
            color: #d0b49e;
        }

        .popup__login__input input {
            width: 100%;
            height: 35px;
            border-radius: 12px;
            margin-top: 15px;
            margin-bottom: 15px;
            padding-top: 10px;
            padding-bottom: 10px;
            padding-left: 10px;
            font-size: 20px;
            border: 0.5px solid #d0b49e;
        }

        .popup__login__input button {
            width: 100%;
            /* height: 35px; */
            border-radius: 12px;
            margin-top: 15px;
            margin-bottom: 15px;
            padding: 10px;
            font-size: 30px;
            background-color: #d0b49e;
            border: none;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

        .popup__login__input button:hover {
            background-color: white;
            border: 0.5px solid #d0b49e;
            color: #d0b49e;
        }

        .popup__login__input a {
            color: #d0b49e;
            margin-top: 200px;
            text-decoration: none;
        }

        .popup__login__input span {
            color: red;
            display: block;
        }

        /* reponse cho tablet */
        @media screen and (max-width: 990px) {
            .popup_login {
                grid-template-columns: 1fr;
            }

            .popup__login__logo {
                display: flex;
                justify-content: center;
            }
        }

        @media screen and (max-width: 600px) {
            .popup__login__input h1{
                font-size: 37px;
            }

            .popup_login {
                width: 100%;
            }
        }
    </style>
    <style>
        .wrapper {
            position: fixed;
            top: 0;
            bottom: 0;
            right: 0;
            left: 0;
            z-index: 2000;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .loader,
        .loader::before,
        .loader::after {
            border-width: 2px;
            border-style: solid;
            border-radius: 10px;
            animation: rotate 5s linear infinite;
        }

        .loader {
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            width: 40px;
            height: 40px;
            border-color: #5a4ff3;
        }

        .loader::before,
        .loader::after {
            position: absolute;
            content: '';
        }

        .loader::before {
            border-color: #35a2d2;
            width: 110%;
            height: 110%;
            animation-delay: 0.5s;
        }

        .loader::after {
            border-color: #9c40fc;
            width: 120%;
            height: 120%;
            animation-delay: 0.1s;
        }

        @keyframes rotate {
            to {
                transform: rotate(360deg);
            }
        }
    </style>
</head>
<body>
<div class="popup_login_bg">
    <div class="popup_login">
        <div class="popup__login__logo">
            <img src="/images/dee42cf38b7f34216d6e.jpg" />
        </div>

        <div class="popup__login__input">
            <h1>Đăng nhập</h1>
            <form id="loginForm" action="/admin/login/submit-email" method="post">
                <input
                        id="email"
                        name="email"
                        type="email"
                        placeholder="Email đã đăng ký"
                />
                <button type="submit" class="popup__login__input__btn">Đăng nhập</button>
            </form>
            <c:if test="${error != null}">
                <span id="emailError">${error}</span>
            </c:if>
        </div>
    </div>
</div>

<div class="wrapper" style="display: none">
    <div class="loader"></div>
</div>

<script>
    document.getElementById('loginForm').addEventListener('submit', function (e) {
        // Chặn submit ngay lập tức
        e.preventDefault();

        // Hiển thị loading (ví dụ: thay đổi nút)
        const loading = document.querySelector('.wrapper');
        loading.style.display = 'flex';
        this.submit(); // submit lại form
    });
</script>
</body>
</html>
