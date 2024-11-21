<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Danh sách các sân</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 20px;
      }

      h2 {
        text-align: center;
      }

      .search-container {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
      }

      .search-container input[type="text"] {
        width: 300px;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ddd;
        border-radius: 5px;
      }

      .search-container button {
        padding: 10px 20px;
        margin-left: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
      }

      .search-container button:hover {
        background-color: #0056b3;
      }

      .btn-primary {
        display: block;
        margin: 20px auto;
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        text-align: center;
        width: fit-content;
      }

      .btn-primary:hover {
        background-color: #0056b3;
      }

      /* Grid layout */
      .grid-container {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
      }

      .grid-item {
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 20px;
        text-align: center;
        background-color: #f9f9f9;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s;
      }

      .grid-item:hover {
        transform: translateY(-5px);
      }

      .grid-item h3 {
        margin: 10px 0;
        font-size: 18px;
        color: #333;
      }

      .grid-item p {
        font-size: 14px;
        color: #666;
      }

      .grid-item a {
        display: inline-block;
        margin: 5px;
        padding: 8px 15px;
        background-color: #007bff;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        font-size: 14px;
      }

      .grid-item a:hover {
        background-color: #0056b3;
      }

      .grid-item a.delete {
        background-color: #dc3545;
      }

      .grid-item a.delete:hover {
        background-color: #c82333;
      }
    </style>
  </head>
  <body>
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
