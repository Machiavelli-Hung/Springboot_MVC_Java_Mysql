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
      href="${pageContext.request.contextPath}/css/css_user/home.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
      integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
  </head>

  <body>
    <!-- Header -->
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
              <a href="/manage-courts"><span>Danh sách sân</span></a>
            </c:if>
          </c:if>
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
            <button onclick="location.href='/login'" class="btn">
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
      <h3>DANH SÁCH SÂN CẦU LÔNG</h3>
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
                <p>${court.owner.phoneNumber}</p>
              </div>
              <!-- Hiển thị chủ sân -->
              <div class="address">
                <i class="fa-solid fa-location-dot"></i>
                <p>${court.address}</p>
              </div>

              <button class="btn-detail" onclick="checkLogin(${court.id})">
                Chi tiết
              </button>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
    <script>
      function checkLogin(courtId) {
        // Kiểm tra nếu người dùng chưa đăng nhập (user = null)
        var user = ${user != null ? 'true' : 'false'};

        if (!user) {
          // Hiển thị popup yêu cầu đăng nhập
          alert("Vui lòng đăng nhập để xem thông tin chi tiết!");
        } else {
          // Nếu người dùng đã đăng nhập, chuyển hướng đến trang chi tiết
          window.location.href = "/manage-courts/details/" + courtId;
        }
      }
    </script>
  </body>
</html>
