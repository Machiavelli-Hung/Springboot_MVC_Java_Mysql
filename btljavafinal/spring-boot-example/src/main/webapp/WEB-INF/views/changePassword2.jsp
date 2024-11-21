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
      href="${pageContext.request.contextPath}/css/css_user/changePassword2.css"
    />
  </head>

  <body>
    <div class="container">
      <div class="form-container">
        <form action="/home/changePassword" method="post">
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

          <input
            type="password"
            id="oldPassword"
            name="oldPassword"
            placeholder="Mật khẩu cũ"
            required
          />
          <input
            type="password"
            id="newPassword"
            name="newPassword"
            placeholder="Mật khẩu mới"
            required
          />

          <button type="submit">Đổi mật khẩu</button>

          <c:choose>
            <c:when test="${user.role == 'admin'}">
              <c:set
                var="homeUrl"
                value="${pageContext.request.contextPath}/admin"
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
  </body>
</html>
