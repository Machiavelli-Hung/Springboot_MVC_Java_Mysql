<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Đăng nhập/Đăng kí Form</title>
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
      class="container ${param.formType == 'signup' ? 'right-panel-active' : ''}"
    >


      <div class="form-container sign-in-container">
        <form action="/user/login" method="post">
          <h1>Đăng nhập </h1>
          <input type="text" name="username" placeholder="Username" required />
          <input
            type="password"
            name="password"
            placeholder="Password"
            required
          />
          <c:if test="${not empty errorMessage}">
                <p style="color:red">${errorMessage}</p>
            </c:if>

            <c:if test="${not empty message}">
                <p style="color:red">${message}</p>
            </c:if>

          <button type="submit">Đăng nhập</button>
        </form>
      </div>

      <div class="overlay-container">
          <div class="overlay">
          <div class="overlay-panel overlay-left">     
          </div>
          
          <div class="overlay-panel overlay-right">
      
            <h3 >Nếu chưa có tài khoản hãy ấn vào đây để đăng ký </h3>
            <a href="/user/register" class="ghost button">Đăng ký </a>
          </div>
        </div>
      </div>

    </div>
  </body>
</html>
