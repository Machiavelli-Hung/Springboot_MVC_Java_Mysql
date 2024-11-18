<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Sign In/Sign Up Form</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
            
<style>
        @import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');

        * {
            box-sizing: border-box;
        }

        body {
            background: #f6f5f7;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            font-family: 'Montserrat', sans-serif;
            height: 100vh;
            margin: -20px 0 50px;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 14px 28px rgba(0,0,0,0.25);
            position: relative;
            overflow: hidden;
            width: 768px;
            max-width: 100%;
            min-height: 600px;
            display: flex;
        }

        .form-container {
            flex: 1;
            padding: 40px;
        }

        form {
            background-color: #FFFFFF;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 50px;
            height: 100%;
            text-align: center;
        }

        h1 {
            font-weight: bold;
            margin: 0;
            margin-bottom: 20px;
            color: #1a4178;
        }

        input, select {
            background-color: #eee;
            border: none;
            padding: 12px 15px;
            margin: 8px 0;
            width: 100%;
            font-size: 14px;
        }

        button {
            border-radius: 20px;
            border: 1px solid #1a4178;
            background-color: #1a4178;
            color: #FFFFFF;
            font-size: 12px;
            font-weight: bold;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: transform 80ms ease-in;
            cursor: pointer;
            margin-top: 15px;
        }

        .overlay-container {
            flex: 1;
            background: linear-gradient(to right, #1a4178, #3c6bac);
            color: #FFFFFF;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 40px;
            text-align: center;
            position: relative; /* Thêm position relative */
        }

        /* Tạo một div wrapper cho nội dung chính */
        .overlay-content {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 100%;
            padding: 0 40px;
        }

        .overlay-container h1 {
            color: #FFFFFF;
            margin-top: 36px; /* Giảm margin bottom */
            font-size: 2.5em;
            margin-bottom: -30px;
        }

        .overlay-container p {
            font-size: 14px;
            line-height: 20px;
            letter-spacing: 0.5px;
            margin-top: 15px 0; /* Giảm margin */
            
        }

        .ghost {
            background-color: transparent;
            border: 2px solid #FFFFFF;
        }

        .overlay-container button {
            background-color: transparent;
            border: 1px solid #FFFFFF;
            color: #FFFFFF;
            border-radius: 30px;
            font-size: 14px;
            font-weight: 500;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
            cursor: pointer;
            margin-top: -20px;
            position: relative;
            overflow: hidden;
        }

        .overlay-container button:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .overlay-container form {
            padding: 0;
            margin: 0;
            background: transparent;
        }

        .overlay-container button:focus {
            outline: none;
        }
        /* Sửa style cho tất cả input và select để đảm bảo chiều rộng bằng nhau */
        input, 
        select {
            background-color: #eee;
            border: none;
            padding: 12px 15px;
            margin: 8px 0;
            width: 100% !important; /* Thêm !important để ghi đè các style khác */
            font-size: 14px;
            box-sizing: border-box;
        }

        /* Style riêng cho select */
        select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 15px center;
            background-size: 15px;
        }

        /* Sửa lại overlay container để căn giữa theo chiều dọc */
        .overlay-container {
            flex: 1;
            background: linear-gradient(to right, #1a4178, #3c6bac);
            color: #FFFFFF;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
            text-align: center;
        }

        .overlay-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }

        /* Đảm bảo form container có width đồng nhất */
        .form-container {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        form {
            width: 100%;
            max-width: 380px; /* hoặc giá trị phù hợp với design của bạn */
        }

    
    </style>
        </head>

        <body>
            <div class="container">
                <div class="form-container">
                    <form action="/user/register" method="post">
                        <h2>Create Account</h2>
        
                        <input type="text" id="username" name="username" placeholder="Tên người dùng" value="${user.username}"
                            required>
        
                        <input type="password" id="password" name="password" placeholder="Mật khẩu" value="${user.password}"
                            required>
        
                        <input type="email" id="email" name="email" placeholder="Email" value="${user.email}" required>
        
                        <select id="role" name="role" required>
                            <option value="nguoi dung">Người Dùng</option>
                            <option value="chu san">Chủ Sân</option>
                            <option value="admin">Admin</option>
                        </select>
        
                        <input type="text" id="phoneNumber" name="phoneNumber" placeholder="Số điện thoại"
                            value="${user.phoneNumber}" required>
        
                        <c:if test="${not empty errorMessage}">
                            <p style="color: red;">${errorMessage}</p>
                        </c:if>
        
                        <button type="submit">Đăng Ký</button>
                    </form>
                </div>
        
                <!-- Phần overlay-container trong HTML -->
                <div class="overlay-container">
                    <div class="overlay-content">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <form action="${pageContext.request.contextPath}/user/login" method="get">
                            <button type="submit" class="ghost">SIGN IN</button>
                        </form>
                    </div>
                </div>
            </div>
        </body>

        </html>