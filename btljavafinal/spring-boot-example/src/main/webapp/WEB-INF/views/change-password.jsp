<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đổi mật khẩu</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/css/css_user/change-password.css"
    />
  </head>

  <body>
    <div class="container">
      <div class="form-container">
        <form action="/home/change-password" method="post">
          <h1>Đổi mật khẩu</h1>

          <c:if test="${not empty message}">
            <p class="message success">${message}</p>
          </c:if>
          <c:if test="${not empty error}">
            <p class="message error">${error}</p>
          </c:if>

          <div class="password-container">
            <input
              type="password"
              id="old-password"
              name="oldPassword"
              placeholder="Mật khẩu cũ"
              required
            />
            <span
              class="password-toggle"
              onclick="togglePassword('old-password')"
            >
              <i class="fas fa-eye-slash"></i>
            </span>
          </div>

          <div class="password-container">
            <input
              type="password"
              id="new-password"
              name="newPassword"
              placeholder="Mật khẩu mới"
              required
            />
            <span
              class="password-toggle"
              onclick="togglePassword('new-password')"
            >
              <i class="fas fa-eye-slash"></i>
            </span>
          </div>

          <button type="submit">Đổi mật khẩu</button>

          <c:choose>
            <c:when test="${user.role == 'admin'}">
              <c:set
                var="homeUrl"
                value="${pageContext.request.contextPath}/chusans"
              />
            </c:when>
            <c:otherwise>
              <c:set
                var="homeUrl"
                value="${pageContext.request.contextPath}/home"
              />
            </c:otherwise>
          </c:choose>

          <a href="${homeUrl}">Trở lại trang chủ</a>
        </form>
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
