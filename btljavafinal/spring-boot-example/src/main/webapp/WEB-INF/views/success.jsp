<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng Ký</title>
</head>
<body>
    <h2>Đăng Ký Người Dùng</h2>
    <c:if test="${param.success != null}">
        <p>Đăng ký thành công!</p>
    </c:if>
    <form action="register" method="post">
        <label for="username">Tên người dùng:</label>
        <input type="text" id="username" name="username" value="${user.username}" required><br>

        <label for="password">Mật khẩu:</label>
        <input type="password" id="password" name="password" value="${user.password}" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${user.email}" required><br>

        <label for="phoneNumber">Số điện thoại:</label>
        <input type="text" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}" required><br>

        <button type="submit">Đăng Ký</button>
    </form>
</body>
</html>
