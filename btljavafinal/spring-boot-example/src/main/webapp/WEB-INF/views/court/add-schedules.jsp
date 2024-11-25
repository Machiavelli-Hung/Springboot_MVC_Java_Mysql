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
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/css/css_admin/add-schedules.css"
    />
    <link rel="icon" href="/images/logo.png" type="image/x-icon" />
    <title>Thêm Lịch Cho Sân</title>
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
