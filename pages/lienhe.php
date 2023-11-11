<?php
session_start();
include('config/config.php');

if (isset($_POST['dangky'])) {
    $ten = $_POST['name'];
    $email = $_POST['email'];
    $tencongty = $_POST['tencongty'];
    $diachi = $_POST['diachi'];
    $sdt = $_POST['dienthoai'];
    $nhanxet = $_POST['nhanxet'];
    $sql = "INSERT INTO tbl_phanhoikhachhang(ten,email,tencongty,diachi,sdt,nhanxet) VALUE(?,?,?,?,?,?)";
    $ketqua = $conn->prepare($sql);
    $ketqua->execute([$ten, $email, $tencongty, $diachi, $sdt, $nhanxet]);
    if ($ketqua) {
        echo '
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script type="text/javascript">
        $(document).ready(function(){
        swal({       
        type: "success",
        title: "Gửi phản hồi thành công",
        icon: "success",
        showConfirmButton: true,        
        })
        });
        </script>';
    }
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên hệ</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
    <?php
    include "../code/head.php";
    ?>

    <div class="">
        <div class="row">
            <div class="col-sm-8 offset-sm-2">
                <div class="fw-bold h4" style="color: #1E40AF; padding-top:10px;">Trợ giúp</div>



                <div class="py-4">
                    <a class="lh link-offset-2 link-offset-3-hover link-underline link-underline-opacity-0 
                        link-underline-opacity-75-hover">Liên hệ chúng tôi</a>
                    <a class="ph ms-4 link-offset-2 link-offset-3-hover link-underline link-underline-opacity-0 
                        link-underline-opacity-75-hover">Phản hồi</a>
                </div>

                <div class="noidung-lh border" style="background-color:aliceblue">
                    <div class="py-3 text-primary h4 ms-3">Liên hệ</div>


                    <div class="h5 ms-3"><i class="fa-regular fa-building me-2"></i>Văn phòng tại Tp. Hồ Chí Minh</div>
                    <div class="border h5 ms-3 me-3" style="background-color:white;">
                        <div class="ms-3">
                            <div class="pt-3">
                                <span>Địa chỉ:</span><span class="ms-3">Phòng 302, 270-272 Cộng Hòa, P.13, Q.Tân Bình, TP. Ho Chi Minh</span>
                            </div>
                            <div class="pt-3">
                                <span>Sđt:</span><span class="ms-5">028 3813 0501</span>
                            </div>
                            <div class="py-3">
                                <span>Email:</span><span class="ms-4" style="padding-left:5px">contact@careerlink.vn</span>
                            </div>
                        </div>
                    </div>


                    <div class="h5 ms-3" style="padding-top:50px"><i class="fa-regular fa-building me-2"></i>Văn phòng tại Hà Nội</div>
                    <div class="border h5 ms-3 me-3" style="background-color:white;">
                        <div class="ms-3">
                            <div class="pt-3">
                                <span>Địa chỉ:</span><span class="ms-3">Phòng 307, DMC Tower, 535 Kim Mã, Ba Đình, TP.Hà Nội</span>
                            </div>
                            <div class="pt-3">
                                <span>Sđt:</span><span class="ms-5">024 3519 0410</span>
                            </div>
                            <div class="py-3">
                                <span>Email:</span><span class="ms-4" style="padding-left:5px">contact@careerlink.vn</span>
                            </div>
                        </div>
                    </div>


                    <div class="h5 ms-3" style="padding-top:50px"><i class="fa-regular fa-building me-2"></i>Văn phòng tại Đà Nẵng</div>
                    <div class="border h5 ms-3 me-3" style="background-color:white;">
                        <div class="ms-3">
                            <div class="pt-3">
                                <span>Địa chỉ:</span><span class="ms-3">Khu C2, tầng 8, Tòa nhà ACB Đà Nẵng, 218 Bạch Đằng, P. Phước Ninh, Q. Hải Châu, Đà Nẵng</span>
                            </div>
                            <div class="pt-3">
                                <span>Sđt:</span><span class="ms-5">0236 3221 767</span>
                            </div>
                            <div class="py-3">
                                <span>Email:</span><span class="ms-4" style="padding-left:5px">contact@careerlink.vn</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class=" noidung-ph">

                    <div class="card" style="border-radius: 0">

                        <div class="card-body" style="background-color:aliceblue; ">
                            <div class=" text-primary h4" style="padding-bottom:10px">Gửi phản hồi</div>
                            <form id="signupForm" method="POST" class="form-horizontal" action="">
                                <span style=" font-size: 20px">

                                    <div class="mb-3">Vui lòng cho chúng tôi biết suy nghĩ của bạn, bất kỳ phản hồi nào cũng sẽ được chúng tôi xem xét cẩn thận.</div>
                                    <!-- Họ và tên -->
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Tên của bạn<span style="color:red">*</span></label>
                                        <input type="text" class="form-control" id="" name="name">
                                    </div>

                                    <!-- Email -->
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email<span style="color:red">*</span></label>
                                        <input type="email" class="form-control" id="" name="email">
                                    </div>

                                    <!-- Tên công ty -->
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Tên công ty</label>
                                        <input type="text" class="form-control" id="" name="tencongty">
                                    </div>

                                    <!-- Địa chỉ -->
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Địa chỉ</label>
                                        <input type="text" class="form-control" id="" name="diachi">
                                    </div>

                                    <!-- Số điện thoại -->
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Số điện thoại</label>
                                        <input type="text" class="form-control" id="" name="dienthoai">
                                    </div>

                                    <!-- Nhận xét -->
                                    <div class="mb-3">
                                        <label for="exampleFormControlTextarea1" class="form-label">Nhận xét<span style="color:red">*</span></label>
                                        <textarea class="form-control" id="exampleFormControlTextarea1" name="nhanxet" rows="3"></textarea>
                                    </div>

                                    <div class="mb-3">
                                        <button type="submit" class="btn btn-primary" name="dangky">Gửi đi</button>
                                    </div>
                            </form>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#signupForm').validate({
                rules: {
                    name: {
                        required: true,
                        minlength: 1
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    nhanxet: {
                        required: true,
                        minlength: 1,
                        maxlength: 200
                    }
                },
                messages: {

                    name: {
                        required: 'Bạn chưa nhập vào tên của bạn',
                    },
                    email: 'Hộp thư điện tử không hợp lệ',
                    nhanxet: {
                        required: 'Vui lòng nhập nhận xét của bạn',
                        minlength: 'Tối thiểu 1 kí tự',
                        maxlength: 'Tối đa 200 kí tự'
                    },
                },
                errorElement: 'div',
                errorPlacement: function(error, element) {
                    error.addClass('invalid-feedback');
                    if (element.prop('type') === 'checkbox') {
                        error.insertAfter(element.siblings('label'));
                    } else {
                        error.insertAfter(element);
                    }
                },
                highlight: function(element, errorClass, validClass) {
                    $(element)
                        .addClass('is-invalid')
                        .removeClass('is-valid');
                },
                unhighlight: function(element, errorClass, validClass) {
                    $(element)
                        .addClass('is-valid')
                        .removeClass('is-invalid');
                },
            });
        });
    </script>




    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script>
        let phanhoi = document.querySelector(".ph");
        let lienhe = document.querySelector(".lh");
        let noidungph = document.querySelector(".noidung-ph");
        noidungph.style.display = "none";
        lienhe.addEventListener("click", function() {
            let noidungph = document.querySelector(".noidung-ph");
            let noidunglh = document.querySelector(".noidung-lh");
            noidungph.style.display = "none";
            noidunglh.style.display = "block";
        });
        phanhoi.addEventListener("click", function() {
            let noidungph = document.querySelector(".noidung-ph");
            let noidunglh = document.querySelector(".noidung-lh");
            noidungph.style.display = "block";
            noidunglh.style.display = "none";
        });
    </script>

    <hr />
    <?php
    include "../code/footer.php";
    ?>
</body>

</html>