<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thêm Lịch Cho Sân</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        line-height: 1.6;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
        color: #333;
      }

      h2,
      h3 {
        color: #2c3e50;
        text-align: center;
      }

      form,
      table {
        margin: 20px auto;
        max-width: 600px;
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
      input[type="number"] {
        width: 100%;
        padding: 8px;
        font-size: 16px;
        border: 1px solid #ddd;
        border-radius: 4px;
      }

      button[type="submit"] {
        display: inline-block;
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

      table {
        width: 100%;
        border-collapse: collapse;
        text-align: left;
      }

      table th,
      table td {
        border: 1px solid #ddd;
        padding: 10px;
      }

      table th {
        background-color: #3498db;
        color: white;
      }

      table tr:nth-child(even) {
        background-color: #f2f2f2;
      }

      a {
        color: #3498db;
        text-decoration: none;
        margin-right: 10px;
        text-align: center;
      }

      a:hover {
        text-decoration: underline;
        text-align: center;
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
    <h2>Thêm Lịch Cho Sân: ${court.name}</h2>

    <!-- Form to add schedule -->
    <form
      action="${pageContext.request.contextPath}/courts/add-schedules/${court.id}"
      method="post"
    >
      <div>
        <label for="times">Buổi</label>
        <input
          type="text"
          id="times"
          name="times"
          placeholder="Buổi sáng, Buổi chiều"
          required
        />
      </div>
      <div>
        <label for="prices">Giá thuê</label>
        <input
          type="number"
          id="prices"
          name="prices"
          placeholder="Giá"
          required
        />
      </div>
      <button type="submit">Thêm Lịch</button>
    </form>

    <!-- Display list of schedules -->
    <h3>Danh sách các lịch hiện tại:</h3>
    <table>
      <thead>
        <tr>
          <th>Thời gian</th>
          <th>Giá</th>
          <th>Trạng thái</th>
          <th>Hành động</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${schedules}" var="schedule">
          <tr>
            <td>${schedule.time}</td>
            <td>${schedule.price}</td>
            <td>${schedule.isRented() ? 'Đã thuê' : 'Chưa thuê'}</td>
            <td>
              <a
                href="${pageContext.request.contextPath}/courts/edit-schedule/${schedule.id}"
              >
                Sửa
              </a>
              <a
                href="${pageContext.request.contextPath}/courts/delete-schedule/${schedule.id}"
                onclick="return confirm('Bạn có chắc chắn muốn xoá lịch này?');"
                style="color: red"
              >
                Xoá
              </a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/courts" class="back-link"
      >Quay lại danh sách sân</a
    >
  </body>
</html>
