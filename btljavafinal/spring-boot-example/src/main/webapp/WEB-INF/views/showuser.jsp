<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Danh sách khách hàng</title>
</head>
<body>
    <a href="/admin">Quay lại</a>
    <h1>Danh sách khách hàng</h1>
    <table border="1">
        <tr>
            <th>Id</th>
            <th>Username</th>
            <th>Password</th>
            <th>Email</th>
            <th>Số điện thoại</th>
            <th>Hành động</th>
        </tr>
        <c:forEach var="customer" items="${customers}">
            <tr>
                <td>${customer.id}</td>
                <td>${customer.username}</td>
                <td>${customer.password}</td>
                <td>${customer.email}</td>
                <td>${customer.phoneNumber}</td>
                <td>
                    <a href="/admin/edit/${customer.id}">Edit</a>
                    <form action="/admin/delete/${customer.id}" method="post" style="display:inline;">
                        <input type="submit" value="Delete" onclick="return confirm('Bạn có chắc chắn muốn xóa không?');" />
                    </form>
                </td>
            </tr>
        </c:forEach>
        
    </table>
</body>
</html>