<?php
session_start();
include('../pages/config/config.php');

$error = ""; // Variable to store the error message

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $admin_status = 1;

    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Perform additional password confirmation validation
    $confirm_password = $_POST['confirm_password'];
    if ($password !== $confirm_password) {
        $error = "Passwords do not match."; // Store the error message
    } else {
        try {
            $conn->beginTransaction();

            $sql = "INSERT INTO tbl_admin (username, password, admin_status) VALUES (?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->execute([$username, $hashed_password, $admin_status]);

            $conn->commit();

            header("Location: login.php");
            exit();
        } catch (PDOException $e) {
            $conn->rollBack();
            $error = "Registration failed: " . $e->getMessage(); // Store the error message
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Admin Registration</title>
    <link rel="icon" type="image/png" href="../pages/images/NiceJob.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-8 offset-sm-2">
                <div class="mt-2">
                    <div class="alert alert-info text-center " role="alert">
                        <h4>Vui lòng đăng nhập tại đây!</h4>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header text-center bg-secondary-subtle text-emphasis-secondary">
                        <a href="index.php">
                            <button type="button" class="btn-close position-absolute top-0 end-0 p-3"
                                aria-label="Close"></button>
                        </a>
                        <h3>Đăng Ký</h3>
                    </div>
                    <div class="card-body ">
                        <form id="adminRegistrationForm" action="#" method="post">
                            <div class="mb-3">
                                <label for="username">Hộp thư điện tử</label>
                                <input type="text" id="username" name="username" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label for="password">Mật khẩu</label>
                                <input type="password" id="password" name="password" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label for="confirm_password">Nhập lại mật khẩu</label>
                                <input type="password" id="confirm_password" name="confirm_password"
                                    class="form-control" required>
                            </div>

                            <!-- Hidden input for admin status (set to 1) -->
                            <input type="hidden" id="admin_status" name="admin_status" value="1" required>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary" name="register">Đăng Ký</button>
                            </div>
                        </form>
                        <div class="text-center">
                            quay lại <a href="login.php">Đăng Nhập</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#adminRegistrationForm').validate({
                rules: {
                    username: {
                        required: true
                    },
                    password: {
                        required: true,
                        minlength: 5
                    },
                    confirm_password: {
                        required: true,
                        minlength: 5,
                        equalTo: "#password"
                    }
                },
                messages: {
                    username: {
                        required: 'Please enter a username'
                    },
                    password: {
                        required: 'Please enter a password',
                        minlength: 'Password must be at least 5 characters'
                    },
                    confirm_password: {
                        required: 'Please enter the password again',
                        minlength: 'Password must be at least 5 characters',
                        equalTo: 'Passwords do not match'
                    }
                },
                errorElement: 'div',
                errorPlacement: function (error, element) {
                    error.addClass('invalid-feedback');
                    error.insertAfter(element);
                },
                highlight: function (element, errorClass, validClass) {
                    $(element).addClass('is-invalid').removeClass('is-valid');
                },
                unhighlight: function (element, errorClass, validClass) {
                    $(element).addClass('is-valid').removeClass('is-invalid');
                }
            });
        });
    </script>
</body>

</html>