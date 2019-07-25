-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 25, 2019 lúc 06:02 PM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 7.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_projectmanager`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `Id` int(11) NOT NULL,
  `UserName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`Id`, `UserName`, `Password`) VALUES
(1, 'hiep', '123123');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` decimal(10,0) NOT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address` text COLLATE utf8_unicode_ci,
  `ProjectId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`Id`, `Name`, `Phone`, `Email`, `Address`, `ProjectId`) VALUES
(1, 'nguyễn ngọc hiệp', '968958647', '3', NULL, 3),
(2, 'nguyễn ngọc Trường', '968958647', '1', NULL, 1),
(3, 'nguyễn ngọc hiệp', '968958647', '1', NULL, 1),
(4, 'nguyễn ngọc hiệp', '968958647', 'ngochiep30051998@gmail.com', NULL, 1),
(5, 'nguyễn ngọc hiệp', '968958647', 'ngochiep30051998@gmail.com', NULL, 1),
(6, 'nguyễn ngọc hiệp', '968958647', 'ngochiep30051998@gmail.com', 'nhà số 5, ngõ 95, đường đan hội', 1),
(7, 'nguyễn ngọc hiệp', '968958647', 'ngochiep30051998@gmail.com', 'nhà số 5, ngõ 95, đường đan hội', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `Id` int(11) NOT NULL,
  `Title` text COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci,
  `Image` text COLLATE utf8_unicode_ci NOT NULL,
  `Link` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`Id`, `Title`, `Content`, `Image`, `Link`) VALUES
(1, 'Quyết định bất ngờ giúp một đại gia đình ở Bến Tre trúng jackpot 100 tỉ', 'Công ty Xổ số điện toán Việt Nam (Vietlott) vừa trao jackpot 1 - sản phẩm Power 6/55 kỳ quay 307 cho khách hàng trúng thưởng. Theo đó, gia đình chị B.T.H.N đến từ Bến Tre đã trở thành chủ nhân giải jackpot 1 trị giá gần 100 tỉ đồng này.', 'cc71af243b6d2ad01effda90451f9600', 'https://www.24h.com.vn/tin-tuc-trong-ngay/quyet-dinh-bat-ngo-giup-mot-dai-gia-dinh-o-ben-tre-trung-jackpot-100-ti-c46a1069384.html'),
(2, 'Trung Quốc lên tiếng về tin bí mật xây căn cứ với Campuchia', 'Tờ The Wall Street Journal ngày 22-7 đưa tin Trung Quốc và Campuchia đã ký một mật ước, trong đó cho phép Trung Quốc độc quyền sử dụng một căn cứ hải quân ở Sihanoukville (Campuchia) trên Vịnh Thái Lan trong 30 năm. Sau thời gian này, thỏa thuận sẽ tự động gia hạn sau mỗi 10 năm.\r\n\r\nTuy nhiên, theo hãng tin AP, Trung Quốc cho hay các báo cáo nói rằng Bắc Kinh thiết lập một căn cứ quân sự ở TP cảng của Campuchia là không đúng.\r\n\r\nNgười phát ngôn Bộ Quốc phòng Trung Quốc Wu Qian ngày 25-7 cho hay quân đội Trung Quốc và Campuchia “đã có những cuộc trao đổi và hợp tác trong huấn luyện quân sự”.\r\n\r\nÔng Wu nói thêm: “Sự hợp tác này không nhằm vào bên thứ ba”.\r\n\r\nPhát biểu trên trang web thân chính phủ Fresh News, Thủ tướng Campuchia Hun Sen gọi thông tin đăng trên tờ báo Mỹ là “tin tức bị xuyên tạc tồi tệ nhất”, nói rằng Campuchia chưa bao giờ thảo luận với Trung Quốc về thiết lập một căn cứ nào.', '4c36eebc122fcf0c43e1119152f0e333', 'https://www.24h.com.vn/tin-tuc-quoc-te/trung-quoc-len-tieng-ve-tin-bi-mat-xay-can-cu-voi-campuchia-c415a1069354.html');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `project`
--

CREATE TABLE `project` (
  `Id` int(11) NOT NULL,
  `ProjectName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Image` text COLLATE utf8_unicode_ci,
  `Location` text COLLATE utf8_unicode_ci,
  `Content` text COLLATE utf8_unicode_ci,
  `Price` decimal(15,0) NOT NULL DEFAULT '0',
  `ViewNumber` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `project`
--

INSERT INTO `project` (`Id`, `ProjectName`, `Image`, `Location`, `Content`, `Price`, `ViewNumber`) VALUES
(1, 'Chính chủ cần bán lô liền kề Hoàng Quốc Việt kéo dài, DT: 75m2 mặt tiền 5m xây thô 4.5 tầng', '50ca73d07893e0c5ab86f2482f0f47af', 'Bán nhà biệt thự, liền kề tại Khu nhà ở xã Tân Lập - Cienco 5 - Huyện Đan Phượng - Hà Nội', 'Chính chủ cần bán lô liền kề Hoàng Quốc Việt kéo dài, DT: 75m2 mặt tiền 5m xây thô 4.5 tầng, hướng Nam. Đã nhận nhà sổ đỏ chính chủ, giá bán thỏa thuận, liên hệ anh Tân: 0904498118.', '700000000', 300),
(2, '5 SUẤT NỘI BỘ FLC QUY NHƠN,SHOPHOUSE 2MT GOLFHOUSE VIEW BIỂN SAFARI', 'aab6b99359f0176476227c60da1c0b4e', 'Bán đất nền dự án tại FLC Quy Nhơn - Thành phố Quy Nhơn - Bình Định', 'Suất nội bộ bao gồm những chính sách đặc biệt ưu đãi trước mở bán từ CHỦ ĐẦU TƯ, Khách hàng mua cam kết sẽ lời ngay từ 8-12% so với những khách mua khác .Gọi ngay : 0908.922.500 Để nhận chính sách ưu đãi đặc biệt ,thông tin sản phẩm và hỗ trợ nghỉ dưỡng xem đất miễn phí . \r\nTên dự án: FLC Canava. \r\n- CĐT: FLC Group. \r\n- Vị trí dự án: Nằm ngay vị trí trung tâm Khu đô thị du lịch sinh thái FLC Quy Nhơn. \r\n- Dự án FLC Canava: Gồm các khu shophouse liền kề và golf house đơn lập. \r\n- Quy Mô dự án: 13.1 ha. \r\n- Mật độ xây dựng: 40%. \r\n- Tổng số căn hộ dự án: 158 căn shophouse và 82 căn Golfhouse. \r\nNằm trong quần thể FLC Beach & Golf Resort, thừa hưởng gần 80 tiện ích đẳng cấp. Sân golf 36 hố dạng links, bến đỗ du thuyền, bãi đỗ trực thăng, Safari Zoo Park, trung tâm hội nghị quốc tế,... \r\nFLC Quy Nhơn nơi hội tụ của những tầm nhìn đầu tư vững chắc. FLC làm cao tốc nối từ sân bay Phù Cát tới khu FLC Quy Nhơn chỉ mất 15p đi xe, ra Kỳ Co - Eo Gió chỉ 3p. \r\n- Sở hữu sổ hồng lâu dài. \r\n\r\nHotline: 0908 922 500. \r\n- ------------------------------------------------. \r\nMục đích đầu tư: Nghỉ dưỡng, đầu tư ngắn hạn, trung hạn, dài hạn: Kinh doanh du lịch, khách sạn 1 - 3*, nhà hàng, bar,... \r\n\r\n+ Shophouse: (nhà phố để ở và kinh doanh). 2 mặt tiền. \r\n- Diện tích: 108m2 (6 x 18m). \r\n- Xây dựng 4 tầng: 1 trệt, 3 lầu. \r\n\r\nGiá Đất + Móng = 2.1 tỷ, giá xây 1 tỷ. \r\n\r\n*** Khách hàng có thể lựa chọn mua: Đất + móng hoặc nguyên căn (tuỳ theo nhu cầu đầu tư). \r\n\r\n+ Golf house: \r\n- Diện tích: 300m2 (15 x 20m). \r\n- Xây dựng 3 tầng: 1 trệt, 2 lầu. \r\n\r\nGiá đất + móng = 4.8 tỷ, giá xây 1.5 tỷ. \r\n\r\n*** Khách hàng có thể lựa chọn mua: Đất + móng hoặc Nguyên Căn (tuỳ theo nhu cầu đầu tư). \r\n- --------------------------. \r\n\r\nTiến độ thanh toán dự án FLC Canava: \r\n\r\n+ Đặt cọc 100 triệu. \r\n+ Đợt 1 thanh toán 30% ký HĐMB/HĐVV sau 7 ngày kể từ ngày đặt cọc. \r\n+ Đợt 2 thanh toán 20% GTHĐ (bao gồm VAT) trong 30 ngày kể từ ngày ký hợp đồng. \r\n+ Đợt 3 thanh toán 20% GTHD (bao gồm VAT) trong 60 ngày kể từ ngày ký hợp đồng. \r\n+ Đợt 4 thanh toán 20% GTHD (bao gồm VAT) trong 120 ngày kể từ ngày ký hợp đồng. \r\n+ Đợt 5 thanh toán 5% GTHD + 100% tiền Móng (bao gồm VAT) khi nhận thông báo bàn giao đất + móng. \r\n+ Đợt 6 thanh toán 5% GTHD (bao gồm VAT) khi nhận nhận giấy chứng nhận QSDĐ. \r\n\r\nChiết khấu trực tiếp: 3% (chính sách trước ngày mở bán). \r\n\r\nHỗ trợ tư vấn trực tiếp trên cả nước. \r\nNhân viên trực dự án, hỗ trợ xem đất 24/7. \r\nQuý khách hàng quan tâm đầu tư cũng như tham quan dự án, xin liên hệ sớm để nhận thông tin và chính sách ưu đãi tốt nhất + voucher nghỉ dưỡng 3 ngày 2 đêm. \r\n\r\nHotline: 0908.922.500 Thành. (có zalo và viber). \r\nXin cảm ơn. ', '1500000000', 956),
(3, 'BÁN ĐẤT NỀN SỔ ĐỎ LONG THÀNH GẦN SÂN BAY, SIÊU LỢI NHUẬN, PHÁP LÝ HOÀN CHỈNH, 9TR/M2,HỖ TRỢ TRẢ GÓP', 'da82cc878753876b820ca99122d2e4b8', 'Khu vực: Bán đất nền dự án tại Xã Tân Hiệp - Huyện Long Thành - Đồng Nai', 'ĐẤT NỀN SỔ ĐỎ LONG THÀNH, GẦN SÂN BAY MUA LỜI NGAY, PHÁP LÝ HOÀN CHỈNH 1/500, LIÊN HỆ NGAY 0909349798 - 0787843939.\r\n\r\nKhu vực: Bán đất tại xã Tân Hiệp - Huyện Long Thành - Đồng Nai.\r\nQuy mô 5,8 ha.\r\nDiện tích đa dạng 5x20m, 5x22.\r\nPháp lý: SĐR, Thổ Cư 100%.\r\nHạ tầng: Đường nội bộ 12m. Điện âm, nước sạch.\r\nTiện ích nội khu: Trung tâm thương mại, công viên xanh, khu TDTT, khu vui chơi trẻ em...\r\nGiá: 9 triệu/m, Hỗ trợ mua trả góp, thanh toán linh hoạt dài hạn,...\r\n\r\nThông tin mô tả.\r\nLong Thành Air Port city có vị trí đắc địa tại Long Thành với 400m mặt đường Tân Hiệp khu vực thuộc thành phố sân bay lớn nhất Đông Nam Á đang là tâm điểm đầu tư vượt trội nhất hiện nay với các lý do sau:\r\n\r\nĐã có phê duyệt quy hoạch 1/500, sổ đỏ riêng từng nền.\r\n4,7km đến Sân bay Quốc tế Long Thành Siêu dự án của Việt Nam tại thời điểm này.\r\nNằm trong vùng đệp của sân bay Long Thành.\r\nMặt tiền đường rộng đến 32m, nối thẳng với sân bay với 2 đường song song là Phước Bình - Bầu Cạn và Phước Bình - Tân Hiệp.\r\nNằm tại trung tâm hệ thống giao thông liên kết 6 tỉnh, điều này làm cho thời gian di chuyển từ Long Thành Air port city đến các tỉnh lân cận được rút ngắn một nửa so với trước.\r\nThuộc khu đô thị được quy hoạch bài bản, đẳng cấp nhưng không bị hạn chế thiết kế. Theo đó, nhà đầu tư được quyền tự do xây dựng để tận hưởng không gian mơ ước.\r\n\r\nĐặc biệt:\r\nCông ty dành nhiều chương trình ưu đãi cho khách hàng khi mua đầu tư với chính sách tặng quà hàng tuần khi tham quan dự án và giao dịch trị giá lên đến 1 LƯỢNG VÀNG 9999, Chiết khấu 6% trở lên.\r\nHãy nhanh tay liên hệ với chúng tôi để giữ riêng cho mình và gia đình những vị trí đẹp nhất.\r\nLH Hotline: 0787843939, 0909349798 để đăng_ký tham quan dự án (Xe đưa đón tận nơi).', '900000000', 1250),
(4, 'ĐẤT NỀN SỔ ĐỎ LONG THÀNH, GẦN SÂN BAY MUA LỜI NGAY, PHÁP LÝ HOÀN CHỈNH 1/500, LIÊN HỆ NGAY 0909349798 - 0787843939.  Khu vực: Bán đất tại xã Tân Hiệp - Huyện Long Thành - Đồng Nai. Quy mô 5,8 ha. Diện tích đa dạng 5x20m, 5x22. Pháp lý: SĐR, Thổ Cư 100%. H', '7b386382af5b2a6bd1cf9e5474fd2fa8', 'Bán đất nền dự án tại Đường 19B - Thành phố Quy Nhơn - Bình Định', 'Nhận giữ chỗ 50tr/suất đất nền nhơn hội phân khu 2, rổ hàng độc quyền chủ đầu tư, sổ đỏ riêng, CK 1 - 3%. LH 0902.650.481 Ms. Hà.\r\n\r\nSau thành công của phân khu số 4 (Nhơn Hội New City). Với hơn 1300 lô cháy hàng mà không cần tổ chức mở bán.\r\nNay Chủ Đầu Tư chính thức cho giữ chỗ tiếp tục Phân Khu 2. Khu đẹp nhất dự án, sát biển, liền kề nhiều tiện ích.\r\nPháp lý: Sổ đỏ từng nền, đất sạch 100%, xây dựng tự do, không giới hạn thời gian.\r\n+ Có Chính sách cho khách mua sỉ, thanh toán nhanh.\r\nLiên hệ: 0902.650.481 Ms. Hà.\r\nMail: thendi2206@gmail.com\r\n\r\n- Thông tin tổng quan:\r\n+ Quy mô Dự án: 36ha.\r\n+ Đất ở liền kề: 1503 lô.\r\n+ Đất ở liền kề thương mại: 439 lô.\r\n+ Dân số phân bổ dự kiến tại phân khu: 7.768 người.\r\n+ Diện tích Đất nền liền kề: 5x16. Gía dự kiến: 17tr/m2.\r\n+ Diện tích Đất nền Shophouse: 7x16 & 7x18.\r\n+ Đường nhỏ nhất 11m, lớn nhất 50m.\r\n+ Không ấn định thời gian xây dựng.\r\n+ Xây dựng tự do, chiều cao quy chuẩn 45m.\r\n+ Đóng 40% giá trị HĐ được sang nhượng.\r\n+ Thanh toán tiến độ theo từng đợt, chủ động được nguồn tài chính.\r\n- Vị trí độc tôn:\r\n+ Vị trí mặt tiền biển, liền kề những khu vực du lịch nổi tiếng tại Bình Định như: Eo Gió, Kỳ Co, Hòn Sẹo, Bãi Trung Lương.\r\n+ Cách TTTP Quy Nhơn 1 chỉ 15 phút, cách sân bay Phù Cát 25 phút đi xe.\r\n+ Liền kề FLC Quy Nhơn.\r\n+ Nằm ngay mặt tiền đường 4 làn xe, xây theo hình thức BT rút ngắn thời gian đến sân bay quốc tế Phù Cát chỉ còn 15p.\r\nThanh xuân như một chén trà.\r\nNếu mà do dự hết vị trí ngon.\r\nCám ơn quý khách hàng đã đọc tin.', '1700000000', 650);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ProjectId` (`ProjectId`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `project`
--
ALTER TABLE `project`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`ProjectId`) REFERENCES `project` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
