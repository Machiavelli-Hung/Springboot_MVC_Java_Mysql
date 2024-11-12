<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin người dùng</title>
</head>
<body>
    <h1>Thông tin người dùng</h1>
    <table >
        <tr>
            <th>Tên người dùng</th>
            <td>${user.username}</td>
        </tr>
        <tr>
            <th>Mật khẩu</th>
            <td>${user.password}</td>
        </tr>
        <tr>
            <th>Email</th>
            <td>${user.email}</td>
        </tr>
        <tr>
            <th>Số điện thoại</th>
            <td>${user.phoneNumber}</td>
        </tr>
        <tr>
            <th>Vai trò</th>
            <td>${user.role}</td>
        </tr>


    </table>
</body>
</html>