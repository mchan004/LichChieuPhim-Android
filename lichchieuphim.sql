/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50505
 Source Host           : localhost
 Source Database       : LichChieuPhim

 Target Server Type    : MySQL
 Target Server Version : 50505
 File Encoding         : utf-8

 Date: 12/15/2016 22:50:50 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `CommentPhimdangchieu`
-- ----------------------------
DROP TABLE IF EXISTS `CommentPhimdangchieu`;
CREATE TABLE `CommentPhimdangchieu` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`idPhim` varchar(255) NOT NULL,
	`Name` varchar(255) DEFAULT NULL,
	`Email` varchar(255) DEFAULT NULL,
	`Rate` int(11) DEFAULT NULL,
	`DateCreate` datetime DEFAULT NULL,
	`Comment` varchar(255) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=`InnoDB` AUTO_INCREMENT=34 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ROW_FORMAT=COMPACT COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `CommentPhimdangchieu`
-- ----------------------------
BEGIN;
INSERT INTO `CommentPhimdangchieu` VALUES ('1', '257', 'Thanh Tu', 'sdfsdf@asd.asd', '5', '2016-12-16 23:27:39', 'dsfsdf sdfs dfs dfsd fsdf sdfsdf'), ('2', '257', 'Thanh Tuan', 'ssdfsdfsfsdf', '3', '2016-12-03 23:28:03', 'sdfsdf sd fs dfs dfsdf sd fsdfsdf sdf s f sdf sdfsdfs dfsd fs dfsdfsdf sdfsdfs fsdfsd fsdf s dfsdfs'), ('3', '257', 'JDJD DDD', 'sdfsdfsdfsdf', '1', '2016-12-16 23:28:37', 'qweqwe qwe qwe qweqwe qwe qwe'), ('12', '1', 'Thanhtu', 'email', '6', '2016-12-04 22:30:03', 'sdfsdf'), ('13', '257', 'Thanh Tu123', 'dsfsdfsdf', '2', '2016-12-04 22:31:46', 'Phim ko hay la\'m\nKo nen di xem nhe moi nguoi :P'), ('14', '257', 'kjhkjhkjhj', 'hjhgjhgjhgjhgj', '4', '2016-12-04 22:37:33', 'hkjhkjhkjhkjh\nkjhkjhkjhkjhkjhkjhk'), ('15', '257', 'kjhkjhkjhj', 'hjhgjhgjhgjhgj', '4', '2016-12-04 22:38:55', 'hkjhkjhkjhkjh\nkjhkjhkjhkjhkjhkjhk'), ('16', '257', 'kjhkjhkjhj', 'hjhgjhgjhgjhgj', '4', '2016-12-04 22:39:32', 'hkjhkjhkjhkjh\nkjhkjhkjhkjhkjhkjhk'), ('17', '257', 'kjhkjhkjhj', 'hjhgjhgjhgjhgj', '4', '2016-12-04 22:39:57', 'hkjhkjhkjhkjh\nkjhkjhkjhkjhkjhkjhk\nlalalalalal'), ('18', '257', 'kjhkjhkjhj', 'hjhgjhgjhgjhgj', '4', '2016-12-04 22:40:53', 'hkjhkjhkjhkjh\nkjhkjhkjhkjhkjhkjhk\nlalalalalal\nhjjhgjhgjhg\njhgjhgjhgjhgjhggj\nhkjhkjhkjhkjhkjhkj\nhkjhkjhkjhkjhkjkh'), ('19', '257', 'sdfsdfwerwe', 'dfsdfsdf', '1', '2016-12-04 22:52:42', 'dsfsdfsdfs'), ('20', '257', 'new test', 'vgghhncfh', '2', '2016-12-05 21:35:51', 'gvc bhgc gbb.'), ('21', '257', 'fdfhjh2', 'ffhiihd', '1', '2016-12-05 22:32:42', 'phhgyi\"v hhjj'), ('22', '276', 'Tu', 'sdfsdfsdfsdf', '5', '2016-12-06 22:45:02', '1231 sdfsdfsdf\nsdfsdfsdfsdfsdf'), ('23', '276', 'Tai', '12321eqwdas', '1', '2016-12-06 22:45:57', 'dfsdfsdfsdf'), ('24', '277', 'dfsdfsd', 'fsDvdvxc', '3', '2016-12-06 22:48:29', 'sczxcxxczxc'), ('25', '277', 'gdfgdgdfg', 'fgdfgdf', '1', '2016-12-06 23:59:54', 'fdgdfgdfgd'), ('26', '278', 'fvjn cf', 'cghbcdtg', '4', '2016-12-07 17:52:02', 'fguhcsfhj'), ('27', '280', 'ysysyhd', 'bxjdjsjbe', '5', '2016-12-07 17:58:03', 'jshdndjdjcuys'), ('28', '285', 'jsjsjsnsn', 'sjsjjsnsnsnsnd', '4', '2016-12-07 18:24:11', 'jsjsjsjjsbs'), ('29', '281', 'sjhshshshsh', 'nsjsjjshs', '4', '2016-12-07 18:26:45', 'bahhahshshhs'), ('30', '280', 'hsbshhucujsb', 'hshshxucjnbs', '1', '2016-12-07 18:31:02', 'bzhshhshshs'), ('31', '283', 'hdhdhxbdbd', 'dhdbbdbdh', '1', '2016-12-07 18:36:20', 'shbdbdbdbd'), ('32', 'UNDERWORLD: BLOOD WARS / THẾ GIỚI NGẦM: TRẬN CHIẾN ĐẪM MÁU', 'bshxnjcjc', 'sbbshxuxujc', '4', '2016-12-07 21:15:25', 'sbxhuxudhshdbdh'), ('33', 'VỆ SĨ, TIỂU THƯ VÀ THẰNG KHỜ', 'nxnxnxnnxjxjx', 'shdndnnxnxnxn', '4', '2016-12-07 21:15:45', 'shzhxbnxndndbnd');
COMMIT;

