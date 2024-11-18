<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Xác nhận đăng ký</title>
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
                    width: 500px;
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

                <!-- .overlay-container {
                    flex: 1;
                    background: linear-gradient(to right, #1a4178, #3c6bac);
                    color: #FFFFFF;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    flex-direction: column;
                    padding: 40px;
                    text-align: center;
                } -->

                .success {
                    color: green;
                    margin-bottom: 20px;
                }

                label {
                    text-align: left;
                    width: 100%;
                    margin-top: 10px;
                    color: #1a4178;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <div class="form-container">
                    <form action="/user/success" method="post">
                        <h1>Thông tin đăng ký</h1>

                        <c:if test="${param.success != null}">
                            <p class="success">Đăng ký thành công!</p>
                        </c:if>

                        <label for="username">Tên người dùng:</label>
                        <input type="text" id="username" name="username" value="${user.username}" readonly>

                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" value="${user.email}" readonly>

                        <label for="phoneNumber">Số điện thoại:</label>
                        <input type="text" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}" readonly>

                        <button type="submit">Trở về trang đăng nhập</button>
                    </form>
                </div>

                <!-- <div class="overlay-container">
                    <div class="overlay-content">
                        <h1>Đăng ký thành công</h1>
                        <p>Chúc mừng bạn đã đăng ký thành công! Bạn có thể đăng nhập ngay bây giờ để trải nghiệm dịch vụ
                            của chúng tôi.</p>
                    </div>
                </div> -->
            </div>
        </body>

        </html>