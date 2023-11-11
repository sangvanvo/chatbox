<?php
session_start(); // Bắt đầu session

// Xóa tất cả các biến session
session_unset();

// Hủy session
session_destroy();

// Chuyển hướng người dùng đến trang đăng nhập
header("Location: index.php");
exit();
?>