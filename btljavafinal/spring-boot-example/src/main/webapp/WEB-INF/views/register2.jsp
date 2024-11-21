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

          <div class="password-container">
            <input
              type="password"
              id="password"
              name="password"
              placeholder="Mật khẩu"
              value="${user.password}"
              required
            />
            <span class="password-toggle" onclick="togglePassword('password')">
              <i class="fas fa-eye-slash"></i>
            </span>
          </div>

          <div class="password-container">
            <input 
              type="password"
              id="confirmPassword"
              name="confirmPassword"
              placeholder="Nhập lại mật khẩu"
              value="${user.confirmPassword}"
              required
            />
            <span class="password-toggle" onclick="togglePassword('confirmPassword')">
              <i class="fas fa-eye-slash"></i>
            </span>
          </div>

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

      <!-- Phần overlay-container trong HTML -->
      <div class="overlay-container">
        <div class="overlay-content">
          <h1>Hello, Friend!</h1>
          <p>Enter your personal details and start journey with us</p>
          <form
            action="${pageContext.request.contextPath}/user/login"
            method="get"
          >
            <button type="submit" class="ghost">SIGN IN</button>
          </form>
        </div>
      </div>
    </div>

    <script>
    function togglePassword(inputId) {
        const passwordInput = document.getElementById(inputId);
        const icon = event.target;
        
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        } else {
            passwordInput.type = 'password';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        }
    }
    </script>
  </body>
</html>
