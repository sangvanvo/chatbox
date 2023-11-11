<?php
session_start();
include('../config/config.php');

if (isset($_POST['timkiemvieclam'])) {
    $nganhnghe = $_POST['nganh_nghe'];
    $tencongty = $_POST['tencongty'];
    $vitricongty = $_POST['vitri_congty'];
    $mucluong = $_POST['muc_luong'];
    $image = $_POST['images'];
    $trinhdo = $_POST['trinh_do'];
    $vitri = $_POST['vi_tri'];
    $giatri = $_POST['gia_tri'];
    $sql = "CALL ctythemvieclam('$nganhnghe','$tencongty','$vitricongty','$mucluong','$image','$trinhdo','$vitri','1')";
    $ketqua = $conn->prepare($sql);
    $ketqua->execute();
    header("Location:../../pages/index.php");
}

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cty đăng tuyển</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css
" rel="stylesheet">
</head>

<body>
    <div class="">
        <div class="row">
            <div class="col-sm-6 col-md-4 d-flex align-items-center">
                <img class=" img-fluid" src="https://dxwd4tssreb4w.cloudfront.net/web/images/pages/login/banner.png"
                    alt="">
            </div>
            <div class="col-sm-6 col-md-4">

                <div class="card">
                    <div class="card-header text-center position-relative alert alert-info">
                        <h3>Thêm đăng tuyển dụng</h3>
                    </div>

                    <div class="card-body ">
                        <form id="signupForm" method="POST" class="form-horizontal" action="">
                            <!-- Vị trí cần tuyển -->
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Ngành nghề</label>
                                <input type="text" class="form-control" id="" name="nganh_nghe">
                            </div>

                            <!-- Tên công ty -->
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Tên công ty</label>
                                <input type="text" class="form-control" id="" name="tencongty">
                            </div>

                            <!-- Địa chỉ -->
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Địa chỉ</label>
                                <input type="text" class="form-control" id="" name="vitri_congty">
                            </div>


                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Mức lương</label>
                                <input type="text" class="form-control" id="" name="muc_luong">
                            </div>


                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Logo công ty</label>
                                <input type="text" class="form-control" id="" name="images">
                            </div>

                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Trình độ</label>
                                <input type="text" class="form-control" id="" name="trinh_do">
                            </div>

                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Vị trí công việc</label>
                                <input type="text" class="form-control" id="" name="vi_tri">
                            </div>

                            <div class="">
                                <div class="d-grid">
                                    <button type="submit" class="btn btn-primary" name="timkiemvieclam">Thêm</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4"></div>
            </div>
        </div>
    </div>

    <hr />
    <?php
    include "../../code/footer.php";
    ?>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>

</body>

</html>