<?php
session_start();
include('../pages/config/config.php');
if (isset($_POST['signup'])) {
    $taikhoan = $_POST['email'];
    $matkhau = md5($_POST['password']);
    $sql = "SELECT * FROM tbl_admin WHERE username=? and password=? LIMIT 1";
    $ketqua = $conn->prepare($sql);
    $ketqua->execute([$taikhoan, $matkhau]);
    $ketqua = $ketqua->fetch(PDO::FETCH_ASSOC);
    if ($ketqua) {
        header("Location:index.php");
    } else {
        echo '<script language="javascript">';
        echo 'alert("Email hoặc mật khẩu không đúng")';
        echo '</script>';
    }
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Đăng nhập</title>
    <link rel="icon" type="image/png" href="../pages/images/NiceJob.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css
" rel="stylesheet">
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-8 offset-sm-2">
                <div class="mt-2">
                    <div class="alert alert-info text-center" role="alert">
                        <h4>Vui lòng đăng nhập tại đây!</h4>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header text-center">
                        <a href="../pages/index.php"><button type="button" class="btn-close offset-11"
                                aria-label="Close"></button></a>
                        <h3>Đăng nhập</h3>
                    </div>
                    <div class="card-body">
                        <form id="signupForm" method="post" class="form-horizontal" action="#">
                            <div class="form-group row p-2">
                                <label class="col-sm-4 col-form-label" for="email">Hộp thư điện tử</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="email" name="email"
                                        placeholder="Hộp thư điện tử" />
                                </div>
                            </div>

                            <div class="form-group row p-2">
                                <label class="col-sm-4 col-form-label" for="password">Mật khẩu</label>
                                <div class="col-sm-5">
                                    <input type="password" class="form-control" id="password" name="password"
                                        placeholder="Nhập mật khẩu tài khoản web" />
                                </div>
                            </div>


                            <div class="row p-2 d-flex gap-2">
                                <div class="col-sm-5 offset-sm-4">
                                    <button type="submit" class="btn btn-primary" name="signup" value="Sign up">
                                        Đăng nhập
                                    </button>
                                </div>
                                <!-- <div class="col-sm-5 offset-sm-4">
                                    <a href="registeradmin.php" class="btn btn-primary">Đăng Ký</a>
                                </div> -->
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </script>
    </nav>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $('#signupForm').validate({
                rules: {
                    password: { required: true, minlength: 0 },
                    email: { required: true, email: true },
                },
                messages: {
                    password: {
                        required: 'Bạn chưa nhập mật khẩu',
                        minlength: 'Mật khẩu phải có ít nhất 5 ký tự',
                    },
                    email: 'Hộp thư điện tử không hợp lệ',
                },
                errorElement: 'div',
                errorPlacement: function (error, element) {
                    error.addClass('invalid-feedback');
                    if (element.prop('type') === 'checkbox') {
                        error.insertAfter(element.siblings('label'));
                    } else {
                        error.insertAfter(element);
                    }
                },
                highlight: function (element, errorClass, validClass) {
                    $(element)
                        .addClass('is-invalid')
                        .removeClass('is-valid');
                },
                unhighlight: function (element, errorClass, validClass) {
                    $(element)
                        .addClass('is-valid')
                        .removeClass('is-invalid');
                },
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>

</html>