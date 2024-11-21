<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> <%@
taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thêm Sân</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f4f6f9;
        margin: 0;
        padding: 0;
        color: #333;
      }

      h2 {
        text-align: center;
        color: #2c3e50;
        margin: 20px 0;
      }

      form {
        max-width: 600px;
        margin: 0 auto;
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      }

      label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
      }

      input[type="text"],
      input[type="number"],
      input[type="file"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 4px;
      }

      .error {
        color: red;
        font-size: 14px;
      }

      button {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #3498db;
        color: white;
        font-size: 16px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
      }

      button:hover {
        background-color: #2980b9;
      }

      .back-link {
        display: block;
        text-align: center;
        margin: 20px 0;
        color: #3498db;
        text-decoration: none;
        font-size: 16px;
      }

      .back-link:hover {
        text-decoration: underline;
      }

      .owner-selector {
        width: 100%;
        margin: 20px 0;
        height: 40px;
        border: 1px solid #ccc;
        border-radius: 4px;
      }
    </style>
  </head>
  <body>
    <h2>Thêm Sân</h2>

    <form:form
      action="${pageContext.request.contextPath}/courts/add"
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
    <a href="${pageContext.request.contextPath}/courts" class="back-link"
      >Quay lại danh sách sân</a
    >
  </body>
</html>
