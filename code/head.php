<div class="">
  <nav class="navbar navbar-expand-lg">
    <div class="container border-bottom">
      <a class="navbar-brand fw-bold" style="color:red">Hỗ trợ việc làm</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse bg-white" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">

          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="index.php"><i
                class="fa-solid fa-house text-success"></i>Trang chủ</a>
          </li>

          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="nganhnghe.php"><i
                class="fa-solid fa-magnifying-glass text-success"></i>Tìm kiếm</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="../pages/login.php"><i
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