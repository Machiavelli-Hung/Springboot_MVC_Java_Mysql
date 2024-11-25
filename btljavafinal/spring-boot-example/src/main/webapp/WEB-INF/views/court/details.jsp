<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Chi tiết sân bóng</title>
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
      href="${pageContext.request.contextPath}/css/css_admin/details.css"
    />
    <link rel="icon" href="/images/logo.png" type="image/x-icon" />
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
    <div class="court-details">
      <div class="court-info">
        <h3>${court.name}</h3>
        <p class="court-address"><strong>Địa chỉ:</strong> ${court.address}</p>
        <p class="court-owner">
          <strong>Chủ sở hữu:</strong>
          <button
            onclick="location.href='/user/details/${court.owner.id}'"
            class="court-owner-details"
          >
            ${court.owner.username}
          </button>
        </p>

        <h4 class="court-images-title">Hình ảnh sân</h4>
        <div class="court-images">
          <c:forEach var="image" items="${court.images}">
            <img
              src="/images/${image.name}"
              alt="Hình ảnh sân"
              class="court-image"
            />
          </c:forEach>
        </div>

        <h4>Lịch sân</h4>
        <table class="schedule-table">
          <thead>
            <tr>
              <th>Thời gian</th>
              <th>Giá</th>
              <th>Trạng thái</th>
              <th>Thuê</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="schedule" items="${court.schedules}">
              <tr>
                <td>${schedule.time}</td>
                <td>${schedule.price}</td>
                <td>${schedule.rented ? 'Đã thuê' : 'Chưa thuê'}</td>
                <div class="overlay" id="overlay"></div>
                <div class="popup" id="popup">
                  <h3>
                    Bạn đã yêu cầu thuê sân, vui lòng chờ xác nhận của chủ sân!
                  </h3>
                  <button onclick="closePopup()">Đóng</button>
                </div>

                <!-- Thêm script -->
                <script>
                  function showPopup(formId) {
                    // Hiển thị popup
                    document.getElementById("overlay").style.display = "block";
                    document.getElementById("popup").style.display = "block";

                    // Lưu lại form ID để thực hiện gửi form khi xác nhận
                    document.getElementById("confirm-rent").onclick =
                      function () {
                        document.getElementById(formId).submit();
                      };
                  }

                  function closePopup() {
                    // Đóng popup
                    document.getElementById("overlay").style.display = "none";
                    document.getElementById("popup").style.display = "none";
                  }
                </script>

                <!-- Sửa nút "Thuê ngay" -->
                <td>
                  <form
                    action="/manage-courts/rent/${schedule.id}"
                    method="post"
                  >
                    <c:if test="${!schedule.rented && schedule.renter == null}">
                      <input
                        type="hidden"
                        name="name"
                        value="${user.username}"
                      />
                      <input
                        type="hidden"
                        name="email"
                        value="${court.owner.email}"
                      />
                      <input
                        type="hidden"
                        name="phone"
                        value="${user.phoneNumber}"
                      />
                      <input type="hidden" name="field" value="${court.name}" />
                      <input
                        type="hidden"
                        name="schedule"
                        value="${schedule.time}"
                      />
                      <button type="submit" class="rent-btn">Thuê ngay</button>
                    </c:if>
                  </form>
                  <form
                    action="/manage-courts/cancel/${schedule.id}"
                    method="post"
                  >
                    <input type="hidden" name="role" value="user" />
                    <input type="hidden" name="courtId" value="${court.id}" />
                    <input type="hidden" name="field" value="${court.name}" />
                    <input
                      type="hidden"
                      name="email"
                      value="${schedule.renter.email}"
                    />
                    <input
                      type="hidden"
                      name="schedule"
                      value="${schedule.time}"
                    />
                    <c:if test="${!schedule.rented && schedule.renter != null}">
                      <button
                        onclick="confirmCancel(${schedule.id})"
                        type="submit"
                        class="rent-btn"
                      >
                        Chờ xác nhận
                      </button>
                    </c:if>
                    <script>
                      function confirmCancel(scheduleId) {
                        const isConfirmed = confirm(
                          "Bạn có chắc chắn muốn hủy đặt lịch sân này không?"
                        );
                        if (isConfirmed) {
                          // Lấy form dựa trên scheduleId và gửi yêu cầu
                          document
                            .getElementById(`cancel-form-${scheduleId}`)
                            .submit();
                        }
                      }
                    </script>
                  </form>
                  <c:if
                    test="${schedule.rented && schedule.renter.id != user.id}"
                  >
                    Không thể thuê
                  </c:if>

                  <c:if
                    test="${schedule.rented && schedule.renter.id == user.id}"
                  >
                    Bạn đã đặt sân này
                  </c:if>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>

        <button onclick="window.history.back();" class="back-btn">
          Quay lại danh sách sân
        </button>
      </div>
    </div>
  </body>
</html>
