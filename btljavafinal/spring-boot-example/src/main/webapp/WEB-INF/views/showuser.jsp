<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <title>Danh sách khách hàng</title>
</head>
<body>
    <h1>Danh sách khách hàng</h1>
    <table border="1">
        <tr>
            <th>Username</th>
            <th>Password</th>
            <th>Email</th>
            <th>Số điện thoại</th>
            <th>Hành động</th>
        </tr>
        <c:forEach var="customer" items="${customers}">
            <tr>
                <td>${customer.username}</td>
                <td>${customer.password}</td>
                <td>${customer.email}</td>
                <td>${customer.phoneNumber}</td>
                <td>
                    <a href="/admin/edit">Edit</a>
                    <a href="/admin/delete">Delete</a>
                </td>
            </tr>
        </c:forEach>
        <a href="/admin"> quay lại </a>

    </table>
</body>
</html>