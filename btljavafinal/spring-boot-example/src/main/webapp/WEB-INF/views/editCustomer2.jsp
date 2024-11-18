<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chỉnh sửa thông tin</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/css/css_user/editCustomer2.css"
    />
  </head>

  <body>
    <div class="container">
      <div class="form-container">
        <form action="/chusan/update" method="post">
          <h1>Chỉnh sửa thông tin</h1>

          <input type="hidden" name="id" value="${customer.id}" />

          <div class="input-group">
            <label for="username">Username:</label>
            <input
              type="text"
              name="username"
              value="${customer.username}"
              required
            />
          </div>

          <div class="input-group">
            <label for="password">Password:</label>
            <input
              type="password"
              name="password"
              value="${customer.password}"
              required
            />
          </div>

          <div class="input-group">
            <label for="email">Email:</label>
            <input
              type="email"
              name="email"
              value="${customer.email}"
              required
            />
          </div>

          <div class="input-group">
            <label for="phone">Số điện thoại:</label>
            <input
              type="text"
              name="phone"
              value="${customer.phoneNumber}"
              required
            />
          </div>

          <label id="role1" for="role">Role</label>
          <input
            id="role"
            type="text"
            name="role"
            value="${customer.role}"
            required
          />

          <button type="submit">Cập nhật</button>
          <a href="/chusan/showuser">Quay lại</a>
        </form>
      </div>
    </div>
  </body>
</html>
