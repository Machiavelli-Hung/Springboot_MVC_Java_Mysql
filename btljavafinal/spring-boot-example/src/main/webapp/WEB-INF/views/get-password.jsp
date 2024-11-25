<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Reset Password</title>
    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link rel="icon" href="/images/logo.png" type="image/x-icon" />
  </head>
  <body
    class="d-flex justify-content-center align-items-center vh-100 bg-light"
  >
    <div
      class="card shadow p-5"
      style="width: 750px; max-width: 650px; border-radius: 12px; height: 300px"
    >
      <h4 class="text-center mb-4">Nhập email của bạn để lấy lại mật khẩu</h4>
      <h4 style="color: red">${message}</h4>
      <form action="/auth/reset-password" method="post">
        <div class="mb-4">
          <input
            type="email"
            name="email"
            id="email"
            class="form-control form-control-lg"
            placeholder="Nhập email của bạn"
            required
          />
        </div>
        <button type="submit" class="btn btn-primary btn-lg w-100">
          Gửi mã PIN
        </button>
      </form>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
<!-- trang này có thể tùy chỉnh nhg để lại action đúng và name  -->
