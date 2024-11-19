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
      href="${pageContext.request.contextPath}/css/css_user/showuser2.css"
    />
  </head>

  <body>
    <!-- Header -->
    <header>
      <nav>
        <ul>
          <li><a href="/chusan">Trang chủ</a></li>

          <li><a href="#">Giới thiệu</a></li>
          <li><a href="#">Chính sách</a></li>
          <li><a href="#">Điều khoản</a></li>
          <li><a href="#">Liên hệ</a></li>
          <c:if test="${customers != null}">
            <a href="/chusan/showuser"><span>Danh sách người dùng</span></a>
            <a href="/chusan/showuser"><span>Danh sách sân</span></a>
          </c:if>
        </ul>
        <div class="auth-buttons">
          <button onclick="location.href='/home/logout'" class="btn">
            Đăng xuất
          </button>
        </div>
      </nav>
    </header>

    <!-- Main content -->
    <div class="main-content">
      <div class="list_customer">
        <h3 style="text-align: center">Danh sách khách hàng</h3>

        <table border="1">
          <tr>
            <th>Id</th>
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
                <a href="/chusan/edit/${customer.id}">Edit</a>
                <form
                  action="/chusan/delete/${customer.id}"
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
