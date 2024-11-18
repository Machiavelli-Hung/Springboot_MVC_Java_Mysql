<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>JAVA_N4.10</title>
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

                .list_customer {
                    margin-top: -20px;
                    margin-left: -20px;
                    
                }
                .list_customer table{
                    border: 2px solid black; /* Đổi màu hoặc độ dày của viền tùy ý */
                    border-radius: 8px; /* Tùy chỉnh bo góc (nếu cần) */
                    background-color: #fff; /* Màu nền cho phần tử */
                }
                .list_customer th,td{
                    padding: 10px;
                    border: 2px solid black;
                     /* Đổi màu hoặc độ dày của viền tùy ý */
                }

                /* ... existing styles ... */

<!-- .list_customer {
    margin: 20px;
    width: 100%;
} -->

.list_customer h3 {
    color: #333;
    margin-bottom: 20px;
    font-size: 1.5em;
}

.list_customer table {
    width: 100%;
    border-collapse: collapse;
    background-color: white;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.list_customer th {
    background-color: #f8f9fa;
    color: #333;
    font-weight: 500;
    text-align: left;
    padding: 12px 15px;
    justify-content: center;
}

.list_customer td {
    padding: 12px 15px;
    border-bottom: 1px solid #dee2e6;
    color: #666;
    justify-content: center;
}

.list_customer tr:hover {
    background-color: #f8f9fa;
}

.list_customer a {
    color: #0d6efd;
    text-decoration: none;
    margin-right: 10px;
}

.list_customer input[type="submit"] {
    background-color: #dc3545;
    color: white;
    border: none;
    padding: 5px 10px;
    border-radius: 4px;
    cursor: pointer;
}

.list_customer input[type="submit"]:hover {
    background-color: #bb2d3b;
}

/* ... existing styles ... */

                


                

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
                
            </style>
        </head>

        <body>
            <!-- Header -->
            <header>
                <nav>
                    <ul>
                        <li><a href="/chusan">Trang chủ</a></li>
                        <li><a href="#">Giới thiệu</a></li>
                        <li><a href="#">Chính sách</a></li>
                        <li><a href="#">Điều khoản</a></li>
                        <c:if test="${user != null}">
                            <a href="/chusan/showuser"><span>Danh sách người dùng</span></a>
                        </c:if>
                        <c:if test="${user == null}">
                            <a href="#"><span>Danh sách người dùng</span></a>
                        </c:if>
                        <li><a href="#">Liên hệ</a></li>
                    </ul>
                    <div class="auth-buttons">
                        <button onclick="location.href='/home/logout'" class="btn">Đăng xuất</button>
                        
                    </div>
                </nav>
            </header>
            
            <!-- Main content -->
            <div class="main-content">
                <div class="list_customer">
                    <h3 style="display :block;">Danh sách khách hàng</h3>
                    
                    <table border="1">
                        <tr>
                            <th>Id</th>
                            <th>Username</th>
                            <!-- <th>Password</th> -->
                            <th>Email</th>
                            <th>Số điện thoại</th>
                            <th>Hành động</th>
                        </tr>
                        <c:forEach var="customer" items="${customers}">
                            <tr>
                                <td>${customer.id}</td>
                                <td>${customer.username}</td>
                                <!-- <td>${customer.password}</td> -->
                                <td>${customer.email}</td>
                                <td>${customer.phoneNumber}</td>
                                <td>
                                    <a href="/chusan/edit/${customer.id}">Edit</a>
                                    <form action="/chusan/delete/${customer.id}" method="post" style="display:inline;">
                                        <input type="submit" value="Delete" onclick="return confirm('Bạn có chắc chắn muốn xóa không?');" />
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>

            </div>


        </body>
        <footer>

        </footer>

        </html>











