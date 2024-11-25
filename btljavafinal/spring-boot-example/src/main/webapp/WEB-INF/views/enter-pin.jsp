<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/css/css_user/enter-pin.css"
    />
    <title>Enter PIN</title>
  </head>
  <body>
    <div class="container">
      <h2>Nhập mã PIN</h2>
      <h4 style="color: red">${message}</h4>
      <form action="/auth/verify-pin" method="post">
        <input type="hidden" name="email" value="${email}" />
        <input
          type="text"
          name="pin"
          id="pin"
          placeholder="Nhập mã PIN của bạn"
          required
        />
        <button type="submit">Xác thực</button>
      </form>
      <p class="error">${error}</p>
    </div>
  </body>
</html>
