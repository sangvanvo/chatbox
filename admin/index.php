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
        <div class="col-2" style="height: 100vh; background-color: aquamarine;">
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
        <div class="col-10">
            <h1>Quản lý Công Việc</h1>
            <button class="btn btn-primary" data-toggle="modal" data-target="#addMemberModal">Thêm công việc</button>
            <br><br>

            <!-- Bảng hiển thị Thành viên -->
            <table class="table">
                <thead>
                    <tr>
                        <th>Tên</th>
                        <th>Email</th>
                        <th>Tên công việc</th>
                        <th>Mức lương</th>
                        <th>Tên công ty</th>
                        <th>Mô tả công việc</th>
                        <th>Số điện thoại</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody id="memberTableBody">
                    <!-- Dữ liệu thành viên sẽ được thêm ở đây -->
                </tbody>
            </table>
        </div>
        <!-- Modal Thêm Thành viên -->
        <div class="modal fade" id="addMemberModal" tabindex="-1" role="dialog" aria-labelledby="addMemberModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addMemberModalLabel">Thêm công việc</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="addMemberForm">
                            <div class="form-group">
                                <label for="memberName">Tên:</label>
                                <input type="text" class="form-control" id="memberName" required>
                            </div>
                            <div class="form-group">
                                <label for="memberEmail">Email:</label>
                                <input type="email" class="form-control" id="memberEmail" required>
                            </div>
                            <div class="form-group">
                                <label for="jobTitle">Tên công việc:</label>
                                <input type="text" class="form-control" id="jobTitle" required>
                            </div>
                            <div class="form-group">
                                <label for="salary">Mức lương (VND):</label>
                                <input type="text" class="form-control" id="salary" required>
                            </div>
                            <div class="form-group">
                                <label for="location">Tên công ty:</label>
                                <input type="text" class="form-control" id="location" required>
                            </div>
                            <div class="form-group">
                                <label for="jobDescription">Mô tả công việc:</label>
                                <textarea class="form-control" id="jobDescription" rows="3" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="contactInfo">Số điện thoại:</label>
                                <input type="text" class="form-control" id="contactInfo" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Thêm</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Chỉnh Sửa Thành viên -->
        <div class="modal fade" id="editMemberModal" tabindex="-1" role="dialog" aria-labelledby="editMemberModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editMemberModalLabel">Chỉnh sửa công việc</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="editMemberForm">
                            <div class="form-group">
                                <label for="editMemberName">Tên:</label>
                                <input type="text" class="form-control" id="editMemberName" required>
                            </div>
                            <div class="form-group">
                                <label for="editMemberEmail">Email:</label>
                                <input type="email" class="form-control" id="editMemberEmail" required>
                            </div>
                            <div class="form-group">
                                <label for="editJobTitle">Tên công việc:</label>
                                <input type="text" class="form-control" id="editJobTitle" required>
                            </div>
                            <div class="form-group">
                                <label for="editSalary">Mức lương (VND):</label>
                                <input type="text" class="form-control" id="editSalary" required>
                            </div>
                            <div class="form-group">
                                <label for="editLocation">Tên công ty:</label>
                                <input type="text" class="form-control" id="editLocation" required>
                            </div>
                            <div class="form-group">
                                <label for="editJobDescription">Mô tả công việc:</label>
                                <textarea class="form-control" id="editJobDescription" rows="3" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="editContactInfo">Số điện thoại:</label>
                                <input type="text" class="form-control" id="editContactInfo" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Cập nhật</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </main>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
    let members = [];

    function addMember(name, email, jobTitle, salary, location, jobDescription, contactInfo) {
        const newMember = {
            id: Date.now(),
            name,
            email,
            jobTitle,
            salary,
            location,
            jobDescription,
            contactInfo
        };
        members.push(newMember);
        displayMembers();
    }

    function deleteMember(id) {
        members = members.filter(member => member.id !== id);
        displayMembers();
    }

    function displayMembers() {
        const memberTableBody = document.getElementById('memberTableBody');
        memberTableBody.innerHTML = '';

        members.forEach(member => {
            const row = `
       <tr>
                    <td>${member.name}</td>
                    <td>${member.email}</td>
                    <td>${member.jobTitle}</td>
                    <td>${member.salary.replace(/\B(?=(\d{3})+(?!\d))/g, ".")}</td>
                    <td>${member.location}</td>
                    <td>${member.jobDescription}</td>
                    <td>${member.contactInfo}</td>
                    <td>
                        <button class="btn btn-info" onclick="editMember(${member.id})">Sửa</button>
                        <button class="btn btn-danger" onclick="deleteMember(${member.id})">Xóa</button>
                    </td>
                </tr>
    `;
            memberTableBody.innerHTML += row;
        });
    }

    document.getElementById('addMemberForm').addEventListener('submit', function (event) {
        event.preventDefault();
        const name = document.getElementById('memberName').value;
        const email = document.getElementById('memberEmail').value;
        const jobTitle = document.getElementById('jobTitle').value;
        const salary = document.getElementById('salary').value;
        const location = document.getElementById('location').value;
        const jobDescription = document.getElementById('jobDescription').value;
        const contactInfo = document.getElementById('contactInfo').value;
        addMember(name, email, jobTitle, salary, location, jobDescription, contactInfo);
        $('#addMemberModal').modal('hide');
    });

    let editingMemberId = null;

    function editMember(id) {
        editingMemberId = id;
        const editingMember = members.find(member => member.id === id);
        document.getElementById('editMemberName').value = editingMember.name;
        document.getElementById('editMemberEmail').value = editingMember.email;
        document.getElementById('editJobTitle').value = editingMember.jobTitle;
        document.getElementById('editSalary').value = editingMember.salary;
        document.getElementById('editLocation').value = editingMember.location;
        document.getElementById('editJobDescription').value = editingMember.jobDescription;
        document.getElementById('editContactInfo').value = editingMember.contactInfo;
        $('#editMemberModal').modal('show');
    }

    function updateMember(name, email, jobTitle, salary, location, jobDescription, contactInfo) {
        const updatedMember = {
            id: editingMemberId,
            name,
            email,
            jobTitle,
            salary,
            location,
            jobDescription,
            contactInfo
        };

        members = members.map(member => (member.id === editingMemberId ? updatedMember : member));
        displayMembers();
        $('#editMemberModal').modal('hide');
    }

    document.getElementById('editMemberForm').addEventListener('submit', function (event) {
        event.preventDefault();
        const name = document.getElementById('editMemberName').value;
        const email = document.getElementById('editMemberEmail').value;
        const jobTitle = document.getElementById('editJobTitle').value;
        const salary = document.getElementById('editSalary').value;
        const location = document.getElementById('editLocation').value;
        const jobDescription = document.getElementById('editJobDescription').value;
        const contactInfo = document.getElementById('editContactInfo').value;
        updateMember(name, email, jobTitle, salary, location, jobDescription, contactInfo);
    });

</script>

</html>