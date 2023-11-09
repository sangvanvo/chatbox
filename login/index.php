<?php
session_start();
include('../config.php');
if (isset($_POST['dangnhap'])) {
    $email = $_POST['email'];
    $mat_khau = md5($_POST['mat_khau']);
    $sql = "SELECT * FROM khach_hang WHERE email=? and mat_khau=? LIMIT 1";
    $ketqua = $conn->prepare($sql);
    $ketqua->execute([$email, $mat_khau]);
    $ketqua = $ketqua->fetch(PDO::FETCH_ASSOC);
    header("Location:../home/index.php");
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body class="container-fluid">
    <main>
        <div class="row">
            <div class="col-12 col-md-2" style="height: 100vh; background-color: aquamarine;">
                <div class="d-flex align-items-center gap-3 py-2">
                    <a href="/home/index.php" class="text-decoration-none text-white fw-bold"><i
                            class="fa fa-solid fa-house"></i>Trang
                        chủ</a>
                    <a href="/login/index.php" class="text-decoration-none text-white fw-bold"><i
                            class="fa fa-solid fa-user"></i>Đăng
                        nhập</a>

                </div>

                <div class="d-flex py-2">
                    <a href="/signup/index.php" class="text-decoration-none text-white fw-bold"><i
                            class="fas fa-user-plus"></i>Đăng
                        ký</a>
                </div>

                <div class="py-2">
                    <a href="/admin/index.php" class="text-decoration-none text-white fw-bold">
                        Trang quản trị
                    </a>
                </div>
                <hr>
                <div>
                    <p>lich sữ tìm kiếm</p>
                    <button class="btn btn-dark">new</button>
                    <hr>
                </div>
            </div>
            <div class="col-12 col-md-8 offset-md-1">
                <div class="mt-4">
                    <div class="alert alert-info text-center " role="alert">
                        <h4>Vui lòng đăng nhập tại đây!</h4>
                    </div>
                </div>

                <div class="card  ">

                    <div class="card-body ">
                        <form id="signupForm" method="post" class="form-horizontal" action="#">



                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label"><i
                                        class="me-1 fa-solid fa-envelope text-success"></i>Email</label>
                                <input type="email" class="form-control" id="" name="email">
                            </div>

                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label"><i
                                        class="me-1 fa-solid fa-lock text-success"></i>Mật khẩu</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" name="mat_khau">
                            </div>




                            <div class="d-grid">
                                <button type="submit" class="btn btn-success" name="dangnhap">Đăng nhập</button>
                            </div>



                        </form>
                    </div>
                </div>
            </div>
        </div>
        </div>

    </main>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#signupForm').validate({
                rules: {
                    matkhau: {
                        required: true,
                        minlength: 5
                    },
                    email: {
                        required: true,
                        email: true
                    },
                },
                messages: {
                    matkhau: {
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




</body>

</html>