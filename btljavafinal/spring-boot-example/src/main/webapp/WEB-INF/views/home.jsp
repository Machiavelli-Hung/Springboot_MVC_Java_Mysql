<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin người dùng</title>
</head>
<body>
    <h1>Thông tin người dùng</h1>
    <table>
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
    
    <br>

    <c:if test="${user != null}">
        <a href="/home/logout"><span>Đăng xuất</span></a>
    </c:if>


    <a href="/home/changePassword"><span>Đổi mật khẩu</span></a>
    
    <!-- Kiểm tra nếu chưa có user trong session, thì hiện phần "đăng nhập" -->
    <c:if test="${user == null}">
        <a href="/user/login"><span>danh nhap </span></a>
    </c:if>

    <c:if test="${user == null}">
        <a href="/user/register"><span>danh ki</span></a>
    </c:if>

</body>
</html>
