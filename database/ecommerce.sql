-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2021 at 05:31 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'motorolla'),
(5, 'LG'),
(6, 'Cloth Brand');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Electronics'),
(2, 'Ladies Wears'),
(3, 'Mens Wear'),
(4, 'Kids Wear'),
(5, 'Furnitures'),
(6, 'Home Appliances'),
(7, 'Electronics Gadgets');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Lawrence', 'lawrenceperezpogi123@gmail.com', 'Philippines,Paranaque', 'Paranaque', 'NCR', 1234, 'pogi', '4321 2345 6788 7654', '12/90', 3, 77000, 1234);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Samsung galaxy s7 edge', 5000, 'Samsung galaxy s7 edge', 'product07.png', 'samsung mobile electronics'),
(4, 1, 3, 'iPhone 6s', 32000, 'Apple iPhone ', 'http___pluspng.com_img-png_iphone-6s-png-iphone-6s-gold-64gb-1000.png', 'iphone apple mobile'),
(8, 1, 4, 'Sony', 40000, 'Sony Mobile', '530201353846AM_635_sony_xperia_z.png', 'sony mobile'),
(82, 1, 1, 'Redmi 9T', 7200, 'Dimensions      	162.3 x 77.3 x 9.6 mm (6.39 x 3.04 x 0.38 in)\r\nWeight	                198 g (6.98 oz)\r\nBuild	               Glass front (Gorilla Glass 3), plastic frame, plastic back\r\nSIM	Dual SIM (Nano-SIM, dual stand-by)\r\n 	Water-repellent coating\r\nDISPLAY	Type	IPS LCD, 400 nits (typ)\r\nSize	6.53 inches, 104.7 cm2 (~83.4% screen-to-body ratio)\r\nResolution	1080 x 2340 pixels, 19.5:9 ratio (~395 ppi density)\r\nProtection	Corning Gorilla Glass 3\r\nPLATFORM	OS	Android 10, MIUI 12\r\nChipset	Qualcomm SM6115 Snapdragon 662 (11 nm)\r\nCPU	Octa-core (4x2.0 GHz Kryo 260 Gold & 4x1.8 GHz Kryo 260 Silver)\r\nGPU	Adreno 610', '1621693409_Redmi 9t.jpg', 'Redmi 9t'),
(83, 1, 1, 'Poco M3', 8000, 'Test', '1621694578_Poco m3.jpg', 'Poco M3'),
(84, 1, 1, 'Vivo Y19', 10000, 'BODY	Dimensions	162.2 x 76.5 x 8.9 mm (6.39 x 3.01 x 0.35 in)\r\nWeight	193 g (6.81 oz)\r\nBuild	Glass front, plastic back, plastic frame\r\nSIM	Single SIM (Nano-SIM) or Dual SIM (Nano-SIM, dual stand-by)\r\nDISPLAY	Type	IPS LCD\r\nSize	6.53 inches, 104.7 cm2 (~84.4% screen-to-body ratio)\r\nResolution	1080 x 2340 pixels, 19.5:9 ratio (~395 ppi density)\r\nPLATFORM	OS	Android 9.0 (Pie), Funtouch 9.2\r\nChipset	Mediatek MT6768 Helio P65 (12nm)\r\nCPU	Octa-core (2x2.0 GHz Cortex-A75 & 6x1.7 GHz Cortex-A55)\r\nGPU	Mali-G52 MC2\r\nMEMORY	Card slot	microSDXC (dedicated slot)\r\nInternal	128GB 4GB RAM, 128GB 6GB RAM, 128GB 8GB RAM\r\n 	eMMC 5.1\r\nMAIN CAMERA	Triple	16 MP, f/1.8, (wide), PDAF\r\n8 MP, f/2.2, 13mm (ultrawide)\r\n2 MP, f/2.4, (macro)\r\nFeatures	LED flash, HDR, panorama\r\nVideo	1080p@30fps\r\nSELFIE CAMERA	Single	16 MP, f/2.0, 26mm (wide), 1/3.06\", 1.0µm\r\nFeatures	HDR\r\nVideo	1080p@30fps', '1621695096_Vivo y19.jpg', 'VIvo y19'),
(85, 1, 1, 'Huawei P30', 10000, 'BODY	Dimensions	162.2 x 76.5 x 8.9 mm (6.39 x 3.01 x 0.35 in)\r\nWeight	193 g (6.81 oz)\r\nBuild	Glass front, plastic back, plastic frame\r\nSIM	Single SIM (Nano-SIM) or Dual SIM (Nano-SIM, dual stand-by)\r\nDISPLAY	Type	IPS LCD\r\nSize	6.53 inches, 104.7 cm2 (~84.4% screen-to-body ratio)\r\nResolution	1080 x 2340 pixels, 19.5:9 ratio (~395 ppi density)\r\nPLATFORM	OS	Android 9.0 (Pie), Funtouch 9.2\r\nChipset	Mediatek MT6768 Helio P65 (12nm)\r\nCPU	Octa-core (2x2.0 GHz Cortex-A75 & 6x1.7 GHz Cortex-A55)\r\nGPU	Mali-G52 MC2\r\nMEMORY	Card slot	microSDXC (dedicated slot)\r\nInternal	128GB 4GB RAM, 128GB 6GB RAM, 128GB 8GB RAM\r\n 	eMMC 5.1\r\nMAIN CAMERA	Triple	16 MP, f/1.8, (wide), PDAF\r\n8 MP, f/2.2, 13mm (ultrawide)\r\n2 MP, f/2.4, (macro)\r\nFeatures	LED flash, HDR, panorama\r\nVideo	1080p@30fps\r\nSELFIE CAMERA	Single	16 MP, f/2.0, 26mm (wide), 1/3.06\", 1.0µm\r\nFeatures	HDR\r\nVideo	1080p@30fps', '1621695200_huawei-p30-pro.jpg', 'Huawei P30'),
(86, 1, 1, 'Realme 8 Pro', 12000, 'BODY	Dimensions	160.6 x 73.9 x 8.1 mm (6.32 x 2.91 x 0.32 in)\r\nWeight	176 g (6.21 oz)\r\nBuild	Glass front, plastic frame, plastic back\r\nSIM	Dual SIM (Nano-SIM, dual stand-by)\r\nDISPLAY	Type	Super AMOLED, 430 nits (typ), 1000 nits (peak)\r\nSize	6.4 inches, 98.9 cm2 (~83.3% screen-to-body ratio)\r\nResolution	1080 x 2400 pixels, 20:9 ratio (~411 ppi density)\r\n 	Always-on display\r\nPLATFORM	OS	Android 11, Realme UI 2.0\r\nChipset	Qualcomm SM7125 Snapdragon 720G (8 nm)\r\nCPU	Octa-core (2x2.3 GHz Kryo 465 Gold & 6x1.8 GHz Kryo 465 Silver)\r\nGPU	Adreno 618\r\nMEMORY	Card slot	microSDXC (dedicated slot)\r\nInternal	128GB 6GB RAM, 128GB 8GB RAM\r\n 	UFS 2.1\r\nMAIN CAMERA	Quad	108 MP, f/1.9, 26mm (wide), 1/1.52\", 0.7µm, PDAF\r\n8 MP, f/2.3, 119?, 16mm (ultrawide), 1/4.0\", 1.12µm\r\n2 MP, f/2.4, (macro)\r\n2 MP, f/2.4, (depth)\r\nFeatures	LED flash, HDR, panorama\r\nVideo	4K@30fps, 1080p@30/60/120/480fps, 720p@960fps, gyro-EIS\r\nSELFIE CAMERA	Single	16 MP, f/2.5, (wide), 1/3.0\", 1.0µm\r\nFeatures	HDR, panorama\r\nVideo	1080p@30/120fps, gyro-EIS', '1621695291_realme_8_Pro_L_1.jpg', 'Realme 8 Pro'),
(87, 1, 1, 'Realme 7', 7000, 'BODY	Dimensions	162.3 x 75.4 x 9.4 mm (6.39 x 2.97 x 0.37 in)\r\nWeight	196.5 g (6.95 oz)\r\nBuild	Glass front (Gorilla Glass 3), plastic back, plastic frame\r\nSIM	Dual SIM (Nano-SIM, dual stand-by)\r\nDISPLAY	Type	IPS LCD, 90Hz, 480 nits (typ)\r\nSize	6.5 inches, 102.0 cm2 (~83.4% screen-to-body ratio)\r\nResolution	1080 x 2400 pixels, 20:9 ratio (~405 ppi density)\r\nProtection	Corning Gorilla Glass 3\r\nPLATFORM	OS	Android 10, Realme UI\r\nChipset	Mediatek Helio G95 (12 nm)\r\nCPU	Octa-core (2x2.05 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55)\r\nGPU	Mali-G76 MC4\r\nMEMORY	Card slot	microSDXC (dedicated slot)\r\nInternal	64GB 6GB RAM, 128GB 8GB RAM\r\n 	UFS 2.1\r\nMAIN CAMERA	Quad	64 MP, f/1.8, 26mm (wide), 1/1.73\", 0.8µm, PDAF\r\n8 MP, f/2.3, 119?, 16mm (ultrawide), 1/4.0\", 1.12µm\r\n2 MP, f/2.4, (macro)\r\n2 MP, f/2.4, (depth)\r\nFeatures	LED flash, HDR, panorama\r\nVideo	4K@30fps, 1080p@30/60/120fps, gyro-EIS\r\nSELFIE CAMERA	Single	16 MP, f/2.1, 26mm (wide), 1/3.1\", 1.0µm\r\nFeatures	Panorama\r\nVideo	1080p@30/120fps', '1621695345_Reame 7.jpg', 'Realme 7'),
(88, 2, 6, 'Women dress !', 500, 'Test', '1621695558_1 dress.jpg', 'Dress 1'),
(89, 2, 6, 'Women dress 2', 500, 'Test', '1621695594_2 Dress.jpg', 'Dress 2'),
(90, 2, 6, 'Women Dress 3', 500, 'Test', '1621695626_3 Dress.jpg', 'Dress 3'),
(91, 2, 6, 'Women Dress 4', 500, 'Test', '1621695699_4 Dress.jpg', 'Dress 4'),
(92, 2, 6, 'Women Dress 5', 500, 'Test', '1621695737_5 dress.jpg', 'Dress 5'),
(93, 2, 6, 'Women Dress 6', 500, 'Test', '1621695831_6 dress.jpg', 'Dress 6'),
(94, 2, 6, 'Women Dress 7', 500, 'Test', '1621695866_7 Dress.jpg', 'Dress 7'),
(95, 2, 6, 'Women Dress 8', 500, 'test', '1621695899_8 Dress.jpg', 'Dress 7'),
(96, 2, 6, 'Women Dress 8', 500, 'Test', '1621695934_8 Dress.jpg', 'Dress 8'),
(97, 2, 6, 'Women Dress 9', 500, 'Test', '1621695962_9 Dress.jpg', 'Dress 9'),
(98, 3, 6, 'Mens Shirt 1', 500, 'Test', '1621696168_Mens Shirt 1.jpg', 'Shirt 1'),
(99, 3, 6, 'Mens Shirt 2', 500, 'Test', '1621696192_Mens Shirt 2.png', 'Shirt 2'),
(100, 3, 6, 'Mens Shirt 3', 500, 'Test', '1621696222_Mens shirt 3.jpg', 'Shirt 3'),
(101, 3, 6, 'Mens shirt 4', 500, 'Test', '1621696282_Mens shirt 4.jpg', 'Shirt 4'),
(102, 3, 6, 'Men Shirt 5', 500, 'Test', '1621696326_Mens shirt 5.jpg', 'Shirt 5'),
(103, 3, 6, 'Mens Shirt 6', 500, 'Test', '1621696410_Mens shirt 6.jpg', 'Shirt 6'),
(104, 3, 6, 'Mens Shirt 6', 500, 'Test', '1621696470_Mens shirt 6.jpg', 'Shirt 6'),
(105, 3, 6, 'Mens Shirt 7', 500, 'Test', '1621696522_Mens shirt 7.jpg', 'Shirt 7'),
(106, 3, 6, 'Mens Shirt 8', 500, 'Test', '1621696576_Mens Shirt 8.jpg', 'Shirt 8'),
(107, 3, 6, 'Mens Shirt 8', 500, 'Test', '1621696632_Mens Shirt 8.jpg', 'Dress 8'),
(108, 3, 6, 'Mens Shirt 9', 500, 'Test', '1621696662_Mens shirt 9.jpg', 'Shirt 9'),
(109, 4, 6, 'Kids Wear 1', 500, 'test', '1621696906_Kids 1.jpg', 'Kids 1'),
(110, 4, 6, 'Kids Wear 2', 500, 'Test', '1621696938_Kids 2.jpg', 'Kids 2'),
(111, 4, 6, 'Kids Wear 3', 500, 'Test', '1621696988_Kids 3.jpg', 'Kids 3'),
(112, 4, 6, 'Kids Wear 4', 500, 'Test', '1621697018_Kids 4.jpg', 'Kids 4'),
(113, 4, 6, 'KIds Wear 5', 500, 'Test', '1621697045_Kids 5.jpg', 'Kids 5'),
(114, 4, 6, 'Kids Wear 6', 500, 'Test', '1621697070_Kids 6.jpg', 'Kids 6'),
(115, 4, 6, 'Kids wear 7', 500, 'Test', '1621697098_Kids 7.jpg', 'Kids 7'),
(116, 4, 6, 'Kids Wear 8', 500, 'Test', '1621697152_KIds 8.jpg', 'Kids 8'),
(117, 4, 6, 'Kids Wear 9', 500, 'Test', '1621697191_Kids 9.jpg', 'KIds 9');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Lawrence', 'Perez', 'lawrenceperezpogi123@gmail.com', 'lawrence', '9448121558', '123456789', 'sdcjns,djc');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Lawrence', 'Perez', 'lawrenceperezpogi123@gmail.com', 'lawrence', '9448121558', '123456789', 'sdcjns,djc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
