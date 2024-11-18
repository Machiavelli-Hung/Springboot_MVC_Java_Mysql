<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Đổi mật khẩu</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
            <style>
                @import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');

                * {
                    box-sizing: border-box;
                }

                body {
                    background: #f6f5f7;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    flex-direction: column;
                    font-family: 'Montserrat', sans-serif;
                    height: 100vh;
                    margin: -20px 0 50px;
                }

                .container {
                    background-color: #fff;
                    border-radius: 10px;
                    box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25);
                    position: relative;
                    overflow: hidden;
                    width: 600px;
                    max-width: 100%;
                    min-height: 500px;
                    display: flex;
                }

                .form-container {
                    flex: 1;
                    padding: 40px;
                    
                }

                form {
                    background-color: #FFFFFF;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    flex-direction: column;
                    padding: 0 50px;
                    height: 100%;
                    text-align: center;
                }

                h1 {
                    font-weight: bold;
                    margin: 0;
                    margin-bottom: 20px;
                    color: #1a4178;
                }

                input {
                    background-color: #eee;
                    border: none;
                    padding: 12px 15px;
                    margin: 8px 0;
                    width: 100%;
                    font-size: 14px;
                }

                button {
                    border-radius: 20px;
                    border: 1px solid #1a4178;
                    background-color: #1a4178;
                    color: #FFFFFF;
                    font-size: 12px;
                    font-weight: bold;
                    padding: 12px 45px;
                    letter-spacing: 1px;
                    text-transform: uppercase;
                    transition: transform 80ms ease-in;
                    cursor: pointer;
                    margin-top: 15px;
                }

                .overlay-container {
                    flex: 1;
                    background: linear-gradient(to right, #1a4178, #3c6bac);
                    color: #FFFFFF;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    flex-direction: column;
                    padding: 40px;
                    text-align: center;
                }

                <!-- .overlay-content {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    gap: 20px;
                } -->

                <!-- .overlay-container h1 {
                    color: #FFFFFF;
                    margin-bottom: 20px;
                } -->

                <!-- .overlay-container p {
                    font-size: 14px;
                    line-height: 20px;
                    letter-spacing: 0.5px;
                    margin: 20px 0;
                } -->

                a {
                    color: #1a4178;
                    text-decoration: none;
                    margin-top: 15px;
                }

                a:hover {
                    text-decoration: underline;
                }

                .message {
                    margin: 15px 0;
                }

                .success {
                    color: green;
                }

                .error {
                    color: red;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <div class="form-container">
                    <form action="/home/changePassword" method="post">
                        <h1>Đổi mật khẩu</h1>

                        <c:if test="${not empty message}">
                            <p class="message success">${message}</p>
                        </c:if>
                        <c:if test="${not empty error}">
                            <p class="message error">${error}</p>
                        </c:if>

                        <input type="password" id="oldPassword" name="oldPassword" placeholder="Mật khẩu cũ" required />
                        <input type="password" id="newPassword" name="newPassword" placeholder="Mật khẩu mới"
                            required />

                        <button type="submit">Đổi mật khẩu</button>

                        <a href="<c:choose>
                    <c:when test=" ${user.role=='admin' }">/admin</c:when>
                            <c:otherwise>/home</c:otherwise>
                            </c:choose>">
                            Trở lại trang chủ
                        </a>
                    </form>
                </div>

                <!-- <div class="overlay-container">
                    <div class="overlay-content">
                        <h1>Đổi mật khẩu</h1>
                        <p>Để bảo mật tài khoản của bạn, hãy sử dụng mật khẩu mạnh và không chia sẻ mật khẩu với người
                            khác</p>
                    </div>
                </div> -->
            </div>
        </body>

        </html>