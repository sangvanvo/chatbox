<?php
session_start();
include('config/config.php');
$ketqua = [];
if (empty($_SESSION['tenkhachhang'])) {
    header('Location:login.php');
    exit();
}
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (isset($_GET['button'])) {
        $noidung1 = $_GET['1'];
        $sql = "SELECT * FROM loi_khuyen where linh_vuc like ?";

        $ketqua = $conn->prepare($sql);

        $ketqua->execute(["%$noidung1%"]);

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

</head>

<body class="container-fluid">
    <main class="">
        <div class="">
            <nav class="navbar navbar-expand-lg">
                <div class="container border-bottom">
                    <a class="navbar-brand fw-bold" style="color:red">Hỗ trợ việc làm</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="index.php"><i
                                        class="fa-solid fa-house text-success"></i>Trang chủ</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="login.php"><i
                                        class="fa-solid fa-magnifying-glass text-success"></i>Tìm kiếm</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="chatbot.php"><i
                                        class="fa-solid fa-comment text-success"></i>Chatbot</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="../admincp/login.php">Admin </a>
                            </li>


                        </ul>

                        <div class="d-flex align-items-center">
                            <?php
                            if ((isset($_SESSION['tenkhachhang'])) || (isset($_SESSION['tencongty']))) {
                                if ((isset($_SESSION['tenkhachhang']))) {
                                    echo "<span class='text-capitalize fw-bold' style='color:red'>" . $_SESSION['tenkhachhang'] . "</span>";
                                } else {
                                    echo "<span class='text-capitalize fw-bold' style='color:red'>" . $_SESSION['tencongty'] . " </span>";
                                    echo '<span><a class="text-decoration-none text-dark ms-3" href="nhatuyendung/post_info.php"><i class="fa-regular fa-paste text-success"></i>Đăng tin tuyển dụng</a></span>';
                                }

                                echo '<span><a class="text-decoration-none text-dark ms-3" href="logout.php"><i class="fa-solid fa-right-from-bracket text-success"></i>Đăng xuất</a></span>';
                            } else {
                                echo '<div><a class="text-decoration-none text-dark " href="login.php"><i class="fa-solid fa-user text-success"></i> Người tìm việc</a></div>';
                                echo '<div><a class="text-decoration-none text-dark ms-3 " href="nhatuyendung/login.php"><i class="fa-solid fa-building text-success"></i>Nhà tuyển dụng</a></div>';
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </nav>
        </div>

        <div class="col-12 col-md-8 offset-2 mt-3 py-4">
            <form method="GET">
                <div class="input-group">
                    <input type="text" name="1" class="form-control"
                        placeholder="Hãy cho chúng tôi biết lĩnh vực bạn cần tư vấn">
                    <button class="btn btn-primary" name="button">Gửi</button>
                </div>
            </form>
        </div>
        <div class="row mt-2">

            <div class="col-10 col-md-10 offset-1">
                <?php foreach ($ketqua as $cty): ?>

                    <div class="row">
                        <div class="border text-body mt-4" style="background-color: #f8f9fa;">
                            <div class="h5 ms-2 me-2 mt-2">Về lĩnh vực
                                <?= $cty['linh_vuc'] ?>
                            </div>
                            <div class="ms-2 me-2 mb-2"><a class="text-decoration-none text-dark ">
                                    <?= $cty['su_nghiep'] ?>
                                </a></div>
                        </div>
                        <div class="border text-body mt-4" style="background-color: #f8f9fa;">
                            <div class="h5 ms-2 me-2 mt-2">Các khóa học mà bạn nên thử khi chọn
                                <?= $cty['linh_vuc'] ?>
                            </div>
                            <div class="ms-2 me-2 mb-2"><a class="text-decoration-none text-dark ">
                                    <?= $cty['khoa_hoc'] ?>
                                </a></div>
                        </div>
                        <div class="border text-body mt-4" style="background-color: #f8f9fa;">
                            <div class="h5 ms-2 me-2 mt-2">Lời khuyên của chúng tôi gửi đến bạn khi chọn
                                <?= $cty['linh_vuc'] ?>
                            </div>
                            <div class="ms-2 me-2 mb-2"><a class="text-decoration-none text-dark">
                                    <?= $cty['h_phat_trien'] ?>
                                </a></div>
                        </div>
                    </div>

                <?php endforeach ?>
            </div>
        </div>
    </main>


</body>

</html>