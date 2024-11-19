<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
contentType="text/html" pageEncoding="UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Chỉnh sửa lịch</title>
  </head>
  <body>
    <h2>Chỉnh sửa lịch</h2>
    <form
      action="${pageContext.request.contextPath}/courts/edit-schedule/${schedule.id}"
      method="post"
    >
      <div>
        <label for="time">Thời gian</label>
        <input type="text" name="time" value="${schedule.time}" required />
      </div>
      <div>
        <label for="price">Giá thuê</label>
        <input type="number" name="price" value="${schedule.price}" required />
      </div>
      <div>
        <label for="rented">Trạng thái</label>
        <select name="rented" required>
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
  </body>
</html>
