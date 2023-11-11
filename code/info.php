<div class="container" style="padding-top:25px">
  <div class="row">
    <?php foreach ($ketqua as $cty): ?>
      <div class=" col-md-4 border">
        <div class="row">
          <div class="col-3 col-sm-3 col-md-3" style="display: grid; place-items: center;">
            <img class="img-fluid hot-job__logo img-thumbnail mr-2 mr-sm-3 border-0 bg-white"
              src="<?= $cty['images'] ?>" />
          </div>
          <div class="col-9 col-sm-9 col-md-9 ">
            <div class="" style="padding-top:10px"><a class="text-decoration-none text-dark h5 fw-bold "
                href="cty1.php?id=<?= $cty['tencongty'] ?>">
                <?= $cty['vitri_congty'] ?>
              </a></div>
            <div class=""><a class=" text-decoration-none text-dark h6 " href="cty1.php?id=<?= $cty['tencongty'] ?>">
                <?= $cty['tencongty'] ?>
              </a></div>
            <div class=""><a class="text-decoration-none text-dark h6 " href="cty1.php?id=<?= $cty['tencongty'] ?>">
                <?= $cty['vitri_congty'] ?>
              </a></div>
            <div class=""><a class="text-decoration-none text-danger h6 fw-bold" href="">Lương:
                <?= $cty['muc_luong'] ?>
              </a></div>
          </div>
        </div>
      </div>
    <?php endforeach ?>
  </div>
</div>