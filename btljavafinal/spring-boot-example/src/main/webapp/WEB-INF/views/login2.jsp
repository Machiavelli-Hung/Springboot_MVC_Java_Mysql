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
      href="${pageContext.request.contextPath}/css/css_user/login2.css"
    />
  </head>


  <body>
    <div
      class="container ${param.formType == 'signup' ? 'right-panel-active' : ''}">
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
          <div style="position: relative; width: 100%;">
            <input
              type="password"
              name="password"
              placeholder="Password"
              required
              id="registerPassword"
            />
            <i class="fas fa-eye-slash password-toggle" 
               onclick="togglePassword('registerPassword')" 
               style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;">
            </i>
          </div>
          <a href="/user/register"><span>danh ki</span></a>
        </form>
      </div>

      <div class="form-container sign-in-container">
        <form action="/user/login" method="post">
          <h1>Sign in</h1>
          <input type="text" name="username" placeholder="Username" required />
          <div style="position: relative; width: 100%;">
            <input
              type="password"
              name="password"
              placeholder="Password"
              required
              id="loginPassword"
            />
            <i class="fas fa-eye-slash password-toggle" 
               onclick="togglePassword('loginPassword')" 
               style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;">
            </i>
          </div>

          <button type="submit">Sign In</button>
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
              >Sign In</a
            >
          </div>
          <div class="overlay-panel overlay-right">
            <h1>Hello, Friend!</h1>
            <p>Enter your personal details and start journey with us</p>
            <a href="/user/register" class="ghost button">Sign Up</a>
          </div>
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
