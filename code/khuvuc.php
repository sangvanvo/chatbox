<?php
session_start();
include('config/config.php');
$sql = "select * from tbl_thongtintuyendung where da_duyet=1";
$ketqua = $conn->query($sql);
$ketqua = $ketqua->fetchAll(PDO::FETCH_ASSOC);
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
  if (isset($_GET['button'])) {
    $noidung = $_GET['khuvuc'];

    $sql = "SELECT * FROM tbl_thongtintuyendung where vitri_congty like ? and da_duyet=1";

    $ketqua = $conn->prepare($sql);

    $ketqua->execute(["%$noidung%"]);

    $ketqua = $ketqua->fetchAll(PDO::FETCH_ASSOC);
  }
};


?>

<form method="GET">
                <input type="text" name="khuvuc" placeholder="Ngành nghề">
                <button type="submit" name="button">Tìm</button>
              </form>