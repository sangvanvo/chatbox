<?php
session_start();
include('config/config.php');
$id = $_GET['id'];

$sql = "SELECT * FROM tbl_thongtintuyendung WHERE tencongty=?  and da_duyet=1";
$ketqua = $conn->prepare($sql);
$ketqua->execute([$id]);
$ketqua = $ketqua->fetchAll(PDO::FETCH_ASSOC);

?>



<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Công ty 1</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
    integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>

<body>

  <?php
  include "../code/head.php";
  ?>
  <?php foreach ($ketqua as $cty): ?>
    <img style="width: 100%;" src="<?= $cty['anhdaidien'] ?>" alt="">


    <div class="text-center py-2"><a class=" text-decoration-none text-dark h3">
        <?= $cty['tencongty'] ?>
      </a></div>
    <div class="text-center">
      <div>
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt"
          viewBox="0 2 21 16">
          <path
            d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 
            3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
          <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
        </svg>
        <span>
          <?= $cty['vitri_congty'] ?>
        </span>
      </div>
    </div>


    <hr />

    <div class="container">
      <div class="row ">

        <div class="col-sm-6 col-md-8  g-3 " style="background-color: #f8f9fa;">
          <h4 class="text-primary py-3 ms-2">Về chúng tôi</h4>
          <p class="ms-2">
            <?= $cty['thongtincongty'] ?>
          </p>
          <div class="row">
            <div class="col-sm-6 col-md-6">


            </div>
            <div class="d-flex flex-row-reverse col-sm-6 col-md-6">
              <div class=" text-primary"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="24"
                  fill="currentColor" class="bi bi-bell" viewBox="0 3 21 16">
                  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 
                            1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 
                            12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 
                            0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
                </svg><a class="text-primary h5 text-decoration-none" href="#">Gửi thông báo cho tìm kiếm này</a></div>
            </div>

          </div>

          <div class="row">
            <div class="col-sm-6 col-md-6">

            </div>
            <div class="d-flex flex-row-reverse col-sm-6 col-md-6">
              <div class="ms-3"> <a class="nav-link dropdown-toggle text-dark" href="#" role="button"
                  data-bs-toggle="dropdown">Mới cập nhật</a>
                <div class="dropdown-menu border" style="width: 100px; height: 120px; border: 1px #e0d8d8;">
                  <li><a href="khuvucmienbac.html" class="dropdown-item">Mới cập nhật </a></li>
                  <li><a href="khuvucmientrung.html" class="dropdown-item">Mới đăng</a></li>
                  <li><a href="khuvucmiennam.html" class="dropdown-item">Sắp hết hạn</a></li>
                </div>
              </div>
              <div class="">Sắp xếp</div>
            </div>
          </div>
          <h4 class="text-primary  ms-2">Việc đang tuyển</h4>

          <div class="border bg-body text-body">
            <div class="row">
              <div class=" col-sm-6 col-md-2" style="display: grid; place-items: center;">
                <img class="img-fluid hot-job__logo img-thumbnail mr-2 mr-sm-3 border-0 bg-white"
                  src="<?= $cty['images'] ?>" />
              </div>
              <div class="col-sm-6 col-md-10 ">
                <div class="" style="padding-top:10px"><a class="text-decoration-none text-dark h5 fw-bold " href="">
                    <?= $cty['vitri_tuyendung'] ?>
                  </a></div>
                <div class=""><a class=" text-decoration-none text-dark h6 " href="cty1.php?id=<?= $cty['tencongty'] ?>">
                    <?= $cty['tencongty'] ?>
                  </a></div>
                <div class=""><a class="text-decoration-none text-dark h6 " href="">
                    <?= $cty['vitri_congty'] ?>
                  </a></div>
                <div class=""><a class="text-decoration-none text-danger h6 fw-bold" href="">Lương:
                    <?= $cty['mucluong_tuyendung'] ?>
                  </a></div>
              </div>
            </div>


          </div>

        </div>


        <div class="col-6 col-md-4 py-2 g-3" style="background-color: #f8f9fa;">
          <h4 class="text-dark ms-2" style="padding-top:10px">Website</h4>
          <div class="ms-2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
              class="bi bi-globe" viewBox="0 0 16 16">
              <path
                d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm7.5-6.923c-.67.204-1.335.82-1.887 1.855A7.97 7.97 0 0 0 5.145 4H7.5V1.077zM4.09 4a9.267 9.267 0 0 1 .64-1.539 6.7 6.7 0 0 1 .597-.933A7.025 7.025 0 0 0 2.255 4H4.09zm-.582 3.5c.03-.877.138-1.718.312-2.5H1.674a6.958 6.958 0 0 0-.656 2.5h2.49zM4.847 5a12.5 12.5 0 0 0-.338 2.5H7.5V5H4.847zM8.5 5v2.5h2.99a12.495 12.495 0 0 0-.337-2.5H8.5zM4.51 8.5a12.5 12.5 0 0 0 .337 2.5H7.5V8.5H4.51zm3.99 0V11h2.653c.187-.765.306-1.608.338-2.5H8.5zM5.145 12c.138.386.295.744.468 1.068.552 1.035 1.218 1.65 1.887 1.855V12H5.145zm.182 2.472a6.696 6.696 0 0 1-.597-.933A9.268 9.268 0 0 1 4.09 12H2.255a7.024 7.024 0 0 0 3.072 2.472zM3.82 11a13.652 13.652 0 0 1-.312-2.5h-2.49c.062.89.291 1.733.656 2.5H3.82zm6.853 3.472A7.024 7.024 0 0 0 13.745 12H11.91a9.27 9.27 0 0 1-.64 1.539 6.688 6.688 0 0 1-.597.933zM8.5 12v2.923c.67-.204 1.335-.82 1.887-1.855.173-.324.33-.682.468-1.068H8.5zm3.68-1h2.146c.365-.767.594-1.61.656-2.5h-2.49a13.65 13.65 0 0 1-.312 2.5zm2.802-3.5a6.959 6.959 0 0 0-.656-2.5H12.18c.174.782.282 1.623.312 2.5h2.49zM11.27 2.461c.247.464.462.98.64 1.539h1.835a7.024 7.024 0 0 0-3.072-2.472c.218.284.418.598.597.933zM10.855 4a7.966 7.966 0 0 0-.468-1.068C9.835 1.897 9.17 1.282 8.5 1.077V4h2.355z" />
            </svg>
            <a class=" text-decoration-none h6 text-primary" href="https://thanhconghome.com/">
              <?= $cty['link'] ?>
            </a>
          </div>
          <h4 class="text-dark ms-2" style="padding-top:10px">Theo dõi</h4>

          <div class="row">
            <div class="col-sm-1 col-md-1 ms-3 text-primary">
              <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-facebook"
                viewBox="0 0 16 16">
                <path
                  d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
              </svg>
            </div>

            <div class="col-sm-1 col-md-1 ms-3 text-primary">
              <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="currentColor" class="bi bi-twitter"
                viewBox="0 0 16 16">
                <path
                  d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z" />
              </svg>
            </div>

            <div class="col-sm-10 col-md-10"></div>

          </div>
        </div>



      </div>
    </div>
  <?php endforeach ?>
  <hr />
  <?php
  include "../code/footer.php";
  ?>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
    crossorigin="anonymous"></script>
</body>

</html>