-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 29, 2019 lúc 06:03 PM
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
  `Message` text COLLATE utf8_unicode_ci,
  `ProjectId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`Id`, `Name`, `Phone`, `Email`, `Address`, `Message`, `ProjectId`) VALUES
(1, 'nguyễn ngọc hiệp', '968958647', '3', NULL, NULL, 3),
(2, 'nguyễn ngọc Trường', '968958647', '1', NULL, NULL, 1),
(3, 'nguyễn ngọc hiệp', '968958647', '1', NULL, NULL, 1),
(4, 'nguyễn ngọc hiệp', '968958647', 'ngochiep30051998@gmail.com', NULL, NULL, 1),
(5, 'nguyễn ngọc hiệp', '968958647', 'ngochiep30051998@gmail.com', NULL, NULL, 1),
(6, 'nguyễn ngọc hiệp', '968958647', 'ngochiep30051998@gmail.com', 'nhà số 5, ngõ 95, đường đan hội', NULL, 1),
(7, 'nguyễn ngọc hiệp', '968958647', 'ngochiep30051998@gmail.com', 'nhà số 5, ngõ 95, đường đan hội', NULL, NULL),
(8, 'Nguyễn Xuân Công', '968958647', 'Cong@gmail.com', 'nhà số 5, ngõ 95, đường đan hội', '111111111', 6);

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
(2, 'Hạ tầng phát triển, tạo đà cho thị trường bất động sản khu Nam TP.HCM bứt phá', 'Với lợi thế quỹ đất rộng lớn, hạ tầng giao thông ngày càng hoàn thiện, hàng loạt công trình trọng điểm được xây dựng, thu hút dòng vốn từ các chủ đầu tư trong và ngoài nước, khu Nam TP.HCM tiếp tục là tâm điểm của thị trường BĐS trong năm 2019 và được kỳ vọng bứt phá trong thời gian tới.\r\n', 'de3e1d968b8b4235efbdeabd00d0b7e9', 'https://dantri.com.vn/bat-dong-san/ha-tang-phat-trien-tao-da-cho-thi-truong-bat-dong-san-khu-nam-tphcm-but-pha-20190728070357719.htm'),
(3, 'Movenpick Resort Cam Ranh giao dịch sôi động tại TP.HCM', 'Hàng loạt giao dịch biệt thự nghỉ dưỡng đã được khách hàng thực hiện trong Lễ giới thiệu “Tuyệt phẩm nghỉ dưỡng Movenpick Resort Cam Ranh – Nét Chăm Pa nơi thiên đường biển biếc” được tổ chức ngày 27/07/2019 tại TP.HCM.', '8cbe93be314f604603a4819b333e200c', 'https://dantri.com.vn/bat-dong-san/movenpick-resort-cam-ranh-giao-dich-soi-dong-tai-tphcm-20190726221722549.htm'),
(4, 'Vinhomes sắp khai trương Vườn Nhật lớn nhất Việt Nam', 'Ngày 29/7/2019, CTCP Vinhomes công bố triển khai xây dựng Vườn Nhật hơn 6 ha tại đô thị thông minh Vinhomes Smart City. Với quy mô lớn nhất Việt Nam – vườn Nhật Vinhomes Smart City sẽ là điểm nhấn độc đáo cho khu đô thị; đồng thời là điểm tham quan mới lạ tại khu vực phía Tây Hà Nội', '00de2b6853a97141c75ddb5d764eaca4', 'https://dantri.com.vn/bat-dong-san/vinhomes-sap-khai-truong-vuon-nhat-lon-nhat-viet-nam-20190729131732893.htm'),
(5, 'Giá đất nền tại nhiều quận, huyện ngoại thành Hà Nội leo thang', 'Bộ Xây dựng trả lời về việc kiểm soát người nước ngoài mua nhà; giá đất nền tại nhiều quận, huyện ngoại thành tăng chóng mặt; Địa ốc Đất Xanh lãi lớn nhưng nhưng vẫn \"đau đầu\" vì dòng tiền âm... là những thông tin bất động sản nổi bật tuần qua.', 'a06aee5e986df3d18c9165e298f92bfb', 'https://dantri.com.vn/bat-dong-san/gia-dat-nen-tai-nhieu-quan-huyen-ngoai-thanh-ha-noi-leo-thang-20190729062923786.htm'),
(6, 'Phuc Khang Corporation chiến thắng giải thưởng Nhà phát triển BĐS bền vững nhất năm 2019', ' Tại Lễ trao giải thưởng Bất động sản (BĐS) “DOT Property Vietnam Awards 2019. Nhà Phát triển Công trình xanh (CTX) Phuc Khang Corporation đã giành chiến thắng tại 2 hạng mục: Best Luxury Condo Architectural Design Vietnam 2019 (Dự án căn hộ hạng sang có kiến trúc đẹp nhất 2019) và Best Sustainable Developer Vietnam 2019 (Nhà phát triển bền vững của năm).', 'e9ab93bf4cfc06a5a9a04093d51f451f', 'https://dantri.com.vn/bat-dong-san/phuc-khang-corporation-chien-thang-giai-thuong-nha-phat-trien-bds-ben-vung-nhat-nam-2019-20190729153552628.htm'),
(7, 'Không gian làm việc VVIP - “Thú chơi” đẳng cấp mới của giới đại gia Việt', 'Theo Báo cáo Thịnh vượng 2019 (Wealth Report) được Knight Frank công bố, số lượng người siêu giàu (sở hữu khối tài sản lớn hơn 30 triệu USD) tại Việt Nam đã cán mốc 142 người. Trong 5 năm tới, Việt Nam được dự báo có tốc độ tăng trưởng người siêu giàu nhanh nhất thế giới, trong đó đa phần là tầng lớp doanh nhân.', '67d725edb38551311d9ec844bc4e87f7', 'https://dantri.com.vn/bat-dong-san/khong-gian-lam-viec-vvip-thu-choi-dang-cap-moi-cua-gioi-dai-gia-viet-20190729110430039.htm');

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
(1, 'Movenpick Resort Cam Ranh', '338789aca34c0bacf83ea2b49c1e5b34', '', 'Mövenpick Resort Cam Ranh là quần thể khu nghỉ dưỡng 5 sao có chủ đầu tư là Công ty Cổ phần Đầu tư Du lịch Eurowindow Nha Trang - thành viên của Eurowindow Holding và quản lý bởi Tập đoàn Mövenpick Hotels & Resorts (Thụy Sỹ). Đây là tập đoàn nổi tiếng thế giới có rất nhiều kinh nghiệm trong việc quản lý các khách sạn và khu nghỉ dưỡng tiêu chuẩn 5 sao.\r\n\r\nMövenpick Resort Cam Ranh sở hữu vị trí trung tâm – trái tim của Bãi Dài với 800m bờ biển. Khu nghỉ dưỡng chỉ cách sân bay quốc tế Cam Ranh 5 phút đi xe, 25 phút để đến thành phố Nha Trang và thuận tiện cho việc di chuyển đến các danh lam thắng cảnh nổi tiếng như: Tháp Chàm, Đà Lạt… Đây cũng chính là một trong những yếu tố quyết định đến giá trị cũng như khả năng hấp dẫn khách du lịch của dự án.\r\n\r\nQuần thể khu nghỉ dưỡng Mövenpick Resort Cam Ranh được các kiến trúc sư nổi tiếng thế giới thiết kế với phong cách vừa hiện đại vừa pha lẫn nét kiến trúc địa phương, bao gồm 118 căn biệt thự cao cấp, 250 phòng khách sạn tiêu chuẩn 5 sao quốc tế và khu Condotel với 132 căn hộ nghỉ dưỡng cùng các dịch vụ vui chơi, giải trí, chăm sóc sức khỏe và sắc đẹp bao gồm: Làng Thụy Sỹ, khu thể thao, câu lạc bộ bãi biển, câu lạc bộ vui chơi có thưởng, Ốc đảo Sức sống mới Spa & Beauty, các nhà hàng và khu vui chơi trẻ em, khu vui chơi mạo hiểm với nhiều trò chơi phong phú, đa dạng.\r\n\r\nĐối với biệt thự nghỉ dưỡng biển, tiêu chí quan trọng hàng đầu là phải “nhìn thấy biển, sát biển và chỉ 1 tầng”. Mövenpick Resort Cam Ranh có thiết kế độc nhất vô nhị với toàn bộ các phòng nghỉ dưỡng đều hướng Đông và nhìn thấy biển, đây là điểm mà hiếm có khu nghỉ dưỡng nào có được. Với đa dạng loại hình bất động sản nghỉ dưỡng từ biệt thự, condotel đến phòng khách sạn, Mövenpick Resort Cam Ranh sẽ là quần thể nghỉ dưỡng đáp ứng nhu cầu của mọi đối tượng khách hàng.', '700000000', 300),
(2, '5 SUẤT NỘI BỘ FLC QUY NHƠN,SHOPHOUSE 2MT GOLFHOUSE VIEW BIỂN SAFARI', 'aab6b99359f0176476227c60da1c0b4e', 'Bán đất nền dự án tại FLC Quy Nhơn - Thành phố Quy Nhơn - Bình Định', 'Suất nội bộ bao gồm những chính sách đặc biệt ưu đãi trước mở bán từ CHỦ ĐẦU TƯ, Khách hàng mua cam kết sẽ lời ngay từ 8-12% so với những khách mua khác .Gọi ngay : 0908.922.500 Để nhận chính sách ưu đãi đặc biệt ,thông tin sản phẩm và hỗ trợ nghỉ dưỡng xem đất miễn phí . \r\nTên dự án: FLC Canava. \r\n- CĐT: FLC Group. \r\n- Vị trí dự án: Nằm ngay vị trí trung tâm Khu đô thị du lịch sinh thái FLC Quy Nhơn. \r\n- Dự án FLC Canava: Gồm các khu shophouse liền kề và golf house đơn lập. \r\n- Quy Mô dự án: 13.1 ha. \r\n- Mật độ xây dựng: 40%. \r\n- Tổng số căn hộ dự án: 158 căn shophouse và 82 căn Golfhouse. \r\nNằm trong quần thể FLC Beach & Golf Resort, thừa hưởng gần 80 tiện ích đẳng cấp. Sân golf 36 hố dạng links, bến đỗ du thuyền, bãi đỗ trực thăng, Safari Zoo Park, trung tâm hội nghị quốc tế,... \r\nFLC Quy Nhơn nơi hội tụ của những tầm nhìn đầu tư vững chắc. FLC làm cao tốc nối từ sân bay Phù Cát tới khu FLC Quy Nhơn chỉ mất 15p đi xe, ra Kỳ Co - Eo Gió chỉ 3p. \r\n- Sở hữu sổ hồng lâu dài. \r\n\r\nHotline: 0908 922 500. \r\n- ------------------------------------------------. \r\nMục đích đầu tư: Nghỉ dưỡng, đầu tư ngắn hạn, trung hạn, dài hạn: Kinh doanh du lịch, khách sạn 1 - 3*, nhà hàng, bar,... \r\n\r\n+ Shophouse: (nhà phố để ở và kinh doanh). 2 mặt tiền. \r\n- Diện tích: 108m2 (6 x 18m). \r\n- Xây dựng 4 tầng: 1 trệt, 3 lầu. \r\n\r\nGiá Đất + Móng = 2.1 tỷ, giá xây 1 tỷ. \r\n\r\n*** Khách hàng có thể lựa chọn mua: Đất + móng hoặc nguyên căn (tuỳ theo nhu cầu đầu tư). \r\n\r\n+ Golf house: \r\n- Diện tích: 300m2 (15 x 20m). \r\n- Xây dựng 3 tầng: 1 trệt, 2 lầu. \r\n\r\nGiá đất + móng = 4.8 tỷ, giá xây 1.5 tỷ. \r\n\r\n*** Khách hàng có thể lựa chọn mua: Đất + móng hoặc Nguyên Căn (tuỳ theo nhu cầu đầu tư). \r\n- --------------------------. \r\n\r\nTiến độ thanh toán dự án FLC Canava: \r\n\r\n+ Đặt cọc 100 triệu. \r\n+ Đợt 1 thanh toán 30% ký HĐMB/HĐVV sau 7 ngày kể từ ngày đặt cọc. \r\n+ Đợt 2 thanh toán 20% GTHĐ (bao gồm VAT) trong 30 ngày kể từ ngày ký hợp đồng. \r\n+ Đợt 3 thanh toán 20% GTHD (bao gồm VAT) trong 60 ngày kể từ ngày ký hợp đồng. \r\n+ Đợt 4 thanh toán 20% GTHD (bao gồm VAT) trong 120 ngày kể từ ngày ký hợp đồng. \r\n+ Đợt 5 thanh toán 5% GTHD + 100% tiền Móng (bao gồm VAT) khi nhận thông báo bàn giao đất + móng. \r\n+ Đợt 6 thanh toán 5% GTHD (bao gồm VAT) khi nhận nhận giấy chứng nhận QSDĐ. \r\n\r\nChiết khấu trực tiếp: 3% (chính sách trước ngày mở bán). \r\n\r\nHỗ trợ tư vấn trực tiếp trên cả nước. \r\nNhân viên trực dự án, hỗ trợ xem đất 24/7. \r\nQuý khách hàng quan tâm đầu tư cũng như tham quan dự án, xin liên hệ sớm để nhận thông tin và chính sách ưu đãi tốt nhất + voucher nghỉ dưỡng 3 ngày 2 đêm. \r\n\r\nHotline: 0908.922.500 Thành. (có zalo và viber). \r\nXin cảm ơn. ', '1500000000', 956),
(3, 'Luxury Park Views', 'd7727a7ca3b12e6f4d62b0acdfed7f8c', 'Tọa lạc tại KĐT mới Cầu Giấy, phường Yên Hòa, quận Cầu Giấy.', 'Thiết kế\r\nLuxury Park Views sở hữu thiết kế căn hộ thông minh, tận dụng tối đa công năng sử dụng 63,98m2 - 131,02m2 thông thủy bố trí 2 – 4 phòng ngủ. 80% căn hộ đều có 2 logia, cửa sổ mang ánh sáng tự nhiên vào từng không gian sống, đem đến sự tươi mới và ngập tràn sinh khí.\r\n \r\nTiện ích\r\n \r\nĐược phát triển theo loại hình tổ hợp trung tâm thương mại, văn phòng cho thuê và căn hộ cao cấp, Luxury Park Views sẽ mang đến cho cư dân tương lai một cuộc sống chất lượng với hệ thống tiện ích đa dạng, đẳng cấp: thỏa sức mua sắm tại khu trung tâm thương mại; thư giãn bên bạn bè, người thân tại nhà hàng, quán café; chăm sóc sức khỏe sắc đẹp với hệ thống phòng gym, spa,… Bên cạnh đó, dự án trang bị hệ thống an ninh duy trì 24/7, cùng với hệ thống đỗ xe phân luồng thông minh hứa hẹn sẽ trở thành một điểm nhấn trong khu vực.', '900000000', 1250),
(4, 'Premier Berriver', 'e8e1d273c62b62863827f240848d1699', 'Lô N01, 390 Nguyễn Văn Cừ, Long Biên, Hà Nội', 'Tổng diện tích đất: 2.650 m2\r\nQuy mô dự án: 1 tòa tháp cao 25 tầng, gồm 2 tầng tiện ích chung & 23 tầng căn hộ & 3 tầng hầm\r\nDiện tích căn hộ: 2PN (71,6m2 – 88,5m2); 3PN (105,4m2 – 124,6 m2)\r\nLoại căn hộ: Căn hộ 2 - 3 phòng ngủ, penthouse\r\nTổng số lượng căn hộ: 210 căn hộ và 06 căn penthouse\r\nTiện ích nội khu:\r\n+ Hệ thống PCCC đạt chuẩn, an ninh kiểm soát 24/7\r\n \r\n+ Sảnh lễ tân hiện đại\r\n \r\n+ Hệ thống shophouse thương mại phục vụ cộng đồng dân cư\r\n \r\n+ Hồ bơi trong nhà với hệ thống lọc nước đạt chuẩn\r\n \r\n+ Phòng Gym hiện đại\r\n \r\n+ Khu Spa chăm sóc sức khỏe\r\nDự kiến bàn giao: Quý IV/2019\r\nHình thức bàn giao: Hoàn thiện cơ bản\r\nHình thức sở hữu: Lâu dài', '1700000000', 650),
(5, 'Chung cư Green Pearl Bắc Ninh', 'd1e2bd8f1d8d60bdb0579267fa1e7810', 'Đường Lê Thái Tổ, phường Võ Cường, TP. Bắc Ninh, Tỉnh Bắc Ninh', 'KHÔNG GIAN SỐNG CAO CẤP TIỆN NGHI\r\n\r\nGreen Pearl là dự án hiếm hoi tại Bắc Ninh sở hữu hệ thống tiện ích hiện đại, đẳng cấp dành riêng cho cư dân nơi đây, biến cuộc sống thường ngày của cư dân thành những giây phút trải nghiệm nghỉ dưỡng ngay tại nhà!\r\n\r\nKhu căn hộ Green Pearl Bắc Ninh thích hợp cho các khách hàng cao cấp, muốn tận hưởng không gian sống tiện nghi hiện đại giữa trung tâm thành phố với các tiện ích: Trung tâm thương mại, phòng tập Gym yoga, bể bơi, nhà hàng, khu vui chơi trẻ em, hệ thống an ninh và phòng cháy chữa cháy chất lượng cao.\r\n\r\nCĂN HỘ 4 SAO – VẬN HÀNH THEO HƯỚNG DỊCH VỤ CHO THUÊ\r\n\r\nCác căn hộ Green Pearl có diện tích đa dạng từ 41m2 – 95m2 bố trí 1 – 3 phòng ngủ, phù hợp với nhiều đối tượng khách hàng như: khách thuê nước ngoài, chuyên gia Hàn Quốc, Nhật Bản, các gia đình trẻ và các gia đình đa thế hệ.\r\n\r\n100% các căn hộ đều được thiết kế tinh tế, sang trọng và hiện đại, logia rộng, các phòng đều thoáng sáng, đảm bảo tối ưu hóa và công năng sử dụng.\r\n\r\nCỘNG ĐỒNG CƯ DÂN NƯỚC NGOÀI ĐẲNG CẤP\r\n\r\nHướng tới đối tượng là các chuyên gia và người lao động nước ngoài sinh sống và làm việc tại Bắc Ninh, dự án dành riêng 4 tầng cho khách Hàn Quốc, Nhật Bản,… sinh sống. Với vị trí tọa lạc đắc địa, thiết kế căn hộ thông minh cùng hệ thống tiện ích chuẩn 4 sao dự án hứa hẹn đáp ứng được tiêu chuẩn sống khắt khe của người nước ngoài.', '12312000', 312312),
(6, 'Sky Central', '0405ec79ff437a0d9555b506645de779', '176 Định Công, Hoàng Mai, Hà Nội', 'Nằm tại trung tâm phía Nam của Thành phố, Sky Central là dự án nằm trên mặt đường vành đai 2.5 và nhiều tuyến đường huyết mạch. Hệ thống mạng lưới giao thông thuận tiện giúp cư dân Sky Central có thể di chuyển về bất kỳ nơi nào của thành phố và các tỉnh lị xung quanh một cách nhanh chóng và an toàn nhất.\r\n\r\nSky Central dễ dàng kết nối trung tâm hành chính, trung tâm mua sắm và giải trí, các hệ thống trường học và bệnh viện lớn. Không chỉ vậy, cư dân còn được thừa hưởng hệ sinh thái xanh – trong lành hồ lớn xung quanh như: hồ Định Công, hồ Linh Đàm, hồ Yên Sở.', '123123', 123123);

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `project`
--
ALTER TABLE `project`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
