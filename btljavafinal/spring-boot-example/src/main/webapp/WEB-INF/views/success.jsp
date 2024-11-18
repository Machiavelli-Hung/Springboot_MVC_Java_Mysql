<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Xác nhận đăng ký</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css_user/success.css">
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