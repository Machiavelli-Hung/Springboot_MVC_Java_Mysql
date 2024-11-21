<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Sign In/Sign Up Form</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />

    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/css/css_user/register2.css"
    />
  </head>

  <body>
    <div class="container">
      <div class="form-container">
        <form action="/user/register" method="post">
          <h2>Create Account</h2>

          <input
            type="text"
            id="username"
            name="username"
            placeholder="Tên người dùng"
            value="${user.username}"
            required
          />

          <input
            type="password"
            id="password"
            name="password"
            placeholder="Mật khẩu"
            value="${user.password}"
            required
          />

          <input
            type="email"
            id="email"
            name="email"
            placeholder="Email"
            value="${user.email}"
            required
          />

          <select id="role" name="role" required>
            <option value="nguoi dung">Người Dùng</option>
            <option value="chu san">Chủ Sân</option>
          </select>

          <input
            type="text"
            id="phoneNumber"
            name="phoneNumber"
            placeholder="Số điện thoại"
            value="${user.phoneNumber}"
            required
          />

          <c:if test="${not empty errorMessage}">
            <p style="color: red">${errorMessage}</p>
          </c:if>

          <button type="submit">Đăng Ký</button>
        </form>
      </div>

      <!-- phan nay phai xoa (khong them lai khi merger) -->
      <!-- Phần overlay-container trong HTML -->
      
      <!-- end -->
    </div>
  </body>
</html>
