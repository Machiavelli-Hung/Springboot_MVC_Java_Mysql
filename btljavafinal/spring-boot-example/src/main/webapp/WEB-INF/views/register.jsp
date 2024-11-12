<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>

    <head>
        <title>Đăng Ký</title>
    </head>

    <body>
        <h2>Đăng Ký Người Dùng</h2>

        

        <form action="/user/register" method="post">
            <label for="username">Tên người dùng đăng ký:</label>
            <input type="text" id="username" name="username" value="${user.username}" required><br>

            <label for="password">Mật khẩu đăng ký:</label>
            <input type="password" id="password" name="password" value="${user.password}" required><br>

            <label for="email">Email đăng ký:</label>
            <input type="email" id="email" name="email" value="${user.email}" required><br>

            <label for="role">Vai trò:</label>
            <select id="role" name="role" required>
                <option value="nguoi dung">Người Dùng</option>
                <option value="chu san">Chủ Sân</option>
            </select><br>

            <label for="phoneNumber">Số điện thoại đăng ký:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}" required><br>

            <c:if test="${not empty errorMessage}">
                <p style="color:red">${errorMessage}</p>
            </c:if>

            <button type="submit">Đăng Ký</button>
        </form>
    </body>