<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
      integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <title>Danh sách các sân</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
      }

      h2 {
        text-align: center;
      }

      .search-container {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
      }

      .search-container input[type="text"] {
        width: 300px;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ddd;
        border-radius: 5px;
      }

      .search-container button {
        padding: 10px 20px;
        margin-left: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
      }

      .search-container button:hover {
        background-color: #0056b3;
      }

      .btn-primary {
        display: block;
        margin: 20px auto;
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        text-align: center;
        width: fit-content;
      }

      .btn-primary:hover {
        background-color: #0056b3;
      }

      /* Grid layout */
      .grid-container {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
        margin: 0 20px;
      }

      .grid-item {
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 20px;
        text-align: center;
        background-color: #f9f9f9;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s;
      }

      .grid-item:hover {
        transform: translateY(-5px);
      }

      .grid-item h3 {
        margin: 10px 0;
        font-size: 18px;
        color: #333;
      }

      .grid-item p {
        font-size: 14px;
        color: #666;
      }

      .grid-item a {
        display: inline-block;
        margin: 5px;
        padding: 8px 15px;
        background-color: #007bff;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        font-size: 14px;
      }

      .grid-item a:hover {
        background-color: #0056b3;
      }

      .grid-item a.delete {
        background-color: #dc3545;
      }

      .grid-item a.delete:hover {
        background-color: #c82333;
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
    <h2>Danh sách các sân</h2>

    <!-- Thanh tìm kiếm -->
    <div class="search-container">
      <form
        action="${pageContext.request.contextPath}/manage-courts/search"
        method="GET"
      >
        <input
          type="text"
          name="keyword"
          placeholder="Nhập tên hoặc địa chỉ cần tìm"
          value="${param.keyword}"
        />
        <button type="submit">Tìm kiếm</button>
      </form>
    </div>

    <a
      href="${pageContext.request.contextPath}/manage-courts/add"
      class="btn-primary"
      >Tạo sân mới</a
    >

    <div class="grid-container">
      <c:if test="${courts != null && !courts.isEmpty()}">
        <c:forEach items="${courts}" var="court">
          <div class="grid-item">
            <h3>${court.name}</h3>
            <p>Địa chỉ: ${court.address}</p>
            <div>
              <a
                href="${pageContext.request.contextPath}/manage-courts/add-images/${court.id}"
                >Thêm ảnh</a
              >
              <a
                href="${pageContext.request.contextPath}/manage-courts/add-schedules/${court.id}"
                >Thêm lịch</a
              >
              <a
                href="${pageContext.request.contextPath}/manage-courts/edit/${court.id}"
                >Sửa</a
              >
              <a
                href="${pageContext.request.contextPath}/manage-courts/delete/${court.id}"
                class="delete"
                onclick="return confirm('Bạn có chắc chắn muốn xóa sân này?')"
                >Xóa</a
              >
            </div>
          </div>
        </c:forEach>
      </c:if>
      <c:if test="${courts == null || courts.isEmpty()}">
        <p style="text-align: center; grid-column: span 3">
          Không tìm thấy sân nào.
        </p>
      </c:if>
    </div>
  </body>
</html>