-- ----------------------------
--  Table structure for `CommentPhimsapchieu`
-- ----------------------------
DROP TABLE IF EXISTS `CommentPhimsapchieu`;
CREATE TABLE `CommentPhimsapchieu` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`idPhim` varchar(255) NOT NULL,
	`Name` varchar(255) DEFAULT NULL,
	`Email` varchar(255) DEFAULT NULL,
	`Rate` int(11) DEFAULT NULL,
	`DateCreate` datetime DEFAULT NULL,
	`Comment` varchar(255) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=`InnoDB` AUTO_INCREMENT=3 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ROW_FORMAT=COMPACT COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `CommentPhimsapchieu`
-- ----------------------------
BEGIN;
INSERT INTO `CommentPhimsapchieu` VALUES ('1', '169', 'cxvxcv', 'xcvxcvxcv', '2', '2016-12-07 00:00:18', 'vcbcvbcvbcvbcvb'), ('2', 'HÌNH NHÂN', 'jsjsjdjdjj', 'udjdjdjd', '4', '2016-12-07 21:23:14', 'jdjdjdjjd');
COMMIT;

-- ----------------------------
--  Table structure for `DanhSachPhim`
-- ----------------------------
DROP TABLE IF EXISTS `DanhSachPhim`;
CREATE TABLE `DanhSachPhim` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`TenPhim` varchar(255) DEFAULT NULL,
	`TheLoai` varchar(255) DEFAULT NULL,
	`DaoDien` varchar(255) DEFAULT NULL,
	`DienVien` varchar(255) DEFAULT NULL,
	`NhaSanXuat` varchar(255) DEFAULT NULL,
	`ThoiLuong` varchar(255) DEFAULT NULL,
	`KhoiChieu` date DEFAULT NULL,
	`NoiDung` varchar(1000) DEFAULT NULL,
	`HinhAnh` varchar(255) DEFAULT NULL,
	`Trailer` varchar(255) DEFAULT NULL,
	`Rate` int(11) DEFAULT 0,
	`Galaxy` varchar(255) DEFAULT NULL,
	`CGV` varchar(255) DEFAULT NULL,
	`Lotte` varchar(255) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=`InnoDB` AUTO_INCREMENT=378 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ROW_FORMAT=COMPACT COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `DanhSachPhim`
