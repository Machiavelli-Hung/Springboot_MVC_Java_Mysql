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
      <div class="form-container sign-up-container">
        <form action="/user/register" method="post">
          <h1>Create Account</h1>
          <div class="social-container">
            <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
            <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
          </div>
          <span>or use your email for registration</span>
          <input type="text" name="name" placeholder="Name" required />
          <input type="email" name="email" placeholder="Email" required />
          <input
            type="password"
            name="password"
            placeholder="Password"
            required
          />
          <a href="/user/register"><span>danh ki</span></a>
        </form>
      </div>

      <div class="form-container sign-in-container">
        <form action="/login" method="post">
          <h1>Đăng nhập</h1>
          <input type="text" name="username" placeholder="Username" required />
          <input
            type="password"
            name="password"
            placeholder="Password"
            required
          />

          <!-- phan nay de lai de in thong bao (khong xoa) -->
            <c:if test="${not empty errorMessage}">
              <p style="color:red">${errorMessage}</p>
          </c:if>

          <c:if test="${not empty message}">
              <p style="color:red">${message}</p>
          </c:if>
          <!--  -->

          <button type="submit">Đăng nhập</button>
        </form>
      </div>

      <div class="overlay-container">
        <div class="overlay">
          <div class="overlay-panel overlay-left">
            <h1>Welcome Back!</h1>
            <p>
              To keep connected with us please login with your personal info
            </p>
            <a
              href="${pageContext.request.contextPath}/auth/signin"
              class="ghost button"
              >Đăng nhập</a
            >
          </div>
          <div class="overlay-panel overlay-right">
            <h1>Xin chào!</h1>
            <p>Bạn chưa có tài khoản? Đăng ký tại đây</p>
            <a href="/user/register" class="ghost button">Đăng ký</a>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
