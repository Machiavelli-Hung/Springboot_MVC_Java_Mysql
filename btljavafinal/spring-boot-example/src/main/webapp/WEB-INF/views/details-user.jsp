<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <title>Chi tiết người dùng</title>
            <link rel="stylesheet" type="text/css"
                href="${pageContext.request.contextPath}/css/css_user/details-user.css" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css"
                integrity="sha512-9xKTRVabjVeZmc+GUW8GgSmcREDunMM+Dt/GrzchfN8tkwHizc5RP4Ok/MXFFy5rIjJjzhndFScTceq5e6GvVQ=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
        </head>


        <body>
            <!-- Header -->
            <header>
                <nav>
                    <ul>
                        <li><a href="/chusan">Trang chủ</a></li>
                        <c:if test="${userDetails != null}">
                            <a href="/chusan/showuser"><span>Danh sách người dùng</span></a>
                            <a href="/chusan/showuser"><span>Danh sách sân</span></a>
                        </c:if>
                        <li><a href="#">Giới thiệu</a></li>
                        <li><a href="#">Chính sách</a></li>
                        <li><a href="#">Điều khoản</a></li>
                        <li><a href="#">Liên hệ</a></li>
                    </ul>
                    <div class="auth-buttons">
                        <c:if test="${userDetails != null}">
                            <button onclick="location.href='/home/logout'" class="btn">
                                Đăng xuất
                            </button>
                            <button onclick="location.href='/home/changePassword'" class="btn">
                                Đổi mật khẩu
                            </button>
                            <button class="user-btn">
                                <i class="fa-solid fa-user"></i>
                            </button>
                        </c:if>


                        
                    </div>
                </nav>
            </header>
            <!-- Main content -->
            <div class="main-content">
                <div class="sidebar">
                    <c:if test="${userDetails != null}">
                        <h3>Thông tin người dùng</h3>
                        <table>
                            <tr>
                                <th>Tên người dùng</th>
                                <td>${userDetails.username}</td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <td>${userDetails.email}</td>
                            </tr>
                            <tr>
                                <th>Số điện thoại</th>
                                <td>${userDetails.phoneNumber}</td>
                            </tr>
                            <tr>
                                <th>Vai trò</th>
                                <td>${userDetails.role}</td>
                            </tr>
                        </table>
                    </c:if>


                    <br />
                </div>
            </div>
        </body>
        <footer></footer>

        </html>