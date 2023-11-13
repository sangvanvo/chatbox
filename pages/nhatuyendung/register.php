<?php
session_start();
include('../config/config.php');

if (isset($_POST['dangky'])) {

    $email = $_POST['email'];
    $matkhau = md5($_POST['matkhau']);
    $tencongty = $_POST['tencongty'];
    $sonhanvien = $_POST['sonhanvien'];
    $hotline = $_POST['hotline'];
    $diachi = $_POST['diachi'];
    $sql = "INSERT INTO tbl_dangky_nhatuyendung(email,matkhau,tencongty,sonhanvien,sodienthoai,diachi) VALUE(?,?,?,?,?,?)";
    $ketqua = $conn->prepare($sql);
    $ketqua->execute([$email, $matkhau, $tencongty, $sonhanvien, $hotline, $diachi]);

    header("Location:../nhatuyendung/login.php");

}

?>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Đăng kí</title>
    <link rel="icon" type="image/png" href="../images/NiceJob.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-8 offset-sm-2">
                <div class="mt-2">
                    <div class="alert alert-info text-center" role="alert">
                        <h4>Nhà tuyển dụng đăng kí tại đây</h4>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header text-center position-relative">
                        <!-- <a href="http://localhost/web_mysqli/pages/index.php"><button type="button" class="btn-close position-absolute top-0 end-0 p-2" aria-label="Close"></button></a> -->
                        <h3>Đăng ký để bắt đầu đăng việc ngay</h3>
                    </div>

                    <div class="card-body">
                        <form id="signupForm" method="POST" class="form-horizontal" action="">

                            <!-- Email -->
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Email</label>
                                <input type="email" class="form-control" id="" name="email">
                            </div>


                            <!-- Mật khẩu -->

                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Mật khẩu</label>
                                <input type="password" class="form-control" name="matkhau">
                            </div>


                            <div class="text-center h4" style="">Thông tin công ty</div>


                            <!-- Tên công ty -->
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Tên công ty</label>
                                <input type="text" class="form-control" id="" name="tencongty">
                            </div>


                            <!-- Số nhân viên -->
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Số nhân viên</label>
                                <input type="text" class="form-control" id="" name="sonhanvien">
                            </div>

                            <!-- Hotline -->
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Số điện thoại</label>
                                <input type="text" class="form-control" id="" name="hotline">
                            </div>

                            <!-- Địa chỉ -->
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Địa chỉ</label>
                                <input type="text" class="form-control" id="" name="diachi">
                            </div>

                            <div class="form-group form-check mb-3">
                                <input class="form-check-input" type="checkbox" id="agree" name="agree" value="agree" />
                                <label class="form-check-label" for="agree">Đồng ý các quy định của chúng tôi</label>
                            </div>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary" name="dangky">Đăng ký</button>
                            </div>
                            <div class="text-center">Quay lại <a href="login.php">Đăng nhập</a></div>

                    </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Cột nội dung -->
    </div>
    <!-- Dòng nội dung -->
    </script>
    </nav>

    <hr />
    <?php
    include "../../code/footer.php";
    ?>

    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
    <script type="text/javascript">
        // $.validator.setDefaults({
        //     submitHandler: function () {
        //         alert('Đăng kí thành công!');
        //     },
        // });
        $(document).ready(function () {
            $('#signupForm').validate({
                rules: {
                    hotline: {
                        required: true,
                    },
                    sonhanvien: {
                        required: true,
                    },
                    tencongty: {
                        required: true,
                    },
                    tenkhachhang: {
                        required: true,
                        minlength: 0
                    },
                    diachi: {
                        required: true,
                        minlength: 5
                    },
                    dienthoai: {
                        required: true,
                        minlength: 5
                    },

                    matkhau: {
                        required: true,
                        minlength: 5
                    },

                    email: {
                        required: true,
                        email: true
                    },
                    agree: 'required',
                },
                messages: {
                    hotline: {
                        required: 'Bạn chưa nhập số điện thoại liên hệ',
                    },
                    sonhanvien: {
                        required: 'Bạn chưa nhập số nhân viên',
                    },
                    tencongty: {
                        required: 'Bạn chưa nhập tên công ty',
                    },
                    tenkhachhang: {
                        required: 'Bạn chưa nhập vào tên của bạn',
                    },
                    diachi: {
                        required: 'Bạn chưa nhập địa chỉ',
                    },

                    dienthoai: {
                        required: 'Bạn chưa nhập số điện thoại',
                    },
                    matkhau: {
                        required: 'Bạn chưa nhập mật khẩu',
                        minlength: 'Mật khẩu phải có ít nhất 5 ký tự',
                    },

                    email: 'Hộp thư điện tử không hợp lệ',
                    agree: 'Bạn phải đồng ý với các quy định của chúng tôi',
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