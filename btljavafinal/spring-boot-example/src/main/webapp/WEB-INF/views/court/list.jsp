<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@page
contentType="text/html" pageEncoding="UTF-8"%>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Danh sách các sân</title>
    <style>
      /* CSS cho modal */
      .modal {
        display: none; /* Ẩn modal mặc định */
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.4); /* Màu nền mờ */
      }

      .modal-content {
        background-color: #fefefe;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%; /* Chiều rộng của modal */
        max-width: 400px; /* Giới hạn chiều rộng modal */
      }

      .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
      }

      .close:hover,
      .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
      }

      .modal-buttons {
        display: flex;
        justify-content: space-around;
      }

      .modal-buttons button {
        padding: 10px 20px;
        cursor: pointer;
      }
    </style>
    <script type="text/javascript">
      // JavaScript để hiển thị modal
      function showModal(courtId) {
        // Lấy modal và nút đóng
        var modal = document.getElementById("deleteModal");
        var span = document.getElementsByClassName("close")[0];

        // Hiển thị modal
        modal.style.display = "block";

        // Xử lý xác nhận xóa
        document.getElementById("confirmDelete").onclick = function () {
          window.location.href = "/courts/delete/" + courtId; // Nếu xác nhận, chuyển hướng tới xóa sân
        };

        // Xử lý đóng modal
        span.onclick = function () {
          modal.style.display = "none";
        };

        // Nếu người dùng click ra ngoài modal, đóng modal
        window.onclick = function (event) {
          if (event.target == modal) {
            modal.style.display = "none";
          }
        };
      }
    </script>
  </head>
  <body>
    <h2>Danh sách các sân</h2>
    <div>
      <form
        action="${pageContext.request.contextPath}/courts/search"
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
    <div>
      <a
        href="${pageContext.request.contextPath}/courts/add"
        class="btn btn-primary"
        >Tạo sân mới</a
      >
    </div>
    <table border="1">
      <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Địa chỉ</th>
        <th>Hoạt động</th>
      </tr>
      <c:forEach items="${courts}" var="court">
        <tr>
          <td>${court.id}</td>
          <td>${court.name}</td>
          <td>${court.address}</td>
          <td>
            <a
              href="${pageContext.request.contextPath}/courts/add-images/${court.id}"
              >Thêm ảnh</a
            >
            <a
              href="${pageContext.request.contextPath}/courts/add-schedules/${court.id}"
              >Thêm lịch</a
            >
            <a href="${pageContext.request.contextPath}/courts/edit/${court.id}"
              >Sửa</a
            >
            <a href="javascript:void(0);" onclick="showModal(${court.id})"
              >Xoá</a
            >
          </td>
        </tr>
      </c:forEach>
    </table>

    <!-- Modal -->
    <div id="deleteModal" class="modal">
      <div class="modal-content">
        <span class="close">&times;</span>
        <h3>Bạn có chắc chắn muốn xóa sân này?</h3>
        <div class="modal-buttons">
          <button id="confirmDelete">Xóa</button>
          <button
            onclick="document.getElementById('deleteModal').style.display='none'"
          >
            Hủy
          </button>
        </div>
      </div>
    </div>
  </body>
</html>
