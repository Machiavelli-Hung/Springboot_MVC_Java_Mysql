<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi mật khẩu</title>
</head>
<body>
    <h1>Đổi mật khẩu</h1>

    <!-- Hiển thị thông báo nếu có -->
    <div>
        <c:if test="${not empty message}">
            <p style="color: green;" >${message}</p>
        </c:if>
        <c:if test="${not empty error}">
            <p style="color: red;" >${error}</p>
        </c:if>
    </div>

    <!-- Form Đổi mật khẩu -->
    <form action="/home/changePassword" method="post">
        <div>
            <label for="oldPassword">Mật khẩu cũ:</label>
            <input type="password" id="oldPassword" name="oldPassword" required/>
        </div>
        <div>
            <label for="newPassword">Mật khẩu mới:</label>
            <input type="password" id="newPassword" name="newPassword" required/>
        </div>
        <div>
            <button type="submit">Đổi mật khẩu</button>
        </div>
    </form>
    
    <a href="/home">Trở lại trang chủ</a>
</body>
</html>
