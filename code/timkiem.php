<?php
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (isset($_GET['button'])) {
        $noidung = $_GET['nghenghiep'];
        $nd = $_GET['khuvuc'];
        $sql = "SELECT * FROM tbl_thongtintuyendung where vitri_tuyendung like ? and vitri_congty like ?";

        $ketqua = $conn->prepare($sql);

        $ketqua->execute(["%$noidung%", "%$nd%"]);

        $ketqua = $ketqua->fetchAll(PDO::FETCH_ASSOC);
    }
};
?>

<li class="nav-item">
    <form method="GET">
        <input type="text" name="nghenghiep" placeholder="Ngành nghề">
        <input type="text" name="khuvuc" placeholder="Địa điểm">
        <button type="submit" name="button">Tìm</button>
    </form>
</li>