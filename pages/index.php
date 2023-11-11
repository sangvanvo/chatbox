<?php
session_start();
include('config/config.php');
$sql = "select * from timkiemvieclam limit 9";
$ketqua = $conn->prepare($sql);
$ketqua->execute();
$ketqua = $ketqua->fetchAll();

?>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <title>Tìm kiếm việc làm</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
    integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
  <?php
  include "../code/head.php";
  ?>



  <div class="container d-block d-md-none">
    <img style="width: 100%;" src="images/anhdaidien.jpg" alt="">
  </div>
  <div class=" d-none d-md-block">
    <img style="width: 100%;" src="images/anhdaidien.jpg" alt="">
  </div>



  <div class="container h3 fw-bold" style="padding-top:25px">Việc làm hấp dẫn</div>
  <?php
  include "../code/info.php";
  ?>

  <div class="container h3 fw-bold" style="padding-top:25px">Cẩm nang tìm việc
    <div class="row" style="padding-top:20px">
      <div class="col-6 col-md-4">
        <div class="border">
          <a href="camnangvieclam.php"><img class="img-fluid hot-job__logo  mr-2 mr-sm-3 border-0"
              src="https://cl-wpml.s3.ap-southeast-1.amazonaws.com/cam-nang-viec-lam/wp-content/uploads/2023/06/12111459/smiling-diverse-businesswomen-shake-hands-group-meeting-deal-concept-2.jpg" /></a>
          <div class="h6 ms-1"><a class="text-decoration-none" href="camnangvieclam.php">Bài học thành công</a></div>
          <div class="h4 ms-1"><a class="text-decoration-none text-dark" href="camnangvieclam.php">9 hoạt động giúp khởi
              đầu năm mới thuận lợi</a></div>
        </div>
      </div>

      <div class="col-6 col-md-4">
        <div class="border">
          <a href="cv.php"><img class="img-fluid hot-job__logo mr-2 mr-sm-3 border-0"
              src="https://cl-wpml.s3.ap-southeast-1.amazonaws.com/cam-nang-viec-lam/wp-content/uploads/2023/10/30114202/portrait-beautiful-young-asian-business-woman-with-headphone-call-center2.jpg" /></a>
          <div class="h6 ms-1"><a class="text-decoration-none" href="cv.php">Viết CV / Resume</a></div>
          <div class="h4 ms-1"><a class="text-decoration-none text-dark" href="cv.php">Giải đáp thắc mắc về thư xin
              việc</a></div>
        </div>
      </div>
    </div>
  </div>

  <hr />
  <?php
  include "../code/footer.php";
  ?>



  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
    crossorigin="anonymous"></script>


</body>

</html>