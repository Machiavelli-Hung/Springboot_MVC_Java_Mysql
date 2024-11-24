<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
      integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
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
        text-align: center;
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

      .renter-name {
        text-decoration: underline;
        color: #3498db;
        cursor: pointer;
        background-color: transparent;
        border: none;
        padding: 0;
        font-size: 16px;
      }

      .cancel-btn-wrapper {
        padding: 0;
        margin: 0;
        box-shadow: none;
        font-size: 16px;
        width: 100%;
        margin-top: 5px;
      }

      .cancel-btn {
        padding: 6px !important;
        width: 100%;
        text-align: center;
      }
      header {
        background-color: #1a4178;
        padding: 1rem;
        color: white;
      }

      nav ul {
        display: flex;
        list-style: none;
        gap: 2rem;
        margin: 0;
        padding: 0;
      }

      nav a {
        color: white;
        text-decoration: none;
      }

      .auth-buttons {
        align-items: center;
        display: flex;
        float: right;
        margin-right: 1rem;
        /* Thêm khoảng cách từ cạnh phải */
        margin-top: -1.6rem;
        /* Căn chỉnh từ phía trên */
        align-items: center;
        display: flex;
      }

      .btn {
        background-color: #eee;
        color: #1a4178;
        padding: 0.5rem 1rem;
        border-radius: 4px;
        text-decoration: none;
        margin-left: 1rem;
        display: inline-block;
        /* Đảm bảo các nút nằm ngang */
        position: relative;
        /* Bỏ phần margin-top âm */
        font-size: 0.8rem;
        /* Tăng kích thước chữ (có thể điều chỉnh) */
        font-weight: bold;
      }
      .user-btn {
        width: 30px;
        border-radius: 50%;
        height: 30px;
        margin-left: 20px;
        color: #000;
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <header>
      <nav>
        <ul>
          <li><a href="/home">Trang chủ</a></li>
          <c:if test="${user != null}">
            <c:if test="${user.role == 'admin'}">
              <a href="/home/manage-users"><span>Quản lý người dùng</span></a>
              <a href="/manage-courts"><span>Quản lý sân</span></a>
            </c:if>
            <c:if test="${user.role == 'owner'}">
              <a href="/manage-courts"><span>Quản lý sân</span></a>
            </c:if>
          </c:if>
        </ul>
        <div class="auth-buttons">
          <c:if test="${user != null}">
            <button onclick="location.href='/home/logout'" class="btn">
              Đăng xuất
            </button>

            <!-- phần này để xác thực không xóa -> nó chuyển đến trang /auth/reset-password   -->
            <button onclick="location.href='/auth/reset-password'" class="btn">
              Đổi mật khẩu
            </button>
            <!-- kết thúc phần sửa trang này  -->
            <button
              onclick="location.href='/user/details/${user.id}'"
              class="user-btn"
            >
              <i class="fa-solid fa-user"></i>
            </button>
          </c:if>

          <!-- Kiểm tra nếu chưa có user trong session -->
          <c:if test="${user == null}">
            <button onclick="location.href='/auth/login'" class="btn">
              Đăng nhập
            </button>
            <button onclick="location.href='/auth/register'" class="btn">
              Đăng ký
            </button>
          </c:if>
        </div>
      </nav>
    </header>
    <h2>Thêm Lịch Cho Sân: ${court.name}</h2>

    <!-- Form to add schedule -->
    <form
      action="${pageContext.request.contextPath}/manage-courts/add-schedules/${court.id}"
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
          <th>Người thuê</th>
          <th>Xác nhận</th>
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
                href="${pageContext.request.contextPath}/manage-courts/edit-schedule/${schedule.id}"
              >
                Sửa
              </a>
              <a
                href="${pageContext.request.contextPath}/manage-courts/delete-schedule/${schedule.id}"
                onclick="return confirm('Bạn có chắc chắn muốn xoá lịch này?');"
                style="color: red; display: inline"
              >
                Xoá
              </a>
            </td>
            <td>
              <c:if test="${!schedule.rented && schedule.renter == null}">
                Chưa có người thuê
              </c:if>
              <c:if test="${!schedule.rented && schedule.renter != null}">
                <button
                  onclick="location.href='/user/details/${schedule.renter.id}'"
                  class="renter-name"
                >
                  ${schedule.renter.username}
                </button>
                muốn thuê, vui lòng xác nhận
              </c:if>
              <c:if test="${schedule.rented}"
                ><button
                  onclick="location.href='/user/details/${schedule.renter.id}'"
                  class="renter-name"
                >
                  ${schedule.renter.username}
                </button>
                đã thuê
              </c:if>
            </td>
            <td>
              <form
                class="cancel-btn-wrapper"
                action="${pageContext.request.contextPath}/manage-courts/confirm/${schedule.id}"
                method="post"
              >
                <input type="hidden" name="courtId" value="${court.id}" />
                <input type="hidden" name="field" value="${court.name}" />
                <input
                  type="hidden"
                  name="email"
                  value="${schedule.renter.email}"
                />
                <input type="hidden" name="schedule" value="${schedule.time}" />
                <button type="submit" class="cancel-btn">Xác nhận</button>
              </form>
              <form
                class="cancel-btn-wrapper"
                action="${pageContext.request.contextPath}/manage-courts/cancel/${schedule.id}"
                method="post"
              >
                <input type="hidden" name="role" value="admin" />
                <input type="hidden" name="courtId" value="${court.id}" />
                <input type="hidden" name="field" value="${court.name}" />
                <input
                  type="hidden"
                  name="email"
                  value="${schedule.renter.email}"
                />
                <input type="hidden" name="schedule" value="${schedule.time}" />
                <button type="submit" class="cancel-btn">Hủy</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/manage-courts" class="back-link"
      >Quay lại danh sách sân</a
    >
  </body>
</html>
