<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Đăng Nhập</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            form {
                background: white;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            input[type="submit"] {
                background: #5cb85c;
                color: white;
                border: none;
                padding: 10px;
                border-radius: 5px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background: #4cae4c;
            }

            #x{
                display: inline-block;
            }
            
        </style>
    </head>

    <body>
        
        
        

        <form action="/user/login" method="post" >
            <h2>Đăng Nhập</h2>
            <label for="username">Tên Đăng Nhập:</label>
            <input type="text" id="username" name="username" value="" required>

            <label for="password">Mật Khẩu:</label>
            <input type="password" id="password" name="password" value="" required>

            <!-- doan check ma loi  -->
            <c:if test="${not empty errorMessage}">
                <p style="color:red">${errorMessage}</p>
            </c:if>

            <c:if test="${not empty message}">
                <p style="color:blue">${message}</p>
            </c:if>

            <input type="submit" value="Đăng Nhập">
            <div id = "x">Nếu không có tài khoản, nhấn vào đây 
                <a href="/user/register">đăng ký</a>
            </div>
        </form>

        
    </body>

    </html>