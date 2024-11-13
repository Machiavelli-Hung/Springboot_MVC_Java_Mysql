<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin người dùng</title>
</head>
<body>
    <h1>TDay la Admin</h1>
    <table>
        <tr>
            <th>Tên người dùng</th>
            <!-- <td>${user.username}</td> -->
        </tr>
        <tr>
            <th>Mật khẩu</th>
            <!-- <td>${user.password}</td> -->
        </tr>
        <tr>
            <th>Email</th>
            <!-- <td>${user.email}</td> -->
        </tr>
        <tr>
            <th>Số điện thoại</th>
            <!-- <td>${user.phoneNumber}</td> -->
        </tr>
        <tr>
            <th>Vai trò</th>
            <!-- <td>${user.role}</td> -->
        </tr>
    </table>
    
    <br>

    <!-- Nút Đăng xuất -->
    <form action="/home/logout" method="post">
        <button type="submit">Đăng xuất</button>
    </form>
    
    <!-- Nút Đổi mật khẩu -->
    <form action="/home/changePassword" method="get">
        <button type="submit">Đổi mật khẩu</button>
    </form>

    <form action="/user/login" method="get">
        <button type="submit">đăng nhập </button>
    </form>
</body>
</html>
