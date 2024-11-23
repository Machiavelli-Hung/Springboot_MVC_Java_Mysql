<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter PIN</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f4f6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #ffffff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Thêm hiệu ứng box-shadow */
            transition: box-shadow 0.3s ease; /* Hiệu ứng mượt khi hover */
            text-align: center;
            width: 100%;
            max-width: 400px;
        }
        .container:hover {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3); /* Hiệu ứng khi hover */
        }
        h1 {
            color: #333;
            margin-bottom: 15px;
        }
        p {
            margin: 10px 0;
            color: #666;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            text-align: left;
            color: #555;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 15px;
            margin-left: -10px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Nhập mã PIN</h2>
        <h4 style = "color : red;">${message}</h4>
        <form action="/auth/verify-pin" method="post">
            <input type="hidden" name="email" value="${email}">
            <input type="text" name="pin" id="pin" placeholder="Nhập mã PIN của bạn" required>
            <button type="submit">Xác thực</button>
        </form>
        <p class="error">${error}</p>
    </div>
</body>
</html>
