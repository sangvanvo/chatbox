-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 13, 2023 lúc 03:59 AM
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
(5, 'Sẽ không còn gì tuyệt vời hơn khi ý tưởng khởi nghiệp kinh doanh từ những lý thuyết trên giấy được hiện thực hóa một cách thành công nhất. Tuy nhiên, quá trình khởi nghiệp không phải là một con đường trải đầy hoa hồng, bạn sẽ phải đối mặt với vô vàn những khó khăn, thách thức. Thậm chí phải nhận thất bại chỉ sau một khoảng thời gian mới bắt tay vào thực hiện. Bởi thương trường là chiến trường, là nơi bạn phải đánh đổi rất nhiều thứ, bỏ ra rất nhiều công sức và không ngừng nỗ lực phát triển thì mới có được những cơ hội cho mình.', 'Edumall, CTY TNHH Đào Tạo Tư Vấn PDCA, Unica', 'Hãy làm những việc bạn thích, Hãy có một nguồn thu nhập ổn định nào đó, Đi cùng ai hay đi một mình?, Kiếm tiền trước phát triển toàn diện sau, Không ngừng học tập để phát triển bản thân, Xây dựng chiến lược dòng tiền thông minh, Hãy tìm đến sự giúp đỡ từ các chuyên gia, Hãy xây dựng mạng lưới khách hàng ngay từ bây giờ, Mắt nhìn xa – Làm việc cần chuẩn bị.', 'Kinh Doanh'),
(6, 'Sự Nghiệp:\r\nLĩnh vực Phát triển Phần mềm là một ngành đầy tiềm năng với nhiều cơ hội nghề nghiệp hấp dẫn. Bạn có thể thăng tiến từ vị trí lập trình viên cơ bản đến các vị trí cấp cao như kiến trúc sư phần mềm, quản lý dự án công nghệ thông tin, hoặc chuyên gia an ninh mạng.', 'Khóa Học:\r\nNgôn ngữ lập trình: Học các ngôn ngữ phổ biến như Python, Java, JavaScript, C++, Ruby, Swift.\r\nCông cụ và Framework: Nắm vững các công cụ và framework như React, Angular, Node.js, Django, Spring Boot.\r\nQuản lý dự án phần mềm: Học về quy trình phát triển phần mềm, quản lý dự án từ giai đoạn lập kế hoạch đến triển khai.\r\nBảo mật phần mềm: Hiểu về an ninh mạng và cách bảo vệ dữ liệu quan trọng.', 'Phát triển sản phẩm: Tham gia vào việc phát triển ứng dụng, hệ thống phần mềm từ cơ bản đến phức tạp.\r\nChuyên gia về an ninh mạng: Tập trung vào phát triển kiến thức và kỹ năng trong lĩnh vực an ninh mạng và bảo mật phần mềm.\r\nQuản lý dự án CNTT: Leo lên vị trí quản lý dự án, điều phối các hoạt động kỹ thuật và quản lý nhóm phát triển.', 'Phát triển Phần mềm'),
(7, 'Sự Nghiệp:\r\nLĩnh vực Thiết Kế Đồ Họa cung cấp nhiều cơ hội sáng tạo và phát triển nghề nghiệp trong nhiều lĩnh vực khác nhau như quảng cáo, truyền thông, điện ảnh, trò chơi điện tử và thiết kế web.', 'Khóa Học:\r\nPhần mềm Thiết Kế Đồ Họa: Học cách sử dụng các công cụ thiết kế phổ biến như Adobe Photoshop, Illustrator, InDesign, Sketch, hoặc CorelDRAW.\r\nNguyên lý Thiết Kế: Nắm vững về màu sắc, layout, typography và nguyên tắc thiết kế.\r\nĐồ họa Đa Phương Tiện: Học về thiết kế video, animation, và các công cụ xử lý hình ảnh.\r\nThiết Kế Web: Hiểu về UX/UI Design, responsive design, và các công nghệ web liên quan.', 'Hướng Phát Triển:\r\nChuyên sâu trong một lĩnh vực cụ thể: Có thể tập trung vào thiết kế logo, đồ họa trò chơi, hoặc thiết kế web.\r\nTự doanh hoặc làm freelancer: Xây dựng cơ sở khách hàng riêng hoặc tham gia các dự án đa dạng.\r\nChuyển hướng sang quản lý dự án: Điều phối các dự án thiết kế, quản lý nhóm thiết kế và tiến trình sản xuất.', 'Thiết kế Đồ Họa'),
(8, 'Sự Nghiệp:\r\nAn Ninh Mạng cung cấp nhiều cơ hội nghề nghiệp trong việc bảo vệ thông tin, dữ liệu và hệ thống mạng. Các vị trí có thể bao gồm:\r\n\r\nChuyên gia bảo mật mạng: Tập trung vào việc đảm bảo an ninh cho hệ thống mạng và dữ liệu.\r\nChuyên viên phòng chống tấn công mạng: Theo dõi, phát hiện và ngăn chặn các tấn công mạng.\r\nKiểm thử an ninh: Đánh giá tính bảo mật của hệ thống, ứng dụng thông qua việc thực hiện các kiểm thử và phân tích lỗ hổng bảo mật.\r\nQuản trị an ninh thông tin: Đảm bảo chuẩn mực an ninh thông tin được duy trì và tuân thủ.', 'Khóa Học:\r\nAn ninh mạng cơ bản: Học về cơ sở lý thuyết, phương pháp và công cụ cơ bản về an ninh mạng.\r\nBảo mật mạng máy tính: Nắm vững các kiến thức về bảo mật mạng, firewall, IDS/IPS.\r\nKiểm thử đạo đức: Học về việc kiểm thử lỗ hổng một cách đạo đức, không xâm phạm quyền riêng tư hay gây hậu quả tiêu cực.\r\nQuản trị an ninh thông tin: Hiểu về quản lý rủi ro, tuân thủ và bảo vệ dữ liệu.', 'Hướng Phát Triển:\r\nChuyên sâu về lĩnh vực cụ thể: Chọn một lĩnh vực như bảo mật di động, IoT hoặc bảo mật Cloud và trở thành chuyên gia trong lĩnh vực đó.\r\nChứng chỉ an ninh mạng: Có thể học và đạt các chứng chỉ an ninh mạng uy tín như CEH, CISSP, CompTIA Security+.\r\nNghiên cứu và phát triển: Tham gia vào việc nghiên cứu về các vấn đề mới, phát triển giải pháp bảo mật mới.', 'An Ninh Mạng'),
(9, 'Sự Nghiệp:\r\nLĩnh vực Marketing cung cấp nhiều cơ hội nghề nghiệp trong việc quảng bá, tiếp thị sản phẩm/dịch vụ và tương tác với khách hàng. Các vị trí có thể bao gồm:\r\n\r\nChuyên viên tiếp thị: Phân tích thị trường, xác định chiến lược tiếp thị và thực hiện chiến dịch quảng cáo.\r\nChuyên gia truyền thông: Tạo nội dung quảng cáo, quản lý truyền thông qua các kênh online và offline.\r\nQuản lý thương hiệu: Xây dựng và quản lý hình ảnh thương hiệu, định hình chiến lược thương hiệu.', 'Khóa Học:\r\nMarketing cơ bản: Học về các nguyên lý cơ bản của marketing, chiến lược, phân tích thị trường và tiếp thị số.\r\nKỹ năng mềm: Phát triển kỹ năng giao tiếp, viết lách, quản lý dự án và phân tích dữ liệu.\r\nDigital Marketing: Hiểu về SEO, quảng cáo trực tuyến, content marketing, social media marketing.\r\nQuản lý Thương hiệu: Học cách xây dựng và quản lý hình ảnh thương hiệu, quản lý cộng đồng và tương tác khách hàng.', 'Hướng Phát Triển:\r\nChuyên sâu vào lĩnh vực cụ thể: Chọn một lĩnh vực như Digital Marketing, Marketing nội dung, hoặc quảng cáo truyền thông và trở thành chuyên gia trong lĩnh vực đó.\r\nQuản lý chiến lược marketing: Phát triển kỹ năng quản lý chiến lược, điều phối và lãnh đạo nhóm tiếp thị.\r\nTư vấn hoặc tự doanh: Xây dựng cơ sở khách hàng riêng hoặc tư vấn cho các doanh nghiệp về chiến lược marketing.\r\nTheo dõi xu hướng mới, học hỏi liên tục và áp dụng kiến thức vào thực tế thông qua các chiến dịch thực tế sẽ giúp bạn phát triển sự nghiệp trong lĩnh vực Marketing.', 'Marketing'),
(10, 'Sự Nghiệp:\r\nLĩnh vực Công Nghệ Thực Phẩm liên quan đến quá trình sản xuất, xử lý và bảo quản thực phẩm. Các vị trí có thể bao gồm:\r\n\r\nKỹ sư thực phẩm: Nghiên cứu, phát triển và thử nghiệm sản phẩm thực phẩm mới.\r\nChuyên gia chất lượng thực phẩm: Đảm bảo tuân thủ quy chuẩn an toàn và chất lượng trong sản xuất thực phẩm.\r\nChuyên gia nghiên cứu thực phẩm: Tiến hành nghiên cứu về cải tiến quy trình sản xuất, bảo quản thực phẩm.', 'Khóa Học:\r\nCông nghệ thực phẩm cơ bản: Học về quy trình sản xuất, kỹ thuật chế biến thực phẩm và an toàn thực phẩm.\r\nChất lượng thực phẩm: Nắm vững về quản lý chất lượng, kiểm soát chất lượng trong sản xuất thực phẩm.\r\nKhoa học và kỹ thuật thực phẩm: Hiểu về lý thuyết và kỹ thuật sản xuất thực phẩm, bảo quản thực phẩm.\r\nQuản lý an toàn thực phẩm: Học về quy trình đảm bảo an toàn và vệ sinh trong quá trình sản xuất thực phẩm.', 'Hướng Phát Triển:\r\nChuyên sâu vào một lĩnh vực cụ thể: Chọn một lĩnh vực như công nghệ chế biến thực phẩm, bảo quản thực phẩm hoặc chất lượng thực phẩm.\r\nNghiên cứu và phát triển: Tham gia vào việc nghiên cứu về cải tiến quy trình, phát triển sản phẩm mới và công nghệ sản xuất tiên tiến.\r\nQuản lý dự án thực phẩm: Phát triển kỹ năng quản lý dự án, điều phối và lãnh đạo nhóm thực phẩm.\r\nSự tập trung, kiên nhẫn và sự quan tâm đến chất lượng và an toàn thực phẩm là những yếu tố quan trọng để thành công trong lĩnh vực Công Nghệ Thực Phẩm.', 'Công Nghệ Thực Phẩm'),
(11, 'Sự Nghiệp:\r\nLĩnh vực kiến trúc mở ra nhiều cơ hội đa dạng từ việc thiết kế nhà ở, văn phòng đến các công trình công cộng. Các vị trí có thể bao gồm:\r\n\r\nKiến trúc sư: Thiết kế, xây dựng và quản lý các dự án kiến trúc.\r\nKiến trúc sư nội thất: Thiết kế không gian nội thất cho các dự án kiến trúc.\r\nKiến trúc sư cảnh quan: Thiết kế không gian xanh, cảnh quan cho các khu vực dân cư hoặc công cộng.', 'Khóa Học:\r\nKiến trúc cơ bản: Học về lịch sử kiến trúc, quy trình thiết kế và kỹ thuật vẽ.\r\nPhần mềm kiến trúc: Nắm vững các công cụ như AutoCAD, SketchUp, Revit.\r\nKiến trúc bền vững: Học về thiết kế bền vững, vật liệu xanh và tiết kiệm năng lượng.\r\nKiến trúc cảnh quan: Hiểu về thiết kế không gian xanh, vườn hoa và công viên.', 'Hướng Phát Triển:\r\nChuyên sâu vào lĩnh vực cụ thể: Chọn một lĩnh vực như kiến trúc nội thất, kiến trúc bền vững hoặc kiến trúc cảnh quan.\r\nNghiên cứu và phát triển: Tham gia vào việc nghiên cứu về các vấn đề kiến trúc mới, công nghệ xây dựng và vật liệu mới.\r\nPhát triển kỹ năng lãnh đạo: Nếu muốn đi theo con đường quản lý dự án, quản lý nhóm và dự án sẽ quan trọng.\r\nSự sáng tạo, khả năng thị giác tốt và khả năng làm việc theo nhóm là những yếu tố quan trọng trong lĩnh vực Kiến trúc.', 'Kiến trúc'),
(12, 'Sự Nghiệp:\r\nLĩnh vực Quản trị Kinh doanh mở ra nhiều cơ hội nghề nghiệp trong lĩnh vực quản lý, kế hoạch kinh doanh và chiến lược doanh nghiệp. Các vị trí có thể bao gồm:\r\n\r\nQuản lý dự án: Điều phối và quản lý các dự án kinh doanh.\r\nQuản lý sản phẩm: Phát triển và quản lý chiến lược sản phẩm.\r\nChuyên gia phân tích kinh doanh: Phân tích dữ liệu để hỗ trợ quyết định kinh doanh', 'Khóa Học:\r\nQuản trị kinh doanh cơ bản: Học về quản lý tổng thể doanh nghiệp, marketing, tài chính và nguồn nhân lực.\r\nKế hoạch kinh doanh: Nắm vững kỹ năng lập kế hoạch, phân tích thị trường và chiến lược kinh doanh.\r\nQuản trị dự án: Học cách quản lý dự án từ khâu lập kế hoạch đến thực hiện.\r\nKỹ năng lãnh đạo và giao tiếp: Phát triển kỹ năng lãnh đạo, giao tiếp và làm việc nhóm.', 'Hướng Phát Triển:\r\nChuyên sâu vào lĩnh vực cụ thể: Chọn một lĩnh vực như quản lý sản phẩm, quản trị dự án hoặc quản lý rủi ro kinh doanh.\r\nTiến lên vị trí quản lý cao cấp: Phát triển kỹ năng quản lý chiến lược, quản lý nguồn nhân lực và tài chính.\r\nHọc hỏi liên tục và mở rộng kỹ năng: Tìm cơ hội học tập liên tục, tham gia các khóa học mới, đào tạo để cập nhật kiến thức và kỹ năng mới.\r\nSự quan tâm đến chi tiết, khả năng phân tích và kỹ năng lãnh đạo là những yếu tố quan trọng để thành công trong lĩnh vực Quản trị Kinh doanh.', 'Quản trị Kinh doanh:'),
(13, 'Sự Nghiệp:\r\nLĩnh vực Logistics tập trung vào việc quản lý và vận hành chuỗi cung ứng, từ quản lý hàng hóa, kho bãi đến vận chuyển và phân phối. Các vị trí trong lĩnh vực này có thể bao gồm:\r\n\r\nChuyên viên Logistics: Quản lý và tối ưu hóa chuỗi cung ứng, quản lý kho bãi và vận tải.\r\nChuyên viên Vận chuyển: Quản lý đội xe, định tuyến và tối ưu hóa vận chuyển hàng hóa.\r\nQuản lý Chuỗi Cung Ứng: Đảm bảo mọi quá trình từ sản xuất đến giao hàng diễn ra một cách hiệu quả.', 'Khóa Học:\r\nQuản lý Logistics cơ bản: Học về quy trình vận hành, quản lý kho bãi và vận tải.\r\nKỹ năng quản lý kho và chuỗi cung ứng: Nắm vững về quản lý hàng tồn kho, dự báo và lập kế hoạch chuỗi cung ứng.\r\nCông nghệ thông tin trong Logistics: Hiểu về các hệ thống thông tin và phần mềm hỗ trợ quản lý Logistics.\r\nQuản trị chuỗi cung ứng toàn cầu: Học về chuỗi cung ứng trong ngữ cảnh toàn cầu, với tầm quan trọng của quản lý vận tải quốc tế và thương mại quốc tế.', 'Hướng Phát Triển:\r\nChuyên sâu vào một lĩnh vực cụ thể: Chọn một mảng như quản lý vận tải, quản lý kho hoặc quản lý chuỗi cung ứng và trở thành chuyên gia.\r\nNghiên cứu và phát triển: Tham gia vào việc nghiên cứu về các phương pháp mới, công nghệ mới, và phát triển các giải pháp hiệu quả cho Logistics.\r\nTham gia cấp quản lý cao cấp: Phát triển kỹ năng quản lý chiến lược, điều hành và lãnh đạo để tiến lên vị trí quản lý cao hơn trong lĩnh vực Logistics.\r\nSự tổ chức, khả năng quản lý, và khả năng làm việc hiệu quả với các hệ thống là cực kỳ quan trọng để phát triển trong lĩnh vực Logistics.', ' Logistics'),
(14, 'Sự Nghiệp:\r\nLĩnh vực Tâm lý học bao gồm nhiều ngả như tâm lý học cố vấn, tâm lý học học thuật, tâm lý học công nghiệp và tổ chức, tâm lý học giáo dục, tâm lý học lâm sàng, và nhiều lĩnh vực khác. Các vị trí có thể bao gồm:\r\n\r\nTâm lý học cố vấn: Hỗ trợ và tư vấn cá nhân hoặc nhóm trong việc giải quyết vấn đề tâm lý.\r\nTâm lý học công nghiệp và tổ chức: Áp dụng kiến thức tâm lý vào môi trường làm việc để cải thiện hiệu suất và sức khỏe tinh thần.\r\nTâm lý học giáo dục: Hỗ trợ và tư vấn cho học sinh, giáo viên và hệ thống giáo dục.', 'Khóa Học:\r\nTâm lý học cơ bản: Nền tảng về lịch sử, lý thuyết và phương pháp nghiên cứu trong tâm lý học.\r\nTâm lý học ứng dụng: Học cách áp dụng kiến thức tâm lý vào thực tế, giải quyết vấn đề và tư vấn.\r\nTâm lý học công nghiệp: Học về ứng dụng tâm lý học trong môi trường làm việc và quản lý nhân sự.\r\nTâm lý học giáo dục: Nắm vững kiến thức để hỗ trợ giáo viên, học sinh và cải thiện hệ thống giáo dục.', 'Hướng Phát Triển:\r\nChuyên sâu vào lĩnh vực cụ thể: Chọn một ngách như tâm lý học trẻ em, tâm lý học trị liệu, hoặc tâm lý học xã hội.\r\nNghiên cứu và phát triển: Tham gia vào việc nghiên cứu về các vấn đề tâm lý học mới, công nghệ và phương pháp điều trị tiên tiến.\r\nTư vấn hoặc giảng dạy: Xây dựng cơ sở khách hàng riêng hoặc trở thành giảng viên, đào tạo tương lai trong lĩnh vực tâm lý học.\r\nSự kiên nhẫn, khả năng lắng nghe và tư duy phản biện là những yếu tố quan trọng để thành công trong lĩnh vực Tâm lý học.', 'Tâm lý học'),
(15, 'Sự Nghiệp:\r\nLĩnh vực Luật mở ra nhiều cơ hội nghề nghiệp trong ngành tư pháp, doanh nghiệp, tư vấn pháp luật và nhiều lĩnh vực khác. Các vị trí có thể bao gồm:\r\n\r\nLuật sư: Đại diện cho cá nhân hoặc doanh nghiệp trong các vụ kiện và tư vấn về các vấn đề pháp lý.\r\nQuản lý rủi ro pháp lý: Đảm bảo rằng hoạt động của công ty tuân thủ các quy định pháp luật.\r\nChuyên gia tư vấn pháp luật: Cung cấp tư vấn pháp lý cho cá nhân hoặc tổ chức về các vấn đề pháp luật.', 'Khóa Học:\r\nLuật học cơ bản: Học về các nguyên tắc cơ bản của pháp luật, hệ thống pháp luật và các quy định pháp lý cơ bản.\r\nPhân ngành pháp luật: Nắm vững về lĩnh vực cụ thể như luật dân sự, luật hình sự, luật doanh nghiệp.\r\nKỹ năng nghiên cứu và viết luận văn pháp lý: Học cách nghiên cứu, phân tích và viết tài liệu pháp lý chuyên nghiệp.\r\nQuản lý pháp lý trong doanh nghiệp: Học cách quản lý rủi ro pháp lý và tuân thủ quy định pháp luật trong môi trường kinh doanh.', 'Hướng Phát Triển:\r\nChuyên sâu vào một lĩnh vực cụ thể: Chọn một ngách như luật lao động, luật bất động sản hoặc luật doanh nghiệp và trở thành chuyên gia.\r\nNghiên cứu và phát triển: Tham gia vào việc nghiên cứu về các vấn đề pháp luật mới, thay đổi pháp luật và phát triển giải pháp pháp lý mới.\r\nTư vấn hoặc đào tạo: Xây dựng cơ sở khách hàng riêng hoặc trở thành giảng viên, đào tạo tương lai trong lĩnh vực Luật.\r\nSự kiên nhẫn, khả năng phân tích và làm việc cẩn thận với các văn bản pháp lý là rất quan trọng để thành công trong lĩnh vực Luật.', 'Luật'),
(16, 'Sự Nghiệp trong Ngành Hàng không:\r\nLĩnh vực hàng không bao gồm nhiều vị trí, từ những người làm việc trực tiếp trên máy bay đến những người quản lý và hỗ trợ các hoạt động phức tạp của ngành. Các vị trí có thể bao gồm:\r\n\r\nPhi công: Là người lái máy bay và có trách nhiệm an toàn cho hành khách và hàng hóa.\r\nKỹ sư hàng không: Tham gia vào việc thiết kế, bảo trì và phát triển công nghệ hàng không.\r\nNhân viên hành lý và dịch vụ hành khách: Quản lý hành lý, tiếp đón và hỗ trợ hành khách.', 'Khóa Học:\r\nLý thuyết và quy tắc hàng không: Học về lịch sử hàng không, quy tắc an toàn, và kiến thức về hoạt động của máy bay.\r\nKỹ năng làm việc trên máy bay: Đào tạo về kỹ năng cần thiết cho phi công, lễ tân hàng không, và nhân viên hành lý.\r\nKhoa học kỹ thuật hàng không: Nắm vững kiến thức về công nghệ máy bay, cơ cấu cánh, và hệ thống điều khiển.\r\nQuản lý hàng không: Học về quản lý hoạt động sân bay, quản lý an toàn và quản lý vận hành.', 'Hướng Phát Triển:\r\nChuyên sâu vào lĩnh vực cụ thể: Chọn một chuyên ngành như kỹ sư hàng không, quản lý vận hành sân bay hoặc đi theo con đường tiến sĩ về các chủ đề hàng không.\r\nTiếp tục học hỏi và cập nhật kiến thức: Tham gia vào các khóa học và đào tạo để cập nhật về công nghệ mới và quy định an toàn.\r\nThăng tiến trong vị trí quản lý: Xây dựng kỹ năng lãnh đạo và quản lý để tiến lên vị trí quản lý cao hơn trong ngành hàng không.\r\nSự tập trung vào kỹ năng chuyên môn, tuân thủ nghiêm ngặt quy định an toàn và khả năng làm việc cùng đồng đội là quan trọng trong lĩnh vực hàng không.', 'Hàng không');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`id_admin`, `username`, `password`, `admin_status`) VALUES
(7, 'admin@gmail.com', '$2y$10$b1wCoa3/XqMtd5HvjhhiJuBfnejgYQIU9qGz9fsuKqM61xUNlmhFi', 1),
(8, 'admin1@gmail.com', '$2y$10$xQLAa0B6FSAMBjN4ryC2RumpPduGVHr3cEzimty36x1AkDJebY1jO', 1),
(9, 'sang@gmail.com', '$2y$10$EWnnDptzKZPVnwy6kmsAIOidjZx9BjxYclZ0xIn8ofpdJesxrxvoC', 1);

