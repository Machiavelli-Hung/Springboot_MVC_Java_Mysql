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
      href="${pageContext.request.contextPath}/css/css_user/manage-user.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
      integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="icon" href="/images/logo.png" type="image/x-icon" />
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

    <!-- Main content -->
    <div class="main-content">
      <div class="list_customer">
        <h3 style="text-align: center">Danh sách khách hàng</h3>

        <table border="1">
          <tr>
            <th>UserID</th>
            <th>Username</th>
            <!-- <th>Password</th> -->
            <th>Email</th>
            <th>Số điện thoại</th>
            <th>Hành động</th>
          </tr>
          <c:forEach var="customer" items="${customers}">
            <tr>
              <td>${customer.id}</td>
              <td>${customer.username}</td>
              <!-- <td>${customer.password}</td> -->
              <td>${customer.email}</td>
              <td>${customer.phoneNumber}</td>
              <td>
                <a href="/home/edit/${customer.id}">Edit</a>
                <form
                  action="/home/delete/${customer.id}"
                  method="post"
                  style="display: inline"
                >
                  <input
                    type="submit"
                    value="Delete"
                    onclick="return confirm('Bạn có chắc chắn muốn xóa không?');"
                  />
                </form>
              </td>
            </tr>
          </c:forEach>
        </table>
      </div>
    </div>
  </body>
  <footer></footer>
</html>
