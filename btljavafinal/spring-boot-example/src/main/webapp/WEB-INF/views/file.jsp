<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thông tin đặt sân</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background: #f6f5f7;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            font-family: "Montserrat", sans-serif;
            height: 100vh;
            margin: -20px 0 50px;
        }
        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
            padding: 20px;
            width: 50%;
            max-width: 100%;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-group input {
            background-color: #eee;
            border: none;
            padding: 12px 15px;
            margin: 8px 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Thông tin đặt sân</h2>
        <div class="form-group">
            <label for="name">Tên:</label>
            <input type="text" id="name" name="name" value="${name}" readonly>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${email}" readonly>
        </div>
        <div class="form-group">
            <label for="phone">Số điện thoại:</label>
            <input type="text" id="phone" name="phone" value="${phone}" readonly>
        </div>
        <div class="form-group">
            <label for="field">Sân đã đặt:</label>
            <input type="text" id="field" name="field" value="${field}" readonly>
        </div>
        <div class="form-group">
            <label for="schedule">Lịch đặt:</label>
            <input type="text" id="schedule" name="schedule" value="${schedule}" readonly>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>