-- ----------------------------
BEGIN;
INSERT INTO `DanhSachPhim` VALUES ('362', 'UNDERWORLD: BLOOD WARS / THẾ GIỚI NGẦM: TRẬN CHIẾN ĐẪM MÁU', null, null, null, null, null, null, null, null, null, '0', 'https://www.galaxycine.vn/dat-ve/underworld-5', 'https://www.cgv.vn/vn/the-gioi-ngam-tran-chien-dam-mau.html', 'http://www.lottecinemavn.com/vi-vn/phim/the-gioi-ngam-cuoc-chien-%C4%91am-mau.aspx'), ('363', 'VỆ SĨ, TIỂU THƯ VÀ THẰNG KHỜ', null, null, null, null, null, null, null, null, null, '0', 'https://www.galaxycine.vn/dat-ve/ve-si-tieu-thu-thang-kho', 'https://www.cgv.vn/vn/catalog/product/view/id/1799/', 'http://www.lottecinemavn.com/vi-vn/phim/(nc16)-ve-sy,-tieu-thu-va-thang-kho.aspx'), ('364', 'INCARNATE / QUỶ ÁM', null, null, null, null, null, null, null, null, null, '0', 'https://www.galaxycine.vn/dat-ve/quy-am', 'https://www.cgv.vn/vn/quy-am.html', 'http://www.lottecinemavn.com/vi-vn/phim/(nc16)-quy-am.aspx'), ('365', 'CHO EM GẦN ANH THÊM CHÚT NỮA', null, null, null, null, null, null, null, null, null, '0', 'https://www.galaxycine.vn/dat-ve/cho-anh-gan-em-them-chut-nua', 'https://www.cgv.vn/vn/cho-em-gan-anh-them-chut-nua.html', 'http://www.lottecinemavn.com/vi-vn/phim/cho-em-gan-anh-them-chut-nua.aspx'), ('366', 'SÚT', null, null, null, null, null, null, null, null, null, '0', 'https://www.galaxycine.vn/dat-ve/sut', 'https://www.cgv.vn/vn/catalog/product/view/id/1790/', 'null'), ('367', 'MOANA / HÀNH TRÌNH CỦA MOANA', null, null, null, null, null, null, null, null, null, '0', 'https://www.galaxycine.vn/dat-ve/moana', 'https://www.cgv.vn/vn/hanh-trinh-cua-moana.html', 'http://www.lottecinemavn.com/vi-vn/phim/hanh-trinh-cua-moana-(3).aspx'), ('368', 'FANTASTIC BEASTS AND WHERE TO FIND THEM / SINH VẬT HUYỀN BÍ VÀ NƠI TÌM RA CHÚNG', null, null, null, null, null, null, null, null, null, '0', 'https://www.galaxycine.vn/dat-ve/fantastic-beast-and-where-to-find-them', 'https://www.cgv.vn/vn/sinh-vat-huyen-bi-va-noi-tim-ra-chung.html', 'http://www.lottecinemavn.com/vi-vn/phim/sinh-vat-huyen-bi-va-noi-tim-ra-chung.aspx'), ('369', '4 NĂM 2 CHÀNG 1 TÌNH YÊU', null, null, null, null, null, null, null, null, null, '0', 'https://www.galaxycine.vn/dat-ve/4nam-2chang-1tinhyeu', 'null', 'http://www.lottecinemavn.com/vi-vn/phim/4-nam,-2-chang,-1-tinh-yeu.aspx'), ('370', 'BẢO MẪU SIÊU QUẬY 2', null, null, null, null, null, null, null, null, null, '0', 'https://www.galaxycine.vn/dat-ve/bao-mau-sieu-quay-2', 'null', 'null'), ('371', 'EM LÀ BÀ NỘI CỦA ANH', null, null, null, null, null, null, null, null, null, '0', 'https://www.galaxycine.vn/dat-ve/em-la-ba-noi-cua-anh', 'null', 'null'), ('372', 'ĐẤU TRƯỜNG ÂM NHẠC', null, null, null, null, null, null, null, null, null, '0', 'null', 'https://www.cgv.vn/vn/dau-truong-am-nhac.html', 'null'), ('373', 'CỔNG CHIẾN BINH', null, null, null, null, null, null, null, null, null, '0', 'null', 'https://www.cgv.vn/vn/cong-chien-binh.html', 'null'), ('374', 'TRÒ MA THUẬT', null, null, null, null, null, null, null, null, null, '0', 'null', 'https://www.cgv.vn/vn/tro-ma-thuat.html', 'null'), ('375', 'MẸ ƠI BỐ ĐÂU RỒI ?', null, null, null, null, null, null, null, null, null, '0', 'null', 'https://www.cgv.vn/vn/me-oi-bo-dau-roi.html', 'null'), ('376', 'CHUYẾN TÀU SINH TỬ', null, null, null, null, null, null, null, null, null, '0', 'null', 'https://www.cgv.vn/vn/chuyen-tau-sinh-tu.html', 'http://www.lottecinemavn.com/vi-vn/phim/chuyen-tau-sinh-tu.aspx'), ('377', 'XIN LỖI ANH CHỈ LÀ SÁT THỦ', null, null, null, null, null, null, null, null, null, '0', 'null', 'https://www.cgv.vn/vn/xin-loi-anh-chi-la-cao-thu.html', 'null');
COMMIT;

