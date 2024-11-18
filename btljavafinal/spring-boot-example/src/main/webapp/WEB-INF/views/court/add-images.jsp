<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
contentType="text/html" pageEncoding="UTF-8" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Thêm ảnh cho sân</title>
    <style>
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
      }
      .delete-btn {
        position: absolute;
        top: 2px;
        right: 2px;
        background-color: red;
        color: white;
        border: none;
        border-radius: 50%;
        width: 20px;
        height: 20px;
        font-size: 14px;
        cursor: pointer;
      }
    </style>
    <script>
      let selectedFiles = []; // Array to hold all selected files

      function previewImages() {
        const previewContainer = document.getElementById("preview-container");
        const newFiles = Array.from(
          document.getElementById("file-input").files
        );

        // Add new files to the selectedFiles array
        selectedFiles = selectedFiles.concat(newFiles);

        // Clear previewContainer and regenerate previews for all selected files
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
              selectedFiles.splice(index, 1); // Remove from selectedFiles array
              previewItem.remove(); // Remove the preview item from DOM
            };

            previewItem.appendChild(img);
            previewItem.appendChild(deleteBtn);
            previewContainer.appendChild(previewItem);
          };
          reader.readAsDataURL(file);
        });
      }
    </script>
    <script>
      function confirmDeleteImage(event, imageId) {
        event.preventDefault(); // Ngừng hành động mặc định của thẻ a

        // Hiển thị popup xác nhận
        const confirmation = confirm("Bạn có chắc chắn muốn xóa ảnh này?");
        if (confirmation) {
          // Nếu người dùng đồng ý, thực hiện yêu cầu xóa
          window.location.href = event.target.href; // Chuyển hướng đến URL xóa ảnh
        }
      }
    </script>
  </head>
  <body>
    <h2>Thêm ảnh cho sân</h2>

    <!-- Form to add images -->
    <form
      action="${pageContext.request.contextPath}/courts/add-images/${court.id}"
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
      <br /><br />

      <!-- Preview selected images -->
      <div id="preview-container" class="preview-container"></div>

      <button type="submit">Thêm ảnh</button>
    </form>

    <br /><br />

    <!-- Display existing images of the court -->
    <h3>Ảnh hiện tại của sân:</h3>
    <div class="preview-container">
      <c:forEach var="image" items="${court.images}">
        <div class="preview-item">
          <img
            src="${pageContext.request.contextPath}/uploads/${image.name}"
            alt="Image"
          />
          <!-- Add delete button for each image -->
          <a
            class="delete-btn"
            href="${pageContext.request.contextPath}/courts/delete-image/${image.id}"
            onclick="return confirm('Bạn có chắc chắn muốn xoá ảnh này?');"
          >
            X
          </a>
        </div>
      </c:forEach>
    </div>

    <br />
    <div>
      <a href="${pageContext.request.contextPath}/courts"
        >Quay lại danh sách sân</a
      >
    </div>
  </body>
</html>