-- phpMyAdmin SQL Dump
-- version 3.4.11.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 27, 2013 at 09:48 AM
-- Server version: 5.5.29
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `codeshe1_hackjersey`
--

-- --------------------------------------------------------

--
-- Table structure for table `counties`
--

DROP TABLE IF EXISTS `counties`;
CREATE TABLE IF NOT EXISTS `counties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `locale` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `counties`
--

INSERT INTO `counties` (`id`, `name`, `locale`) VALUES
(1, 'Atlantic', 'rest'),
(2, 'Sussex', 'north'),
(3, 'Passaic', 'north'),
(4, 'Bergen', 'north'),
(5, 'Warren', 'north'),
(6, 'Morris', 'north'),
(7, 'Essex', 'north'),
(8, 'Hudson', 'north'),
(9, 'Hunterdon', 'north'),
(10, 'Somerset', 'north'),
(11, 'Middlesex', 'north'),
(12, 'Union', 'north'),
(13, 'Mercer', 'rest'),
(14, 'Monmouth', 'rest'),
(15, 'Ocean', 'rest'),
(16, 'Burlington', 'rest'),
(17, 'Camden', 'rest'),
(18, 'Gloucester', 'rest'),
(19, 'Salem', 'rest'),
(20, 'Cumberland', 'rest'),
(21, 'Cape May', 'rest');

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
CREATE TABLE IF NOT EXISTS `facilities` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `address` varchar(80) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zip` varchar(11) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `website` varchar(100) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=103 ;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`ID`, `name`, `address`, `city`, `state`, `zip`, `phone`, `website`, `lat`, `lng`) VALUES
(75, 'Hamilton Medical Arts', '2501 Kuser Rd.', 'Hamilton', 'NJ', '08691', '609-585-8800', 'http://www.4rai.com', 0.000000, 0.000000),
(76, 'Meadowlands Hospital Medical Center', '55 Meadowland Pkwy.', 'Secaucus', 'NJ', '07094', '201-392-3518', '', 0.000000, 0.000000),
(77, 'Hudson River Radiology', '120-152 48th St.', 'Union City', 'NJ', '07087', '201-330-1606', '', 0.000000, 0.000000),
(78, 'Hudson Radiology Center of NJ', '657-659 Broadway', 'Bayonne', 'NJ', '07002', '201-437-3007', '', 0.000000, 0.000000),
(79, 'Quakerbridge Radiology - Lawrenceville', '21 Lawrenceville-Pennington Rd.', 'Lawrenceville', 'NJ', '08648', '609-890-0033', '', 0.000000, 0.000000),
(80, 'Quakerbridge Radiology - Mercerville', '8 Quakerbridge Plz.', 'Mercerville', 'NJ', '08619', '609-890-0033', '', 0.000000, 0.000000),
(81, 'Westfield Imaging Center', '118-122 Elm St.', 'Westfield', 'NJ', '07090', '908-232-0290', '', 0.000000, 0.000000),
(82, 'The Imaging Center of Montville', '350 Main Rd.', 'Montville', 'NJ', '07045', '973-401-6800', '', 0.000000, 0.000000),
(83, 'Diagnostic Radiology Associates of Northfield', '772 Northfield Ave.', 'West Orange', 'NJ', '07052', '973-325-0002', '', 0.000000, 0.000000),
(84, 'St. Marys Hospital', '350 Blvd.', 'Passaic', 'NJ', '07055', '973-365-4607', '', 0.000000, 0.000000),
(85, 'South Mountain Imaging Center', '120 Millburn Ave. Ste. 101', 'Millburn', 'NJ', '07041', '973-376-0900', '', 0.000000, 0.000000),
(86, 'American Imaging of West Orange LLC', '61 Main St.', 'West Orange', 'NJ', '07045', '973-669-1989', '', 0.000000, 0.000000),
(87, 'Edgewater Family Care Center', '725 River Rd. Ste. 202', 'Edgewater', 'NJ', '07020', '201-943-4040', '', 0.000000, 0.000000),
(88, 'The Mountainside Hospital', '1 Bay Ave.', 'Montclair', 'NJ', '07042', '973-429-6120', '', 0.000000, 0.000000),
(89, 'Montclair Breast Center PC', '37 North Fullerton Ave.', 'Montclair', 'NJ', '07042', '973-509-1818', '', 0.000000, 0.000000),
(90, 'Lawrenceville Executive Center', '3120 Princeton Pike', 'Lawrenceville', 'NJ', '08648', '(609) 219-1000', 'http://www.4rai.com', 0.000000, 0.000000),
(91, 'East Windsor Medical Commons', '300A Princeton-Hightstown Road Suite 101', 'East Windsor', 'NJ', '08520', '(609) 426-9200', 'http://www.4rai.com', 0.000000, 0.000000),
(92, 'The Suite for Womens Imaging', '2501 Kuser Rd.', 'Hamilton', 'NJ', '08691', '609-585-8800', 'http://www.4rai.com', 0.000000, 0.000000),
(93, 'The Suite for Womens Imaging', '3120 Princeton Pike', 'Lawrenceville', 'NJ', '08648', '(609) 219-1000', 'http://www.4rai.com', 0.000000, 0.000000),
(94, 'Lawrenceville Executive Cente', '3120 Princeton Pike', 'Lawrenceville', 'NJ', '08648', '(609) 219-1000', 'http://www.4rai.com', 0.000000, 0.000000),
(95, 'North Jersey Imaging Center', '307 West 60th St.', 'West New York', 'NJ', '07093', '201-854-1200', 'radiologyimagingcenters.com', 0.000000, 0.000000),
(96, 'Denville Diagnostics', '161 East Main St.', 'Denville', 'NJ', '07834', '973-586-1212', 'http://www.denvillediagnostics.com/', 0.000000, 0.000000),
(97, 'American Imaging of New Jersey', '505 Summit Ave.', 'Jersey City', 'NJ', '07306', '202-656-5050', 'aisny.com', 0.000000, 0.000000),
(98, 'Barnabas Health', '300 Second Ave.', 'Long Branch', 'NJ', '07740', '(732) 923-7700', 'www.monmouthwilentzbreastcenter.com', 0.000000, 0.000000),
(99, 'New Jersey Cancer Education and Early Detection/St. Clares', '20 Walnut St.', 'Sussex', 'NJ', '07461', '973-702-2740', '', 0.000000, 0.000000),
(100, 'Newton Memorial Hospitals Education/ Outreach office æ', '175 High St.', 'Newton', 'NJ', '07860', '(973) 383-2121', '', 0.000000, 0.000000),
(101, 'DePaul Ambulatory Care Centeræ', '11 Getty Ave. Building 275', 'Paterson', 'NJ', '07503', '973-754-2705', '', 0.000000, 0.000000),
(102, 'Dr Jay''s', '17 West 34th Street', 'Montclair', 'NJ', '', '7324067045', 'http://jennschiffer.com', 0.000000, 0.000000);

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
CREATE TABLE IF NOT EXISTS `insurance` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`ID`, `name`) VALUES
(1, 'not insured'),
(2, 'Aetna'),
(3, 'Oxford Health Plans'),
(4, 'Horizon Blue Cross Blue Shield'),
(5, 'Cigna'),
(6, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `medicare`
--

DROP TABLE IF EXISTS `medicare`;
CREATE TABLE IF NOT EXISTS `medicare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `procedureID` int(11) NOT NULL,
  `locale` varchar(30) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `medicare`
--

INSERT INTO `medicare` (`id`, `procedureID`, `locale`, `cost`) VALUES
(1, 1, 'north', 93.00),
(2, 1, 'rest', 89.00),
(3, 4, 'north', 505.00),
(4, 4, 'rest', 481.00),
(5, 5, 'north', 755.00),
(6, 5, 'rest', 720.00),
(7, 6, 'north', 507.00),
(8, 6, 'rest', 483.00),
(9, 7, 'north', 767.00),
(10, 2, 'north', 166.00),
(11, 2, 'rest', 159.00),
(12, 3, 'north', 148.00),
(13, 3, 'rest', 141.00);

-- --------------------------------------------------------

--
-- Table structure for table `municipalities`
--

DROP TABLE IF EXISTS `municipalities`;
CREATE TABLE IF NOT EXISTS `municipalities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `countyID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=567 ;

--
-- Dumping data for table `municipalities`
--

INSERT INTO `municipalities` (`id`, `name`, `countyID`) VALUES
(1, 'Absecon City', 1),
(2, 'Atlantic City', 1),
(3, 'Brigantine City', 1),
(4, 'Buena Boro', 1),
(5, 'Buena Vista Twp', 1),
(6, 'Corbin City', 1),
(7, 'Egg Harbor City', 1),
(8, 'Egg Harbor Twp', 1),
(9, 'Estell Manor City', 1),
(10, 'Folsom Boro', 1),
(11, 'Galloway Twp', 1),
(12, 'Hamilton Twp', 1),
(13, 'Hammonton Town', 1),
(14, 'Linwood City', 1),
(15, 'Longport Boro', 1),
(16, 'Margate City', 1),
(17, 'Mullica Twp', 1),
(18, 'Northfield City', 1),
(19, 'Pleasantville City', 1),
(20, 'Port Republic City', 1),
(21, 'Somers Point City', 1),
(22, 'Ventnor City', 1),
(23, 'Weymouth Twp', 1),
(24, 'Allendale Boro', 4),
(25, 'Alpine Boro', 4),
(26, 'Bergenfield Boro', 4),
(27, 'Bogota Boro', 4),
(28, 'Carlstadt Boro', 4),
(29, 'Cliffside Park Boro', 4),
(30, 'Closter Boro', 4),
(31, 'Cresskill Boro', 4),
(32, 'Demarest Boro', 4),
(33, 'Dumont Boro', 4),
(34, 'Elmwood Park Boro', 4),
(35, 'East Rutherford Boro', 4),
(36, 'Edgewater Boro', 4),
(37, 'Emerson Boro', 4),
(38, 'Englewood City', 4),
(39, 'Englewood Cliffs Boro', 4),
(40, 'Fair Lawn Boro', 4),
(41, 'Fairview Boro', 4),
(42, 'Fort Lee Boro', 4),
(43, 'Franklin Lakes Boro', 4),
(44, 'Garfield City', 4),
(45, 'Glen Rock Boro', 4),
(46, 'Hackensack City', 4),
(47, 'Harrington Park Boro', 4),
(48, 'Hasbrouck Heights Boro', 4),
(49, 'Haworth Boro', 4),
(50, 'Hillsdale Boro', 4),
(51, 'Hohokus Boro', 4),
(52, 'Leonia Boro', 4),
(53, 'Little Ferry Boro', 4),
(54, 'Lodi Boro', 4),
(55, 'Lyndhurst Twp', 4),
(56, 'Mahwah Twp', 4),
(57, 'Maywood Boro', 4),
(58, 'Midland Park Boro', 4),
(59, 'Montvale Boro', 4),
(60, 'Moonachie Boro', 4),
(61, 'New Milford Boro', 4),
(62, 'North Arlington Boro', 4),
(63, 'Northvale Boro', 4),
(64, 'Norwood Boro', 4),
(65, 'Oakland Boro', 4),
(66, 'Old Tappan Boro', 4),
(67, 'Oradell Boro', 4),
(68, 'Palisades Park Boro', 4),
(69, 'Paramus Boro', 4),
(70, 'Park Ridge Boro', 4),
(71, 'Ramsey Boro', 4),
(72, 'Ridgefield Boro', 4),
(73, 'Ridgefield Park Village', 4),
(74, 'Ridgewood Village', 4),
(75, 'River Edge Boro', 4),
(76, 'River Vale Twp', 4),
(77, 'Rochelle Park Twp', 4),
(78, 'Rockleigh Boro', 4),
(79, 'Rutherford Boro', 4),
(80, 'Saddle Brook Twp', 4),
(81, 'Saddle River Boro', 4),
(82, 'South Hackensack Twp', 4),
(83, 'Teaneck Twp', 4),
(84, 'Tenafly Boro', 4),
(85, 'Teterboro Boro', 4),
(86, 'Upper Saddle River Boro', 4),
(87, 'Waldwick Boro', 4),
(88, 'Wallington Boro', 4),
(89, 'Washington Twp', 4),
(90, 'Westwood Boro', 4),
(91, 'Woodcliff Lake Boro', 4),
(92, 'Wood-Ridge Boro', 4),
(93, 'Wyckoff Twp', 4),
(94, 'Bass River Twp', 16),
(95, 'Beverly City', 16),
(96, 'Bordentown City', 16),
(97, 'Bordentown Twp', 16),
(98, 'Burlington City', 16),
(99, 'Burlington Twp', 16),
(100, 'Chesterfield Twp', 16),
(101, 'Cinnaminson Twp', 16),
(102, 'Delanco Twp', 16),
(103, 'Delran Twp', 16),
(104, 'Eastampton Twp', 16),
(105, 'Edgewater Park Twp', 16),
(106, 'Evesham Twp', 16),
(107, 'Fieldsboro Boro', 16),
(108, 'Florence Twp', 16),
(109, 'Hainesport Twp', 16),
(110, 'Lumberton Twp', 16),
(111, 'Mansfield Twp', 16),
(112, 'Maple Shade Twp', 16),
(113, 'Medford Twp', 16),
(114, 'Medford Lakes Boro', 16),
(115, 'Moorestown Twp', 16),
(116, 'Mount Holly Twp', 16),
(117, 'Mount Laurel Twp', 16),
(118, 'New Hanover Twp', 16),
(119, 'North Hanover Twp', 16),
(120, 'Palmyra Boro', 16),
(121, 'Pemberton Boro', 16),
(122, 'Pemberton Twp', 16),
(123, 'Riverside Twp', 16),
(124, 'Riverton Boro', 16),
(125, 'Shamong Twp', 16),
(126, 'Southampton Twp', 16),
(127, 'Springfield Twp', 16),
(128, 'Tabernacle Twp', 16),
(129, 'Washington Twp', 16),
(130, 'Westampton Twp', 16),
(131, 'Willingboro Twp', 16),
(132, 'Woodland Twp', 16),
(133, 'Wrightstown Boro', 16),
(134, 'Audubon Boro', 17),
(135, 'Audubon Park Boro', 17),
(136, 'Barrington Boro', 17),
(137, 'Bellmawr Boro', 17),
(138, 'Berlin Boro', 17),
(139, 'Berlin Twp', 17),
(140, 'Brooklawn Boro', 17),
(141, 'Camden City', 17),
(142, 'Cherry Hill Twp', 17),
(143, 'Chesilhurst Boro', 17),
(144, 'Clementon Boro', 17),
(145, 'Collingswood Boro', 17),
(146, 'Gibbsboro Boro', 17),
(147, 'Gloucester City', 17),
(148, 'Gloucester Twp', 17),
(149, 'Haddon Twp', 17),
(150, 'Haddonfield Boro', 17),
(151, 'Haddon Heights Boro', 17),
(152, 'Hi-Nella Boro', 17),
(153, 'Laurel Springs Boro', 17),
(154, 'Lawnside Boro', 17),
(155, 'Lindenwold Boro', 17),
(156, 'Magnolia Boro', 17),
(157, 'Merchantville Boro', 17),
(158, 'Mount Ephraim Boro', 17),
(159, 'Oaklyn Boro', 17),
(160, 'Pennsauken Twp', 17),
(161, 'Pine Hill Boro', 17),
(162, 'Pine Valley Boro', 17),
(163, 'Runnemede Boro', 17),
(164, 'Somerdale Boro', 17),
(165, 'Stratford Boro', 17),
(166, 'Tavistock Boro', 17),
(167, 'Voorhees Twp', 17),
(168, 'Waterford Twp', 17),
(169, 'Winslow Twp', 17),
(170, 'Woodlynne Boro', 17),
(171, 'Avalon Boro', 21),
(172, 'Cape May City', 21),
(173, 'Cape May Point Boro', 21),
(174, 'Dennis Twp', 21),
(175, 'Lower Twp', 21),
(176, 'Middle Twp', 21),
(177, 'North Wildwood City', 21),
(178, 'Ocean City', 21),
(179, 'Sea Isle City', 21),
(180, 'Stone Harbor Boro', 21),
(181, 'Upper Twp', 21),
(182, 'West Cape May Boro', 21),
(183, 'West Wildwood Boro', 21),
(184, 'Wildwood City', 21),
(185, 'Wildwood Crest Boro', 21),
(186, 'Woodbine Boro', 21),
(187, 'Bridgeton City', 20),
(188, 'Commercial Twp', 20),
(189, 'Deerfield Twp', 20),
(190, 'Downe Twp', 20),
(191, 'Fairfield Twp', 20),
(192, 'Greenwich Twp', 20),
(193, 'Hopewell Twp', 20),
(194, 'Lawrence Twp', 20),
(195, 'Maurice River Twp', 20),
(196, 'Millville City', 20),
(197, 'Shiloh Boro', 20),
(198, 'Stow Creek Twp', 20),
(199, 'Upper Deerfield Twp', 20),
(200, 'Vineland City', 20),
(201, 'Belleville Twp', 7),
(202, 'Bloomfield Twp', 7),
(203, 'Caldwell Boro Twp', 7),
(204, 'Cedar Grove Twp', 7),
(205, 'East Orange City', 7),
(206, 'Essex Fells Twp', 7),
(207, 'Fairfield Twp', 7),
(208, 'Glen Ridge Boro Twp', 7),
(209, 'Irvington Twp', 7),
(210, 'Livingston Twp', 7),
(211, 'Maplewood Twp', 7),
(212, 'Millburn Twp', 7),
(213, 'Montclair Twp', 7),
(214, 'Newark City', 7),
(215, 'North Caldwell Boro', 7),
(216, 'Nutley Twp', 7),
(217, 'City Of Orange Twp', 7),
(218, 'Roseland Boro', 7),
(219, 'South Orange Village Twp', 7),
(220, 'Verona Twp', 7),
(221, 'West Caldwell Twp', 7),
(222, 'West Orange Twp', 7),
(223, 'Clayton Boro', 18),
(224, 'Deptford Twp', 18),
(225, 'East Greenwich Twp', 18),
(226, 'Elk Twp', 18),
(227, 'Franklin Twp', 18),
(228, 'Glassboro Boro', 18),
(229, 'Greenwich Twp', 18),
(230, 'Harrison Twp', 18),
(231, 'Logan Twp', 18),
(232, 'Mantua Twp', 18),
(233, 'Monroe Twp', 18),
(234, 'National Park Boro', 18),
(235, 'Newfield Boro', 18),
(236, 'Paulsboro Boro', 18),
(237, 'Pitman Boro', 18),
(238, 'South Harrison Twp', 18),
(239, 'Swedesboro Boro', 18),
(240, 'Washington Twp', 18),
(241, 'Wenonah Boro', 18),
(242, 'West Deptford Twp', 18),
(243, 'Westville Boro', 18),
(244, 'Woodbury City', 18),
(245, 'Woodbury Heights Boro', 18),
(246, 'Woolwich Twp', 18),
(247, 'Bayonne City', 8),
(248, 'East Newark Boro', 8),
(249, 'Guttenberg Town', 8),
(250, 'Harrison Town', 8),
(251, 'Hoboken City', 8),
(252, 'Jersey City', 8),
(253, 'Kearny Town', 8),
(254, 'North Bergen Twp', 8),
(255, 'Secaucus Town', 8),
(256, 'Union City', 8),
(257, 'Weehawken Twp', 8),
(258, 'West New York Town', 8),
(259, 'Alexandria Twp', 9),
(260, 'Bethlehem Twp', 9),
(261, 'Bloomsbury Boro', 9),
(262, 'Califon Boro', 9),
(263, 'Clinton Town', 9),
(264, 'Clinton Twp', 9),
(265, 'Delaware Twp', 9),
(266, 'East Amwell Twp', 9),
(267, 'Flemington Boro', 9),
(268, 'Franklin Twp', 9),
(269, 'Frenchtown Boro', 9),
(270, 'Glen Gardner Boro', 9),
(271, 'Hampton Boro', 9),
(272, 'High Bridge Boro', 9),
(273, 'Holland Twp', 9),
(274, 'Kingwood Twp', 9),
(275, 'Lambertville City', 9),
(276, 'Lebanon Boro', 9),
(277, 'Lebanon Twp', 9),
(278, 'Milford Boro', 9),
(279, 'Raritan Twp', 9),
(280, 'Readington Twp', 9),
(281, 'Stockton Boro', 9),
(282, 'Tewksbury Twp', 9),
(283, 'Union Twp', 9),
(284, 'West Amwell Twp', 9),
(285, 'East Windsor Twp', 13),
(286, 'Ewing Twp', 13),
(287, 'Hamilton Twp', 13),
(288, 'Hightstown Boro', 13),
(289, 'Hopewell Boro', 13),
(290, 'Hopewell Twp', 13),
(291, 'Lawrence Twp', 13),
(292, 'Pennington Boro', 13),
(293, 'Princeton Boro', 13),
(294, 'Princeton Twp', 13),
(295, 'Robbinsville Twp', 13),
(296, 'Trenton City', 13),
(297, 'West Windsor Twp', 13),
(298, 'Carteret Boro', 11),
(299, 'Cranbury Twp', 11),
(300, 'Dunellen Boro', 11),
(301, 'East Brunswick Twp', 11),
(302, 'Edison Twp', 11),
(303, 'Helmetta Boro', 11),
(304, 'Highland Park Boro', 11),
(305, 'Jamesburg Boro', 11),
(306, 'Old Bridge Twp', 11),
(307, 'Metuchen Boro', 11),
(308, 'Middlesex Boro', 11),
(309, 'Milltown Boro', 11),
(310, 'Monroe Twp', 11),
(311, 'New Brunswick City', 11),
(312, 'North Brunswick Twp', 11),
(313, 'Perth Amboy City', 11),
(314, 'Piscataway Twp', 11),
(315, 'Plainsboro Twp', 11),
(316, 'Sayreville Boro', 11),
(317, 'South Amboy City', 11),
(318, 'South Brunswick Twp', 11),
(319, 'South Plainfield Boro', 11),
(320, 'South River Boro', 11),
(321, 'Spotswood Boro', 11),
(322, 'Woodbridge Twp', 11),
(323, 'Allenhurst Boro', 14),
(324, 'Allentown Boro', 14),
(325, 'Asbury Park City', 14),
(326, 'Atlantic Highlands Boro', 14),
(327, 'Avon-By-The-Sea Boro', 14),
(328, 'Belmar Boro', 14),
(329, 'Bradley Beach Boro', 14),
(330, 'Brielle Boro', 14),
(331, 'Colts Neck Twp', 14),
(332, 'Deal Boro', 14),
(333, 'Eatontown Boro', 14),
(334, 'Englishtown Boro', 14),
(335, 'Fair Haven Boro', 14),
(336, 'Farmingdale Boro', 14),
(337, 'Freehold Boro', 14),
(338, 'Freehold Twp', 14),
(339, 'Highlands Boro', 14),
(340, 'Holmdel Twp', 14),
(341, 'Howell Twp', 14),
(342, 'Interlaken Boro', 14),
(343, 'Keansburg Boro', 14),
(344, 'Keyport Boro', 14),
(345, 'Lake Como (South Belmar Boro)', 14),
(346, 'Little Silver Boro', 14),
(347, 'Loch Arbour Village', 14),
(348, 'Long Branch City', 14),
(349, 'Manalapan Twp', 14),
(350, 'Manasquan Boro', 14),
(351, 'Marlboro Twp', 14),
(352, 'Matawan Boro', 14),
(353, 'Aberdeen Twp', 14),
(354, 'Middletown Twp', 14),
(355, 'Millstone Twp', 14),
(356, 'Monmouth Beach Boro', 14),
(357, 'Neptune Twp', 14),
(358, 'Neptune City Boro', 14),
(359, 'Tinton Falls Boro', 14),
(360, 'Ocean Twp', 14),
(361, 'Oceanport Boro', 14),
(362, 'Hazlet Twp', 14),
(363, 'Red Bank Boro', 14),
(364, 'Roosevelt Boro', 14),
(365, 'Rumson Boro', 14),
(366, 'Sea Bright Boro', 14),
(367, 'Sea Girt Boro', 14),
(368, 'Shrewsbury Boro', 14),
(369, 'Shrewsbury Twp', 14),
(370, 'Spring Lake Boro', 14),
(371, 'Spring Lake Heights Boro', 14),
(372, 'Union Beach Boro', 14),
(373, 'Upper Freehold Twp', 14),
(374, 'Wall Twp', 14),
(375, 'West Long Branch Boro', 14),
(376, 'Boonton Town', 6),
(377, 'Boonton Twp', 6),
(378, 'Butler Boro', 6),
(379, 'Chatham Boro', 6),
(380, 'Chatham Twp', 6),
(381, 'Chester Boro', 6),
(382, 'Chester Twp', 6),
(383, 'Denville Twp', 6),
(384, 'Dover Town', 6),
(385, 'East Hanover Twp', 6),
(386, 'Florham Park Boro', 6),
(387, 'Hanover Twp', 6),
(388, 'Harding Twp', 6),
(389, 'Jefferson Twp', 6),
(390, 'Kinnelon Boro', 6),
(391, 'Lincoln Park Boro', 6),
(392, 'Madison Boro', 6),
(393, 'Mendham Boro', 6),
(394, 'Mendham Twp', 6),
(395, 'Mine Hill Twp', 6),
(396, 'Montville Twp', 6),
(397, 'Morris Twp', 6),
(398, 'Morris Plains Boro', 6),
(399, 'Morristown Town', 6),
(400, 'Mountain Lakes Boro', 6),
(401, 'Mount Arlington Boro', 6),
(402, 'Mount Olive Twp', 6),
(403, 'Netcong Boro', 6),
(404, 'Parsippany-Troy Hills Twp', 6),
(405, 'Long Hill Twp', 6),
(406, 'Pequannock Twp', 6),
(407, 'Randolph Twp', 6),
(408, 'Riverdale Boro', 6),
(409, 'Rockaway Boro', 6),
(410, 'Rockaway Twp', 6),
(411, 'Roxbury Twp', 6),
(412, 'Victory Gardens Boro', 6),
(413, 'Washington Twp', 6),
(414, 'Wharton Boro', 6),
(415, 'Barnegat Light Boro', 15),
(416, 'Bay Head Boro', 15),
(417, 'Beach Haven Boro', 15),
(418, 'Beachwood Boro', 15),
(419, 'Berkeley Twp', 15),
(420, 'Brick Twp', 15),
(421, 'Eagleswood Twp', 15),
(422, 'Harvey Cedars Boro', 15),
(423, 'Island Heights Boro', 15),
(424, 'Jackson Twp', 15),
(425, 'Lacey Twp', 15),
(426, 'Lakehurst Boro', 15),
(427, 'Lakewood Twp', 15),
(428, 'Lavallette Boro', 15),
(429, 'Little Egg Harbor Twp', 15),
(430, 'Long Beach Twp', 15),
(431, 'Manchester Twp', 15),
(432, 'Mantaloking Boro', 15),
(433, 'Ocean Twp', 15),
(434, 'Ocean Gate Boro', 15),
(435, 'Pine Beach Boro', 15),
(436, 'Plumsted Twp', 15),
(437, 'Point Pleasant Boro', 15),
(438, 'Point Pleasant Beach Boro', 15),
(439, 'Seaside Heights Boro', 15),
(440, 'Seaside Park Boro', 15),
(441, 'Ship Bottom Boro', 15),
(442, 'South Toms River Boro', 15),
(443, 'Stafford Twp', 15),
(444, 'Surf City Boro', 15),
(445, 'Toms River Twp', 15),
(446, 'Tuckerton Boro', 15),
(447, 'Barnegat Twp', 15),
(448, 'Bloomingdale Boro', 3),
(449, 'Clifton City', 3),
(450, 'Haledon Boro', 3),
(451, 'Hawthorne Boro', 3),
(452, 'Little Falls Twp', 3),
(453, 'North Haledon Boro', 3),
(454, 'Passaic City', 3),
(455, 'Paterson City', 3),
(456, 'Pompton Lakes Boro', 3),
(457, 'Prospect Park Boro', 3),
(458, 'Ringwood Boro', 3),
(459, 'Totowa Boro', 3),
(460, 'Wanaque Boro', 3),
(461, 'Wayne Twp', 3),
(462, 'West Milford Twp', 3),
(463, 'Woodland Park Boro', 3),
(464, 'Alloway Twp', 19),
(465, 'Elmer Boro', 19),
(466, 'Elsinboro Twp', 19),
(467, 'Lower Alloways Creek Twp', 19),
(468, 'Mannington Twp', 19),
(469, 'Oldmans Twp', 19),
(470, 'Penns Grove Boro', 19),
(471, 'Pennsville Twp', 19),
(472, 'Pilesgrove Twp', 19),
(473, 'Pittsgrove Twp', 19),
(474, 'Quinton Twp', 19),
(475, 'Salem City', 19),
(476, 'Carneys Point Twp', 19),
(477, 'Upper Pittsgrove Twp', 19),
(478, 'Woodstown Boro', 19),
(479, 'Bedminster Twp', 10),
(480, 'Bernards Twp', 10),
(481, 'Bernardsville Boro', 10),
(482, 'Bound Brook Boro', 10),
(483, 'Branchburg Twp', 10),
(484, 'Bridgewater Twp', 10),
(485, 'Far Hills Boro', 10),
(486, 'Franklin Twp', 10),
(487, 'Green Brook Twp', 10),
(488, 'Hillsborough Twp', 10),
(489, 'Manville Boro', 10),
(490, 'Millstone Boro', 10),
(491, 'Montgomery Twp', 10),
(492, 'North Plainfield Boro', 10),
(493, 'Peapack Gladstone Boro', 10),
(494, 'Raritan Boro', 10),
(495, 'Rocky Hill Boro', 10),
(496, 'Somerville Boro', 10),
(497, 'South Bound Brook Boro', 10),
(498, 'Warren Twp', 10),
(499, 'Watchung Boro', 10),
(500, 'Andover Boro', 2),
(501, 'Andover Twp', 2),
(502, 'Branchville Boro', 2),
(503, 'Byram Twp', 2),
(504, 'Frankford Twp', 2),
(505, 'Franklin Boro', 2),
(506, 'Fredon Twp', 2),
(507, 'Green Twp', 2),
(508, 'Hamburg Boro', 2),
(509, 'Hampton Twp', 2),
(510, 'Hardyston Twp', 2),
(511, 'Hopatcong Boro', 2),
(512, 'Lafayette Twp', 2),
(513, 'Montague Twp', 2),
(514, 'Newton Town', 2),
(515, 'Ogdensburg Boro', 2),
(516, 'Sandyston Twp', 2),
(517, 'Sparta Twp', 2),
(518, 'Stanhope Boro', 2),
(519, 'Stillwater Twp', 2),
(520, 'Sussex Boro', 2),
(521, 'Vernon Twp', 2),
(522, 'Walpack Twp', 2),
(523, 'Wantage Twp', 2),
(524, 'Berkeley Heights Twp', 12),
(525, 'Clark Twp', 12),
(526, 'Cranford Twp', 12),
(527, 'Elizabeth City', 12),
(528, 'Fanwood Boro', 12),
(529, 'Garwood Boro', 12),
(530, 'Hillside Twp', 12),
(531, 'Kenilworth Boro', 12),
(532, 'Linden City', 12),
(533, 'Mountainside Boro', 12),
(534, 'New Providence Boro', 12),
(535, 'Plainfield City', 12),
(536, 'Rahway City', 12),
(537, 'Roselle Boro', 12),
(538, 'Roselle Park Boro', 12),
(539, 'Scotch Plains Twp', 12),
(540, 'Springfield Twp', 12),
(541, 'Summit City', 12),
(542, 'Union Twp', 12),
(543, 'Westfield Twp', 12),
(544, 'Winfield Twp', 12),
(545, 'Allamuchy Twp', 5),
(546, 'Alpha Boro', 5),
(547, 'Belvidere Twp', 5),
(548, 'Blairstown Twp', 5),
(549, 'Franklin Twp', 5),
(550, 'Frelinghuysen Twp', 5),
(551, 'Greenwich Twp', 5),
(552, 'Hackettstown Town', 5),
(553, 'Hardwick Twp', 5),
(554, 'Harmony Twp', 5),
(555, 'Hope Twp', 5),
(556, 'Independence Twp', 5),
(557, 'Knowlton Twp', 5),
(558, 'Liberty Twp', 5),
(559, 'Lopatcong Twp', 5),
(560, 'Mansfield Twp', 5),
(561, 'Oxford Twp', 5),
(562, 'Phillipsburg Town', 5),
(563, 'Pohatcong Twp', 5),
(564, 'Washington Boro', 5),
(565, 'Washington Twp', 5),
(566, 'White Twp', 5);

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
CREATE TABLE IF NOT EXISTS `prices` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `procedureID` int(11) NOT NULL,
  `facilityID` int(11) NOT NULL,
  `insuranceID` int(11) NOT NULL,
  `sourceID` int(11) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `comments` longtext NOT NULL,
  `entryDate` date NOT NULL,
  `IP` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=254 ;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`ID`, `procedureID`, `facilityID`, `insuranceID`, `sourceID`, `cost`, `comments`, `entryDate`, `IP`) VALUES
(184, 1, 75, 1, 1, 190.00, '', '2013-01-27', '130.68.138.233'),
(185, 1, 76, 1, 1, 85.00, '', '2013-01-27', '130.68.138.233'),
(186, 1, 77, 1, 1, 100.00, '', '2013-01-27', '130.68.138.233'),
(187, 1, 78, 1, 1, 150.00, '', '2013-01-27', '130.68.138.233'),
(188, 1, 79, 1, 1, 156.00, '', '2013-01-27', '130.68.138.233'),
(189, 1, 80, 1, 1, 156.00, '', '2013-01-27', '130.68.138.233'),
(190, 1, 81, 1, 1, 195.00, '', '2013-01-27', '130.68.138.233'),
(191, 1, 82, 1, 1, 200.00, '', '2013-01-27', '130.68.138.233'),
(192, 1, 83, 1, 1, 207.00, '', '2013-01-27', '130.68.138.233'),
(193, 1, 84, 1, 1, 219.00, '', '2013-01-27', '130.68.138.233'),
(194, 1, 85, 1, 1, 225.00, '', '2013-01-27', '130.68.138.233'),
(195, 1, 86, 1, 1, 250.00, '', '2013-01-27', '130.68.138.233'),
(196, 1, 87, 1, 1, 260.00, '', '2013-01-27', '130.68.138.233'),
(197, 1, 88, 1, 1, 290.00, '', '2013-01-27', '130.68.138.233'),
(198, 1, 89, 1, 1, 350.00, '', '2013-01-27', '130.68.138.233'),
(199, 1, 79, 1, 1, 186.00, '', '2013-01-27', '130.68.138.233'),
(200, 1, 79, 1, 1, 156.00, '', '2013-01-27', '130.68.138.233'),
(201, 1, 80, 1, 1, 156.00, '', '2013-01-27', '130.68.138.233'),
(202, 1, 90, 1, 1, 190.00, '', '2013-01-27', '130.68.138.233'),
(203, 1, 91, 1, 1, 190.00, '', '2013-01-27', '130.68.138.233'),
(204, 1, 92, 1, 1, 190.00, '', '2013-01-27', '130.68.138.233'),
(205, 1, 93, 1, 1, 190.00, '', '2013-01-27', '130.68.138.233'),
(206, 7, 75, 1, 1, 745.00, '', '2013-01-27', '130.68.138.233'),
(207, 7, 94, 1, 1, 745.00, '', '2013-01-27', '130.68.138.233'),
(208, 7, 91, 1, 1, 745.00, '', '2013-01-27', '130.68.138.233'),
(209, 6, 75, 1, 1, 475.00, '', '2013-01-27', '130.68.138.233'),
(210, 6, 94, 1, 1, 475.00, '', '2013-01-27', '130.68.138.233'),
(211, 6, 91, 1, 1, 475.00, '', '2013-01-27', '130.68.138.233'),
(212, 5, 95, 1, 1, 1260.00, '', '2013-01-27', '130.68.138.233'),
(213, 4, 95, 1, 1, 840.00, '', '2013-01-27', '130.68.138.233'),
(214, 5, 75, 1, 1, 735.00, '', '2013-01-27', '130.68.138.233'),
(215, 5, 94, 1, 1, 735.00, '', '2013-01-27', '130.68.138.233'),
(216, 5, 91, 1, 1, 735.00, '', '2013-01-27', '130.68.138.233'),
(217, 4, 75, 1, 1, 470.00, '', '2013-01-27', '130.68.138.233'),
(218, 4, 94, 1, 1, 470.00, '', '2013-01-27', '130.68.138.233'),
(219, 4, 91, 1, 1, 470.00, '', '2013-01-27', '130.68.138.233'),
(220, 7, 95, 1, 1, 1260.00, '', '2013-01-27', '130.68.138.233'),
(221, 6, 95, 1, 1, 840.00, '', '2013-01-27', '130.68.138.233'),
(222, 7, 96, 1, 1, 550.00, '', '2013-01-27', '130.68.138.233'),
(223, 6, 96, 1, 1, 475.00, '', '2013-01-27', '130.68.138.233'),
(224, 6, 79, 1, 1, 471.00, '', '2013-01-27', '130.68.138.233'),
(225, 6, 80, 1, 1, 471.00, '', '2013-01-27', '130.68.138.233'),
(226, 7, 79, 1, 1, 737.00, '', '2013-01-27', '130.68.138.233'),
(227, 7, 80, 1, 1, 737.00, '', '2013-01-27', '130.68.138.233'),
(228, 4, 79, 1, 1, 465.00, '', '2013-01-27', '130.68.138.233'),
(229, 4, 80, 1, 1, 465.00, '', '2013-01-27', '130.68.138.233'),
(230, 5, 79, 1, 1, 727.00, '', '2013-01-27', '130.68.138.233'),
(231, 5, 80, 1, 1, 727.00, '', '2013-01-27', '130.68.138.233'),
(232, 3, 95, 1, 1, 220.00, '', '2013-01-27', '130.68.138.233'),
(233, 3, 97, 1, 1, 195.00, 'If one asks for a discount can get both ultrasounds for $250.', '2013-01-27', '130.68.138.233'),
(234, 3, 75, 1, 1, 155.00, '', '2013-01-27', '130.68.138.233'),
(235, 3, 94, 1, 1, 155.00, '', '2013-01-27', '130.68.138.233'),
(236, 3, 91, 1, 1, 155.00, '', '2013-01-27', '130.68.138.233'),
(237, 3, 96, 1, 1, 250.00, '', '2013-01-27', '130.68.138.233'),
(238, 2, 96, 1, 1, 250.00, '', '2013-01-27', '130.68.138.233'),
(239, 2, 95, 1, 1, 250.00, '', '2013-01-27', '130.68.138.233'),
(240, 2, 97, 1, 1, 175.00, 'If one asks for a discount can get both ultrasounds for $250.', '2013-01-27', '130.68.138.233'),
(241, 2, 75, 1, 1, 145.00, '', '2013-01-27', '130.68.138.233'),
(242, 2, 94, 1, 1, 145.00, '', '2013-01-27', '130.68.138.233'),
(243, 2, 91, 1, 1, 145.00, '', '2013-01-27', '130.68.138.233'),
(244, 2, 79, 1, 1, 151.00, '', '2013-01-27', '130.68.138.233'),
(245, 2, 80, 1, 1, 151.00, '', '2013-01-27', '130.68.138.233'),
(246, 2, 79, 1, 1, 139.00, '', '2013-01-27', '130.68.138.233'),
(247, 2, 80, 1, 1, 139.00, '', '2013-01-27', '130.68.138.233'),
(248, 1, 96, 1, 1, 175.00, '', '2013-01-27', '130.68.138.233'),
(249, 1, 98, 1, 1, 300.00, 'From web story', '2013-01-27', '130.68.138.233'),
(250, 1, 99, 1, 1, 0.00, 'Web site', '2013-01-27', '130.68.138.233'),
(251, 1, 100, 1, 1, 0.00, 'means tested', '2013-01-27', '130.68.138.233'),
(252, 1, 101, 1, 1, 0.00, 'means tested', '2013-01-27', '130.68.138.233');

-- --------------------------------------------------------

--
-- Table structure for table `procedures`
--

DROP TABLE IF EXISTS `procedures`;
CREATE TABLE IF NOT EXISTS `procedures` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `procedures`
--

INSERT INTO `procedures` (`ID`, `name`) VALUES
(1, 'Mammogram'),
(2, 'Ultrasound: Abdominal'),
(3, 'Ultrasound: Pelvic'),
(4, 'MRI: Lower Back without contrast'),
(5, 'MRI: Lower Back with and without contrast'),
(6, 'MRI: Upper Back without contrast'),
(7, 'MRI: Upper Back with and without contrast');

-- --------------------------------------------------------

--
-- Table structure for table `sources`
--

DROP TABLE IF EXISTS `sources`;
CREATE TABLE IF NOT EXISTS `sources` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sources`
--

INSERT INTO `sources` (`ID`, `name`) VALUES
(1, 'us'),
(2, 'crowdsource form'),
(3, 'nj insurance lawsuit');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;