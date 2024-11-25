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
      type="text/css"
      href="${pageContext.request.contextPath}/css/css_admin/edit-schedule.css"
    />
    <link rel="icon" href="/images/logo.png" type="image/x-icon" />
    <title>Chỉnh sửa lịch</title>
  </head>
  <body>
    <h2>Chỉnh sửa lịch</h2>

    <!-- Form to edit schedule -->
    <form
      action="${pageContext.request.contextPath}/manage-courts/edit-schedule/${schedule.id}"
      method="post"
    >
      <div>
        <label for="time">Thời gian</label>
        <input
          type="text"
          id="time"
          name="time"
          value="${schedule.time}"
          required
        />
      </div>
      <div>
        <label for="price">Giá thuê</label>
        <input
          type="number"
          id="price"
          name="price"
          value="${schedule.price}"
          required
        />
      </div>
      <div>
        <label for="rented">Trạng thái</label>
        <select id="rented" name="rented" required>
          <c:choose>
            <c:when test="${schedule.rented}">
              <option value="true" selected>Đã thuê</option>
              <option value="false">Chưa thuê</option>
            </c:when>
            <c:otherwise>
              <option value="true">Đã thuê</option>
              <option value="false" selected>Chưa thuê</option>
            </c:otherwise>
          </c:choose>
        </select>
      </div>
      <button type="submit">Cập nhật lịch</button>
    </form>
    <a href="${pageContext.request.contextPath}/manage-courts" class="back-link"
      >Quay lại danh sách sân</a
    >
  </body>
</html>
