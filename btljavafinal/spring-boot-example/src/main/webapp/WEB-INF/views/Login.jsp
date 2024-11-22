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
      href="${pageContext.request.contextPath}/css/css_user/login.css"
    />
  </head>

  <body>
    <div
      class="container ${param.formType == 'signup' ? 'right-panel-active' : ''}"
    >
      <div class="form-container sign-in-container">
        <form action="/login" method="post">
          <h1>Đăng nhập</h1>
          <input type="text" name="username" placeholder="Username" required />
          <div style="position: relative; width: 100%">
            <input
              type="password"
              name="password"
              placeholder="Password"
              required
              id="login-password"
            />
            <i
              class="fas fa-eye-slash password-toggle"
              onclick="togglePassword('login-password')"
              style="
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                cursor: pointer;
              "
            >
            </i>
          </div>

          <button type="submit">Đăng nhập</button>
        </form>
      </div>

      <div class="overlay-container">
        <div class="overlay">
          <div class="overlay-panel overlay-right">
            <a href="/register" class="ghost button">Đăng ký</a>
          </div>
        </div>
      </div>
    </div>

    <script>
      function togglePassword(inputId) {
        const passwordInput = document.getElementById(inputId);
        const icon = event.target;

        if (passwordInput.type === "password") {
          passwordInput.type = "text";
          icon.classList.remove("fa-eye-slash");
          icon.classList.add("fa-eye");
        } else {
          passwordInput.type = "password";
          icon.classList.remove("fa-eye");
          icon.classList.add("fa-eye-slash");
        }
      }
    </script>
  </body>
</html>
