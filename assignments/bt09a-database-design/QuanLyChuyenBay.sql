-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th5 05, 2025 lúc 03:35 PM
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
-- Cơ sở dữ liệu: `QuanLyChuyenBay`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `BAO_CAO_NAM`
--

CREATE TABLE `BAO_CAO_NAM` (
  `Nam` int(11) NOT NULL,
  `Thang` int(11) NOT NULL,
  `SoChuyenBay` int(11) DEFAULT NULL,
  `DoanhThu` float DEFAULT NULL,
  `TyLe` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `BAO_CAO_THANG`
--

CREATE TABLE `BAO_CAO_THANG` (
  `Thang` int(11) NOT NULL,
  `Ma_CB` varchar(50) NOT NULL,
  `SoVe` int(11) DEFAULT NULL,
  `DoanhThu` float DEFAULT NULL,
  `TyLe` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `CHUYEN_BAY`
--

CREATE TABLE `CHUYEN_BAY` (
  `Ma_CB` varchar(50) NOT NULL,
  `SanBayDi` varchar(100) DEFAULT NULL,
  `SanBayDen` varchar(100) DEFAULT NULL,
  `NgayGio` datetime DEFAULT NULL,
  `ThoiGianBay` int(11) DEFAULT NULL,
  `GiaVe` float DEFAULT NULL,
  `SoGheHang1` int(11) DEFAULT NULL,
  `SoGheHang2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `CHUYEN_BAY`
--

INSERT INTO `CHUYEN_BAY` (`Ma_CB`, `SanBayDi`, `SanBayDen`, `NgayGio`, `ThoiGianBay`, `GiaVe`, `SoGheHang1`, `SoGheHang2`) VALUES
('CB001', 'HAN', 'SGN', '2025-06-10 08:00:00', 120, 1500000, 10, 90);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `DAT_CHO`
--

CREATE TABLE `DAT_CHO` (
  `Ma_CB` varchar(50) NOT NULL,
  `CMND` varchar(20) NOT NULL,
  `HangVe` int(11) DEFAULT NULL,
  `GiaTien` float DEFAULT NULL,
  `NgayDat` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `HANG_VE`
--

CREATE TABLE `HANG_VE` (
  `MaHangVe` int(11) NOT NULL,
  `MoTa` text DEFAULT NULL,
  `TyLeGia` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `HANH_KHACH`
--

CREATE TABLE `HANH_KHACH` (
  `CMND` varchar(20) NOT NULL,
  `HoTen` varchar(100) DEFAULT NULL,
  `SDT` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `HANH_KHACH`
--

INSERT INTO `HANH_KHACH` (`CMND`, `HoTen`, `SDT`) VALUES
('123456789', 'Nguyễn Văn A', '0909123456'),
('987654321', 'Trần Thị B', '0987987987');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `LOAI_SAN_BAY`
--

CREATE TABLE `LOAI_SAN_BAY` (
  `MaLoaiSB` varchar(50) NOT NULL,
  `TenLoai` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `QUY_DINH`
--

CREATE TABLE `QUY_DINH` (
  `MaQD` int(11) NOT NULL,
  `MoTa` text DEFAULT NULL,
  `GiaTri` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `SAN_BAY_TG`
--

CREATE TABLE `SAN_BAY_TG` (
  `Ma_CB` varchar(50) NOT NULL,
  `STT` int(11) NOT NULL,
  `TenSB` varchar(100) DEFAULT NULL,
  `ThoiGianDung` int(11) DEFAULT NULL,
  `GhiChu` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `THAM_SO`
--

CREATE TABLE `THAM_SO` (
  `MaThamSo` varchar(50) NOT NULL,
  `TenThamSo` text DEFAULT NULL,
  `GiaTri` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `VE_BAY`
--

CREATE TABLE `VE_BAY` (
  `Ma_CB` varchar(50) NOT NULL,
  `CMND` varchar(20) NOT NULL,
  `HangVe` int(11) DEFAULT NULL,
  `GiaTien` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `VE_BAY`
--

INSERT INTO `VE_BAY` (`Ma_CB`, `CMND`, `HangVe`, `GiaTien`) VALUES
('CB001', '123456789', 1, 1575000);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `BAO_CAO_NAM`
--
ALTER TABLE `BAO_CAO_NAM`
  ADD PRIMARY KEY (`Nam`,`Thang`),
  ADD KEY `Thang` (`Thang`);

--
-- Chỉ mục cho bảng `BAO_CAO_THANG`
--
ALTER TABLE `BAO_CAO_THANG`
  ADD PRIMARY KEY (`Thang`,`Ma_CB`),
  ADD KEY `Ma_CB` (`Ma_CB`);

--
-- Chỉ mục cho bảng `CHUYEN_BAY`
--
ALTER TABLE `CHUYEN_BAY`
  ADD PRIMARY KEY (`Ma_CB`);

--
-- Chỉ mục cho bảng `DAT_CHO`
--
ALTER TABLE `DAT_CHO`
  ADD PRIMARY KEY (`Ma_CB`,`CMND`),
  ADD KEY `CMND` (`CMND`);

--
-- Chỉ mục cho bảng `HANG_VE`
--
ALTER TABLE `HANG_VE`
  ADD PRIMARY KEY (`MaHangVe`);

--
-- Chỉ mục cho bảng `HANH_KHACH`
--
ALTER TABLE `HANH_KHACH`
  ADD PRIMARY KEY (`CMND`);

--
-- Chỉ mục cho bảng `LOAI_SAN_BAY`
--
ALTER TABLE `LOAI_SAN_BAY`
  ADD PRIMARY KEY (`MaLoaiSB`);

--
-- Chỉ mục cho bảng `QUY_DINH`
--
ALTER TABLE `QUY_DINH`
  ADD PRIMARY KEY (`MaQD`);

--
-- Chỉ mục cho bảng `SAN_BAY_TG`
--
ALTER TABLE `SAN_BAY_TG`
  ADD PRIMARY KEY (`Ma_CB`,`STT`);

--
-- Chỉ mục cho bảng `THAM_SO`
--
ALTER TABLE `THAM_SO`
  ADD PRIMARY KEY (`MaThamSo`);

--
-- Chỉ mục cho bảng `VE_BAY`
--
ALTER TABLE `VE_BAY`
  ADD PRIMARY KEY (`Ma_CB`,`CMND`),
  ADD KEY `CMND` (`CMND`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `BAO_CAO_NAM`
--
ALTER TABLE `BAO_CAO_NAM`
  ADD CONSTRAINT `bao_cao_nam_ibfk_1` FOREIGN KEY (`Thang`) REFERENCES `BAO_CAO_THANG` (`Thang`);

--
-- Các ràng buộc cho bảng `BAO_CAO_THANG`
--
ALTER TABLE `BAO_CAO_THANG`
  ADD CONSTRAINT `bao_cao_thang_ibfk_1` FOREIGN KEY (`Ma_CB`) REFERENCES `CHUYEN_BAY` (`Ma_CB`);

--
-- Các ràng buộc cho bảng `DAT_CHO`
--
ALTER TABLE `DAT_CHO`
  ADD CONSTRAINT `dat_cho_ibfk_1` FOREIGN KEY (`Ma_CB`) REFERENCES `CHUYEN_BAY` (`Ma_CB`),
  ADD CONSTRAINT `dat_cho_ibfk_2` FOREIGN KEY (`CMND`) REFERENCES `HANH_KHACH` (`CMND`);

--
-- Các ràng buộc cho bảng `SAN_BAY_TG`
--
ALTER TABLE `SAN_BAY_TG`
  ADD CONSTRAINT `san_bay_tg_ibfk_1` FOREIGN KEY (`Ma_CB`) REFERENCES `CHUYEN_BAY` (`Ma_CB`);

--
-- Các ràng buộc cho bảng `VE_BAY`
--
ALTER TABLE `VE_BAY`
  ADD CONSTRAINT `ve_bay_ibfk_1` FOREIGN KEY (`Ma_CB`) REFERENCES `CHUYEN_BAY` (`Ma_CB`),
  ADD CONSTRAINT `ve_bay_ibfk_2` FOREIGN KEY (`CMND`) REFERENCES `HANH_KHACH` (`CMND`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
