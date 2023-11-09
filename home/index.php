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
    <style>
        #chatboxBody {
            overflow-y: auto;
            min-height: 93vh;
            max-height: 93vh;
            /* Đặt chiều cao tối đa của chatboxBody */
        }
    </style>
</head>

<body class="container-fluid">
    <main class="row">
        <div class="col-12 col-md-2" style="height: 100vh; background-color: aquamarine;">
            <div class="d-flex align-items-center gap-3 py-2">
                <a href="/home/index.php" class="text-decoration-none text-white fw-bold"><i
                        class="fa fa-solid fa-house"></i>Trang
                    chủ</a>
                <a href="/login/index.php" class="text-decoration-none text-white fw-bold"><i
                        class="fa fa-solid fa-user"></i>Đăng
                    nhập</a>

            </div>

            <div class="d-flex py-2">
                <a href="/signup/index.php" class="text-decoration-none text-white fw-bold"><i
                        class="fas fa-user-plus"></i>Đăng
                    ký</a>
            </div>

            <div class="py-2">
                <a href="/admin/index.php" class="text-decoration-none text-white fw-bold">
                    Trang quản trị
                </a>
            </div>


            <hr>
            <div>
                <p>lich sữ tìm kiếm</p>
                <button class="btn btn-dark">new</button>
                <hr>
            </div>
        </div>
        <div class="col-12 col-md-8 col-xl-10">
            <div id="chatbox" class="">
                <div class="card-body" id="chatboxBody">
                    <!-- Nội dung chatbox sẽ được hiển thị ở đây -->
                </div>
                <div class="card-footer">
                    <div class="input-group">
                        <input type="text" class="form-control" id="chatInput" placeholder="Enter your message">
                        <button class="btn btn-primary" id="sendMessageBtn">Gửi</button>
                    </div>
                </div>
            </div>
        </div>
    </main>


    <script>
        $(document).ready(function () {
            var chatboxBody = $("#chatboxBody");

            // Phản hồi giả định từ chatbox
            var responses = [
                "Chúc bạn tìm được công việc mơ ước!",
                "Hãy kiểm tra lại từ khóa tìm kiếm.",
                "Có vẻ như bạn quan tâm đến lĩnh vực nào?",
                // Thêm các phản hồi khác ở đây
            ];

            // Xử lý sự kiện khi người dùng nhập câu hỏi và nhấn nút Gửi
            $("#sendMessageBtn").on("click", function () {
                sendMessage();
            });

            $("#chatInput").on("keypress", function (event) {
                if (event.which === 13) { // 13 là mã phím Enter
                    sendMessage();
                }
            });

            function sendMessage() {
                var question = $("#chatInput").val();
                if (question.trim() !== "") {
                    // Hiển thị câu hỏi của người dùng
                    chatboxBody.append("<p><strong>Bạn: </strong> " + question + "</p>");

                    // Phản hồi giả định từ chatbox
                    var randomResponse = responses[Math.floor(Math.random() * responses.length)];
                    chatboxBody.append("<p><strong>Chatbox: </strong> " + randomResponse + "</p>");

                    // Xóa nội dung câu hỏi trong ô input
                    $("#chatInput").val("");

                    // Cuộn xuống cuối chatboxBody
                    chatboxBody.scrollTop(chatboxBody[0].scrollHeight);
                }
            }
        });
    </script>

</body>

</html>