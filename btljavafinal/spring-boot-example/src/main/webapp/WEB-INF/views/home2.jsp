<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>JAVA_N4.10</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/css/css_user/home2.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css"
      integrity="sha512-9xKTRVabjVeZmc+GUW8GgSmcREDunMM+Dt/GrzchfN8tkwHizc5RP4Ok/MXFFy5rIjJjzhndFScTceq5e6GvVQ=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: Arial, sans-serif;
      }

      /* Header styles */
      header {
        background-color: #1a4178;
        padding: 1rem;
        color: white;
      }

      nav ul {
        display: flex;
        list-style: none;
        gap: 2rem;
      }

      nav a {
        color: white;
        text-decoration: none;
      }

      .auth-buttons {
        float: right;
        margin-right: 1rem;
        /* Thêm khoảng cách từ cạnh phải */
        margin-top: -1.6rem;
        /* Căn chỉnh từ phía trên */
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

      .list_stadium {
        display: flex;
        flex-direction: column;
        align-items: center;
        /* Căn giữa theo chiều ngang */
        text-align: center;
        /* Căn giữa văn bản */
        margin-top: 5vh;
        margin-bottom: -10vh;
        margin-right: 18vh;
      }

      .list_stadium h3 {
        font-size: 1.5rem;
        color: #1a4178;
        margin-bottom: 1rem;
        text-transform: uppercase;
        border-bottom: 2px solid #ffc107;
        display: inline-block;
        padding-bottom: 0.5rem;
        align-content: center;
        margin-left: 10%;
      }

      /* Main content styles */
      .main-content {
        display: flex;
        padding: 2rem;
      }

      .venues-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
        gap: 1rem;
        flex: 3;
        margin-top: 4rem;
        /* Điều chỉnh thêm khoảng cách nếu cần */
      }

      .venue-card {
        border: 1px solid #ddd;
        padding: 1rem;
        border-radius: 8px;
        background: white;
        position: relative;
        height: 451px;
      }

      .venue-card h3 {
        color: #1a4178;
        margin-bottom: 1rem;
      }

      .venue-card image {
        margin-bottom: 10px;
      }

      .venue-card .content_image {
        position: absolute;
        bottom: 10px;
      }

      .btn-detail {
        display: inline-block;
        background-color: #1a4178;
        color: white;
        padding: 0.5rem 1rem;
        border-radius: 4px;
        text-decoration: none;
        margin-top: 1rem;
      }

      /* Register section */
      .register-section {
        background-color: #ffc107;
        padding: 2rem;
        text-align: center;
      }

      .register-section form {
        display: flex;
        justify-content: center;
        gap: 1rem;
        margin-top: 1rem;
      }

      .register-section input {
        padding: 0.5rem;
        border: 1px solid #ddd;
        border-radius: 4px;
      }

      .btn-submit {
        background-color: #1a4178;
        color: white;
        padding: 0.5rem 2rem;
        border: none;
        border-radius: 4px;
        cursor: pointer;
      }

      /* Footer */
      footer {
        background-color: #1a4178;
        padding: 2rem;
      }
    </style>
  </head>

  <body>
    <!-- Header -->
    <header>
      <nav>
        <ul>
          <li><a href="/home">Trang chủ</a></li>
          <li><a href="#">Giới thiệu</a></li>
          <li><a href="#">Chính sách</a></li>
          <li><a href="#">Điều khoản</a></li>
          <!-- <li><a href="#">Dành cho chủ sân</a></li> -->
          <li><a href="#">Liên hệ</a></li>
        </ul>
        <div class="auth-buttons">
          <c:if test="${user != null}">
            <button onclick="location.href='/home/logout'" class="btn">
              Đăng xuất
            </button>
            <button onclick="location.href='/home/changePassword'" class="btn">
              Đổi mật khẩu
            </button>
            <button
              onclick="location.href='/user/details/${user.id}'"
              class="user-btn"
            >
              <i class="fa-solid fa-user"></i>
            </button>
          </c:if>

          <!-- Kiểm tra nếu chưa có user trong session -->
          <c:if test="${user == null}">
            <button onclick="location.href='/user/login'" class="btn">
              Đăng nhập
            </button>
            <button onclick="location.href='/user/register'" class="btn">
              Đăng ký
            </button>
          </c:if>
        </div>
      </nav>
    </header>
    <div class="list_stadium">
      <h3>DANH SÁCH SÂN BÃI</h3>
    </div>
    <!-- Main content -->
    <div class="main-content">
      <div class="venues-grid">
        <div class="venue-card">
          <h3>Tennis Tân Trường</h3>
          <img
            src="/images/s1.png"
            style="width: 100%; height: 60%; object-fit: cover"
            alt="san1"
          />
          <div class="content_image">
            <p>0908344582</p>
            <p>
              96 Đường Đào Trí, phường Phú Thuận, Quận 7, Hồ Chí Minh, Việt Nam
            </p>
            <a href="#" class="btn-detail">Chi tiết</a>
          </div>
        </div>

        <div class="venue-card">
          <h3>Saigon Padel</h3>
          <img
            src="/images/s2.png"
            style="width: 100%; height: 60%; object-fit: cover"
            alt="san1"
          />
          <div class="content_image">
            <p>0903920094</p>
            <p>
              Khu Dân Cư Conic, Đường Nguyễn Văn Linh, Bình Chánh, Hồ Chí Minh,
              Việt Nam
            </p>
            <a href="#" class="btn-detail">Chi tiết</a>
          </div>
        </div>

        <div class="venue-card">
          <h3>Hoàng Nghệu Tennis & Pickleball</h3>
          <img
            src="/images/s3.png"
            style="width: 100%; height: 60%; object-fit: cover"
            alt="san1"
          />
          <div class="content_image">
            <p>941172736</p>
            <p>
              Khu Dân Cư Conic, Đường Nguyễn Văn Linh, Bình Chánh, Hồ Chí Minh,
              Việt Nam
            </p>
            <a href="#" class="btn-detail">Chi tiết</a>
          </div>
        </div>
        <div class="venue-card">
          <h3>Saigon Padel</h3>
          <img
            src="/images/s2.png"
            style="width: 100%; height: 60%; object-fit: cover"
            alt="san1"
          />
          <div class="content_image">
            <p>0903920094</p>
            <p>
              Khu Dân Cư Conic, Đường Nguyễn Văn Linh, Bình Chánh, Hồ Chí Minh,
              Việt Nam
            </p>
            <a href="#" class="btn-detail">Chi tiết</a>
          </div>
        </div>
        <div class="venue-card">
          <h3>Saigon Padel</h3>
          <img
            src="/images/s2.png"
            style="width: 100%; height: 60%; object-fit: cover"
            alt="san1"
          />
          <div class="content_image">
            <p>0903920094</p>
            <p>
              Khu Dân Cư Conic, Đường Nguyễn Văn Linh, Bình Chánh, Hồ Chí Minh,
              Việt Nam
            </p>
            <a href="#" class="btn-detail">Chi tiết</a>
          </div>
        </div>
      </div>
    </div>
  </body>
  <footer></footer>
</html>
