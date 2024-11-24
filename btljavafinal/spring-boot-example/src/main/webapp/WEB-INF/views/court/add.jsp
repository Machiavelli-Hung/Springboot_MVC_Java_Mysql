<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> <%@
taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
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
    <title>Thêm Sân</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f4f6f9;
        margin: 0;
        padding: 0;
        color: #333;
      }

      h2 {
        text-align: center;
        color: #2c3e50;
        margin: 20px 0;
      }

      form {
        max-width: 600px;
        margin: 0 auto;
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      }

      label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
      }

      input[type="text"],
      input[type="number"],
      input[type="file"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 4px;
      }

      .error {
        color: red;
        font-size: 14px;
      }

      button {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #3498db;
        color: white;
        font-size: 16px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
      }

      button:hover {
        background-color: #2980b9;
      }

      .back-link {
        display: block;
        text-align: center;
        margin: 20px 0;
        color: #3498db;
        text-decoration: none;
        font-size: 16px;
      }

      .back-link:hover {
        text-decoration: underline;
      }

      .owner-selector {
        width: 100%;
        margin: 20px 0;
        height: 40px;
        border: 1px solid #ccc;
        border-radius: 4px;
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
    <h2>Thêm Sân</h2>

    <form:form
      action="${pageContext.request.contextPath}/manage-courts/add"
      modelAttribute="court"
      method="post"
    >
      <!-- Tên Sân -->
      <div>
        <form:label path="name">Tên Sân:</form:label>
        <form:input path="name" />
        <form:errors path="name" cssClass="error" />
      </div>

      <!-- Địa Chỉ -->
      <div>
        <form:label path="address">Địa Chỉ:</form:label>
        <form:input path="address" />
        <form:errors path="address" cssClass="error" />
      </div>

      <!-- Mã Chủ Sân -->
      <div>
        <form:label path="owner.id">Chọn Chủ Sân:</form:label>
        <form:select class="owner-selector" path="owner.id">
          <c:forEach var="owner" items="${owners}">
            <option value="${owner.id}">${owner.username}</option>
          </c:forEach>
        </form:select>
        <form:errors path="owner.id" cssClass="error" />
      </div>

      <!-- Nút Thêm -->
      <button type="submit">Thêm Sân</button>
    </form:form>

    <!-- Link quay lại danh sách sân -->
    <a href="${pageContext.request.contextPath}/manage-courts" class="back-link"
      >Quay lại danh sách sân</a
    >
  </body>
</html>
