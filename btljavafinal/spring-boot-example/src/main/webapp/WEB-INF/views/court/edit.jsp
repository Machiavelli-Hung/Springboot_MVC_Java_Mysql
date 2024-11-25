<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> <%@
taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
    rel="stylesheet"
    type="text/css"
    href="${pageContext.request.contextPath}/css/css_admin/edit.css"
  />
  <link rel="icon" href="/images/logo.png" type="image/x-icon" />
    <title>Chỉnh sửa sân</title>
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
