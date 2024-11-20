<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <title>Details of Court</title>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
        </head>

        <body>
            <h2>Thông tin chi tiết sân</h2>
            <div>
                <h3>${court.name}</h3>
                <p><strong>Địa chỉ:</strong> ${court.address}</p>
                <p><strong>Chủ sở hữu:</strong> ${court.owner.username}</p>

                <!-- Hiển thị các hình ảnh -->
                <h4>Hình ảnh của sân</h4>
                <c:forEach var="image" items="${court.images}">
                    <img src="/uploads/${image.name}" alt="court image"
                        style="width: 200px; height: 150px; object-fit: cover" />
                </c:forEach>

                <!-- Hiển thị lịch sân -->
                <h4>Lịch sân</h4>
                <table>
                    <thead>
                        <tr>
                            <th>Thời gian</th>
                            <th>Giá</th>
                            <th>Trạng thái</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="schedule" items="${court.schedules}">
                            <tr>
                                <td>${schedule.time}</td>
                                <td>${schedule.price}</td>
                                <td>${schedule.rented ? 'Đã thuê' : 'Chưa thuê'}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <button onclick="window.history.back();">Quay lại</button>
            </div>
        </body>

        </html>