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
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/css/css_admin/add.css"
    />
    <title>Thêm Sân</title>
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
