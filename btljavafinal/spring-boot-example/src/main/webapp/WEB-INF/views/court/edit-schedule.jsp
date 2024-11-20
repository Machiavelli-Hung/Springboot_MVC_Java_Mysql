<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chỉnh sửa lịch</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        line-height: 1.6;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
        color: #333;
      }

      h2 {
        color: #2c3e50;
        text-align: center;
        margin-top: 20px;
      }

      form {
        max-width: 400px;
        margin: 20px auto;
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      }

      form div {
        margin-bottom: 15px;
      }

      label {
        font-weight: bold;
        display: block;
        margin-bottom: 5px;
      }

      input[type="text"],
      input[type="number"],
      select {
        width: 100%;
        padding: 8px;
        font-size: 16px;
        border: 1px solid #ddd;
        border-radius: 4px;
      }

      button[type="submit"] {
        display: block;
        width: 100%;
        background-color: #3498db;
        color: #fff;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
      }

      button[type="submit"]:hover {
        background-color: #2980b9;
      }

      .back-link {
        display: block;
        text-align: center;
        margin: 20px;
        text-decoration: none;
        font-size: 16px;
        color: #3498db;
      }

      .back-link:hover {
        text-decoration: underline;
      }
    </style>
  </head>
  <body>
    <h2>Chỉnh sửa lịch</h2>

    <!-- Form to edit schedule -->
    <form
      action="${pageContext.request.contextPath}/courts/edit-schedule/${schedule.id}"
      method="post"
    >
      <div>
        <label for="time">Thời gian</label>
        <input
          type="text"
          id="time"
          name="time"
          value="${schedule.time}"
          required
        />
      </div>
      <div>
        <label for="price">Giá thuê</label>
        <input
          type="number"
          id="price"
          name="price"
          value="${schedule.price}"
          required
        />
      </div>
      <div>
        <label for="rented">Trạng thái</label>
        <select id="rented" name="rented" required>
          <c:choose>
            <c:when test="${schedule.rented}">
              <option value="true" selected>Đã thuê</option>
              <option value="false">Chưa thuê</option>
            </c:when>
            <c:otherwise>
              <option value="true">Đã thuê</option>
              <option value="false" selected>Chưa thuê</option>
            </c:otherwise>
          </c:choose>
        </select>
      </div>
      <button type="submit">Cập nhật lịch</button>
    </form>
    <a href="${pageContext.request.contextPath}/courts" class="back-link"
      >Quay lại danh sách sân</a
    >
  </body>
</html>
