<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
contentType="text/html" pageEncoding="UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Thêm Lịch Cho Sân</title>
  </head>
  <body>
    <h2>Thêm Lịch Cho Sân: ${court.name}</h2>
    <form
      action="${pageContext.request.contextPath}/courts/add-schedules/${court.id}"
      method="post"
    >
      <div>
        <label for="times">Buổi</label>
        <input
          type="text"
          name="times"
          placeholder="Buổi sáng, Buổi chiều"
          required
        />
      </div>
      <div>
        <label for="prices">Giá thuê</label>
        <input type="number" name="prices" placeholder="Giá" required />
      </div>
      <button type="submit">Thêm Lịch</button>
    </form>

    <h3>Danh sách các lịch hiện tại:</h3>
    <table border="1">
      <tr>
        <th>Thời gian</th>
        <th>Giá</th>
        <th>Trạng thái</th>
        <th>Hành động</th>
      </tr>
      <c:forEach items="${schedules}" var="schedule">
        <tr>
          <td>${schedule.time}</td>
          <td>${schedule.price}</td>
          <td>${schedule.isRented() ? 'Đã thuê' : 'Chưa thuê'}</td>
          <td>
            <!-- Link to Edit schedule -->
            <a
              href="${pageContext.request.contextPath}/courts/edit-schedule/${schedule.id}"
              >Sửa</a
            >

            <!-- Link to Delete schedule -->
            <a
              href="${pageContext.request.contextPath}/courts/delete-schedule/${schedule.id}"
              onclick="return confirm('Bạn có chắc chắn muốn xoá lịch này?');"
            >
              Xoá
            </a>
          </td>
        </tr>
      </c:forEach>
    </table>
  </body>
</html>
