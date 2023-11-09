<?php
session_start();
include('../config.php');
$ketqua = [];
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (isset($_GET['button'])) {
        $noidung1 = $_GET['1'];
        $noidung2 = $_GET['2'];
        $noidung3 = $_GET['3'];
        $noidung4 = $_GET['4'];
        $sql = "SELECT * FROM timkiemvieclam where nganh_nghe like ? and vitri_congty like ? and muc_luong like ? and trinh_do like ?";
        var_dump($sql);
        $ketqua = $conn->prepare($sql);

        $ketqua->execute(["%$noidung1%", "%$noidung2%", "%$noidung3%", "%$noidung4%"]);

        $ketqua = $ketqua->fetchAll(PDO::FETCH_ASSOC);
    }
}


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Tìm Việc Làm</title>
    <style>
        #chatboxBody {
            overflow-y: auto;
            min-height: 93vh;
            max-height: 93vh;
            /* Đặt chiều cao tối đa của chatboxBody */
        }
    </style>
</head>

<body class="container-fluid">
    <main class="row">
        <div class="col-4 col-md-2" style="height: 100vh; background-color: aquamarine;">
            <div class="d-flex align-items-center gap-3 py-2">
                <a href="index.php" class="text-decoration-none text-white fw-bold"><i
                        class="fa fa-solid fa-house"></i>Trang
                    chủ</a>
                <a href="../login/index.php" class="text-decoration-none text-white fw-bold"><i
                        class="fa fa-solid fa-user"></i>Đăng
                    nhập</a>

            </div>

            <div class="d-flex py-2">
                <a href="../signup/index.php" class="text-decoration-none text-white fw-bold"><i
                        class="fas fa-user-plus"></i>Đăng
                    ký</a>
            </div>

            <div class="py-2">
                <a href="../admin/index.php" class="text-decoration-none text-white fw-bold">
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
        <div class="col-12 col-md-10">
            <div class="mt-2">
                <form method="GET">
                    <input type="text" name="1" placeholder="Ngành nghề ">
                    <input type="text" name="2" placeholder="Vị trí">
                    <input type="text" name="3" placeholder="Mức lương">
                    <input type="text" name="4" placeholder="Trình độ">
                    <button type="submit" name="button">Tìm</button>
                </form>
            </div>
            <div class="row mt-2">

                <div class="col-sm-6 col-md-8" style="background-color: #f8f9fa;">
                    <?php foreach ($ketqua as $cty): ?>
                        <div class="border bg-body text-body">
                            <div class="row">
                                <div class=" col-sm-6 col-md-2" style="display: grid; place-items: center;">
                                    <img class="img-fluid hot-job__logo img-thumbnail mr-2 mr-sm-3 border-0 bg-white"
                                        src="<?= $cty['images'] ?>" />
                                </div>
                                <div class="col-sm-6 col-md-10 ">
                                    <div class="" style="padding-top:10px"><a
                                            class="text-decoration-none text-dark h5 fw-bold ">
                                            <?= $cty['nganh_nghe'] ?>
                                        </a></div>
                                    <div class=""><a class=" text-decoration-none text-dark h6 ">
                                            <?= $cty['tencongty'] ?>
                                        </a></div>
                                    <div class=""><a class="text-decoration-none text-dark h6 ">
                                            <?= $cty['vitri_congty'] ?>
                                        </a></div>
                                    <div class=""><a class="text-decoration-none text-danger h6 fw-bold">Lương:
                                            <?= $cty['muc_luong'] ?>
                                        </a></div>
                                    <div class=""><a class="text-decoration-none text-dark h6">Trình Độ:
                                            <?= $cty['trinh_do'] ?>
                                        </a></div>
                                </div>
                            </div>


                        </div>
                    <?php endforeach ?>
                </div>
            </div>
        </div>

        </div>
    </main>


</body>

</html>