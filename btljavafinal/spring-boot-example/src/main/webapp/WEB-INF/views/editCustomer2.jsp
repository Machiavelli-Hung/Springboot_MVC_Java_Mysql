<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Chỉnh sửa thông tin</title>
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
                    box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25);
                    position: relative;
                    overflow: hidden;
                    width: 600px;
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

                .input-group {
                    width: 100%;
                    margin: 8px 0;
                    text-align: left;
                }

                .input-group label {
                    display: block;
                    margin-bottom: 5px;
                    color: #333;
                    font-size: 14px;
                }

                input {
                    background-color: #eee;
                    border: none;
                    padding: 12px 15px;
                    width: 100%;
                    font-size: 14px;
                    border-radius: 5px;
                }

                #role,
                #role1 {
                    display: none;
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

                a {
                    color: #1a4178;
                    text-decoration: none;
                    margin-top: 15px;
                    font-size: 14px;
                }

                a:hover {
                    text-decoration: underline;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <div class="form-container">
                    <form action="/chusan/update" method="post">
                        <h1>Chỉnh sửa thông tin</h1>

                        <input type="hidden" name="id" value="${customer.id}" />

                        <div class="input-group">
                            <label for="username">Username:</label>
                            <input type="text" name="username" value="${customer.username}" required />
                        </div>

                        <div class="input-group">
                            <label for="password">Password:</label>
                            <input type="password" name="password" value="${customer.password}" required />
                        </div>

                        <div class="input-group">
                            <label for="email">Email:</label>
                            <input type="email" name="email" value="${customer.email}" required />
                        </div>

                        <div class="input-group">
                            <label for="phone">Số điện thoại:</label>
                            <input type="text" name="phone" value="${customer.phoneNumber}" required />
                        </div>

                        <label id="role1" for="role">Role</label>
                        <input id="role" type="text" name="role" value="${customer.role}" required />

                        <button type="submit">Cập nhật</button>
                        <a href="/chusan/showuser">Quay lại</a>
                    </form>
                </div>
            </div>
        </body>

        </html>