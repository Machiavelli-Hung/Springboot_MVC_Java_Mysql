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
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
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
      }

      nav a {
        color: white;
        text-decoration: none;
      }

      .auth-buttons {
        float: right;
        margin-right: 1rem;
        margin-top: -1.6rem;
      }

      .btn {
        background-color: #eee;
        color: #1a4178;
        padding: 0.5rem 1rem;
        border-radius: 4px;
        text-decoration: none;
        margin-left: 1rem;
        display: inline-block;
        font-size: 0.8rem;
        font-weight: bold;
        border: none;
        cursor: pointer;
      }

      .court-details {
        flex: 3;
      }

      .court-info {
        background: white;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        padding: 2rem;
        margin-bottom: 2rem;
      }

      .court-images {
        display: flex;
        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
        gap: 1rem;
        margin: 1.5rem 0;
        justify-content: center;
      }

      .court-image {
        width: 100%;
        height: 150px;
        object-fit: cover;
        border-radius: 4px;
      }

      .court-address,
      .court-owner,
      .court-images-title {
        margin-top: 10px;
      }

      .court-owner-details {
        background-color: transparent;
        border: none;
        cursor: pointer;
        text-decoration: underline;
        font-size: 16px;
      }

      .court-owner-details:hover {
        color: cornflowerblue;
      }

      .schedule-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 1rem;
        background-color: #f9f9f9;
        border: 1px solid #ddd;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      }

      .schedule-table th {
        background-color: #1a4178;
        color: #fff;
        text-align: left;
        padding: 0.8rem;
      }

      .schedule-table td {
        padding: 0.8rem;
        border-top: 1px solid #ddd;
      }

      .schedule-table tr:hover {
        background-color: #f1f1f1;
      }

      .back-btn {
        background-color: #1a4178;
        color: white;
        padding: 0.5rem 1rem;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-top: 1rem;
      }
      .schedule-table .rent-btn {
        background-color: #28a745;
        color: white;
        padding: 0.5rem 1rem;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 0.9rem;
        transition: background-color 0.3s ease;
      }

      .schedule-table .rent-btn:hover {
        background-color: #218838;
      }

      .schedule-table td {
        padding: 0.8rem;
        border-top: 1px solid #ddd;
        vertical-align: middle;
      }
      .schedule-table td button {
        background-color: #eee;
        color: #1a4178;
        padding: 0.5rem 1rem;
        border-radius: 4px;
        text-decoration: none;
        display: inline-block;
        font-weight: bold;
        border: none;
        cursor: pointer;
      }
      .overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        backdrop-filter: blur(5px);
        z-index: 999;
      }

      .popup {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        z-index: 1000;
        text-align: center;
      }
      .popup button {
        margin-top: 15px;
        padding: 8px 20px;
        background-color: #1a4178;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
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
                    <input type="hidden" name="courtId" value="${court.id}" />
                    <input type="hidden" name="role" value="user" />
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
