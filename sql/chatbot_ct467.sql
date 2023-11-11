-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 11, 2023 lúc 07:44 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `chatbot_ct467`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `chinhsuavieclam` (IN `record_id` INT, IN `new_nganh_nghe` VARCHAR(200), IN `new_tencongty` VARCHAR(200), IN `new_vitri_congty` VARCHAR(200), IN `new_muc_luong` VARCHAR(100), IN `new_images` VARCHAR(1000), IN `new_trinh_do` VARCHAR(255), IN `new_vi_tri` VARCHAR(200))   BEGIN
    UPDATE timkiemvieclam
    SET nganh_nghe = new_nganh_nghe,
        tencongty = new_tencongty,
        vitri_congty = new_vitri_congty,
        muc_luong = new_muc_luong,
        images = new_images,
        trinh_do = new_trinh_do,
        vi_tri = new_vi_tri
    WHERE id_thongtintuyendung = record_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ctythemvieclam` (IN `n_nganh_nghe` VARCHAR(200), IN `n_tencongty` VARCHAR(200), IN `n_vitri_congty` VARCHAR(200), IN `n_muc_luong` VARCHAR(100), IN `n_images` VARCHAR(1000), IN `n_trinh_do` VARCHAR(255), IN `n_vi_tri` VARCHAR(200), IN `n_gia_tri` TINYINT(1))   BEGIN
    INSERT INTO timkiemvieclam (nganh_nghe, tencongty, vitri_congty, muc_luong, images, trinh_do, vi_tri, gia_tri) 
    VALUES (n_nganh_nghe, n_tencongty, n_vitri_congty, n_muc_luong, n_images, n_trinh_do, n_vi_tri, n_gia_tri);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `themvieclam` (IN `n_nganh_nghe` VARCHAR(200), IN `n_tencongty` VARCHAR(200), IN `n_vitri_congty` VARCHAR(200), IN `n_muc_luong` VARCHAR(100), IN `n_images` VARCHAR(1000), IN `n_trinh_do` VARCHAR(255), IN `n_vi_tri` VARCHAR(200))   BEGIN
    INSERT INTO timkiemvieclam 
        (nganh_nghe, tencongty, vitri_congty, muc_luong, images, trinh_do, vi_tri) 
    VALUES 
        (n_nganh_nghe, n_tencongty, n_vitri_congty, n_muc_luong, n_images, n_trinh_do, n_vi_tri);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `xoavieclam` (IN `record_id` INT)   BEGIN
    DELETE FROM timkiemvieclam 
    WHERE id_thongtintuyendung = record_id;
END$$

--
-- Các hàm
--
CREATE DEFINER=`root`@`localhost` FUNCTION `CountBachelorDegrees` () RETURNS INT(11)  BEGIN
    DECLARE totalBachelorDegrees INT;
    SELECT COUNT(*) INTO totalBachelorDegrees FROM timkiemvieclam WHERE trinh_do = 'Cử Nhân';
    RETURN totalBachelorDegrees;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `CountEmployeePositions` () RETURNS INT(11)  BEGIN
    DECLARE totalEmployeePositions INT;
    SELECT COUNT(*) INTO totalEmployeePositions FROM timkiemvieclam WHERE vi_tri = 'Nhân viên';
    RETURN totalEmployeePositions;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `CountSalariesAbove10Million` () RETURNS INT(11)  BEGIN
    DECLARE totalAbove10M INT;
    SELECT COUNT(*) INTO totalAbove10M FROM timkiemvieclam WHERE CAST(muc_luong AS DECIMAL) >= 10
    ;
    RETURN totalAbove10M;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `CountTotalJobPostings` () RETURNS INT(11)  BEGIN
    DECLARE totalJobs INT;
    SELECT COUNT(*) INTO totalJobs FROM timkiemvieclam;
    RETURN totalJobs;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `CountValuesEqualTo1` () RETURNS INT(11)  BEGIN
    DECLARE totalEqual1 INT;
    SELECT COUNT(*) INTO totalEqual1 FROM timkiemvieclam WHERE gia_tri = '1';
    RETURN totalEqual1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loi_khuyen`
--

