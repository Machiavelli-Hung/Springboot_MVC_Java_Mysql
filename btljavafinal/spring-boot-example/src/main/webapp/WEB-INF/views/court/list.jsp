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
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/css/css_admin/list.css"
    />
    <link rel="icon" href="/images/logo.png" type="image/x-icon" />
    <title>Danh sách các sân</title>
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
