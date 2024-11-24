<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Thông tin đặt sân</title>
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
    <style>
      body {
        font-family: Arial, sans-serif;
      }
      .form-container {
        width: 50%;
        margin: 0 auto;
        background-color: #f9f9f9;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
      }
      .form-container h1 {
        text-align: center;
        color: #5b0c72;
      }
      .form-group {
        margin-bottom: 15px;
      }
      .form-group label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
      }
      .form-group input {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 3px;
        background-color: #eee;
      }
    </style>
  </head>
  <body>
    <!-- trang nay để mô phỏng việc lấy thông tin  -->
    <div class="form-container">
      <h1>Yêu cầu đặt sân của bạn đã được xác nhận!</h1>
      <div class="form-group">
        <label for="field">Sân đã đặt:</label>
        <input type="text" id="field" name="field" value="${field}" />
      </div>
      <div class="form-group">
        <label for="schedule">Lịch đã đặt:</label>
        <input type="text" id="schedule" name="schedule" value="${schedule}" />
      </div>
    </div>
  </body>
</html>
