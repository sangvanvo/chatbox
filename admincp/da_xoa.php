<?php
session_start();
include('../pages/config/config.php');
$sql = "SELECT * from timkiemvieclam where gia_tri=1";
$ketqua = $conn->query($sql);
$ketqua = $ketqua->fetchAll(PDO::FETCH_ASSOC);
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['submit'])) {
        $id = $_POST['id'];
        $sql = "UPDATE timkiemvieclam SET gia_tri=0  where id_thongtintuyendung=?";
        $ketqua = $conn->prepare($sql);
        $ketqua->execute([$id]);
        header("Location:da_xoa.php");
    }
}
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    try {
        if (isset($_POST['delete'])) {
            $id = $_POST['id'];
            $sql = "CALL xoavieclam('$id')";
            $ketqua = $conn->prepare($sql);
            $ketqua->execute();
            header("Location:da_xoa.php");
        }
    } catch (PDOException $e) {
        echo "Lỗi SQL: " . $e->getMessage();
        exit();
    }

}
;
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
    <title>dx</title>
</head>

<body class="container-fluid">
    <main class="row">
        <div class="">
            <h1>Trang quản lý danh mục công việc</h1>
            <div class="py-2"><a class="text-decoration-none fw-bold text-dark" href="../pages/index.php"><i
                        class="fa-solid fa-house text-success"></i>Trang chủ</a></div>
            <div class="btn btn-primary"><a href="index.php" class="text-decoration-none fw-bold text-white">
                    Trang quản trị</a></div>
            <div class="btn btn-primary"><a href="addadmin.php" class="text-decoration-none fw-bold text-white">Thêm
                    công
                    việc</a></div>

            <div class="btn btn-primary"><a href="da_xoa.php"
                    class="text-decoration-none fw-bold text-white">Duyệt_Xóa</a>
            </div>
            <div class="btn btn-primary"><a href="thongke.php" class="text-decoration-none fw-bold text-white">Thống
                    kê</a></div>
            <br><br>

            <!-- Bảng hiển thị Thành viên -->
            <table class="table">
                <thead>
                    <tr>
                        <th>Ảnh bìa</th>
                        <th>Ngành nghề</th>
                        <th>Tên công ty</th>
                        <th>Địa chỉ công ty</th>
                        <th>Mức lương</th>
                        <th>Trình độ</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <thead>
                    <div class="col-sm-6 col-md-8" style="background-color: #f8f9fa;">
                        <?php foreach ($ketqua as $cty): ?>
                            <tr>
                                <th> <img class="img-fluid hot-job__logo img-thumbnail mr-2 mr-sm-3 border-0 bg-white"
                                        style="height: 75px;" src="<?= $cty['images'] ?>" /></th>
                                <th><a href="../pages/cty1.php?id=<?= $cty['tencongty'] ?>"
                                        class="text-decoration-none text-dark h5 fw-bold ">
                                        <?= $cty['nganh_nghe'] ?>
                                    </a></th>
                                <th><a class=" text-decoration-none text-dark h6 ">
                                        <?= $cty['tencongty'] ?>
                                    </a></th>
                                <th><a class="text-decoration-none text-dark h6 ">
                                        <?= $cty['vitri_congty'] ?>
                                    </a></th>
                                <th><a class="text-decoration-none text-danger h6 fw-bold">Lương:
                                        <?= $cty['muc_luong'] ?>
                                    </a></th>
                                <th><a class="text-decoration-none text-dark h6">Trình Độ:
                                        <?= $cty['trinh_do'] ?>
                                    </a></th>
                                <th class="">
                                    <form method="POST"><input type="submit" name="delete" class="btn btn-danger"
                                            value="Xóa"><input type="hidden" name="id"
                                            value="<?= $cty['id_thongtintuyendung'] ?>"></form>
                                    <form method="POST"><input type="submit" name="submit" class="btn btn-success my-1"
                                            value="Thêm lại"><input type="hidden" name="id"
                                            value="<?= $cty['id_thongtintuyendung'] ?>"></form>

                                </th>
                            </tr>
                        <?php endforeach ?>
                    </div>
                </thead>
            </table>
        </div>
    </main>
</body>

</html>