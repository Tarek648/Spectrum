-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 05, 2025 at 01:21 AM
-- Server version: 10.5.25-MariaDB-cll-lve
-- PHP Version: 8.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spectrum_spectrum`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_cards`
--

CREATE TABLE `about_cards` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `sort_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about_cards`
--

INSERT INTO `about_cards` (`id`, `title`, `description`, `sort_order`) VALUES
(1, 'Technical Solutions', 'We offer expert technical services tailored to the pharmaceutical industry, ensuring efficiency, compliance, and innovation in every solution.', 1),
(2, 'Management Expertise', 'Our team delivers comprehensive management strategies to streamline pharmaceutical projects, from planning through execution.', 2),
(3, 'Diverse Sector Experience', 'We have successfully completed projects across primary production, secondary manufacturing, and pharmaceutical laboratories.', 3);

-- --------------------------------------------------------

--
-- Table structure for table `about_section`
--

CREATE TABLE `about_section` (
  `id` int(10) UNSIGNED NOT NULL,
  `subheading` varchar(255) DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `intro_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about_section`
--

INSERT INTO `about_section` (`id`, `subheading`, `heading`, `description`, `intro_text`) VALUES
(1, 'About Us', 'Reliable and Excellence Company', '\"Founded in 1974, Spectrum is an international consultancy dedicated to enhancing quality of life and the environment through innovative engineering and architectural solutions. With expertise across diverse sectors—including education, tourism, transportation, healthcare, and urban planning—we deliver sustainable designs and specialist services that meet the evolving needs of clients worldwide, with a strong presence in the Middle East', 'Excellence in');

-- --------------------------------------------------------

--
-- Table structure for table `background_company_structure`
--

CREATE TABLE `background_company_structure` (
  `id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `background_company_structure`
--

INSERT INTO `background_company_structure` (`id`, `image_path`) VALUES
(9, 'bg_1756288840.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cadd_columns`
--

CREATE TABLE `cadd_columns` (
  `id` int(11) NOT NULL,
  `cadd_section_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cadd_columns`
--

INSERT INTO `cadd_columns` (`id`, `cadd_section_id`, `text`) VALUES
(3, 1, 'Specialized Design Software'),
(4, 1, 'AutoCAD Professional Suite'),
(5, 1, 'AutoCAD Professional'),
(6, 1, 'Advanced Modeling & Visualization');

-- --------------------------------------------------------

--
-- Table structure for table `cadd_section`
--

CREATE TABLE `cadd_section` (
  `id` int(11) NOT NULL,
  `header` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cadd_section`
--

INSERT INTO `cadd_section` (`id`, `header`, `description`, `image`) VALUES
(1, 'CADD Capabilities', 'Spectrum utilizes AutoCAD Release 2005/2007/2010 with Softdesk civil engineering; architectural, structural road and transportation design, electrical and mechanical software on an extensive network of IBM compatible computer workstations, printers and plotters that allow professional and technical staff to develop designs to meet all project and client requirements.', '1758656033_remy-KzvvPlAnZF4-unsplash.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(23, 'buildings and housing'),
(24, 'Urban planning and infrastructure'),
(25, 'Educational'),
(26, 'touristic');

-- --------------------------------------------------------

--
-- Table structure for table `company_structure`
--

CREATE TABLE `company_structure` (
  `id` int(11) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `background_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company_structure`
--

INSERT INTO `company_structure` (`id`, `heading`, `description`, `background_image`) VALUES
(1, 'Company Structure', 'Our company is organized for efficient project delivery. Clear roles and teamwork help us complete projects on time and with quality results.', '1758652824_mikita-yo-yHg6p8vW_Is-unsplash.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contact_info`
--

CREATE TABLE `contact_info` (
  `id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_info`
--

INSERT INTO `contact_info` (`id`, `address`, `image_path`) VALUES
(1, '1st Floor, Burj Chehab Building, Tallet El Khayat, P.O. Box: 114/5029, Beirut, Lebanon.', '1758692557_building-construction-.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `is_read`) VALUES
(1, 'iman', 'imann.soleiman@gmail.com', 'kdkdkd', 'dkdkd ddj', '2025-09-10 09:05:38', 1),
(2, 'iman', 'imann.soleiman@gmail.com', 'djdn', 'smdn', '2025-09-10 09:05:58', 1),
(3, 'jkjhhfh', 'djdjd@gmail.com', 'djdjd', 'ddjjd', '2025-09-10 09:08:34', 1),
(4, 'iman', 'imann.soleiman@gmail.com', 'fjkfkj', 'kdfjlksjdflks', '2025-09-10 09:10:53', 1),
(5, 'iman', 'imann.soleiman@gmail.com', 'kdkdkd', 'kjhkjh', '2025-09-10 09:11:16', 1),
(6, 'iman', 'imann.soleiman@gmail.com', 'dfa', 'fdfdf', '2025-09-10 09:13:07', 1),
(7, 'iman', 'imann.soleiman@gmail.com', 'djdn', 'jsnddjdd', '2025-09-10 09:14:46', 1),
(8, 'ssmms', 'djdjd@gmail.com', 'kdkdkd', 'ddkdkkd', '2025-09-10 09:15:30', 1),
(9, 'kfllfkj', 'imann.soleiman@gmail.com', ',dnfjdk', 'dndn', '2025-09-10 09:16:50', 1),
(10, 'kjhkjh', 'kjlk@gmail.com', 'kljlkj', 'kljlkjlk', '2025-09-10 09:17:28', 1),
(11, 'jljdf', 'dkfsdlk@gmail.com', 'fkfldjkf', 'dfskdjflksjdf', '2025-09-10 09:18:30', 1),
(12, 'dfkjdlk', 'kldfjkl@gmail.com', 'msms', 'smsmmsms', '2025-09-10 09:20:14', 1),
(13, 'Iman Soleiman', 'imann.soleiman@gmail.com', 'fjhvik', 'jfv', '2025-09-15 08:56:14', 1),
(14, 'fdjkd', 'fkjdkf@gmail.com', 'fddf', 'dfsd', '2025-09-15 20:22:31', 1),
(15, 'dsflskjd', 'sfdjksdf@gmail.com', 'fdasd', 'fsdfs', '2025-09-15 21:02:10', 1),
(16, 'fdkjlsjd', 'dfsjlj@gmail.com', 'dfsf', 'dfasa', '2025-09-15 21:02:50', 1),
(17, 'dlkfjlskj', 'fksjdflksj@gmail.com', 'sdfjkslkfj', 'dfksfdkjslkfj', '2025-09-15 21:26:03', 1),
(18, 'ksfjklsdjf', 'fdksljklj@gmail.com', 'sjsks', 'ssksks', '2025-09-15 21:27:03', 1),
(19, 'kjkjfld', 'dskljalkj@gmail.com', 'dfkjslkfdj', 'sdfksljkfdlj', '2025-09-16 04:51:54', 1),
(20, 'kjklj', 'kjlkj@gmail.com', 'kljlk', 'jhkhkj', '2025-09-16 05:19:34', 1),
(21, 'fkskldjsljkfd', 'dfkjsljkdlkjslk@gmail.com', 'dfksdklfjslkfjd', 'dfkjsdlkjfslkjfdklsjfdlksjlkdjs', '2025-09-16 09:17:37', 1),
(22, 'dskjflksdj', 'sdfkljsdkjlf@gmail.com', 'dkljflksjfd', 'sdkfjslkjf', '2025-09-16 20:43:48', 1),
(23, 'kldslkfjlskdjf', 'sdhfskjdh@gmail.com', 'djdjjdj', 'kjhkhkjh', '2025-09-17 10:11:29', 1),
(24, 'krrr', 'rlkrljlkj@gmail.com', 'rlrklrjlkr', 'elejlekjlej', '2025-09-17 11:08:44', 1),
(25, 'jjk', 'kjh@gmail.com', 'jkhjkh', 'iukugjhhj', '2025-09-17 11:18:16', 1),
(26, 'hkkjhk', 'njkjkkjk@gmai.com', 'ifuhfuiuf', 'wjkehwkh', '2025-09-17 11:19:23', 1),
(27, 'kjhjk', 'djkdk@gamil.com', 'wjkee', 'ejkeeej', '2025-09-17 11:21:53', 1),
(28, 'jdhfihdi', 'dshfjkd@gmail.com', 'sdjkaskjf', 'skldjfkj', '2025-09-18 14:51:34', 1),
(29, 'khkjhk', 'khkh@gmail.com', 'fjhvik', 'jhhkjhkj', '2025-09-18 18:43:35', 1),
(30, 'kjkjh', 'kjkh@gmail.comb', 'jhkk', 'bjkjhk', '2025-09-24 06:06:20', 1),
(31, 'ggiii', 'hkjhjkk@gmail.com', 'jggh', 'jhhjhhh', '2025-09-24 10:41:32', 1),
(32, 'Hdjd', 'nsjs@gmail.com', 'Hddj', 'Ndjs', '2025-10-09 19:27:34', 0),
(33, '', '', '', '', '2025-10-22 20:15:09', 0),
(34, '', '', '', '', '2025-10-23 02:04:27', 0),
(35, 'Ramy Madi', 'ramymadi.rm@gmail.com', 'Proof of work', 'Dear Sir/Madam,\r\n\r\nI am writing this email on the behalf of my uncle and your former employee Malik Hassan Madi as he is unfortunately suffering from a mental illness. I would like to ask of you to send me a digital version of a certificate proving he worked for you between the years of 2012 and 2014 so he will be able to apply for the Lebanese Engineers Syndicate pension as he has recently reached the age of 64. I am very thankful for your help.\r\n\r\nKind regards,\r\n\r\nRamy Madi', '2025-10-27 17:36:00', 0),
(36, '', '', '', '', '2025-11-03 10:18:53', 0),
(37, 'Paul Timothy', 'paul.timothy@sourcingforaustralia.org', 'K vdrqii', 'Hi Spectrumlb Com,\r\n\r\n\r\nWe visited your website and are interested in your products.\r\nCould you please send us your latest  price list?\r\n\r\nLooking forward to your prompt response.\r\n\r\nThanks and best regards\r\nPaul Timothy\r\n\r\nBusiness development/ General Counselor\r\nhttps://www.sourcingforaustralia.com\r\n', '2025-11-03 12:31:54', 0),
(38, '', '', '', '', '2025-11-03 19:28:09', 0),
(39, '', '', '', '', '2025-11-04 21:29:12', 0),
(40, '', '', '', '', '2025-11-05 06:32:23', 0);

-- --------------------------------------------------------

--
-- Table structure for table `corporate_fifth_cards`
--

CREATE TABLE `corporate_fifth_cards` (
  `id` int(11) NOT NULL,
  `card_title` varchar(255) DEFAULT NULL,
  `card_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `corporate_fifth_cards`
--

INSERT INTO `corporate_fifth_cards` (`id`, `card_title`, `card_text`) VALUES
(1, 'Sustainable Design', 'Incorporating eco-friendly solutions in all engineering projects'),
(2, 'Resource Conservation', 'Optimizing water and energy usage in infrastructure projects'),
(3, 'Green Technology', 'Implementing renewable energy and sustainable materials'),
(4, 'Environmental Compliance', 'Adhering to international environmental standards and regulations');

-- --------------------------------------------------------

--
-- Table structure for table `corporate_fifth_section`
--

CREATE TABLE `corporate_fifth_section` (
  `id` int(11) NOT NULL,
  `section_title` varchar(255) DEFAULT NULL,
  `section_paragraph` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `corporate_fifth_section`
--

INSERT INTO `corporate_fifth_section` (`id`, `section_title`, `section_paragraph`) VALUES
(1, 'Environmental Responsibility', 'Spectrum has a strong belief in protecting the environment through implementing its green initiative yet improving business performance');

-- --------------------------------------------------------

--
-- Table structure for table `corporate_first_section`
--

CREATE TABLE `corporate_first_section` (
  `id` int(11) NOT NULL,
  `section_header` text DEFAULT NULL,
  `paragraph1` text DEFAULT NULL,
  `paragraph2` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `card1_title` varchar(100) DEFAULT NULL,
  `card1_text` text DEFAULT NULL,
  `card2_title` varchar(100) DEFAULT NULL,
  `card2_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `corporate_first_section`
--

INSERT INTO `corporate_first_section` (`id`, `section_header`, `paragraph1`, `paragraph2`, `image_path`, `card1_title`, `card1_text`, `card2_title`, `card2_text`) VALUES
(1, 'Our Responsibility Towards Our Clients', 'Our expertise in design, infrastructure, and management enables us to give consultations to our clients in reducing costs, improving quality of work for better project execution.', 'Our job is to respond to our client\'s need in leading the built environment and communities. We also advise our clients to an efficient property based on their needs. In addition to that we work alongside with the governments to overcome all infrastructure challenges.', '../../assets/corporate/1757493400_building-construction-.jpg', 'Cost Reduction', 'Expert consultations to optimize project costs while maintaining quality standards', 'Quality Improvement', 'Enhanced work quality for superior project execution and outcomes');

-- --------------------------------------------------------

--
-- Table structure for table `corporate_fourth_cards`
--

CREATE TABLE `corporate_fourth_cards` (
  `id` int(11) NOT NULL,
  `icon_class` varchar(100) DEFAULT NULL,
  `card_title` varchar(255) DEFAULT NULL,
  `card_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `corporate_fourth_cards`
--

INSERT INTO `corporate_fourth_cards` (`id`, `icon_class`, `card_title`, `card_text`) VALUES
(2, 'fa-solid fa-handshake', 'Lasting Partnership', 'Building long-term relationships based on trust and consistent delivery'),
(3, 'fa-solid fa-user', 'Local Investment', 'Supporting local economy through local suppliers and consultants'),
(7, 'fa-solid fa-star', 'Client-Centric Advisory', 'We help our clients make the best use of their properties and work with governments to solve infrastructure challenges.');

-- --------------------------------------------------------

--
-- Table structure for table `corporate_fourth_section`
--

CREATE TABLE `corporate_fourth_section` (
  `id` int(11) NOT NULL,
  `section_title` varchar(255) DEFAULT NULL,
  `section_paragraph` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `corporate_fourth_section`
--

INSERT INTO `corporate_fourth_section` (`id`, `section_title`, `section_paragraph`) VALUES
(1, 'Customer Satisfaction Focus', 'Our clients and their customers are the only guarantee for our sustainability. Hence our main focus is to attain our customer’s satisfaction by achieving the projects managed and out sourced as planned by sticking to the deadlines and delivering the best quality anticipated. We also follow a procedure to endure the good reputation of our clients for a sustainable relationship and lasting partnership. In addition to that we invest in our local economy by using local suppliers and other consultants to provide the best service.');

-- --------------------------------------------------------

--
-- Table structure for table `corporate_second_section`
--

CREATE TABLE `corporate_second_section` (
  `id` int(11) NOT NULL,
  `section_title` varchar(255) DEFAULT NULL,
  `section_subtitle` varchar(255) DEFAULT NULL,
  `section_paragraph` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `corporate_second_section`
--

INSERT INTO `corporate_second_section` (`id`, `section_title`, `section_subtitle`, `section_paragraph`) VALUES
(1, 'Social responsibility', 'Coming from the community to the community!', 'Our major concern is to invest in our community and support it in all aspects. We urge our partners to build projects that can collaborate in its development and increase the bonding among our societies for a better world.');

-- --------------------------------------------------------

--
-- Table structure for table `corporate_third_section`
--

CREATE TABLE `corporate_third_section` (
  `id` int(11) NOT NULL,
  `header_title` varchar(255) DEFAULT NULL,
  `paragraph1` text DEFAULT NULL,
  `paragraph2` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `card1_title` varchar(100) DEFAULT NULL,
  `card1_text` text DEFAULT NULL,
  `card2_title` varchar(100) DEFAULT NULL,
  `card2_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `corporate_third_section`
--

INSERT INTO `corporate_third_section` (`id`, `header_title`, `paragraph1`, `paragraph2`, `image_path`, `card1_title`, `card1_text`, `card2_title`, `card2_text`) VALUES
(1, 'Our Social Responsibility Towards Our People', 'Investing in our human resources body and committing towards them via gaining employee engagement and maintaining a happy workforce for recognized achievements. We develop our employees skills through enhancing their professional skills on all aspects to empower them to take the right decisions for our clients.', 'Because we believe that our client\'s success is in our success we always look for the right people in the right job for innovative solutions that is an added value for the end user that will enhance our position in the global market.', '../../assets/corporate1757493659_mechanical.png', 'Employee Engagement', 'Maintaining a happy workforce with recognized achievements', 'Skill Development', 'Improving employee skills in all areas to support their growth.');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `people_count` int(11) DEFAULT NULL,
  `category` varchar(20) NOT NULL DEFAULT 'person'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `location_id`, `name`, `people_count`, `category`) VALUES
(89, 10, 'Quantity Surveying', 1, 'Engineer'),
(90, 10, 'Architectural', 4, 'engineer'),
(91, 10, 'Structural', 2, 'Engineer'),
(92, 10, 'Transport', 3, 'Engineer'),
(95, 12, 'accounting', 2, 'person'),
(96, 12, 'adminstration', 2, 'person'),
(97, 12, 'architectural', 3, 'engineer'),
(98, 12, 'electrical', 1, 'engineer'),
(99, 12, 'mech and infrastructure', 1, 'engineer'),
(100, 12, 'planning', 1, 'engineer'),
(101, 12, 'quantity surveying', 1, 'engineer'),
(102, 12, 'structural', 1, 'engineer'),
(103, 12, 'supervision', 8, 'engineer'),
(104, 13, 'accounting', 2, 'person'),
(105, 13, 'Adminstration', 2, 'accountant'),
(106, 13, 'architectural', 4, 'engineer'),
(107, 13, 'electrical', 1, 'engineer'),
(108, 13, 'mech and infrastructure', 2, 'engineer'),
(109, 13, 'planning', 1, 'engineer'),
(110, 13, 'quantity surveying', 1, 'engineer'),
(111, 13, 'structural', 1, 'engineer'),
(112, 13, 'supervision', 6, 'engineer'),
(113, 13, 'transport', 2, 'engineer'),
(117, 15, 'Architectural', 3, 'accountant'),
(118, 15, 'Quantity Surveying', 1, 'Engineer'),
(119, 15, 'Structural', 2, 'Engineer'),
(120, 15, 'Adminstration', 2, 'Person'),
(121, 14, 'Architectural', 1, 'Person'),
(122, 14, 'Transport', 1, 'Person'),
(123, 9, 'Accounting', 6, 'Person'),
(124, 9, 'Adminstration', 8, 'Person'),
(125, 9, 'Architectural', 30, 'Engineer'),
(126, 9, 'Electrical', 4, 'Engineer'),
(127, 9, 'Feasibility Studies', 2, 'Person'),
(128, 9, 'marine', 2, 'Engineer'),
(129, 9, 'Mech &Infrastructure', 6, 'Engineer'),
(130, 9, 'Planning', 5, 'Engineer'),
(131, 9, 'project management', 6, 'Person'),
(132, 9, 'Quality control', 3, 'Person'),
(133, 9, 'Quantity Surveying', 4, 'Person'),
(134, 9, 'rehab & conservation', 6, 'Engineer'),
(135, 9, 'Structural', 10, 'Engineer'),
(136, 9, 'Supervision', 28, 'Engineer'),
(137, 9, 'Topography Surveying', 4, 'Person'),
(138, 9, 'Transport', 5, 'Engineer'),
(139, 10, 'Accounting', 2, 'Person'),
(141, 10, 'Adminstration', 2, 'Person'),
(142, 10, 'Electrical', 2, 'Engineer'),
(143, 10, 'Mech &Infrastructure', 2, 'Engineer'),
(144, 10, 'Planning', 2, 'Engineer'),
(145, 10, 'Supervision', 8, 'Engineer'),
(146, 12, 'Transport', 2, 'Engineer'),
(147, 14, 'Accounting', 1, 'Person'),
(148, 14, 'Adminstration', 1, 'Person'),
(149, 14, 'Electrical', 1, 'Engineer'),
(150, 14, 'Mech &Infrastructure', 1, 'Engineer'),
(151, 14, 'Quantity Surveying', 1, 'Engineer'),
(152, 14, 'Structural', 1, 'Engineer'),
(153, 14, 'Supervision', 4, 'Engineer'),
(154, 15, 'Accounting', 1, 'Person'),
(155, 15, 'Electrical', 2, 'Engineer'),
(156, 15, 'Mech &Infrastructure', 2, 'Engineer'),
(157, 15, 'Supervision', 5, 'Engineer'),
(158, 15, 'Transport', 1, 'Engineer'),
(159, 18, 'Accounting', 1, 'Person'),
(160, 18, 'Adminstration', 4, 'Person'),
(161, 18, 'Architectural', 2, 'Engineer'),
(162, 18, 'Electrical', 1, 'Engineer'),
(163, 18, 'Mech &Infrastructure', 1, 'Engineer'),
(164, 18, 'Planning', 1, 'Engineer'),
(165, 18, 'Quantity Surveying', 1, 'Engineer'),
(166, 18, 'Structural', 2, 'Engineer'),
(167, 18, 'Supervision', 12, 'Engineer'),
(168, 18, 'Transport', 5, 'Engineer'),
(169, 19, 'Accounting', 1, 'Person'),
(170, 19, 'Adminstration', 1, 'Person'),
(171, 19, 'Architectural', 1, 'Engineer'),
(172, 19, 'Electrical', 1, 'Engineer'),
(173, 19, 'Mech &Infrastructure', 1, 'Engineer'),
(174, 19, 'Quantity Surveying', 1, 'Engineer'),
(175, 19, 'Structural', 1, 'Engineer'),
(176, 19, 'supervision', 4, 'Engineer'),
(177, 19, 'Transport', 2, 'Engineer'),
(178, 9, 'jkhkh', 4, 'accountant');

-- --------------------------------------------------------

--
-- Table structure for table `department_categories`
--

CREATE TABLE `department_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department_categories`
--

INSERT INTO `department_categories` (`id`, `name`) VALUES
(3, 'accountant'),
(1, 'Engineer'),
(2, 'Person');

-- --------------------------------------------------------

--
-- Table structure for table `division_cards`
--

CREATE TABLE `division_cards` (
  `id` int(11) NOT NULL,
  `title_front` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `header_back` varchar(255) DEFAULT NULL,
  `description_back` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `division_cards`
--

INSERT INTO `division_cards` (`id`, `title_front`, `image_path`, `header_back`, `description_back`) VALUES
(3, 'Infrastructure', '1757881934_India-infrastructure.featured.600x400.jpg', 'infrastructure', 'Sustainable urban and transportation systems'),
(4, 'Management', '1757882119_standard-quality-control-collage-concept-1-1199x800.jpg', 'Management', 'Strategic planning and operational excellence'),
(5, 'Regions', '1757882270_different-maps-of-the-regions-of-the-usa-v0-yprfua5vi9nb1.webp', 'Regions', 'Global presence with local expertise'),
(6, 'design', '1758655825_thisisengineering-WDCE0T4khsE-unsplash.jpg', 'design', 'Innovative architectural and engineering solutions');

-- --------------------------------------------------------

--
-- Table structure for table `division_page`
--

CREATE TABLE `division_page` (
  `id` int(11) NOT NULL,
  `main_header` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `division_page`
--

INSERT INTO `division_page` (`id`, `main_header`, `description`) VALUES
(1, 'our devision', 'We cater to a wide range of services in management consultancy where our experts deliver integrated solutions for our clients by understanding their needs through the divisions we support.');

-- --------------------------------------------------------

--
-- Table structure for table `feature_text`
--

CREATE TABLE `feature_text` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feature_text`
--

INSERT INTO `feature_text` (`id`, `title`) VALUES
(1, 'Driving<br><span class=\"red\">Engineering</span><br><span class=\"red\">Innovation</span><br>Through <span class=\"red\">Smart</span><br>Solutions'),
(2, 'Driving<br><span class=\"red\">Engineering</span><br><span class=\"red\">Innovation</span><br>Through <span class=\"red\">Smart</span><br>Solutions'),
(3, 'how<br><span class=\"red\">Engineering</span><br><span class=\"red\">Innovation</span><br>Through <span class=\"red\">Smart</span><br>Solutions'),
(4, 'how<br><span class=\"red\">Engineering</span><br><span class=\"red\">Innovation</span><br>Through <span class=\"red\">Smart</span><br>Solutions'),
(5, 'Engineering Excellence Since 1999');

-- --------------------------------------------------------

--
-- Table structure for table `footer_content`
--

CREATE TABLE `footer_content` (
  `id` int(11) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `slider_text` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `footer_content`
--

INSERT INTO `footer_content` (`id`, `logo`, `description`, `slider_text`) VALUES
(1, 'logo_1757838754.png', 'At spectrum we provide comprehensive engineering services tailored to meet the demands of modern industry. From project planning and design to execution and maintenance, our team of experts ensures safe, efficient, and sustainable solutions that drive progress and create lasting value for our clients.', 'cntact');

-- --------------------------------------------------------

--
-- Table structure for table `gulf_spectrum_categories`
--

CREATE TABLE `gulf_spectrum_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gulf_spectrum_categories`
--

INSERT INTO `gulf_spectrum_categories` (`id`, `name`, `created_at`) VALUES
(1, 'quality policies', '2025-09-13 20:35:37'),
(2, 'Enviromental policies', '2025-09-13 20:45:52');

-- --------------------------------------------------------

--
-- Table structure for table `gulf_spectrum_images`
--

CREATE TABLE `gulf_spectrum_images` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `header` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gulf_spectrum_images`
--

INSERT INTO `gulf_spectrum_images` (`id`, `category_id`, `image_name`, `header`, `description`, `created_at`) VALUES
(1, 1, 'WhatsApp Image 2025-09-11 at 17.36.25_2682c8fc.jpg', 'quality policies', 'We are committed to delivering products and services that consistently meet or exceed customer expectations.', '2025-09-13 20:36:34'),
(2, 1, 'WhatsApp Image 2025-09-11 at 17.36.25_2682c8fc.jpg', 'enviromental policies', 'lkajsdlajd', '2025-09-13 20:45:27'),
(3, 2, 'WhatsApp Image 2025-09-11 at 17.36.25_918baa98.jpg', 'enviromental policies', '\"At Gulf Spectrum, we actively reduce our environmental footprint by implementing sustainable practices across all operations, promoting energy efficiency, responsible resource use, and waste reduction to protect our planet for future generations.\"', '2025-09-13 20:47:16');

-- --------------------------------------------------------

--
-- Table structure for table `homepage_content`
--

CREATE TABLE `homepage_content` (
  `id` int(11) NOT NULL,
  `section` varchar(100) NOT NULL,
  `header` text DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `homepage_content`
--

INSERT INTO `homepage_content` (`id`, `section`, `header`, `description`) VALUES
(1, 'services', 'Delivering innovative solutions to meet all your engineering needs', 'Discover our range of services...'),
(2, 'structure', 'Our Global Presence and Structure', 'Our company is organized to deliver projects efficiently and on time. Each team has clear roles and works together to ensure smooth communication and fast problem-solving. This structure helps us meet client needs, adapt quickly, and deliver quality results every time.'),
(3, 'projects', 'Recent Projects Showcase Construction Service Excellence and Innovation', 'Explore our recent projects that highlight innovation and reliability...'),
(4, 'news', 'Stay Informed with Our Latest News', 'Get the latest updates from our company...'),
(5, 'final-left', 'Eager to work together apply now', ''),
(6, 'final-right', 'We\'re here to help please contact us', '');

-- --------------------------------------------------------

--
-- Table structure for table `home_section`
--

CREATE TABLE `home_section` (
  `id` int(11) NOT NULL,
  `first_heading` varchar(255) NOT NULL,
  `special_heading` varchar(255) NOT NULL,
  `last_heading` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_section`
--

INSERT INTO `home_section` (`id`, `first_heading`, `special_heading`, `last_heading`) VALUES
(1, 'Engineering', 'Delivering', 'Excellence');

-- --------------------------------------------------------

--
-- Table structure for table `imagery_images`
--

CREATE TABLE `imagery_images` (
  `id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `imagery_images`
--

INSERT INTO `imagery_images` (`id`, `position`, `image_url`) VALUES
(1, 1, 'assets/home/3ca16aabc8dbd6c1.jpg'),
(2, 2, 'assets/home/3ca16aabc8dbd6c1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `residence` varchar(255) NOT NULL,
  `age_range` varchar(50) NOT NULL,
  `position` varchar(100) DEFAULT NULL,
  `start_date` date NOT NULL,
  `employment_status` varchar(50) NOT NULL,
  `social_status` varchar(50) NOT NULL,
  `num_children` int(11) DEFAULT NULL,
  `children_gender` varchar(50) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `submission_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `employment` varchar(255) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_applications`
--

INSERT INTO `job_applications` (`id`, `first_name`, `last_name`, `email`, `phone`, `residence`, `age_range`, `position`, `start_date`, `employment_status`, `social_status`, `num_children`, `children_gender`, `resume`, `submission_date`, `employment`, `is_read`) VALUES
(25, 'dkjdlk', 'dkdj', 'dkdjk@gmail.com', '272828', '', '', 'accountant', '2025-09-25', '', 'single', 0, NULL, 'admin/cv/1758695115_report.docx', '2025-09-24 06:25:15', 'unemployed', 1),
(26, 'iman', 'soleiman', 'imann.soleiman@gmail.com', '289292', '', '', 'accountant', '2025-09-03', '', 'single', 0, NULL, 'admin/cv/1758695654_report.docx', '2025-09-24 06:34:14', 'student', 1),
(27, 'skhskh', 'jdjd', 'skjdkjh@gmail.com', '209202', '', '', 'accountant', '2025-09-25', '', 'married', 3, NULL, 'admin/cv/1758695835_cv.docx', '2025-09-24 06:37:15', 'employed', 1),
(28, 'Ahmad', 'Charafdin', 'ahmadcharafdin2@gmail.com', '+96171126803', '', '', 'mechanical engineer', '2025-10-06', '', 'single', 0, NULL, 'admin/cv/1759731286_ahmadcv.pdf', '2025-10-06 06:14:46', 'student', 0),
(29, 'Mohammed Eatasam', 'Uddin Anas', 'anaseatasam16@gmail.com', '+971569506780', '', '', 'mechanical engineer', '2025-10-10', '', 'single', 0, NULL, 'admin/cv/1759735169_MOAMMED EATASAM UDDIN ANAS (1) (1) (1).pdf', '2025-10-06 07:19:29', 'unemployed', 0),
(30, 'Hussein', 'Al zein', 'hzein@outlook.com', '0096171218490', '', '', 'mechanical engineer', '2025-11-01', '', 'married', 0, NULL, 'admin/cv/1761735060_HUSSEIN AL ZEIN CV 2025.pdf', '2025-10-29 10:51:00', 'employed', 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_positions`
--

CREATE TABLE `job_positions` (
  `id` int(11) NOT NULL,
  `position_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_positions`
--

INSERT INTO `job_positions` (`id`, `position_name`) VALUES
(1, 'accountant'),
(4, 'electrical'),
(5, 'mechanical engineer');

-- --------------------------------------------------------

--
-- Table structure for table `left_cards`
--

CREATE TABLE `left_cards` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image2` varchar(255) DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `overlay_text` varchar(255) NOT NULL DEFAULT 'kjkflj'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `left_cards`
--

INSERT INTO `left_cards` (`id`, `title`, `description`, `text`, `created_at`, `image2`, `image1`, `overlay_text`) VALUES
(1, '20+', 'years of experience ', 'jkh', '2025-09-09 11:00:41', '1758651225_maksym-kaharlytskyi-u13zBF4r56A-unsplash.jpg', '1758651225_bhupathi-srinu-sP7GYPSWZ1w-unsplash.jpg', 'spectrum');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `show_on_home` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `city`, `country`, `image_path`, `show_on_home`) VALUES
(9, 'beirut', 'Lebanon', '68c2cf7c3686c_photo-1496823407868-80f47c7453b5.jpeg', 1),
(10, 'Abu dabi', 'UAE', '68aed6495668a_abudabi.jpg', 1),
(12, 'Bahrain', 'Bhrain', '68c2cd22f2f9d_Bahrain-e1634206956597.jpg.optimal.jpg', 1),
(13, 'central asia', 'regional office', '68c2ceed90978_living-in-central-asia.jpg', 1),
(14, 'yemen', 'yemen', '68c2cf3ee5924_Sanaa_Yemen_KIDS_0521_3x2.avif', 1),
(15, 'Iraq', 'iraq', '68c2d002bc7f1_136874.jpg', 1),
(18, 'CECS/spectrum', 'USA', '68d2f017e439e_ivan-bandura-hFuu6VDKuE8-unsplash.jpg', 1),
(19, 'sudan', 'sudan', '68d2f27cbe6e2_mohammed-mojahed-DXTYGeE1l7M-unsplash.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `location_details`
--

CREATE TABLE `location_details` (
  `id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `background_image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location_details`
--

INSERT INTO `location_details` (`id`, `location_id`, `background_image_path`) VALUES
(17, 9, '68c2cf7c375c2_photo-1496823407868-80f47c7453b5.jpeg'),
(18, 10, '68aed64957a23_abudabi.jpg'),
(20, 12, '68c2cd22f338f_Bahrain-e1634206956597.jpg.optimal.jpg'),
(21, 13, '68c2ceed90e2d_living-in-central-asia.jpg'),
(22, 14, '68c2cf3ee5e04_Sanaa_Yemen_KIDS_0521_3x2.avif'),
(23, 15, '68c2d002bce9d_136874.jpg'),
(26, 18, '68d2f017e6b42_ivan-bandura-hFuu6VDKuE8-unsplash.jpg'),
(27, 19, '68d2f27cc338e_mohammed-mojahed-DXTYGeE1l7M-unsplash.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `middle_east_countries`
--

CREATE TABLE `middle_east_countries` (
  `id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `middle_east_countries`
--

INSERT INTO `middle_east_countries` (`id`, `country_name`, `description`) VALUES
(1, 'United Arab Emirates', 'Permanent Office • Middle East'),
(2, 'Bahrain', 'Permanent Office • Middle East'),
(4, 'Sudan', 'Permanent Office • Middle East'),
(5, 'North Iraq', 'Permanent Office • Middle East'),
(6, ' Lebanon', 'Permanent Office • Middle East'),
(7, 'Yemen', 'Permanent Office • Middle East');

-- --------------------------------------------------------

--
-- Table structure for table `middle_east_section`
--

CREATE TABLE `middle_east_section` (
  `id` int(11) NOT NULL,
  `header` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `middle_east_section`
--

INSERT INTO `middle_east_section` (`id`, `header`, `content`, `image_path`) VALUES
(1, 'Middle East Focus', 'The focus of Spectrum\'s work lies in the Middle East, where six permanent offices are strategically located to serve our clients effectively. Over 125 professional and technical personnel are currently stationed on assignments throughout the region.', '1756201700_a1-bg-img.png');

-- --------------------------------------------------------

--
-- Table structure for table `navbar`
--

CREATE TABLE `navbar` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(50) DEFAULT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `navbar`
--

INSERT INTO `navbar` (`id`, `setting_key`, `setting_value`) VALUES
(1, 'email', 'info@spectrumlb'),
(2, 'phone', '48 3683 838'),
(3, 'working_hours', 'Mon - Fri 8:30 - 17:30, Sat - Sun off');

-- --------------------------------------------------------

--
-- Table structure for table `navbar_social`
--

CREATE TABLE `navbar_social` (
  `id` int(11) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `navbar_social`
--

INSERT INTO `navbar_social` (`id`, `icon`, `link`) VALUES
(5, 'fab fa-facebook-f', 'https://www.facebook.com/spectrumlb/'),
(6, 'fab fa-linkedin-in', 'https://lb.linkedin.com/company/spectrum-engineering-consultants');

-- --------------------------------------------------------

--
-- Table structure for table `news_cards`
--

CREATE TABLE `news_cards` (
  `id` int(11) NOT NULL,
  `year_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `date_day` int(11) NOT NULL,
  `date_month` int(11) NOT NULL,
  `date_year` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `show_on_home` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news_cards`
--

INSERT INTO `news_cards` (`id`, `year_id`, `category_id`, `title`, `date_day`, `date_month`, `date_year`, `image`, `show_on_home`) VALUES
(30, 22, 11, 'Highway Expansion Project Commences', 22, 2, 2024, '1758660923_constructors-discussing-draft.jpg', 1),
(31, 22, 11, 'Major Infrastructure Project Award', 5, 8, 2024, '1758660703_great-modern-infrastructure-megapolis.jpg', 1),
(32, 18, 11, 'Urban Metro Line Design Finalized', 30, 9, 2025, '1758661087_modern-tokyo-street-background.jpg', 1),
(33, 18, 13, 'Top Engineering Firm of the Year', 22, 8, 2025, '1758661298_engineer-meeting-architectural-project-working.jpg', 0),
(34, 23, 13, 'Excellence in Sustainable Design Award', 20, 1, 2022, '1758661383_image-engineering-objects-workplace-top-view-construction-concept-engineering-tools-vintage-tone-retro-filter-effect-soft-focus-selective-focus.jpg', 1),
(35, 25, 14, 'implementation of Advanced BIM Software', 8, 6, 2021, '1758661471_photovoltaics-factory-technician-improves-solar-panel-configurations-with-laptop.jpg', 1),
(36, 23, 14, '3D Printing for Rapid Prototyping', 25, 5, 2022, '1758661796_jakub-zerdzicki-gJ8bkUlUFkY-unsplash.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `news_categories`
--

CREATE TABLE `news_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news_categories`
--

INSERT INTO `news_categories` (`id`, `name`) VALUES
(11, 'projects'),
(13, 'awards'),
(14, 'technology');

-- --------------------------------------------------------

--
-- Table structure for table `news_comments`
--

CREATE TABLE `news_comments` (
  `id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `comment` text NOT NULL,
  `approved` tinyint(1) DEFAULT 0,
  `show_in_recent` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news_comments`
--

INSERT INTO `news_comments` (`id`, `news_id`, `name`, `email`, `comment`, `approved`, `show_in_recent`, `created_at`) VALUES
(13, 31, 'ifg', 'sdfopdisfiou@gmail.com', 'iuhhjhjh', 1, 1, '2025-09-18 17:55:13'),
(15, 33, 'kjjkd', 'dkjdkj@gmail.com', 'ssskks', 0, 0, '2025-09-24 00:35:54'),
(16, 33, 'ckxclj', 'dskjdkh@gmail.com', 'fdds', 0, 0, '2025-09-24 00:37:23');

-- --------------------------------------------------------

--
-- Table structure for table `news_intro`
--

CREATE TABLE `news_intro` (
  `id` int(11) NOT NULL,
  `header_line1` varchar(255) DEFAULT NULL,
  `header_line2` varchar(255) DEFAULT NULL,
  `header_line3` varchar(255) DEFAULT NULL,
  `header_line4` varchar(255) DEFAULT NULL,
  `paragraph` text DEFAULT NULL,
  `background_image` varchar(255) DEFAULT 'd78a969ab20854f240f405d55ebff1d9.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news_intro`
--

INSERT INTO `news_intro` (`id`, `header_line1`, `header_line2`, `header_line3`, `header_line4`, `paragraph`, `background_image`) VALUES
(1, 'stay current', 'with the', 'most recent', 'news', 'We pour our passion into every detail, and our love for what we create truly shines through.', 'news_bg_1758100387.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `news_sections`
--

CREATE TABLE `news_sections` (
  `id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `section_order` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news_sections`
--

INSERT INTO `news_sections` (`id`, `news_id`, `heading`, `content`, `section_order`) VALUES
(17, 33, 'Innovating Beyond Boundaries', 'As a leading engineering firm, we specialize in delivering comprehensive, innovative solutions across diverse sectors. Our multidisciplinary team of experts combines advanced technology, sustainable practices, and deep industry knowledge to tackle complex challenges. From conceptual design and planning to execution and project management, we ensure every solution meets the highest standards of quality, efficiency, and safety. By fostering collaboration, embracing cutting-edge innovation, and anticipating the needs of tomorrow, we help our clients achieve their goals while shaping a more sustainable and technologically advanced world', 1);

-- --------------------------------------------------------

--
-- Table structure for table `news_years`
--

CREATE TABLE `news_years` (
  `id` int(11) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news_years`
--

INSERT INTO `news_years` (`id`, `year`) VALUES
(25, 2021),
(23, 2022),
(22, 2024),
(18, 2025);

-- --------------------------------------------------------

--
-- Table structure for table `offices`
--

CREATE TABLE `offices` (
  `id` int(11) NOT NULL,
  `country` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `pobox` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offices`
--

INSERT INTO `offices` (`id`, `country`, `city`, `address`, `phone`, `lat`, `lng`, `fax`, `pobox`) VALUES
(10, 'Lebanon', 'Beirut', 'Tallet el Khayat', '01817693', 33.8837409, 35.4866255, NULL, NULL),
(16, 'Bahrain', 'Manama', '183 Salmaniya Avenue', '76872417', 26.2221367, 50.5865079, '', ''),
(18, 'Yemen', 'Sanaa', 'Haddah Area Dr Cellan Al Ubaidi Building Office13', '01817693', 15.35, 44.2, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `our_story_cards`
--

CREATE TABLE `our_story_cards` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `our_story_cards`
--

INSERT INTO `our_story_cards` (`id`, `title`, `description`, `image_path`, `created_at`) VALUES
(7, 'Education', 'Our proven experience allows us to serve a diverse range of industry clients. We acknowledge the escalating needs of the education sector and have developed custom services in response. We provide a full range of professional services to local education authorities, schools, higher education, and other educational bodies.', '1758651856_susan-q-yin-2JIvboGLeho-unsplash.jpg', '2025-09-23 18:24:16'),
(8, 'Transportation', 'As the leading consultancy firm in the transportation sector, Spectrum provides sustainable and innovative transportation solutions. We support highway authorities through advanced planning, innovative design, and intelligent maintenance.', '1758651991_connor-wang-3ttFTqPQs5A-unsplash.jpg', '2025-09-23 18:26:31'),
(9, 'Urban Planning', 'We deliver state-of-the-art consultancy services in urban planning. Our success lies not only in our exceptional pool of talented architects who draw on global influences and traditions, but also in our extensive teams of structural and building services engineers and sustainability consultants. Our multidisciplinary team combines traditional methods with modern technology.', '1758652104_chuttersnap-mVLvomAz9oo-unsplash.jpg', '2025-09-23 18:28:24'),
(10, 'Hospitality & Tourism', 'In the tourist industry, we offer up-to-date, state-of-the-art green building designs that benefit both clients and end users. Such buildings include 5-star hotels, recreational facilities, and marinas.', '1758652300_0d565d9f5dffe6e4936b16a1057dcb1a.jpg', '2025-09-23 18:31:40'),
(11, 'Health & Pharmaceutical', 'Spectrum is a leading firm in providing technical, consulting, and support capabilities to the health sector, especially in the Middle East. The expertise of our specialist health architectural design teams, coupled with our commitment to quality and long-term facilities management, sets us apart.\r\n\r\nThis experience is backed up by a clear understanding of clinical, nursing, and patient requirements. We provide technical and management solutions for the pharmaceutical industry, with many completed projects in the primary, secondary, and laboratory sectors.', '1758652410_online-marketing-hIgeoQjS_iE-unsplash.jpg', '2025-09-23 18:33:30'),
(12, 'Achievements', 'Spectrum has accumulated its reputation as one of the most accomplished international designers with a diverse portfolio spanning all market sectors. Our combination of professional experience and creative design is reflected in numerous projects across the world, particularly in the Middle East.', '1758652642_thisisengineering-xYCBw1uIP_M-unsplash.jpg', '2025-09-23 18:37:22');

-- --------------------------------------------------------

--
-- Table structure for table `our_story_section`
--

CREATE TABLE `our_story_section` (
  `id` int(11) NOT NULL,
  `section_title` varchar(255) NOT NULL,
  `section_subtitle` varchar(255) NOT NULL,
  `section_paragraph` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `our_story_section`
--

INSERT INTO `our_story_section` (`id`, `section_title`, `section_subtitle`, `section_paragraph`) VALUES
(1, 'our story', 'background and acheivments', 'Over the years, Spectrum has delivered innovative engineering and consultancy solutions across multiple industries worldwide.');

-- --------------------------------------------------------

--
-- Table structure for table `professional_lists`
--

CREATE TABLE `professional_lists` (
  `id` int(11) NOT NULL,
  `slide_id` int(11) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `professional_lists`
--

INSERT INTO `professional_lists` (`id`, `slide_id`, `heading`, `description`) VALUES
(4, 1, 'Commitment to Excellence', 'Spectrum professionals are expected to maintain the highest standards in their work, ensuring quality and precision in every task they undertake'),
(5, 1, ' Expertise in Their Fields', 'They must possess deep knowledge and technical skills in their respective disciplines, enabling them to provide expert solutions and guidance.'),
(6, 1, 'Problem Solving and Management Skills', 'Professionals should be capable of analyzing challenges, developing effective solutions, and managing projects efficiently.'),
(7, 1, 'Enthusiasm and Flexibility', 'They should approach their work with energy and adaptability, ready to tackle new challenges and adjust to changing circumstances.'),
(8, 2, 'Knowledge Sharing', 'Spectrum professionals are expected to collaborate with clients and colleagues, sharing insights, expertise, and best practices to enhance overall team performance.'),
(9, 2, 'Teamwork Across Various Scales', 'Whether working individually, in a small group, or as part of a large multi-disciplinary team, professionals must effectively contribute to achieving project goals.');

-- --------------------------------------------------------

--
-- Table structure for table `professional_slides`
--

CREATE TABLE `professional_slides` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT 'our professional Excellence',
  `image` varchar(255) NOT NULL,
  `slide_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `professional_slides`
--

INSERT INTO `professional_slides` (`id`, `title`, `image`, `slide_order`) VALUES
(1, 'our proffesional excellence', '1756147748_PC-Professional-Excellence-2.jpg', 0),
(2, 'our profesional excellence', '1758658047_hand-construction-plans-with-yellow-helmet-drawing-tool.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `location_url` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `show_on_home` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `category_id`, `name`, `location`, `location_url`, `image_path`, `show_on_home`) VALUES
(9, 23, 'KAR TOWER', 'Erbil, Iraq', NULL, '1756454563_Kar-tower_100.jpg', 1),
(10, 23, 'MALIA TRADE CENTER', ' Erbil, Iraq', 'https://www.google.com/viewer/place?mid=/g/11h4y5jz3g&sa=X&ved=2ahUKEwi_47_yzK-PAxX9NvsDHVnTEFkQqdYPegYIAwgAEBA', '1756455178_464Image.jpg', 1),
(11, 23, 'KRONFUL BUILDING', 'Verdun, Beirut, Lebanon', NULL, '1756455705_binary.jpg', 1),
(13, 24, 'Five Major Roads in Al-Ehsaa Region', 'Al-Ehsaa Region, Saudi Arabia.', '', '1756458923_site_1563_0019-1200-630-20200605160540.jpg', 0),
(14, 24, 'Jbab El-Homor – Hermel Road', ' Hermel, Lebanon', '', '1756460427_IMG_2730-2.webp', 0),
(15, 25, 'Bouday Public School', 'baalbek', '', '1756460962_491022748_1388669286103982_6954608563969010029_n.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `project_intro`
--

CREATE TABLE `project_intro` (
  `id` int(11) NOT NULL,
  `heading1` varchar(255) NOT NULL,
  `heading2` varchar(255) NOT NULL,
  `heading3` varchar(255) NOT NULL,
  `heading4` varchar(255) NOT NULL,
  `paragraph` text NOT NULL,
  `right_image` varchar(255) DEFAULT NULL,
  `show_right_image` tinyint(1) DEFAULT 1,
  `background_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_intro`
--

INSERT INTO `project_intro` (`id`, `heading1`, `heading2`, `heading3`, `heading4`, `paragraph`, `right_image`, `show_right_image`, `background_image`) VALUES
(1, 'Our projects', 'are a source of', 'immense pride', 'for us', 'We pour our passion into every detail, and our love for what we create truly shines through.', '1758700991_BC4EC018-F427-457D-8592-F4FA850921D4.PNG', 1, '1758700571_danist-soh-8Gg2Ne_uTcM-unsplash.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `project_popups`
--

CREATE TABLE `project_popups` (
  `project_id` int(11) NOT NULL,
  `popup_description` text DEFAULT NULL,
  `popup_key_features` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_popups`
--

INSERT INTO `project_popups` (`project_id`, `popup_description`, `popup_key_features`) VALUES
(9, ' A 14-story office building in Erbil, Iraq, for which Spectrum provided design and redesign services.', '[\"Total area: Around 12,000 m\\u00b2.\",\"Facilities: Offices, open spaces, conference rooms, meeting rooms, cafeteria.\",\"Services: Plant room with mechanical and electrical services.\"]'),
(10, 'A 20-story mixed-use building in the Erbil area, North Iraq, where Spectrum was responsible for design, supervision, and project management.', '[\"Total area: About 24,650 m\\u00b2.\",\"Basement: Three basement floors for parking, storage, and mechanical\\/electrical rooms.\",\"Ground floor: Showroom and entrance hall.\",\"Office floors: Eight floors with various office configurations.\",\"Apartment floors: Seven floors with furnished apartments (studio, one, two, and three-bedroom)\"]'),
(11, ' A residential building project in Verdun, Beirut, where Spectrum provided design, supervision, and project management. The building features 12 typical residential floors, a ground floor for entrances and a car park, and three basement levels. It is designed to accommodate three apartments per floor, each with four bedrooms and other necessary facilities.', '[\"Three apartments per floor.\",\"12 residential floors with ground-level entrances and car park.\",\"Basement: Three basement floors\"]'),
(13, 'The project focused on comprehensive consultancy services for the upgrade of five existing roads, rather than the construction of new ones. It aimed to provide a complete and detailed engineering design, alongside traffic engineering modeling, to prepare full tender documents for the roadwork', '[\"Detailed engineering design for five roads of varying lengths.\",\"Included comprehensive road design, signage, and marking.\",\"Covered all aspects of infrastructure, including drainage, irrigation, and lighting networks.\"]'),
(14, 'Spectrum Engineering Consultants was responsible for the engineering design of a 19 km road connecting Jbab El-Homor to Hermel in Lebanon. The project focused on creating a durable and resilient road infrastructure that could withstand the area\'s weather conditions, particularly the freeze-thaw cycles of winter', '[\"Road with a total length of 19 km and a width of 7 m.\",\"Designed with a flexible, drainable pavement to withstand frost damage.\",\"Included earthworks, drainage, box culverts, and retaining walls.\"]'),
(15, 'The project involved a comprehensive Preliminary Design Report (APS) followed by structural, mechanical, and electrical planning. It was an educational complex composed of three blocks, with a total area of 2,800 m². The design was intended to accommodate 372 students across pre-elementary, elementary, and intermediate levels.', '[\"Scope: Preliminary design, structural, mechanical, and electrical planning.\",\"Deliverable: Includes a Preliminary Design Report with design criteria, space program, and cost estimate.\"]');

-- --------------------------------------------------------

--
-- Table structure for table `right_cards`
--

CREATE TABLE `right_cards` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `right_cards`
--

INSERT INTO `right_cards` (`id`, `title`, `description`, `created_at`) VALUES
(1, '50+', 'project completed', '2025-09-09 10:58:12'),
(2, '99.5%', 'satisfaction', '2025-09-09 10:58:27'),
(3, '800+', 'clients', '2025-09-09 18:59:56');

-- --------------------------------------------------------

--
-- Table structure for table `right_points`
--

CREATE TABLE `right_points` (
  `id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `right_points`
--

INSERT INTO `right_points` (`id`, `text`, `created_at`) VALUES
(1, 'Engineering & Architecture', '2025-09-09 10:57:48'),
(2, 'Education Sector', '2025-09-09 10:57:53'),
(3, 'Tourism & Hospitality', '2025-09-09 18:57:49'),
(4, 'Transportation', '2025-09-09 18:57:59'),
(5, 'Industrial Sector', '2025-09-09 18:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `section_id` varchar(50) NOT NULL,
  `header` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section_id`, `header`, `content`) VALUES
(1, 'qa-section', 'Quality Assurance – ISO 9001:2008', 'Spectrum has obtained the ISO 9001:2008 Quality Management System and is committed to ensure that its quality system is fully and completely understood by its employees and everyone working for Spectrum, and that the procedures of its quality system are implemented and maintained at all times. The quality system is periodically and systematically reviewed by means of both internal and external audits. To fully utilize our in-house expertise in providing solutions to client problems, our senior directors review each project. The appropriate multi-disciplinary team, led by a dedicated project manager, reports back to a senior director providing hands-on quality assurance and responsiveness.'),
(2, 'third-part', 'Our Professional Excellence', 'Spectrum boasts an impressive record of successfully completed projects and enjoys the reputation of completing work on time and within budget. Spectrum provides its staff resources of over 125 project managers, engineers, architects and technical staff. Our commitment to client service ensures that we allocate well-qualified staff to each of our assignments under the direction of a Project Manager. The partners, all of whom have lived and worked in the Middle East and abroad, manage the firm.');

-- --------------------------------------------------------

--
-- Table structure for table `services_background_image`
--

CREATE TABLE `services_background_image` (
  `id` int(11) NOT NULL,
  `background_image` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services_background_image`
--

INSERT INTO `services_background_image` (`id`, `background_image`, `description`) VALUES
(1, '1758655877_bhupathi-srinu-sP7GYPSWZ1w-unsplash.jpg', 'Spectrum provides engineering, architectural, urban & rural planning, transportation, electro-mechanical and project management services with a focus on the major fields of activity.');

-- --------------------------------------------------------

--
-- Table structure for table `services_cards`
--

CREATE TABLE `services_cards` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_desc` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `detail_page_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `show_on_homepage` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services_cards`
--

INSERT INTO `services_cards` (`id`, `title`, `short_desc`, `image`, `detail_page_id`, `created_at`, `show_on_homepage`) VALUES
(10, ' Transportation Planning', 'Transportation planning ensures the efficient, safe, and sustainable movement of people and goods through innovative engineering solutions.', 'transport-planning-1140-x-540shutterstock-286771301.jpg', 10, '2025-08-13 13:47:53', 1),
(11, 'Engineering, Design, and Documents', 'Providing complete engineering solutions, creating technical designs, and preparing detailed construction documents for projects.', 'engineering-design-process-hero.webp', 11, '2025-08-13 14:14:29', 1),
(12, 'Project Feasibility Analysis', 'Evaluating projects to determine their technical, financial, and operational viability before investment.', 'AdobeStock_408919627_400px.jpg', 12, '2025-08-13 14:24:29', 1),
(13, 'Mechanical /Infrastructure Engineering', ' Designing and implementing mechanical and infrastructural systems for projects.', '1682575402552 (1).jpeg', 13, '2025-08-13 14:38:14', 1),
(14, 'Civil and Structural Engineering', 'Planning, designing, and analyzing safe and durable structures.', '312839fdee77d06c63c242c89427a7e6.jpg', 14, '2025-08-13 14:43:38', 1),
(15, ' Landscaping Architecture', 'Creating aesthetic, functional, and sustainable outdoor spaces.', '12th-Aerial-4.8.2022-scaled.jpg', 15, '2025-08-13 14:50:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `services_details`
--

CREATE TABLE `services_details` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `section_title` varchar(255) DEFAULT NULL,
  `list_items` text DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services_details`
--

INSERT INTO `services_details` (`id`, `title`, `slug`, `description`, `image`, `section_title`, `list_items`, `banner_image`) VALUES
(10, 'transportation planning', NULL, 'Transportation planning focuses on designing and improving transport systems to make travel easier, safer, and more efficient. It includes studying traffic patterns, predicting future travel needs, planning roads and intersections, designing public transit like buses and trains, and connecting different modes of transport such as walking, cycling, and vehicles. It also considers environmental impacts, like emissions and noise, and supports policies and guidelines for better urban mobility. Tools used include traffic simulation software, GIS mapping, travel demand modeling, and data collection from counters and GPS devices.', 'Straßennetz-5083ad65.jpg', 'Tools & Techniques:', 'Traffic simulation software| GIS mapping and spatial analysis | Travel demand modeling tools| Data collection technologies', NULL),
(11, 'Engineering design', NULL, 'We provide complete engineering solutions for projects across multiple sectors. Our services cover the creation of technical designs, preparation of detailed construction documents, and engineering support throughout all stages of a project. We focus on delivering safe, efficient, and compliant solutions, ensuring your project is executed smoothly from planning to completion. Our approach integrates innovative design, rigorous analysis, and practical project support to meet client expectations and regulatory standards.', 'Best-Online-Bachelors-in-Engineering.jpg', 'Key Areas of Expertise:', 'Technical Design | Documentation| Engineering Analysis| Project Support', NULL),
(12, 'Project Feasibility Analysis', NULL, 'Project Feasibility Analysis is a critical step to evaluate the viability of any project before committing resources. It involves assessing the technical, financial, operational, and market aspects to determine whether a project is achievable, sustainable, and profitable. This analysis helps stakeholders make informed decisions, minimize risks, and optimize resource allocation. By identifying potential challenges and opportunities early, feasibility studies ensure projects are strategically planned and aligned with business or governmental objectives.', 'images (5).jpeg', 'Key Areas of Focus:', 'Technical Feasibility| Financial Feasibility | Operational Feasibility | Market and Demand Analysis | Risk Assessment', NULL),
(13, 'Mechanical /Infrastructure Engineering', NULL, 'Mechanical and Infrastructure Engineering focuses on the design, implementation, and integration of essential building systems such as HVAC (heating, ventilation, and air conditioning), plumbing, fire protection, electrical power, and other mechanical services. These systems are carefully coordinated with civil and structural elements to ensure optimal performance, efficiency, and safety. Engineers in this field analyze load requirements, energy consumption, and system interactions to deliver sustainable, cost-effective solutions. Their work ensures that buildings and infrastructure operate reliably while meeting regulatory standards and enhancing occupant comfort.', '1682575402552.jpeg', 'Key Areas of Focus', 'HVAC Systems | Plumbing and Water Management | Electrical and Power Systems | Fire Protection and Safety Systems |Sustainability and Energy Efficiency', NULL),
(14, 'Civil and Structural Engineering', NULL, 'Civil and Structural Engineering involves the planning, design, and construction of safe, durable, and efficient infrastructure. This field ensures that buildings, bridges, roads, and other structures can withstand various loads and environmental conditions over their intended lifespan. Engineers analyze material properties, structural behavior, and load distribution to design foundations, beams, columns, and other critical components. They also consider factors like seismic resistance, wind loads, soil conditions, and sustainability in their designs. By integrating civil and structural principles, engineers ensure that infrastructure is not only functional but also safe, cost-effective, and compliant with local and international standards.', 'industrial-engineer-working-on-laptop-in-modern-factory-wearing-safety-gear-and-analyzing-data-photo.jpeg', 'Key Areas of Focus:', 'Structural Analysis | Material Selection | Foundation Design | Construction Planning and Management ', NULL),
(15, ' Landscaping Architecture', NULL, 'Landscaping Architecture focuses on designing outdoor environments that are visually appealing, functional, and sustainable. It integrates principles of horticulture, ecology, urban planning, and environmental design to create spaces that enhance human well-being, biodiversity, and environmental quality. Landscape architects plan parks, gardens, plazas, streetscapes, and recreational areas by considering factors such as topography, soil quality, climate, vegetation, water management, and circulation patterns. They aim to balance aesthetics with practical needs, ensuring accessibility, safety, and sustainability. Beyond design, landscaping architecture involves collaboration with civil engineers, architects, and urban planners to integrate green spaces seamlessly into urban and rural environments. The field also emphasizes sustainable practices such as native planting, water-efficient irrigation, erosion control, and habitat restoration.', 'Lifted-Forest-and-Headwaters-FountainWEB.png', 'Key Areas of Focus:', 'Site Analysis and Planning |  Design and Visualization | Plant Selection and Horticulture | Sustainable Practices | Urban Integration', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slider_items`
--

CREATE TABLE `slider_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `show_slide` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slider_items`
--

INSERT INTO `slider_items` (`id`, `title`, `description`, `image_path`, `sort_order`, `is_active`, `created_at`, `show_slide`) VALUES
(32, 'Innovative Design, Reliable Results', 'We bring your engineering projects to life efficiently and effectively', 'e18b8eb0b4797105.jpg', 1, 1, '2025-08-27 11:02:43', 0),
(33, 'Your Vision, Our Engineering', 'From concept to completion, we ensure excellence at every step.', '3d3da6c92f878eeb.jpg', 2, 1, '2025-08-27 11:03:10', 0),
(37, 'Spectrum Engineering Consultants', 'Delivering innovative solutions with precision and expertise', '279ecfd31ea83520.jpg', 3, 1, '2025-09-09 18:10:42', 1),
(38, 'Advanced Solutions for Modern Challenges', 'Engineering projects that meet today’s demands and tomorrow’s vision.', '039e90e55efc023f.jpg', 4, 1, '2025-09-09 18:18:24', 1),
(39, 'Building the Future of Engineering', 'Innovative solutions for civil, mechanical, and electrical projects worldwide', 'b1ef407486a8998e.jpg', 5, 1, '2025-09-10 17:53:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `slider_settings`
--

CREATE TABLE `slider_settings` (
  `id` int(11) NOT NULL,
  `show_side_slides` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slider_settings`
--

INSERT INTO `slider_settings` (`id`, `show_side_slides`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `spectrum_categories`
--

CREATE TABLE `spectrum_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spectrum_categories`
--

INSERT INTO `spectrum_categories` (`id`, `name`, `created_at`) VALUES
(2, 'quality policies', '2025-09-13 21:03:49');

-- --------------------------------------------------------

--
-- Table structure for table `spectrum_images`
--

CREATE TABLE `spectrum_images` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `header` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spectrum_images`
--

INSERT INTO `spectrum_images` (`id`, `category_id`, `image_name`, `header`, `description`, `created_at`) VALUES
(2, 2, 'WhatsApp Image 2025-09-11 at 17.36.25_c36e11c3.jpg', 'quality policies', 'jkhjkhkj', '2025-09-13 21:04:10');

-- --------------------------------------------------------

--
-- Table structure for table `spectrum_stats`
--

CREATE TABLE `spectrum_stats` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spectrum_stats`
--

INSERT INTO `spectrum_stats` (`id`, `title`, `description`, `created_at`) VALUES
(1, 'ffff', 'ddd', '2025-08-25 10:37:19');

-- --------------------------------------------------------

--
-- Table structure for table `teams_focus_cards`
--

CREATE TABLE `teams_focus_cards` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams_focus_cards`
--

INSERT INTO `teams_focus_cards` (`id`, `title`, `region`) VALUES
(3, 'Kazakhstan', 'Central Asia'),
(4, 'Tajikistan', 'Central Asia'),
(5, 'Kyrgyzstan', 'Central Asia');

-- --------------------------------------------------------

--
-- Table structure for table `teams_section`
--

CREATE TABLE `teams_section` (
  `id` int(11) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `paragraph` text NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams_section`
--

INSERT INTO `teams_section` (`id`, `heading`, `paragraph`, `image`) VALUES
(1, 'Global Project Experience', 'Beyond our permanent offices, Spectrum has successfully carried out project assignments in multiple countries across different regions', '1758658312_4364.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `team_intro`
--

CREATE TABLE `team_intro` (
  `id` int(11) NOT NULL,
  `headings` text NOT NULL,
  `paragraph` text NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team_intro`
--

INSERT INTO `team_intro` (`id`, `headings`, `paragraph`, `image_path`) VALUES
(1, '[\"Our growing\",\"team\",\"of experts\"]', 'Spectrum total staff resources are approximately 150, of which over 125 professional and technical personnel are stationed on current assignments in the Middle East.', 'assets/teams/1758658182_construction-tall-concrete-pylon-bridge-using-tower-crane.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `vision_section`
--

CREATE TABLE `vision_section` (
  `id` int(11) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `subheading` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vision_section`
--

INSERT INTO `vision_section` (`id`, `heading`, `subheading`) VALUES
(1, 'our vision is to', 'enhance the quality of life and the environment through sustainable, innovative, and client-focused engineering and architectural services. By combining professional experience with creative design, Spectrum aims to continue building a legacy of excellence across multiple sectors worldwide, delivering solutions that are both forward-thinking and socially responsible.');

-- --------------------------------------------------------

--
-- Table structure for table `who_we_are_images`
--

CREATE TABLE `who_we_are_images` (
  `id` int(11) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `who_we_are_images`
--

INSERT INTO `who_we_are_images` (`id`, `image_name`, `position`) VALUES
(1, '1758651513_team-reviewing-progress-making-precise-adjustments-project-execution-phase_994764-140190.avif', 1),
(2, '1758651513_360_F_264874512_asSj4QLFkdifkjMUDj80UKLKKwtH8qBZ.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `who_we_are_section`
--

CREATE TABLE `who_we_are_section` (
  `id` int(11) NOT NULL,
  `section_title` varchar(255) NOT NULL,
  `section_subtitle` varchar(500) NOT NULL,
  `left_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `who_we_are_section`
--

INSERT INTO `who_we_are_section` (`id`, `section_title`, `section_subtitle`, `left_text`) VALUES
(1, 'who we are', 'Engineering Excellence Since 1974 Innovating Across Industries Shaping a Sustainable Future', 'Spectrum was founded in 1974 to deliver the best engineering services to international clients. Our main focus is to improve the quality of life and the environment through the provision of sound engineering and architectural services. We provide specialist consultancy services to the manufacturing industry.\r\n\r\nOur proven experience allows us to serve a diverse range of industry clients. We acknowledge the escalating needs of the education sector and have developed custom services in response. We provide a full range of professional services to local education authorities, schools, higher education, and other educational bodies.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_cards`
--
ALTER TABLE `about_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `about_section`
--
ALTER TABLE `about_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `background_company_structure`
--
ALTER TABLE `background_company_structure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cadd_columns`
--
ALTER TABLE `cadd_columns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cadd_section_id` (`cadd_section_id`);

--
-- Indexes for table `cadd_section`
--
ALTER TABLE `cadd_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_structure`
--
ALTER TABLE `company_structure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_info`
--
ALTER TABLE `contact_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `corporate_fifth_cards`
--
ALTER TABLE `corporate_fifth_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `corporate_fifth_section`
--
ALTER TABLE `corporate_fifth_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `corporate_first_section`
--
ALTER TABLE `corporate_first_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `corporate_fourth_cards`
--
ALTER TABLE `corporate_fourth_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `corporate_fourth_section`
--
ALTER TABLE `corporate_fourth_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `corporate_second_section`
--
ALTER TABLE `corporate_second_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `corporate_third_section`
--
ALTER TABLE `corporate_third_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `department_categories`
--
ALTER TABLE `department_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `division_cards`
--
ALTER TABLE `division_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `division_page`
--
ALTER TABLE `division_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_text`
--
ALTER TABLE `feature_text`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_content`
--
ALTER TABLE `footer_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gulf_spectrum_categories`
--
ALTER TABLE `gulf_spectrum_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gulf_spectrum_images`
--
ALTER TABLE `gulf_spectrum_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `homepage_content`
--
ALTER TABLE `homepage_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_section`
--
ALTER TABLE `home_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imagery_images`
--
ALTER TABLE `imagery_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_positions`
--
ALTER TABLE `job_positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `left_cards`
--
ALTER TABLE `left_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location_details`
--
ALTER TABLE `location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `middle_east_countries`
--
ALTER TABLE `middle_east_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `middle_east_section`
--
ALTER TABLE `middle_east_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navbar`
--
ALTER TABLE `navbar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

--
-- Indexes for table `navbar_social`
--
ALTER TABLE `navbar_social`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_cards`
--
ALTER TABLE `news_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `year_id` (`year_id`),
  ADD KEY `fk_news_category` (`category_id`);

--
-- Indexes for table `news_categories`
--
ALTER TABLE `news_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_comments`
--
ALTER TABLE `news_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_id` (`news_id`);

--
-- Indexes for table `news_intro`
--
ALTER TABLE `news_intro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_sections`
--
ALTER TABLE `news_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_id` (`news_id`);

--
-- Indexes for table `news_years`
--
ALTER TABLE `news_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `year` (`year`);

--
-- Indexes for table `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `our_story_cards`
--
ALTER TABLE `our_story_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `our_story_section`
--
ALTER TABLE `our_story_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `professional_lists`
--
ALTER TABLE `professional_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slide_id` (`slide_id`);

--
-- Indexes for table `professional_slides`
--
ALTER TABLE `professional_slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `project_intro`
--
ALTER TABLE `project_intro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_popups`
--
ALTER TABLE `project_popups`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `right_cards`
--
ALTER TABLE `right_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `right_points`
--
ALTER TABLE `right_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services_background_image`
--
ALTER TABLE `services_background_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services_cards`
--
ALTER TABLE `services_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_page_id` (`detail_page_id`);

--
-- Indexes for table `services_details`
--
ALTER TABLE `services_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `slider_items`
--
ALTER TABLE `slider_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider_settings`
--
ALTER TABLE `slider_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spectrum_categories`
--
ALTER TABLE `spectrum_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spectrum_images`
--
ALTER TABLE `spectrum_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `spectrum_stats`
--
ALTER TABLE `spectrum_stats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams_focus_cards`
--
ALTER TABLE `teams_focus_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams_section`
--
ALTER TABLE `teams_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_intro`
--
ALTER TABLE `team_intro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vision_section`
--
ALTER TABLE `vision_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `who_we_are_images`
--
ALTER TABLE `who_we_are_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `who_we_are_section`
--
ALTER TABLE `who_we_are_section`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_cards`
--
ALTER TABLE `about_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `about_section`
--
ALTER TABLE `about_section`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `background_company_structure`
--
ALTER TABLE `background_company_structure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cadd_columns`
--
ALTER TABLE `cadd_columns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cadd_section`
--
ALTER TABLE `cadd_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `company_structure`
--
ALTER TABLE `company_structure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_info`
--
ALTER TABLE `contact_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `corporate_fifth_cards`
--
ALTER TABLE `corporate_fifth_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `corporate_fifth_section`
--
ALTER TABLE `corporate_fifth_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `corporate_first_section`
--
ALTER TABLE `corporate_first_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `corporate_fourth_cards`
--
ALTER TABLE `corporate_fourth_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `corporate_fourth_section`
--
ALTER TABLE `corporate_fourth_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `corporate_second_section`
--
ALTER TABLE `corporate_second_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `corporate_third_section`
--
ALTER TABLE `corporate_third_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `department_categories`
--
ALTER TABLE `department_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `division_cards`
--
ALTER TABLE `division_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `division_page`
--
ALTER TABLE `division_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `feature_text`
--
ALTER TABLE `feature_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `footer_content`
--
ALTER TABLE `footer_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gulf_spectrum_categories`
--
ALTER TABLE `gulf_spectrum_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gulf_spectrum_images`
--
ALTER TABLE `gulf_spectrum_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `homepage_content`
--
ALTER TABLE `homepage_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `home_section`
--
ALTER TABLE `home_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `imagery_images`
--
ALTER TABLE `imagery_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `job_positions`
--
ALTER TABLE `job_positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `left_cards`
--
ALTER TABLE `left_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `location_details`
--
ALTER TABLE `location_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `middle_east_countries`
--
ALTER TABLE `middle_east_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `middle_east_section`
--
ALTER TABLE `middle_east_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `navbar`
--
ALTER TABLE `navbar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `navbar_social`
--
ALTER TABLE `navbar_social`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `news_cards`
--
ALTER TABLE `news_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `news_categories`
--
ALTER TABLE `news_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `news_comments`
--
ALTER TABLE `news_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `news_intro`
--
ALTER TABLE `news_intro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `news_sections`
--
ALTER TABLE `news_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `news_years`
--
ALTER TABLE `news_years`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `offices`
--
ALTER TABLE `offices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `our_story_cards`
--
ALTER TABLE `our_story_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `our_story_section`
--
ALTER TABLE `our_story_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `professional_lists`
--
ALTER TABLE `professional_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `professional_slides`
--
ALTER TABLE `professional_slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `project_intro`
--
ALTER TABLE `project_intro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `right_cards`
--
ALTER TABLE `right_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `right_points`
--
ALTER TABLE `right_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services_background_image`
--
ALTER TABLE `services_background_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services_cards`
--
ALTER TABLE `services_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `services_details`
--
ALTER TABLE `services_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `slider_items`
--
ALTER TABLE `slider_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `slider_settings`
--
ALTER TABLE `slider_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `spectrum_categories`
--
ALTER TABLE `spectrum_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `spectrum_images`
--
ALTER TABLE `spectrum_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `spectrum_stats`
--
ALTER TABLE `spectrum_stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teams_focus_cards`
--
ALTER TABLE `teams_focus_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teams_section`
--
ALTER TABLE `teams_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `team_intro`
--
ALTER TABLE `team_intro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vision_section`
--
ALTER TABLE `vision_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `who_we_are_images`
--
ALTER TABLE `who_we_are_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `who_we_are_section`
--
ALTER TABLE `who_we_are_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cadd_columns`
--
ALTER TABLE `cadd_columns`
  ADD CONSTRAINT `cadd_columns_ibfk_1` FOREIGN KEY (`cadd_section_id`) REFERENCES `cadd_section` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gulf_spectrum_images`
--
ALTER TABLE `gulf_spectrum_images`
  ADD CONSTRAINT `gulf_spectrum_images_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `gulf_spectrum_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `location_details`
--
ALTER TABLE `location_details`
  ADD CONSTRAINT `location_details_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news_cards`
--
ALTER TABLE `news_cards`
  ADD CONSTRAINT `fk_news_category` FOREIGN KEY (`category_id`) REFERENCES `news_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news_comments`
--
ALTER TABLE `news_comments`
  ADD CONSTRAINT `news_comments_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news_cards` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news_sections`
--
ALTER TABLE `news_sections`
  ADD CONSTRAINT `news_sections_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news_cards` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `professional_lists`
--
ALTER TABLE `professional_lists`
  ADD CONSTRAINT `professional_lists_ibfk_1` FOREIGN KEY (`slide_id`) REFERENCES `professional_slides` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_popups`
--
ALTER TABLE `project_popups`
  ADD CONSTRAINT `project_popups_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services_cards`
--
ALTER TABLE `services_cards`
  ADD CONSTRAINT `services_cards_ibfk_1` FOREIGN KEY (`detail_page_id`) REFERENCES `services_details` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `spectrum_images`
--
ALTER TABLE `spectrum_images`
  ADD CONSTRAINT `spectrum_images_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `spectrum_categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
