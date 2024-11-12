<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>xac nhan dki</title>
</head>
<body>
    <h2>hien thi thong tin nguoi dung </h2>
    <c:if test="${param.success != null}">
        <p>trang thai : Đăng ký thành công!</p>
    </c:if>
    <form >
        <label for="username">Tên người dùng dang ky :</label>
        <input type="text" id="username" name="username" value="${user.username}" required><br>

        <label for="password">Mật khẩu dang ky la :</label>
        <input type="password" id="password" name="password" value="${user.password}" required><br>

        <label for="email">Email dang ky la :</label>
        <input type="email" id="email" name="email" value="${user.email}" required><br>

        <label for="phoneNumber">Số điện thoại dang ky la :</label>
        <input type="text" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}" required><br>
    </form>
</body>
</html>
