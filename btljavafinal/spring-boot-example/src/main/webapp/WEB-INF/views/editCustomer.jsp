<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Chỉnh sửa khách hàng</title>
</head>
<body>
    <h1>Chỉnh sửa khách hàng</h1>
    <form action="/admin/update" method="post">
        <input type="hidden" name="id" value="${customer.id}" />
        <label for="username">Username:</label>
        <input type="text" name="username" value="${customer.username}" required /><br/>

        <label for="password">Password:</label>
        <input type="password" name="password" value="${customer.password}" required /><br/>

        <label for="email">Email:</label>
        <input type="email" name="email" value="${customer.email}" required /><br/>

        <label for="phone">Số điện thoại:</label>
        <input type="text" name="phone" value="${customer.phoneNumber}" required /><br/>

        <input type="submit" value="Cập nhật" />
    </form>
    <a href="/admin/showuser">Quay lại</a>
    
</body>
</html>