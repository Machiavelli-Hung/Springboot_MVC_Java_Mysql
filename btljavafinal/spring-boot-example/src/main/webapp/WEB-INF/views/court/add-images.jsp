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
    <title>Thêm ảnh cho sân</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        line-height: 1.6;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
        color: #333;
      }

      h2,
      h3 {
        color: #2c3e50;
        text-align: center;
      }

      form,
      .preview-container {
        margin: 20px auto;
        max-width: 600px;
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      }

      label {
        font-weight: bold;
      }

      input[type="file"] {
        display: block;
        margin: 10px 0;
        padding: 8px;
        font-size: 16px;
      }

      button[type="submit"] {
        display: inline-block;
        background-color: #3498db;
        color: #fff;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
      }

      button[type="submit"]:hover {
        background-color: #2980b9;
      }

      .preview-container {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        margin-top: 15px;
      }

      .preview-item {
        position: relative;
        display: inline-block;
      }

      .preview-item img {
        max-width: 100px;
        max-height: 100px;
        border: 1px solid #ddd;
        border-radius: 4px;
        padding: 5px;
        background-color: #fff;
      }

      .delete-btn {
        position: absolute;
        top: 2px;
        right: 2px;
        background-color: #e74c3c;
        color: white;
        border: none;
        border-radius: 50%;
        width: 20px;
        height: 20px;
        font-size: 14px;
        line-height: 20px;
        text-align: center;
        cursor: pointer;
      }

      .delete-btn:hover {
        background-color: #c0392b;
      }

      .back-link {
        display: block;
        text-align: center;
        margin: 20px;
        text-decoration: none;
        font-size: 16px;
        color: #3498db;
      }

      .back-link:hover {
        text-decoration: underline;
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
        margin: 0;
        padding: 0;
      }

      nav a {
        color: white;
        text-decoration: none;
      }

      .auth-buttons {
        align-items: center;
        display: flex;
        float: right;
        margin-right: 1rem;
        /* Thêm khoảng cách từ cạnh phải */
        margin-top: -1.6rem;
        /* Căn chỉnh từ phía trên */
        align-items: center;
        display: flex;
      }

      .btn {
        background-color: #eee;
        color: #1a4178;
        padding: 0.5rem 1rem;
        border-radius: 4px;
        text-decoration: none;
        margin-left: 1rem;
        display: inline-block;
        /* Đảm bảo các nút nằm ngang */
        position: relative;
        /* Bỏ phần margin-top âm */
        font-size: 0.8rem;
        /* Tăng kích thước chữ (có thể điều chỉnh) */
        font-weight: bold;
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
    <script>
      let selectedFiles = [];

      function previewImages() {
        const previewContainer = document.getElementById("preview-container");
        const newFiles = Array.from(
          document.getElementById("file-input").files
        );

        selectedFiles = selectedFiles.concat(newFiles);
        previewContainer.innerHTML = "";

        selectedFiles.forEach((file, index) => {
          const reader = new FileReader();
          reader.onload = function (e) {
            const previewItem = document.createElement("div");
            previewItem.classList.add("preview-item");

            const img = document.createElement("img");
            img.src = e.target.result;

            const deleteBtn = document.createElement("button");
            deleteBtn.innerHTML = "X";
            deleteBtn.classList.add("delete-btn");
            deleteBtn.onclick = function () {
              selectedFiles.splice(index, 1);
              previewItem.remove();
            };

            previewItem.appendChild(img);
            previewItem.appendChild(deleteBtn);
            previewContainer.appendChild(previewItem);
          };
          reader.readAsDataURL(file);
        });
      }

      function confirmDeleteImage(event, imageId) {
        event.preventDefault();
        const confirmation = confirm("Bạn có chắc chắn muốn xóa ảnh này?");
        if (confirmation) {
          window.location.href = event.target.href;
        }
      }
    </script>
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
    <h2>Thêm ảnh cho sân</h2>

    <c:if test="${not empty errorMessage}">
      <div style="color: red; font-weight: bold">${errorMessage}</div>
    </c:if>

    <c:out value="${errorMessage}" />

    <!-- Form to add images -->
    <form
      action="${pageContext.request.contextPath}/manage-courts/add-images/${court.id}"
      method="post"
      enctype="multipart/form-data"
    >
      <label for="file-input">Chọn ảnh:</label>
      <input
        type="file"
        id="file-input"
        name="files"
        multiple
        onchange="previewImages()"
      />
      <div id="preview-container" class="preview-container"></div>
      <button type="submit">Thêm ảnh</button>
    </form>

    <!-- Display existing images of the court -->
    <h3>Ảnh hiện tại của sân:</h3>
    <div class="preview-container">
      <c:forEach var="image" items="${court.images}">
        <div class="preview-item">
          <img
            src="${pageContext.request.contextPath}/images/${image.name}"
            alt="Image"
          />
          <a
            class="delete-btn"
            href="${pageContext.request.contextPath}/manage-courts/delete-image/${image.id}"
            onclick="return confirm('Bạn có chắc chắn muốn xoá ảnh này?');"
          >
            X
          </a>
        </div>
      </c:forEach>
    </div>

    <a href="${pageContext.request.contextPath}/manage-courts" class="back-link"
      >Quay lại danh sách sân</a
    >
  </body>
</html>
