<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> <%@
taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chỉnh sửa sân</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
      }

      h2 {
        text-align: center;
        color: #2c3e50;
        margin-top: 20px;
      }

      form {
        max-width: 500px;
        margin: 20px auto;
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      }

      form div {
        margin-bottom: 15px;
      }

      form label {
        font-weight: bold;
        display: block;
        margin-bottom: 5px;
        color: #333;
      }

      form input[type="text"],
      form input[type="number"],
      textarea {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #f9f9f9;
      }

      .error {
        color: red;
        font-size: 14px;
        margin-top: 5px;
      }

      button {
        display: block;
        width: 100%;
        padding: 10px;
        font-size: 16px;
        color: white;
        background-color: #3498db;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
      }

      button:hover {
        background-color: #2980b9;
      }

      a {
        display: inline-block;
        margin-top: 10px;
        text-align: center;
        text-decoration: none;
        font-size: 16px;
        color: #555;
        transition: color 0.3s ease;
      }

      a:hover {
        color: #3498db;
      }

      .cancel-link {
        text-align: center;
        margin-top: 10px;
      }

      .cancel-link a {
        text-decoration: none;
        color: #555;
        font-size: 16px;
      }

      .cancel-link a:hover {
        color: #3498db;
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
    <h2>Chỉnh sửa sân</h2>

    <form:form
      action="${pageContext.request.contextPath}/manage-courts/edit/${court.id}"
      modelAttribute="court"
      method="post"
    >
      <!-- Tên sân -->
      <div>
        <form:label path="name">Tên sân:</form:label>
        <form:input path="name" />
        <form:errors path="name" cssClass="error" />
      </div>

      <!-- Địa chỉ sân -->
      <div>
        <form:label path="address">Địa chỉ:</form:label>
        <form:input path="address" />
        <form:errors path="address" cssClass="error" />
      </div>

      <div>
        <form:label path="owner.id">Chủ Sân:</form:label>
        <form:select class="owner-selector" path="owner.id">
          <c:forEach var="owner" items="${owners}">
            <option value="${owner.id}" <c:if test="${owner.id == court.owner.id}">selected</c:if>>
              ${owner.username}
            </option>
          </c:forEach>
        </form:select>
        <form:errors path="owner.id" cssClass="error" />
      </div>

      <!-- Nút Lưu -->
      <div>
        <button type="submit">Lưu thay đổi</button>
        <div class="cancel-link">
          <a href="${pageContext.request.contextPath}/manage-courts">Hủy</a>
        </div>
      </div>
    </form:form>
  </body>
</html>
