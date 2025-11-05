<?php
session_start();

// Hardcoded credentials (replace with DB later)
$admin_user = "admin";
$admin_pass = "12345";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $username = trim($_POST['username'] ?? '');
    $password = trim($_POST['password'] ?? '');

    if ($username === $admin_user && $password === $admin_pass) {
        $_SESSION['admin_logged_in'] = true;
        header("Location: home.php");
        exit;
    } else {
        $error = "Invalid username or password.";
    }

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #141e30, #243b55);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-box {
            background: #fff;
            padding: 40px 35px;
            border-radius: 15px;
            width: 380px;
            box-shadow: 0 12px 40px rgba(0,0,0,0.3);
            text-align: center;
            animation: fadeIn 0.8s ease-in-out;
        }

        .login-box h2 {
            margin-bottom: 25px;
            color: #2c3e50;
            font-size: 26px;
            font-weight: bold;
        }

        .input-field {
            position: relative;
            margin-bottom: 20px;
            width: 100%;
        }

        .input-field input {
            width: 100%;
            padding: 14px 15px 14px 45px; /* room for icon on left */
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
            font-size: 15px;
            background: #f9f9f9;
            transition: all 0.3s ease;
            box-sizing: border-box; /* ✅ ensures no overflow */
        }

        .input-field input:focus {
            background: #fff;
            border-color: #3498db;
            box-shadow: 0 0 8px rgba(52,152,219,0.2);
        }

        .input-field i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #888;
            font-size: 16px;
            pointer-events: none; /* ✅ icon won’t block typing */
        }

        button {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #3498db, #2980b9);
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(41,128,185,0.4);
        }

        .error {
            margin-bottom: 18px;
            color: #e74c3c;
            font-size: 14px;
            background: #fdecea;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #f5c6cb;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(-20px);}
            to {opacity: 1; transform: translateY(0);}
        }

        /* Responsive */
        @media (max-width: 420px) {
            .login-box {
                width: 90%;
                padding: 30px 20px;
            }
        }
    </style>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="login-box">
        <h2>Admin Login</h2>
        <?php if (!empty($error)) echo "<p class='error'>$error</p>"; ?>
        <form method="post">
            <div class="input-field">
                <i class="fa fa-user"></i>
                <input type="text" name="username" placeholder="Username" required>
            </div>
            <div class="input-field">
                <i class="fa fa-lock"></i>
                <input type="password" name="password" placeholder="Password" required>
            </div>
            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>
