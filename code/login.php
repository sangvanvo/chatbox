<div class="container">
    <div class="row">
        <div class="col-sm-8 offset-sm-2">
            <div class="mt-2">
                <div class="alert alert-info text-center " role="alert">
                    <h4>Vui lòng đăng nhập tại đây!</h4>
                </div>
            </div>

            <div class="card">
                <div class="card-header text-center bg-secondary-subtle text-emphasis-secondary">
                    <a href="index.php"><button type="button" class="btn-close position-absolute top-0 end-0 p-3"
                            aria-label="Close"></button></a>
                    <h3>Đăng nhập</h3>
                </div>
                <div class="card-body ">
                    <form id="signupForm" method="post" class="form-horizontal" action="#">



                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Email</label>
                            <input type="email" class="form-control" id="" name="email">
                        </div>

                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Mật khẩu</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" name="matkhau">
                        </div>

                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Đồng ý các quy định của chúng
                                tôi</label>
                        </div>


                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary" name="login">Đăng nhập</button>
                        </div>

                        <div class="text-center">Nếu chưa có tài khoản vui lòng <a href="register.php">Đăng kí</a></div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</script>
</nav>