-- ----------------------------
--  Table structure for `DanhSachPhimSapChieu`
-- ----------------------------
DROP TABLE IF EXISTS `DanhSachPhimSapChieu`;
CREATE TABLE `DanhSachPhimSapChieu` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`TenPhim` varchar(255) DEFAULT NULL,
	`TheLoai` varchar(255) DEFAULT NULL,
	`DaoDien` varchar(255) DEFAULT NULL,
	`DienVien` varchar(255) DEFAULT NULL,
	`NhaSanXuat` varchar(255) DEFAULT NULL,
	`ThoiLuong` varchar(255) DEFAULT NULL,
	`KhoiChieu` date DEFAULT NULL,
	`NoiDung` varchar(1000) DEFAULT NULL,
	`HinhAnh` varchar(255) DEFAULT NULL,
	`Trailer` varchar(255) DEFAULT NULL,
	`Rate` int(11) DEFAULT 0,
	`Galaxy` varchar(255) DEFAULT NULL,
	`CGV` varchar(255) DEFAULT NULL,
	`Lotte` varchar(255) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=`InnoDB` AUTO_INCREMENT=186 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ROW_FORMAT=COMPACT COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `DanhSachPhimSapChieu`
-- ----------------------------
BEGIN;
INSERT INTO `DanhSachPhimSapChieu` VALUES ('169', 'HÌNH NHÂN', 'Kinh dị', 'Võ Ngọc', 'Trương Quỳnh Anh, Mạc Văn Khoa, Hòa Minzy, Kim Tuyến', null, null, '2016-12-09', 'Ba người bạn thân Thư, Quân và Hạnh cùng học một lớp tại nhạc viện. Vì giáo viên chủ nhiệm cũ tạm nghỉ, Hùng trở thành giáo viên mới. Lần đầu tới lớp, Hùng bàng hoàng nhận ra Thư giống hệt người yêu cũ đã qua đời mười lăm năm trước của anh. Biết điều này, Hương- vợ anh cực kỳ khó chịu. Cũng trong lúc này, ba người bạn vô tình phát hiện một hình nhân được bí mật giấu ngay trong lớp học của nhạc viện. Với sự tham gia của ngôi sao điện ảnh Dustin Nguyễn, diễn viên Trương Quỳnh Anh & Kim Tuyến, ca sĩ Hòa Minzy và danh hài Mạc Văn Khoa, Hình Nhân hứa hẹn sẽ đem đến những giây phút gay cấn tại rạp chiếu phim vào dịp cuối năm. Phim dự kiến khởi chiếu 09.12.2016.', 'https://www.galaxycine.vn/media/h/i/hinhnha.jpg', 'SkA_NAQBtIw', '0', 'https://www.galaxycine.vn/dat-ve/hinh-nhan', 'https://www.cgv.vn/vn/hinh-nhan.html', 'null'), ('170', 'ELIMINATORS', 'Hành động', 'James Nunn', 'Scott Adkins, Stu Bennett, Daniel Caltagirone', 'WWE Studios, Tea Shop & Film Company', '', '2016-12-09', 'Một cựu đặc vụ Mỹ phải từ bỏ chương trình bảo vệ nhân chứng và không thể chạy trốn nữa khi ngôi nhà tại London của anh bị tấn công. May mắn, kẻ tấn công đã sai địa chỉ. Khi vụ việc kết thúc bằng vài cái chết, anh bị săn đuổi khắp châu Âu bởi một sát thủ nguy hiểm. Giờ đây, anh phải chạy trốn cùng con gái.  Cựu đặc vụ quyết tâm đưa được cô bé tới nơi an toàn trước khi trốn chạy kẻ thù. Bộ phim hành động gay cấn này do James Nunn làm đạo diễn, cùng sự tham gia của dàn diễn viên Scott Adkins, Stu Bennett, Daniel Caltagirone', 'https://www.galaxycine.vn/media/e/l/elimi.jpg', 'P4Y9uK6y6zw', '0', 'https://www.galaxycine.vn/dat-ve/eliminators', 'null', 'null'), ('171', 'SWORD MASTER / THẦN KIẾM', 'Hành động', 'Tung-Shing Yee', 'Peter Ho', 'Bona Film Group', '', '2016-12-09', 'Hai người khổng lồ của điện ảnh Hongkong là Derek Yee  and Tsui Hark  cùng hợp tác trong một tác phẩm 3D sử thi võ thuật gay cấn. Bộ phim kể về Tam thiếu gia – một cao thủ võ lâm với tài nghệ dùng kiếm hơn người. Đã rút khỏi giang hồ từ lâu nhưng những thế lực đen tối không để anh yên. Vị kiếm sĩ phải một lần nữa bước vào giang hồ để cứu lấy bản thân và những người thân yêu. ', 'https://www.galaxycine.vn/media/t/h/than.jpg', '9g2wDe_TKnw', '0', 'https://www.galaxycine.vn/dat-ve/than-kiem', 'https://www.cgv.vn/vn/than-kiem.html', 'null'), ('172', 'A MONSTER CALLS / LỜI THỈNH CẦU QUÁI VẬT', 'Tâm lý, Thần thoại', 'J.A. Bayona', 'Lewis MacDougall, Felicity Jones, Toby Kebbell', 'Apaches Entertainment', '', '2016-12-09', 'Chuyện phim kể về Conor- một cậu bé đang sống cùng người mẹ đơn thân. Một ngày nọ, mẹ Conor mắc phải một căn bệnh nan y quái ác, sự sống chỉ đếm từng ngày. Để mẹ yên tâm chữa bệnh, Conor được gửi tới nhờ bà ngoại chăm sóc. Thế nhưng, cuộc sống mới khiến cậu bé gặp rất nhiều áp lực khi vừa phải ở cùng người bà khô khan, vừa phải chịu đựng cảnh bị bắt nạt ở trường. Mọi thứ cứ như thế cho đến khi một con “quái vật” xuất hiện trong cuộc đời cậu. ', 'https://www.galaxycine.vn/media/l/o/loithinhcau.jpg', '2HKZhhHdDqY', '0', 'https://www.galaxycine.vn/dat-ve/loi-thinh-cau-quai-vat', 'null', 'null'), ('173', 'VỆ SĨ SÀI GÒN', 'Hành động, Hài', 'Ken Ochiai', 'Thái Hòa, Chi Pu, B Trần', 'CJ Entertainment, Galaxy M&E', '', '2016-12-16', 'Vệ sĩ Sài Gòn là phim chiếu rạp đầu tiên của Việt Nam nói về nghề vệ sĩ – một công việc nhiều nguy hiểm, thử thách và cũng đầy thú vị. Bộ phim cũng đánh dấu lần kết hợp đầu tiên của “ông hoàng phòng vé” - danh hài Thái Hòa và nam diễn viên điển trai Kim Lý. Trong phim Kim Lý vào vai Mr. Hoàn Hảo cùng với Mr Mê Gái - Thái Hòa phải thực hiện một nhiệm vụ tưởng dễ nhưng hóa ra... cực khó. Nhận lời ủy thác của một nữ khách hàng xinh đẹp, cả hai phải bảo vệ một công tử nhà giàu. Thế nhưng, với tính cách khó gần, cậu ấm Henry gây không ít khó khăn cho họ. Trong lúc bất ngờ, Henry bị bắt cóc. Hai chàng vệ sĩ phải vận dụng hết các kỹ năng nghề nghiệp để giải cứu khách hàng.', 'https://www.galaxycine.vn/media/v/e/vesi_1.jpg', 'kne_bEt6Z3w', '0', 'https://www.galaxycine.vn/dat-ve/ve-si-sai-gon', 'https://www.cgv.vn/vn/ve-si-sai-gon.html', 'null'), ('174', 'ROGUE ONE: A STAR WARS STORY', 'Phiêu lưu, Hành động, Giả Tưởng', 'Gareth Edwards', 'Felicity Jones, Mads Mikkelsen, Ben Mendelsohn', 'Lucasfilm, Walt Disney Studios Motion Pictures', '', '2016-12-16', 'Rogue One: A Star Wars Story là bộ phim hành động, phiêu lưu, giả tưởng – Phần ngoại truyện của một trong những franchise ăn khách nhất trong lịch sử - siêu phẩm Star Wars. Phần phim này tập trung vào các cuộc nổi dậy của phiến quân, đang cố gắng đánh cắp các kế hoạch đến Death Star. Phim do Gareth Edwards làm đạo diễn, với sự tham gia của Felicity Jones, Mads Mikkelsen, Ben Mendelsohn.', 'https://www.galaxycine.vn/media/w/a/war_2.jpg', 'BHGb7vacV0Q', '0', 'https://www.galaxycine.vn/dat-ve/star-war', 'https://www.cgv.vn/vn/rogue-one-a-star-wars-story.html', 'null'), ('175', 'LA LA LAND', 'Tâm lý, Nhạc kịch, Hài', 'Damien Chazelle', 'Emma Stone, Ryan Gosling', 'Lionsgate', '', '2016-12-16', 'La La Land là câu chuyện tình yêu tuyệt đẹp thời hiện đại giữa chàng nhạc công piano tài hoa chuyên diễn tại các quán bar Sebastian (Ryan Gosling) và cô diễn viên mới nổi xinh đẹp Mia Dolan (Emma Stone). Thế nhưng, ở thiên đường điện ảnh Hollywood, tình yêu và sự thành công dường như không thể song hành. Khi thành công và sự nổi tiếng đến, họ sẽ phải đối mặt ra sao?', 'https://www.galaxycine.vn/media/l/a/la la land- vnese teaser poster.jpg', '2V1HxmmbORM', '0', 'https://www.galaxycine.vn/dat-ve/la-la-land', 'null', 'null'), ('176', 'SING / ĐẤU TRƯỜNG ÂM NHẠC', 'Hài, Hoạt hình', 'Garth Jennings', 'Matthew McConaughey, Reese Witherspoon', 'Universal', '', '2016-12-23', 'Trong một thế giới mà các động vật sinh sống như người, để cứu lấy nhà hát đang trên bờ vực đóng cửa do mình làm chủ, chú gấu koala Buster đã rủ các bạn tổ chức một cuộc thi âm nhạc tầm cỡ lớn. Những người bạn của Buster cũng có những hoàn cảnh vô cùng khác nhau. Đó là chú chuột ranh ma thích lừa đảo, là bé voi chưa trưởng thành sợ sân khấu, một con khỉ dữ dằn muốn tìm đường thoát tội cho gia đình, một cô nhím thích nhạc punk-rock vì tập trung cho sự nghiệp ca hát mà phải tìm cách chia tay bạn trai và cuối cùng là bà mẹ heo với gánh nặng chăm 25 chú heo con. ', 'https://www.galaxycine.vn/media/d/a/dautruong.jpg', 'uZZsGVFem0M', '0', 'https://www.galaxycine.vn/dat-ve/sing', 'null', 'null'), ('177', 'ALLIED / LIÊN MINH SÁT THỦ', 'Tâm lý, Hành động, Tình cảm', 'Robert Zemeckis', 'Brad Pitt, Marion Cotillard', 'Paramount Pictures', '', '2016-12-30', 'Liên Minh Sát Thủ diễn ra khi thế chiến thứ 2 đang hồi khốc liệt, một sĩ quan tình báo hoạt động ở Bắc Phi tình cờ gặp gỡ một nữ quân nhân người Pháp. Họ buộc phải dựng nên một cuộc hôn nhân giả, để rồi khi cùng trải qua cuộc sống mái ngàn cân treo sợi tóc với kẻ thù, hai con người này đã yêu nhau say đắm. Khi trở về London, tình cảm của họ bị thử thách bởi áp lực của cuộc chiến.', 'https://www.galaxycine.vn/media/a/l/all.jpg', 'XBAAqzOxdbQ', '0', 'https://www.galaxycine.vn/dat-ve/lien-minh-huyen-thoai-1', 'https://www.cgv.vn/vn/lien-minh-sat-thu.html', 'null'), ('178', 'ASSASSIN&#039;S CREED / SÁT THỦ BÓNG ĐÊM', 'Hành động', 'Justin Kurzel', 'Michael Fassbender, Marion Cotillard, Jeremy Irons', '20th Century Fox', '', '2016-12-30', 'Thông qua một công nghệ mang tính cách mạng trong lĩnh vực di truyền, Callum Lynch được đưa về thế giới loạn lạc cách đây năm trăm năm. Nhờ cuộc phiêu lưu kỳ lạ này, anh phát hiện mình chính là hậu duệ của sát thủ lừng danh Aguilar. Rèn luyện những kỹ năng thật trong thế giới ảo, Lynch dần dần thông thạo những kỹ năng chiến đấu điêu luyện và thực sự trở thành một sát thủ đáng gờm thời hiện đại.', 'https://www.galaxycine.vn/media/a/s/assasin.jpg', '_PJ0DrAQ6ns', '0', 'https://www.galaxycine.vn/dat-ve/assassins-creed', 'null', 'null'), ('179', 'WHY HIM ?', 'Hài', 'John Hamburg', 'James Franco, Bryan Cranston', '20th Century Fox', '', '2017-01-20', 'Why him? kể về cả kỳ nghỉ là một cuộc đấu trí căng thẳng thực sự của ông bố khi nỗ lực thuyết phục con gái rằng cái gã mà cô đang hẹn hò thay vì là soái ca trong truyền thuyết thì hắn thực sự là một sói ca kinh điển. Chưa kịp thuyết phục con gái thì tất thảy những thành viên còn lại đều đã bị “mua chuộc” trắng trợn. Trong khi cậu con trai 15 tuổi dán mắt vào bộ game 4 nút và trở thành bạn game ăn ý với “con rể tương lai” thì người vợ mực thước đã kịp cắn thuốc, phê cần, lắc giật điên loạn, thích thú mê tơi.', 'https://www.galaxycine.vn/media/w/h/whyhim.jpg', 'AChhKiy0wAI', '0', 'https://www.galaxycine.vn/dat-ve/why-him', 'null', 'null'), ('180', 'XXX: RETURN OF XANDER CAGE / XXX PHẢN ĐÒN', 'Hình sự, Hành động, Giả Tưởng', 'D.J. Caruso', 'Vin Diesel, Samuel L. Jackson', 'Paramount Pictures', '', '2017-01-27', 'Gặp tai nạn chết người, Xander Cage vẫn còn sống nhưng giả vờ đã qua đời. Giờ đây, Xander bí mật trở lại trong một điệp vụ mới. Tuy nhiên, anh gặp khó khăn trong việc hợp tác với người cộng sự Augustus Gibbons.Sau 15 năm, Vin Diesel trở lại với bộ phim đã đưa tên tuổi anh nổi tiếng toàn cầu. Trở lại cùng anh trong phần này còn có Samuel L. Jackson. Ngoài ra, xXx: Return Of Xander Cage còn có sự tham gia của người đẹp Vampire Diaries – Nina Dobrev và hai ngôi sao châu Á Chân Tử Đan & Ngô Diệc Phàm. ', 'https://www.galaxycine.vn/media/x/x/xxx.jpg', 'cc0bI_GIk14', '0', 'https://www.galaxycine.vn/dat-ve/xxx-phan-don', 'https://www.cgv.vn/vn/xxx-the-return-of-xander-cage.html', 'null'), ('181', 'GUARDIANS', 'Phiêu lưu, Hành động, Giả Tưởng', 'Sarik Andreasyan', 'Valeriya Shkirando, Anton Pampushnyy, Alina Lanina, Sanzhar Madiyev', 'Enjoy Movies', '', '2017-02-23', 'Khi cuộc chiến tranh lạnh giữa Nga và Mỹ không ngừng leo thang căng thẳng, một tổ chức tên Patriot được lập ra nhằm đào tạo một biệt đội siêu anh hùng bao gồm các thành viên của những nước Xô Viết. Họ được cải tạo gen và biến thành những chiến binh bất khả chiến bại. Suốt nhiều năm, những siêu anh hùng này cố gắng che giấu danh tính của mình.', 'https://www.galaxycine.vn/media/g/d/gda.jpg', 'Jc35Clv1V40', '0', 'https://www.galaxycine.vn/dat-ve/guardians', 'null', 'null'), ('182', 'BEAUTY AND THE BEAST', 'Tình cảm, Thần thoại', '', 'Emma Watson', 'Disney', '', '2017-03-01', 'Chuyển thể từ truyện cổ Grimm nổi tiếng, Beauty And The Beast là câu chuyện tình lãng mạn giữa một cô gái vùng quê và vị hoàng tử bị dính lời nguyền trở thành quái vật.', 'https://www.galaxycine.vn/media/n/g/nguoidep.jpg', 'fkNVzqI6bxo', '0', 'https://www.galaxycine.vn/dat-ve/beauty-and-the-beast', 'https://www.cgv.vn/vn/beauty-and-the-beast.html', 'null'), ('183', 'WOLVERINE 3- LOGAN', 'Hành động, Giả Tưởng', 'James Mangold', 'Hugh Jackman, Patrick Stewart', '20th Century Fox', '', '2017-03-03', 'Đặt bối cảnh ở tương lai năm 2024, khi nhóm X-Men đã tan rã. Năng lực hồi phục của Wolverine - Logan dần dần mất đi còn giáo sư X lại mắc bệnh Alzheimer suy giảm trí nhớ. Lúc này, một tập đoàn do Nathaniel Essex lãnh đạo tìm cách phá hoại thế giới, Logan phải chiến đấu chống lại hắn cùng với sự giúp đỡ của cô bé Laura Kinney – một người đột biến được nhân bản từ chính ông.', 'https://www.galaxycine.vn/media/l/o/lo.jpg', '8iJn8gO3mIQ', '0', 'https://www.galaxycine.vn/dat-ve/wolverine-logan', 'null', 'null'), ('184', 'KONG: SKULL ISLAND', 'Phiêu lưu, Hành động, Giả Tưởng', 'Jordan Vogt-Roberts', 'Tom Hiddleston, Samuel L. Jackson, Toby Kebbell', 'Warner Bros', '', '2017-03-10', 'Kong: Skull Island là bộ phim hành động, phiêu lưu, giả tưởng kể về nguồn gốc thật sự của King Kong, mở đầu bằng chuyến hành trình của một đoàn thám hiểm tới hòn đảo này. Không may, họ gặp phải sự cố. Những nhà thám hiểm sẽ phải sống mái với cư dân bản địa và cả cơn ác mộng tồi tệ nhất – King Kong.Với ngoại cảnh quay ở Việt Nam, Kong: Skull Island tự hào giới thiệu những thắng cảnh tuyệt đẹp của Ninh Bình, Quảng Bình… tới bạn bè thế giới. Phim có sự tham gia của ngôi sao người Anh Tom Hiddleston và nữ diễn viên vừa đoạt giải Oscar năm 2016 Brie Larson. ', 'https://www.galaxycine.vn/media/k/o/kong.jpg', 'WfjvbkdQ2zQ', '0', 'https://www.galaxycine.vn/dat-ve/kong-skull-island', 'null', 'null'), ('185', 'MONSTER TRUCKS', 'Phiêu Lưu, Hoạt Hình', 'Chris Wedge', 'Lucas Till, Jane Levy, Barry Pepper, Amy Ryan, Rob Lowe, Danny Glover, Thomas Lennon, Holt McCallany', 'null', '', '2017-01-13', 'Câu chuyện bắt đầu với Tripp – một nam sinh trung học đang tìm cách thoát khỏi cuộc sống ở thành phố nơi cậu sinh ra và tìm cách lắp ráp một chiếc xe tải quái vật từ những vật liệu cũ. Sau tai nạn ở trạm xăng, gần chỗ ẩn náu của một sinh vật kỳ lạ với giác quan và tài năng về tốc độ, Tripp bắt đầu nhìn thấy kế hoạch để rời thành phố và một người bạn đặc biệt.', 'https://www.cgv.vn/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/m/o/monster_trucks_160x237.jpg', 'F1_Z3kLgKGc', '0', 'null', 'https://www.cgv.vn/vn/monster-trucks.html', 'null');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
