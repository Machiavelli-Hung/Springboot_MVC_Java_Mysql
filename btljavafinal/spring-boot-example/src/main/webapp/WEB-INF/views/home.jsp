<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <title>JAVA_N4.10</title>
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css_user/home2.css" />
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }

                body {
                    font-family: Arial, sans-serif;
                }

                /* Header styles */
                header {
                    background-color: #1a4178;
                    padding: 1rem;
                    color: white;
                }

                nav ul {
                    display: flex;
                    list-style: none;
                    gap: 2rem;
                }

                nav a {
                    color: white;
                    text-decoration: none;
                }

                .auth-buttons {
                    float: right;
                    margin-right: 1rem;
                    /* Thêm khoảng cách từ cạnh phải */
                    margin-top: -1.6rem;
                    /* Căn chỉnh từ phía trên */
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

                .list_stadium {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    /* Căn giữa theo chiều ngang */
                    text-align: center;
                    /* Căn giữa văn bản */
                    margin-top: 5vh;
                    margin-bottom: -10vh;
                    margin-right: 18vh;
                }

                .list_stadium h3 {
                    font-size: 1.5rem;
                    color: #1a4178;
                    margin-bottom: 1rem;
                    text-transform: uppercase;
                    border-bottom: 2px solid #ffc107;
                    display: inline-block;
                    padding-bottom: 0.5rem;
                    margin-left: 30%;
                }

                /* Main content styles */
                .main-content {
                    display: flex;
                    padding: 2rem;
                }

                .sidebar {
                    flex: 1;
                    padding-right: 2rem;
                }

                .sidebar ul {
                    list-style: none;
                }

                .sidebar li {
                    margin: 1rem 0;
                }

                .sidebar a {
                    text-decoration: none;
                    color: #333;
                }

                .sidebar h3 {
                    font-size: 1.5rem;
                    color: #1a4178;
                    margin-bottom: 1rem;
                    text-transform: uppercase;
                    border-bottom: 2px solid #ffc107;
                    display: inline-block;
                    padding-bottom: 0.5rem;
                }

                /* Định dạng bảng */
                .sidebar table {
                    width: 100%;
                    border-collapse: collapse;
                    /* Loại bỏ khoảng cách giữa các đường kẻ */
                    margin-top: 1rem;
                    background-color: #f9f9f9;
                    border: 1px solid #ddd;
                    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                }

                /* Định dạng cho tiêu đề các cột */
                .sidebar th {
                    background-color: #1a4178;
                    color: #fff;
                    text-align: left;
                    padding: 0.8rem;
                    font-size: 1rem;
                    font-weight: bold;
                }

                /* Định dạng cho nội dung các cột */
                .sidebar td {
                    padding: 0.8rem;
                    text-align: left;
                    font-size: 1rem;
                    color: #333;
                    border-top: 1px solid #ddd;
                    /* Đường kẻ giữa các hàng */
                }

                /* Hiệu ứng khi hover vào các hàng */
                .sidebar tr:hover {
                    background-color: #f1f1f1;
                }

                .venues-grid {
                    display: grid;
                    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
                    gap: 1rem;
                    flex: 3;
                    margin-top: 4rem;
                    /* Điều chỉnh thêm khoảng cách nếu cần */
                }

                .venue-card {
                    border: 1px solid #ddd;
                    padding: 1rem;
                    border-radius: 8px;
                    background: white;
                    position: relative;
                    height: 451px;
                }

                .venue-card h3 {
                    color: #1a4178;
                    margin-bottom: 1rem;
                }

                .venue-card image {
                    margin-bottom: 10px;
                }

                .venue-card .content_image {
                    position: absolute;
                    bottom: 10px;
                }

                .btn-detail {
                    display: inline-block;
                    background-color: #1a4178;
                    color: white;
                    padding: 0.5rem 1rem;
                    border-radius: 4px;
                    text-decoration: none;
                    margin-top: 1rem;
                }

                /* Register section */
                .register-section {
                    background-color: #ffc107;
                    padding: 2rem;
                    text-align: center;
                }

                .register-section form {
                    display: flex;
                    justify-content: center;
                    gap: 1rem;
                    margin-top: 1rem;
                }

                .register-section input {
                    padding: 0.5rem;
                    border: 1px solid #ddd;
                    border-radius: 4px;
                }

                .btn-submit {
                    background-color: #1a4178;
                    color: white;
                    padding: 0.5rem 2rem;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                }

                /* Footer */
                footer {
                    background-color: #1a4178;
                    padding: 2rem;
                }
            </style>
        </head>

        <body>
            <!-- Header -->
            <header>
                <nav>
                    <ul>
                        <li><a href="/home">Trang chủ</a></li>
                        <li><a href="#">Giới thiệu</a></li>
                        <li><a href="#">Chính sách</a></li>
                        <li><a href="#">Điều khoản</a></li>
                        <!-- <li><a href="#">Dành cho chủ sân</a></li> -->
                        <li><a href="#">Liên hệ</a></li>
                    </ul>
                    <div class="auth-buttons">
                        <c:if test="${user != null}">
                            <button onclick="location.href='/home/logout'" class="btn">
                                Đăng xuất
                            </button>
                            <button onclick="location.href='/home/changePassword'" class="btn">
                                Đổi mật khẩu
                            </button>
                        </c:if>

                        <!-- Kiểm tra nếu chưa có user trong session -->
                        <c:if test="${user == null}">
                            <button onclick="location.href='/user/login'" class="btn">
                                Đăng nhập
                            </button>
                            <button onclick="location.href='/user/register'" class="btn">
                                Đăng ký
                            </button>
                        </c:if>
                    </div>
                </nav>
            </header>
            <div class="list_stadium">
                <h3>DANH SÁCH SÂN BÃI</h3>
            </div>
            <!-- Main content -->
            <div class="main-content">
                <div class="sidebar">
                    <c:if test="${user != null}">
                        <h3>Thông tin người dùng</h3>
                        <table>
                            <tr>
                                <th>Tên người dùng</th>
                                <td>${user.username}</td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <td>${user.email}</td>
                            </tr>
                            <tr>
                                <th>Số điện thoại</th>
                                <td>${user.phoneNumber}</td>
                            </tr>
                            <tr>
                                <th>Vai trò</th>
                                <td>${user.role}</td>
                            </tr>
                        </table>
                    </c:if>

                    <br />
                </div>

                
                    <!-- ... existing code ... -->

                <div class="venues-grid">
                    <c:forEach items="${courts}" var="court">
                        <div class="venue-card">
                            <h3>${court.name}</h3>
                            <img src="/images/s1.png" style="width: 100%; height: 60%; object-fit: cover" alt="${court.name}" />
                            <div class="content_image">
                                <p>${court.id}</p>
                                <p>${court.address}</p>
                                <a href="/courts/details/${court.id}" class="btn-detail">Chi tiết</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                    <!-- ... existing code ... -->






                
            </div>
        </body>
        <footer></footer>

        </html>