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
      href="${pageContext.request.contextPath}/css/css_user/chusan.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css"
      integrity="sha512-9xKTRVabjVeZmc+GUW8GgSmcREDunMM+Dt/GrzchfN8tkwHizc5RP4Ok/MXFFy5rIjJjzhndFScTceq5e6GvVQ=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
  </head>

  <body>
    <!-- Header -->
    <header>
      <nav>
        <ul>
          <li><a href="/chusan">Trang chủ</a></li>
          <c:if test="${user != null}">
            <a href="/chusan/showuser"><span>Danh sách người dùng</span></a>
            <a href="/chusan/showuser"><span>Danh sách sân</span></a>
          </c:if>
          <li><a href="#">Giới thiệu</a></li>
          <li><a href="#">Chính sách</a></li>
          <li><a href="#">Điều khoản</a></li>
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
        <!-- Lặp qua danh sách sân -->
        <c:forEach var="court" items="${courts}">
          <div class="venue-card">
            <h3>${court.name}</h3>
            <img
              src="/images/${court.images[0].name}"
              style="width: 100%; height: 60%; object-fit: cover"
              alt="san1"
            />
            <div class="content_image">
              <div class="phone-number">
                <i class="fa-solid fa-phone"></i>
                <p>  ${court.owner.phoneNumber}</p>
              </div>
              <!-- Hiển thị chủ sân -->
              <div class="address">
                <i class="fa-solid fa-location-dot"></i>
                <p>  ${court.address}</p>
              </div>
              
              <a href="/courts/details/${court.id}" class="btn-detail">Chi tiết</a>
              

            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </body>
  <footer></footer>
</html>
