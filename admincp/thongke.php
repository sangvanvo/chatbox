<?php
session_start();
include('../pages/config/config.php');


// Gọi các hàm SQL từ PHP
$sqlTotalJobs = "SELECT CountTotalJobPostings() as totalJobs";
$resultTotalJobs = $conn->query($sqlTotalJobs);
$totalJobs = $resultTotalJobs->fetch(PDO::FETCH_ASSOC);

$sqlTotalBachelorDegrees = "SELECT CountBachelorDegrees() as totalBachelorDegrees";
$resultTotalBachelorDegrees = $conn->query($sqlTotalBachelorDegrees);
$totalBachelorDegrees = $resultTotalBachelorDegrees->fetch(PDO::FETCH_ASSOC);


$sqlTotalEmployeePositions = "SELECT CountEmployeePositions() as totalEmployeePositions";
$resultTotalEmployeePositions = $conn->query($sqlTotalEmployeePositions);
$totalEmployeePositions = $resultTotalEmployeePositions->fetch(PDO::FETCH_ASSOC);


$sqlTotalAbove10M = "SELECT CountSalariesAbove10Million() as totalAbove10M";
$resultTotalAbove10M = $conn->query($sqlTotalAbove10M);
$totalAbove10M = $resultTotalAbove10M->fetch(PDO::FETCH_ASSOC);

$sqlTotalEqual1 = "SELECT CountValuesEqualTo1() as totalEqual1";
$resultTotalEqual1 = $conn->query($sqlTotalEqual1);
$totalEqual1 = $resultTotalEqual1->fetch(PDO::FETCH_ASSOC);
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
    <title>admin</title>
</head>

<body class="container-fluid">
    <main class="row">
        <div class="">
            <h1>Trang Thống Kê</h1>
            <div class="py-2"><a class="text-decoration-none fw-bold text-dark" href="../pages/index.php"><i
                        class="fa-solid fa-house text-success"></i>Trang chủ</a></div>
            <div class="btn btn-primary"><a href="index.php" class="text-decoration-none fw-bold text-white">
                    Trang quản trị</a></div>
            <div class="btn btn-primary"><a href="addadmin.php" class="text-decoration-none fw-bold text-white">Thêm
                    công
                    việc</a></div>

            <div class="btn btn-primary"><a href="da_xoa.php"
                    class="text-decoration-none fw-bold text-white">Duyệt_xóa</a>
            </div>
            <div class="btn btn-primary"><a href="thongke.php" class="text-decoration-none fw-bold text-white">Thống
                    kê</a></div>

            <br><br>
            <div class="row">
                <div class="fw-bold d-flex gap-2" style="font-size: 25px;">
                    Số lượng công việc đã thêm:
                    <p class="fw-bold text-success" style="font-size: 25px;">
                        <?php echo $totalJobs['totalJobs']; ?>
                    </p>
                </div>
                <div class="fw-bold d-flex gap-2" style="font-size: 25px;">
                    Số lượng cử nhân:
                    <p class="fw-bold text-success" style="font-size: 25px;">
                        <?php echo $totalBachelorDegrees['totalBachelorDegrees']; ?>
                    </p>
                </div>
                <div class="fw-bold d-flex gap-2" style="font-size: 25px;">
                    Số lượng vị trí Nhân viên:
                    <p class="fw-bold text-success" style="font-size: 25px;">
                        <?php echo $totalEmployeePositions['totalEmployeePositions']; ?>
                    </p>
                </div>
                <div class="fw-bold d-flex gap-2" style="font-size: 25px;">
                    Số lượng mức lương trên 10 triệu:
                    <p class="fw-bold text-success" style="font-size: 25px;">
                        <?php echo $totalAbove10M['totalAbove10M']; ?>
                    </p>
                </div>
                <div class="fw-bold d-flex gap-2" style="font-size: 25px;">
                    Số lượng chưa duyệt:
                    <p class="fw-bold text-success" style="font-size: 25px;">
                        <?php echo $totalEqual1['totalEqual1']; ?>
                    </p>
                </div>

            </div>
        </div>
    </main>
</body>

</html>