--
-- Bẫy `tbl_admin`
--
DELIMITER $$
CREATE TRIGGER `trg_prevent_admin_delete` BEFORE DELETE ON `tbl_admin` FOR EACH ROW BEGIN
    IF OLD.admin_status = 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không thể xóa dữ liệu admin đang hoạt động!';
    END IF;
END
$$
DELIMITER ;

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
(28, 'admin@gamil.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'CDS', 12, '0965931927', '133c3'),
(29, 'admin@gamil.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'ABC', 25, '0965931927', '133c2');

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
-- Bẫy `timkiemvieclam`
--
DELIMITER $$
CREATE TRIGGER `prevent_delete_nv` BEFORE DELETE ON `timkiemvieclam` FOR EACH ROW BEGIN
    IF OLD.vi_tri = 'Nhân viên' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete rows with position Nhân viên';
    END IF;
END
$$
DELIMITER ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `loi_khuyen`
--
ALTER TABLE `loi_khuyen`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT cho bảng `loi_khuyen`
--
ALTER TABLE `loi_khuyen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `tbl_dangky_nguoitimviec`
--
ALTER TABLE `tbl_dangky_nguoitimviec`
  MODIFY `id_dangky` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `tbl_dangky_nhatuyendung`
--
ALTER TABLE `tbl_dangky_nhatuyendung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `tbl_thongtintuyendung`
--
ALTER TABLE `tbl_thongtintuyendung`
  MODIFY `id_thongtintuyendung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `timkiemvieclam`
--
ALTER TABLE `timkiemvieclam`
  MODIFY `id_thongtintuyendung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