CREATE TABLE `loi_khuyen` (
  `id` int(11) NOT NULL,
  `su_nghiep` varchar(1000) NOT NULL,
  `khoa_hoc` varchar(1000) NOT NULL,
  `h_phat_trien` varchar(1000) NOT NULL,
  `linh_vuc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `loi_khuyen`
--

INSERT INTO `loi_khuyen` (`id`, `su_nghiep`, `khoa_hoc`, `h_phat_trien`, `linh_vuc`) VALUES
(1, 'Công nghệ thông tin là một ngành rất rộng, mỗi ngạch hẹp của công nghệ thông tin có thể nói là cả một con đường không điểm dừng. Nên trước mắt, trước khi đưa ra quyết định nghiêm túc như làm gì để theo ngành IT, các bạn trẻ có định hướng CNTT nên nhìn lại xem: vì sao mình có mong muốn theo học ngành CNTT? Động lực khiến mình theo đuổi ngành CNTT là gì? Mình sẵn sàng “đánh đổi” và nỗ lực ra sao để theo ngành? Mình sẽ là ai, đi tới đâu với những nỗ lực sẽ bỏ ra?', 'TechMaster, CodeGym, FUNiX, Awesome Academy', 'Có định hướng CNTT rõ ràng, bạn nên tìm cho mình một lộ trình học tập để có kiến thức nền tảng về ngành. Lộ trình đó có thể do bạn tự lên, tự học, cũng có thể do bạn đăng ký các khóa học, có tham khảo cố vấn của người có kinh nghiệm, người đi trước. Lộ trình phải rõ ràng, cụ thể và có thời gian học tập chinh phục để bạn sớm đánh giá được khả năng của mình.', 'Công Nghệ Thông Tin (CNTT)'),
(2, 'Tiền bạc chính là huyết mạch của công ty. Mặc dù tất cả chúng ta bước vào kinh doanh với niềm khao khát được làm những việc mình yêu thích và tạo ra sự khác biệt cho những người mà chúng ta phục vụ, thì tiền bạc vẫn là thứ không thể bỏ qua. Đây là vấn đề mà chúng ta luôn cần phải quản lý và quan tâm thích đáng để đạt được thành công. Rất nhiều các doanh nghiệp làm ăn thuận lợi, doanh số tốt và lợi nhuận cao. Tuy nhiên vì không chú trọng vào sổ sách kế toán nên việc quản lý tiền có nhiều lỗ hổng. Họ không hiểu toàn bộ số tiền kiếm về lại đi đâu mất. Công việc kinh doanh cũng vì thế mà gặp nhiều sự cố.', 'Học viện TACA, Trung tâm GEC, Kế toán Thiên Ưng', 'Mỗi buổi sáng cùng với việc check mail hay xem lại bản kiểm kê hàng hóa mỗi tuần, hãy tạo cho mình thói quen xem lại sổ sách kế toán định kỳ. Hãy cài đặt vào lịch làm việc của bạn với nội dung “Kiểm tra sổ sách”. Tần suất kiểm tra tùy thuộc vào bạn, nhưng bạn nên dành ít nhất mỗi tháng một lần, hoặc nhiều hơn.Các thuật ngữ kế toán phức tạp đôi khi là trở ngại lớn đối với những nhà điều hành doanh nghiệp khi họ không phải là người có chuyên môn về lĩnh vực này. Như các thuật ngữ: Hệ thống tài khoản kế toán, Sổ cái, Tiền mặt với tiền lũy kế… cần được các nhà quản trị hiểu cặn kẽ ý nghĩa của nó.Những thuật ngữ kế toán phải được hiểu một cách cặn kẽ để chủ doanh nghiệp nắm vững được tình hình tài chính của công ty. Có nhiều cách để tích lũy và nâng cao kiến thức về lĩnh vực kế toán như: Các khóa đào tạo ngắn hạn, hiệp hội kế toán hay các trang web chuyên về kế toán là những nơi tốt để bắt đầu tìm hiểu về kế toán và thuế. Thường một số doanh nghiệp cũng thuê những chuyên gia kế toán hoặc ch', 'Kế Toán'),
(3, 'Ngành Ngôn ngữ Anh, đôi khi còn được gọi là ngành Anh văn, là một lĩnh vực học thuật chuyên sâu vào nghiên cứu về ngôn ngữ, văn hóa, văn học và xã hội của các quốc gia nói tiếng Anh. Đặc biệt, ngành Ngôn ngữ Anh không chỉ giới hạn trong việc học cách sử dụng ngôn ngữ này mà còn đào sâu vào cấu trúc, ngữ pháp, từ vựng, âm điệu và ngữ điệu của tiếng Anh. Bên cạnh đó, những người theo học ngành này cũng có cơ hội tìm hiểu về văn hóa, lịch sử, văn học và xã hội của các quốc gia và vùng lãnh thổ nói tiếng Anh.', 'Các trường đạo tạo từ xa tốt nhất hiện tại:Đại học Mở Hà Nội, Đại học Thái nguyên', 'Giao tiếp tiếng Anh: Thực hành mỗi ngày từ 15-30 phút.2. Tham gia các nhóm học tiếng Anh. Tư duy phân tích và giải quyết vấn đề: Tự giải quyết vấn đề khi gặp khó khăn, thực hành tư duy phân tích qua việc đọc sách, viết luận văn, tham gia thảo luận. Khám phá và học hỏi: Mở rộng kiến thức qua việc đọc sách, theo dõi tin tức, tham gia khóa học trực tuyến, học hỏi và rút kinh nghiệm từ những thất bại.', 'Ngôn Ngữ Anh'),
(4, 'Kỹ sư cơ khí là những người làm việc trong ngành nghiên cứu, chế tạo máy móc và thiết bị hữu ích nhằm phục vụ cho mọi lĩnh vực: hàng không, ô tô, robot, máy móc sản xuất, vũ khí, đồ dùng gia đình. Đây được xem là công việc có cơ hội và triển vọng nghề nghiệp cao tại thị trường Việt Nam cũng như nhiều nước khác trên thế giới. Bởi cơ khí có thể được ví như “xương sống” của các ngành công nghiệp. Tóm lại, kỹ sư cơ khí là lực lượng lao động đóng vai trò quan trọng tạo nên sự phát triển bền vững. Hiện nay, kỹ sư cơ khí được đào tạo tại các trường đại học/cao đẳng thuộc các khối ngành Kỹ thuật cơ khí, Công nghệ tự động, Cơ khí chế tạo.', 'Các trường đào tạo về Kỹ sư cơ khí: Trường Đại học Bách khoa Hà Nội, Trường Đại học Kỹ thuật Lê Quý Đôn, Trường Đại học Bách khoa, Đại học Quốc gia Thành phố Hồ Chí Minh, Trường Đại học Cần Thơ, Trường Đại học Bách khoa, Đại học Đà Nẵng, Trường Đại học Kỹ thuật Công nghiệp, Đại học Thái Nguyên. ', 'Suy nghĩ như một doanh nhân. Hãy suy nghĩ bên ngoài chuyên môn của bạn. Làm việc nhóm. Tuân thủ các quy tắc. Hãy là một phần của đổi mới. Làm cho sếp của bạn trông tử tế. Luôn kết nối với trường đại học của bạn. Tiếp tục học hỏi. Hãy tích cực kết nối. Tìm một người cố vấn. Tăng cường kỹ năng giao tiếp của bạn.', 'Kỹ Sư Cơ Khí'),
(5, 'Sẽ không còn gì tuyệt vời hơn khi ý tưởng khởi nghiệp kinh doanh từ những lý thuyết trên giấy được hiện thực hóa một cách thành công nhất. Tuy nhiên, quá trình khởi nghiệp không phải là một con đường trải đầy hoa hồng, bạn sẽ phải đối mặt với vô vàn những khó khăn, thách thức. Thậm chí phải nhận thất bại chỉ sau một khoảng thời gian mới bắt tay vào thực hiện. Bởi thương trường là chiến trường, là nơi bạn phải đánh đổi rất nhiều thứ, bỏ ra rất nhiều công sức và không ngừng nỗ lực phát triển thì mới có được những cơ hội cho mình.', 'Edumall, CTY TNHH Đào Tạo Tư Vấn PDCA, Unica', 'Hãy làm những việc bạn thích, Hãy có một nguồn thu nhập ổn định nào đó, Đi cùng ai hay đi một mình?, Kiếm tiền trước phát triển toàn diện sau, Không ngừng học tập để phát triển bản thân, Xây dựng chiến lược dòng tiền thông minh, Hãy tìm đến sự giúp đỡ từ các chuyên gia, Hãy xây dựng mạng lưới khách hàng ngay từ bây giờ, Mắt nhìn xa – Làm việc cần chuẩn bị.', 'Kinh Doanh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`id_admin`, `username`, `password`, `admin_status`) VALUES
(2, 'dang@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1),
(5, 'admin@gmail.com', '11111111', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_dangky_nguoitimviec`
--

CREATE TABLE `tbl_dangky_nguoitimviec` (
  `id_dangky` int(11) NOT NULL,
  `tenkhachhang` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `diachi` varchar(200) NOT NULL,
  `dienthoai` varchar(10) NOT NULL,
  `matkhau` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_dangky_nguoitimviec`
--

INSERT INTO `tbl_dangky_nguoitimviec` (`id_dangky`, `tenkhachhang`, `email`, `diachi`, `dienthoai`, `matkhau`) VALUES
(27, 'Võ Văn Sang', 'admin@gamil.com', '133c3', '0965931927', 'b0baee9d279d34fa1dfd71aadb908c3f');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_dangky_nhatuyendung`
--

CREATE TABLE `tbl_dangky_nhatuyendung` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `matkhau` varchar(100) NOT NULL,
  `tencongty` varchar(200) NOT NULL,
  `sonhanvien` int(11) NOT NULL,
  `sodienthoai` varchar(10) NOT NULL,
  `diachi` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_dangky_nhatuyendung`
--

INSERT INTO `tbl_dangky_nhatuyendung` (`id`, `email`, `matkhau`, `tencongty`, `sonhanvien`, `sodienthoai`, `diachi`) VALUES
(6, '1@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', '11111', 111, '1111111111', '11111'),
(7, '1@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', '11111', 111, '1111111111', '11111'),
(10, 'admin@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'Nhà tuyển dụng', 11111, '0123456789', 'Bạc Liêu'),
(11, 'admin@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'admin', 100, '0941673654', 'Bạc Liêu'),
(12, 'admin@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'admin', 100, '0941673654', 'Bạc Liêu'),
(13, 'dang@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'MAI DE CHÓC', 100, '0941673654', 'Bạc Liêu'),
(14, 'admin@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'Admin', 100, '0941673654', 'Bạc Liêu'),
(15, 'admin@gamil.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'adsads', 12, '0965931927', '133c2'),
(16, 'admin@gamil.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'adsads', 12, '0965931927', '133c2'),
(17, 'admin@gamil.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'adsads', 12, '0965931927', '133c2'),
(18, 'admin@gamil.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'adsads', 12, '0965931927', '133c2'),
(19, 'admin@gamil.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'adsads', 12, '0965931927', '133c2'),
(20, 'admin@gamil.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'adsads', 12, '0965931927', '133c2'),
(21, 'admin@gamil.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'adsads', 12, '0965931927', '133c2'),
(22, 'admin@gamil.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'adsads', 12, '0965931927', '133c2'),
(23, 'admin@gamil.com', '96e79218965eb72c92a549dd5a330112', 'adsads', 12, '0965931927', '133c2'),
(24, 'admin@gamil.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'adsads', 12, '0965931927', '133c2'),
(25, 'admin@gamil.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'adsads', 12, '0965931927', '133c2'),
(26, 'admin@gamil.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'adsads', 12, '0965931927', '133c2'),
(27, 'admin@gamil.com', '96e79218965eb72c92a549dd5a330112', 'adsads', 12, '0965931927', '133c2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_thongtintuyendung`
--

CREATE TABLE `tbl_thongtintuyendung` (
  `id_thongtintuyendung` int(11) NOT NULL,
  `vitri_tuyendung` varchar(200) NOT NULL,
  `tencongty` varchar(200) NOT NULL,
  `vitri_congty` varchar(200) NOT NULL,
  `mucluong_tuyendung` varchar(100) NOT NULL,
  `images` varchar(1000) NOT NULL,
  `da_duyet` tinyint(1) NOT NULL DEFAULT 0,
  `anhdaidien` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `thongtincongty` varchar(1000) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_thongtintuyendung`
--

INSERT INTO `tbl_thongtintuyendung` (`id_thongtintuyendung`, `vitri_tuyendung`, `tencongty`, `vitri_congty`, `mucluong_tuyendung`, `images`, `da_duyet`, `anhdaidien`, `link`, `thongtincongty`, `created_at`) VALUES
(17, 'KĨ THUẬT CƠ KHÍ', 'CTY TNHH VIỆT Á CHÂU', 'Bà Rịa - Vũng Tàu', '15 triệu', 'https://vietachautravel.com.vn/wp-content/uploads/2021/01/Logo-VIETACHAU-1536x988-1.jpg', 1, 'https://cdn.nhanlucnganhluat.vn/uploads/images/2e9c6bba/source/2018-10/0176847661083880.jpg', 'https://vietachau.com.vn/', 'Công ty TNHH Xây lắp & Thương mại Việt Á Châu thành lập vào ngày 24 tháng 02 năm 2011, trải qua hơn 10 năm hoạt động và nỗ lực không ngừng, đến nay Việt Á Châu đã đạt được những bước tiến mới trong quá trình phát triển, tạo dựng được đội ngũ nhân viên, cán bộ kỹ sư giỏi chuyên môn, giàu nhiệt huyết cùng các đội ngũ công nhân xây lắp lành nghề thi công chủ yếu trong các công trình dầu khí cả nước.', '2023-11-10 17:59:55'),
(19, 'NHÂN VIÊN KINH DOANH', 'CTY CỔ PHẦN ANITIME', 'Hồ Chí Minh', '8 triệu', 'https://cdn1.vieclam24h.vn/tvn/asset/home/img/employer/577e12186ddb5_1467879960.jpg', 1, 'https://anitime.vn/uploads/files/trang_chu/Slide/viet-nam.jpg', 'https://anitime.vn/', 'Công Ty Cổ Phần Anitime được thành lập vào 2013, có trụ sở tại Thành Phố Hồ Chí Minh, hội tụ các thành viên có kinh nghiệm, nhiệt huyết đam mê. Với phương châm: UY TÍN - CHUYÊN NGHIỆP - THÂN THIỆN, Anitime sẽ không ngừng phát triển và mở rộng để có thể trở thành một trong những công ty dịch vụ có chất lượng tốt nhất. Trong tất cả những dự án, trải nghiệm của khách hàng luôn là sự ưu tiên hàng đầu của chúng tôi. Vì vậy, xuyên suốt quá trình định hướng kế hoạch và phát triển, Anitime đã liên tục cải tiến chất lượng dịch vụ, công nghệ máy móc, đội ngũ nhân sự để có thể đáp ứng được nhu cầu của khách hàng.', '2023-11-10 17:59:55'),
(20, 'NHÂN VIÊN QUẢNG CÁO', 'TẬP ĐOÀN AN PHÁT HOLDINGS', 'Hà Nội', '7 triệu - 10 triệu', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_D9DfP0fGP4UK39Q3zQhKKWjmB7tFLeYzEA&usqp=CAU', 1, 'https://dxwd4tssreb4w.cloudfront.net/image/5abfdb7c997f319f4b319e8df8fb265b', 'https://anphatholdings.com/', 'Có thể nói đến thời điểm hiện tại, An Phát Holdings đã hoàn thành vượt mức những mục tiêu quan trọng trong giai đoạn đầu phát triển của mình, cũng như khẳng định được thương hiệu, uy tín, vị thế hàng đầu của doanh nghiệp tại Việt Nam trong lĩnh vực phát triển sản phẩm thân thiện môi trường, công nghiệp hỗ trợ, nguyên vật liệu ngành nhựa… và đặc biệt, chúng tôi đang chiếm giữ vị trí hàng đầu tại Đông Nam Á về sản xuất bao bì màng mỏng nhờ vào việc hoàn thiện hệ thống quản lý sản xuất kinh doanh hiện đại, quản lý chất lượng sản phẩm, quản lý chi phí, khả năng cung cấp giải pháp cho khách hàng, đầu tư nhà xưởng, trang thiết bị hiện đại.', '2023-11-10 17:59:55'),
(21, 'NHÂN VIÊN PHỤ KHO', 'CTY OPPO VIỆT NAM', 'Hà Nội', '10 triệu', 'https://d3nax9sawz4kbl.cloudfront.net/company_logos/ce0e5f7cd227a464ea605c56cd649c23.png', 1, 'https://vieclam.oppomobile.vn/layout-2020/img/oppo-vietnam/viet-nam-2.jpg', 'https://www.oppo.com/vn/', 'Văn hoá doanh nghiệp cốt lõi của OPPO luôn là Bổn phận. Hãng cam kết tạo ra những sản phẩm tuyệt vời, làm hài lòng người dùng. Đối mặt với áp lực và sự cám dỗ từ bên ngoài, chúng tôi tin rằng việc giữ bình tĩnh và tập trung vào các nguyên tắc cơ bản là cách duy nhất để đưa ra những nhận định và lựa chọn đúng đắn, mở đường cho sự phát triển mạnh mẽ và bền vững cho doanh nghiệp.', '2023-11-10 17:59:55'),
(22, 'NHÂN VIÊN BÁN HÀNG', 'CTY CỔ PHẦN KĨ THUẬT SỐ FPT', 'Bình Dương', '11 triệu - 13 triệu', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/FPT_logo_2010.svg/800px-FPT_logo_2010.svg.png', 1, 'https://frt-cms-prod.s3-sgn09.fptcloud.com/anh_frt_banner_fdd48ae4e0.png', 'https://frt.vn/', 'Công ty Cổ phần Bán lẻ Kỹ thuật số FPT (gọi tắt là FPT Retail) được thành lập từ năm 2012 tại Việt Nam, là công ty liên kết của Tập đoàn FPT, sở hữu 2 chuỗi bán lẻ là FPT Shop, F.Studio By FPT và 1 công ty con là Công ty Cổ phần Dược phẩm FPT Long Châu.\r\n\r\n \r\n\r\nTrong suốt nhiều năm qua, bằng những nỗ lực không mệt mỏi, trung thành với chính sách “tận tâm phục vụ khách hàng”, FPT Retail quyết tâm hoạt động, xây dựng phong cách phục vụ khách hàng cho tất cả các mảng kinh doanh dù mới hay cũ, lấy đó làm nền tảng tăng trưởng bền vững, hoàn thiện hình ảnh một thương hiệu gần gũi, thân thiện và hướng tới mục tiêu phục vụ khách hàng là ưu tiên hàng đầu.', '2023-11-10 17:59:55'),
(23, 'TƯ VẤN VIÊN', 'CTY CỔ PHẦN VÀNG BẠC ĐÁ QUÝ', 'Bà Rịa - Vũng Tàu', '6 triệu', 'https://cdn.haitrieu.com/wp-content/uploads/2022/01/Logo-PNJ-Wh-Sl.png', 1, 'https://image.talentnetwork.vn/pnj///news/2020/10/23/1603444855_banner-tin-tuc.jpg', 'https://pnj.com.vn/', 'PNJ là thương hiệu hàng đầu tại Việt Nam trong lĩnh vực chế tác và bán lẻ trang sức bằng vàng, bạc, đá quý. Sản phẩm PNJ ngày càng được các nước tại thị trường Châu Á và Châu Âu ưu chuộng.\r\n\r\nHiện tại, PNJ Group có gần 7000 nhân viên với hệ thống bán sỉ, và gần 400 cửa hàng bán lẻ trải rộng trên toàn quốc. Công ty PNJP có công suất sản xuất đạt trên 4 triệu sản phẩm/năm, được đánh giá là một trong những nhà máy chế tác nữ trang lớn nhất khu vực Châu Á với đội ngũ gần 1.500 nhân viên.\r\n\r\nTrải qua 33 năm hình thành và phát triển, PNJ đã đạt đươc nhiều thành tựu đáng kể: thuộc Top 500 nhà bán lẻ hàng đầu Châu Á Thái Bình Dương, Giải thưởng Chất lượng Châu Á Thái Bình Dương, Thương hiệu quốc gia, Top 100 Môi trường làm việc tốt nhất Việt Nam, Môi trường làm việc tốt nhất châu Á.', '2023-11-10 17:59:55'),
(24, 'NHÂN VIÊN KẾ TOÁN', 'TẬP ĐOÀN GIÁO DỤC RES', 'Cần Thơ', '6 triệu', 'https://data.canthojob.vn/canthojob/2023/9/9/tap-doan-giao-duc-res-canthojobvn-638298545024730116.png', 1, 'https://res.edu.vn/wp-content/uploads/2021/11/cover-res-dia-diem-thi-ielts-1400x533.jpg', 'https://res.edu.vn/', 'Res là hệ thống trường Anh Ngữ Quốc Tế được thành lập vào năm 2007 chuyên về Khóa Học IELTS,Tiếng Anh Trẻ em và Thiếu Niên. Là hệ thống trung tâm Anh Ngữ tiêu chuẩn Quốc Tế Cambridge và được Hội Đồng Úc IDP công nhận là đối tác xuất sắc trong suốt 8 năm liên tiếp. \r\n\r\nHiện nay Trung Tâm RES có tổng cộng 38 Chi nhánh toàn quốc và đang giữ kỷ lục trung tâm có số lượng học Viên học chứng chỉ quốc tế IELTS đông  cả nước (22300 học viên, thống kê 2018) và cũng đã và luôn giữ kỷ lục số học viên đạt điểm IELTS cao cả nước trong suốt 12 năm liên tiếp. ', '2023-11-10 17:59:55'),
(30, 'KẾ TOÁN TRƯỞNG', 'CTY TTNN TẬP ĐOÀN THÀNH CÔNG HOME', 'Hồ Chí Minh', '10 triệu', 'https://d3nax9sawz4kbl.cloudfront.net/company_logos/51f7a3ef24b1a449f28a7258ff4eb9a4.png', 1, 'https://d3nax9sawz4kbl.cloudfront.net/company_banners/b263815ea21c8cb8d7cf7a660e721a3a', 'https://thanhconghome.com/', 'TC HOME là công ty dịch vụ bất động sản hàng đầu về uy tín và chất lượng dịch vụ.\r\n\r\nTC HOME phân phối trực tiếp (F1) các sản phẩm bất động sản đô thị và nghỉ dưỡng từ các chủ đầu tư uy tín.\r\nKhông ngừng học hỏi và nỗ lực để trở thành\r\nngười bạn đồng hành đáng tin cậy và tận\r\ntụy của khách hàng. Chúng tôi không chỉ tư\r\nvấn những sản phẩm phù hợp mà còn giúp\r\nquý khách hàng lựa chọn gói giải pháp tài\r\nchính tối ưu nhằm đạt mục đích đầu tư hiệu\r\nquả nhất.', '2023-11-10 17:59:55'),
(32, 'NHÂN VIÊN KẾ TOÁN', 'CÔNG TY TNHH IMAX', 'Hồ Chí Minh', '10 triệu', 'https://dxwd4tssreb4w.cloudfront.net/image/144a1a63d921993b30ae470d7745a4aa', 1, 'https://dxwd4tssreb4w.cloudfront.net/web/images/default_banner_2.svg', 'http://imaxvietnam.vn/', 'Công Ty TNHH Imax là công ty Việt Nam được thành lập từ năm 2015 với lãnh vực hoạt động kinh doanh chính là Quảng cáo, Tổ chức các hoạt động truyền thông kích hoạt (Brand Activation), Roadshow, Sampling sản phẩm và tổ chức Sự kiện (Events) trên tất cả các địa bàn tỉnh thành Việt Nam. Các khách hàng của Imax là các tập đoàn hàng tiêu dùng nhanh trên thế giới.', '2023-11-10 17:59:55'),
(33, 'Nhân Viên QC', 'Công Ty TNHH DSM Việt Nam', 'Hưng Yên', 'Thương lượng', 'https://dxwd4tssreb4w.cloudfront.net/image/8f51809f6b1b19f41c0e2bbe1542abdb', 1, 'https://lh3.googleusercontent.com/p/AF1QipN43q2ZzaC2pIsGoUyYR5SJ4NFSIY4RuR3TizRs=s1360-w1360-h1020', 'https://www.dsm.com/', 'Công ty TNHH DSM Việt Nam là Công ty 100% vốn đầu tư của Hàn Quốc. Công ty chuyên sản xuất các sản phầm từ nhựa và lắp ráp linh kiện điện tử', '2023-11-10 17:59:55'),
(34, 'Nhân Viên Tư Vấn', 'CTY CỔ PHẦN BÁN LẺ KỸ THUẬT SỐ FPT', 'Đồng Nai', '7 triệu', 'https://dxwd4tssreb4w.cloudfront.net/image/ff516ed683b79e28190f8f0f796ba267', 1, 'https://frt-cms-prod.s3-sgn09.fptcloud.com/frt_agm2023_1_bfc26df36f.jpeg', 'https://frt.vn/', 'Công ty Cổ Phần Bán Lẻ Kỹ Thuật Số FPT là thành viên của tập đoàn FPT Việt Nam. Ra đời từ năm 2012 dưới hai thương hiệu chính là FPT Shop và F Studio By FPT. Sau hơn 7 năm hoạt động , công ty đã không ngừng mở rộng và phát triển hệ thống các chuổi cửa hàng trên toàn quốc. Với phương châm gần gủi, thân thiện cộng với sự phục vụ tận tình chu đáo của đội ngũ nhân viên, FPT Shop tạo cho khách hàng cảm giác thoải mái, thư giãn mỗi khi bước chân vào.', '2023-11-10 17:59:55'),
(35, 'CHUYÊN VIÊN Y TẾ', 'CTY CỔ PHẦN DƯỢC PHẨM PASTEUR', 'Bạc Liêu', '12 triệu', 'https://dxwd4tssreb4w.cloudfront.net/image/aef36760030e0bfa021a3ca79f47b0e6', 1, 'https://static.topcv.vn/company_logos/34XOo06LFpLJvb2ztUQfBG7uYZ31OC0R_1646643091____1dcd2cb4bc768b1f61e3e6918ac38cbe.png', 'https://nhathuocthanthien.com.vn/thuong-hieu/pasteur-phap/', 'Công Ty Cổ Phần Dược Phẩm Pasteur - Pháp chuyên bán lẻ thuốc, dụng cụ y tế, mỹ phẩm và vật phẩm vệ sinh trong các cửa hàng chuyên doanh.', '2023-11-10 17:59:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `timkiemvieclam`
--

CREATE TABLE `timkiemvieclam` (
  `id_thongtintuyendung` int(11) NOT NULL,
  `nganh_nghe` varchar(200) NOT NULL,
  `tencongty` varchar(200) NOT NULL,
  `vitri_congty` varchar(200) NOT NULL,
  `muc_luong` varchar(100) NOT NULL,
  `images` varchar(1000) NOT NULL,
  `trinh_do` varchar(255) DEFAULT NULL,
  `vi_tri` varchar(200) DEFAULT NULL,
  `gia_tri` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `timkiemvieclam`
--

INSERT INTO `timkiemvieclam` (`id_thongtintuyendung`, `nganh_nghe`, `tencongty`, `vitri_congty`, `muc_luong`, `images`, `trinh_do`, `vi_tri`, `gia_tri`, `created_at`) VALUES
(19, 'NHÂN VIÊN KINH DOANH', 'CTY CỔ PHẦN ANITIME', 'Hồ Chí Minh', '8 triệu', 'https://cdn1.vieclam24h.vn/tvn/asset/home/img/employer/577e12186ddb5_1467879960.jpg', 'Cử Nhân', 'Nhân Viên', 0, '2023-11-11 18:34:54'),
(20, 'NHÂN VIÊN QUẢNG CÁO', 'TẬP ĐOÀN AN PHÁT HOLDINGS', 'Hà Nội', '7 triệu - 10 triệu', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_D9DfP0fGP4UK39Q3zQhKKWjmB7tFLeYzEA&usqp=CAU', 'Cao Đẳng', 'Nhân Viên', 0, '2023-11-11 18:34:54'),
(21, 'NHÂN VIÊN PHỤ KHO', 'CTY OPPO VIỆT NAM', 'Hà Nội', '10 triệu', 'https://d3nax9sawz4kbl.cloudfront.net/company_logos/ce0e5f7cd227a464ea605c56cd649c23.png', 'Không yêu cầu chuyên môn', 'Nhân Viên', 0, '2023-11-11 18:34:54'),
(22, 'NHÂN VIÊN BÁN HÀNG', 'CTY CỔ PHẦN KĨ THUẬT SỐ FPT', 'Bình Dương', '11 triệu - 13 triệu', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/FPT_logo_2010.svg/800px-FPT_logo_2010.svg.png', 'Cử Nhân', 'Nhân Viên', 0, '2023-11-11 18:34:54'),
(23, 'TƯ VẤN VIÊN', 'CTY CỔ PHẦN VÀNG BẠC ĐÁ QUÝ', 'Bà Rịa - Vũng Tàu', '6 triệu', 'https://cdn.haitrieu.com/wp-content/uploads/2022/01/Logo-PNJ-Wh-Sl.png', 'Cử Nhân', 'Nhân Viên', 0, '2023-11-11 18:34:54'),
(24, 'NHÂN VIÊN KẾ TOÁN', 'TẬP ĐOÀN GIÁO DỤC RES', 'Cần Thơ', '6 triệu', 'https://data.canthojob.vn/canthojob/2023/9/9/tap-doan-giao-duc-res-canthojobvn-638298545024730116.png', 'Cử Nhân', 'Nhân Viên', 0, '2023-11-11 18:34:54'),
(30, 'KẾ TOÁN TRƯỞNG', 'CTY TTNN TẬP ĐOÀN THÀNH CÔNG HOME', 'Hồ Chí Minh', '10 triệu', 'https://d3nax9sawz4kbl.cloudfront.net/company_logos/51f7a3ef24b1a449f28a7258ff4eb9a4.png', 'Cử Nhân', 'Trưởng Phòng', 0, '2023-11-11 18:34:54'),
(32, 'NHÂN VIÊN KẾ TOÁN', 'CÔNG TY TNHH IMAX', 'Hồ Chí Minh', '11 triệu', 'https://dxwd4tssreb4w.cloudfront.net/image/144a1a63d921993b30ae470d7745a4aa', 'Cử Nhân', 'Nhân Viên', 0, '2023-11-11 18:34:54'),
(33, 'Nhân Viên QC', 'Công Ty TNHH DSM Việt Nam', 'Hưng Yên', 'Thương lượng', 'https://dxwd4tssreb4w.cloudfront.net/image/8f51809f6b1b19f41c0e2bbe1542abdb', 'Cao Đẳng', 'Nhân Viên', 0, '2023-11-11 18:34:54'),
(34, 'Nhân Viên Tư Vấn', 'CTY CỔ PHẦN BÁN LẺ KỸ THUẬT SỐ FPT', 'Đồng Nai', '7 triệu', 'https://dxwd4tssreb4w.cloudfront.net/image/ff516ed683b79e28190f8f0f796ba267', 'Cử Nhân', 'Nhân Viên', 0, '2023-11-11 18:34:54'),
(35, 'CHUYÊN VIÊN Y TẾ', 'CTY CỔ PHẦN DƯỢC PHẨM PASTEUR', 'Bạc Liêu', '12 triệu', 'https://dxwd4tssreb4w.cloudfront.net/image/aef36760030e0bfa021a3ca79f47b0e6', 'Thạc Sĩ', 'Trưởng Phòng', 0, '2023-11-11 18:34:54'),
(36, 'Nhân Viên Sales Thị Trường Đà Nẵng', 'Công Ty TNHH Quốc Tế Vina Mask', 'ĐÀ NẴNG', '10 triệu', 'https://d3nax9sawz4kbl.cloudfront.net/company_logos/8cbcfad69b3facd56e73486c898ed160.png', 'Cử Nhân', 'Nhân Viên', 0, '2023-11-11 18:34:54'),
(37, 'NHÂN VIÊN KẾ TOÁN', 'CTY TNHH VIỆT Á CHÂU', 'Bà Rịa - Vũng Tàu', '15 triệu', 'https://vietachautravel.com.vn/wp-content/uploads/2021/01/Logo-VIETACHAU-1536x988-1.jpg', 'Cử Nhân', 'Nhân Viên', 0, '2023-11-11 18:34:54');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Chỉ mục cho bảng `tbl_dangky_nguoitimviec`
--
ALTER TABLE `tbl_dangky_nguoitimviec`
  ADD PRIMARY KEY (`id_dangky`);

--
-- Chỉ mục cho bảng `tbl_dangky_nhatuyendung`
--
ALTER TABLE `tbl_dangky_nhatuyendung`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_thongtintuyendung`
--
ALTER TABLE `tbl_thongtintuyendung`
  ADD PRIMARY KEY (`id_thongtintuyendung`);

--
-- Chỉ mục cho bảng `timkiemvieclam`
--
ALTER TABLE `timkiemvieclam`
  ADD PRIMARY KEY (`id_thongtintuyendung`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `tbl_dangky_nguoitimviec`
--
ALTER TABLE `tbl_dangky_nguoitimviec`
  MODIFY `id_dangky` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `tbl_dangky_nhatuyendung`
--
ALTER TABLE `tbl_dangky_nhatuyendung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `tbl_thongtintuyendung`
--
ALTER TABLE `tbl_thongtintuyendung`
  MODIFY `id_thongtintuyendung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `timkiemvieclam`
--
ALTER TABLE `timkiemvieclam`
  MODIFY `id_thongtintuyendung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
