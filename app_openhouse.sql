-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 10, 2023 at 04:44 PM
-- Server version: 5.7.39
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app_openhouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `type` varchar(10) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `username`, `password`, `is_active`, `timestamp`) VALUES
(1, 'admin@admin.com', 'admin', 'admin', 0, '2021-01-20 00:47:35');

-- --------------------------------------------------------

--
-- Table structure for table `appraisals`
--

CREATE TABLE `appraisals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `listing_id` int(11) NOT NULL,
  `appraisal_price` int(11) NOT NULL,
  `renovations_selected` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appraisals`
--

INSERT INTO `appraisals` (`id`, `user_id`, `listing_id`, `appraisal_price`, `renovations_selected`, `timestamp`) VALUES
(1, 12, 119, 2000, '[\"kitchen\",\"bathroom\"]', '2023-02-10 15:40:13'),
(2, 193, 124, 666, '[\"Kitchen\",\"Bedroom\"]', '2023-02-10 19:11:36'),
(3, 48, 124, 1200, '[\"Kitchen\"]', '2023-02-10 20:44:16'),
(4, 48, 124, 1200, '[\"Kitchen\"]', '2023-02-10 20:44:20'),
(5, 48, 124, 1200, '[\"Kitchen\"]', '2023-02-10 20:44:21');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`) VALUES
(1, 1, 'Automotive'),
(2, 2, 'Entertainment & Tourism'),
(3, 3, 'Fashion & Cosmetics'),
(4, 4, 'Groceries'),
(5, 5, 'Industrial & Other businesses'),
(6, 6, 'Other bartering'),
(7, 7, 'Pets & Animals'),
(8, 8, 'Professional Services & Skills'),
(9, 9, 'Real Estate'),
(10, 10, 'Technology & Electronics'),
(11, 11, 'Valuables, Art & Investments'),
(12, 0, 'Home & Office Furniture');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(10) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `to_id` int(10) NOT NULL,
  `from_id` int(10) NOT NULL,
  `datetime` int(11) NOT NULL,
  `seen` int(10) NOT NULL,
  `msg_type` int(10) NOT NULL,
  `listing_id` int(11) NOT NULL,
  `archive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `msg`, `to_id`, `from_id`, `datetime`, `seen`, `msg_type`, `listing_id`, `archive`) VALUES
(284, 'Hey! check user want to make a deal', 58, 48, 1637011742, 1, 0, 17, 0),
(285, 'hello', 58, 48, 1637056222, 1, 0, 17, 0),
(286, 'sdds', 58, 48, 1637056250, 1, 0, 17, 0),
(287, 'aa', 48, 58, 1637056329, 1, 0, 17, 0),
(288, 'hell', 48, 58, 1637056363, 1, 0, 17, 0),
(289, 'as', 48, 58, 1637056612, 1, 0, 17, 0),
(290, 'sasas', 48, 58, 1637056653, 1, 0, 17, 0),
(291, 'ds', 48, 58, 1637056851, 1, 0, 17, 0),
(292, 'Hhh', 58, 48, 1637062193, 1, 0, 17, 0),
(293, 'hi', 58, 61, 1637087566, 1, 0, 18, 1),
(294, 'How are you doing', 58, 61, 1637087599, 1, 0, 18, 1),
(295, 'jkkjjjkjkjkjkjkjkjknkjnkn jknkj jknkjn kjnkj', 48, 58, 1637090542, 1, 0, 17, 0),
(296, 'Hi', 58, 61, 1637095937, 1, 0, 18, 1),
(297, 'hellow how are you', 58, 61, 1637096092, 1, 0, 19, 0),
(298, '???', 58, 61, 1637096109, 1, 0, 19, 0),
(299, 'Great', 61, 58, 1637129022, 1, 0, 19, 0),
(300, 'Great', 48, 58, 1637129081, 1, 0, 17, 0),
(301, 'Hey! danishg goheer want to make a deal', 48, 61, 1637255242, 1, 0, 20, 0),
(302, 'Hey! Salma Abulella want to make a deal', 63, 61, 1637419597, 1, 0, 21, 0),
(303, 'Hello, this is for testing', 64, 63, 1637427353, 1, 0, 22, 0),
(304, 'hi', 63, 64, 1637427558, 1, 0, 23, 1),
(305, 'How to confirm', 63, 64, 1637427658, 1, 0, 23, 0),
(306, 'I just pressed confirm', 64, 63, 1637427764, 1, 0, 23, 0),
(307, 'Hello', 58, 63, 1637428099, 1, 0, 24, 0),
(308, 'Hey! Salma Abulella want to make a deal', 55, 64, 1637428305, 0, 0, 25, 0),
(309, 'hello', 58, 63, 1637428311, 1, 0, 26, 0),
(310, 'Hey! Huds Meqdad want to make a deal', 58, 63, 1637428356, 0, 0, 27, 0),
(311, 'Hey! Salma Abulella want to make a deal', 63, 64, 1637428577, 1, 0, 28, 0),
(312, 'Hello', 64, 63, 1637428595, 1, 0, 29, 0),
(313, 'Hey! Salma Abulella want to make a deal', 63, 64, 1637429446, 1, 0, 30, 0),
(314, 'Hey! Salma Abulella want to make a deal', 55, 64, 1637496920, 1, 0, 31, 0),
(315, 'Hey! Salma Abulella want to make a deal', 55, 64, 1637497037, 1, 0, 32, 0),
(316, 'Hey! Salma Abulella want to make a deal', 55, 64, 1637497554, 1, 0, 33, 0),
(317, 'Hey! Salma Abulella want to make a deal', 55, 64, 1637497642, 1, 0, 34, 0),
(318, 'Hey! check user want to make a deal', 58, 48, 1637573021, 0, 0, 35, 0),
(319, 'Hey! arman talib want to make a deal', 66, 48, 1637573277, 1, 0, 36, 0),
(320, 'Hey! arman talib want to make a deal', 66, 48, 1637573501, 1, 0, 37, 0),
(321, 'Hey! arman talib want to make a deal', 66, 48, 1637603605, 1, 0, 38, 0),
(322, 'hiiii', 91, 89, 1655712308, 1, 0, 0, 0),
(347, 'Hi aliiii how are you', 90, 90, 1656915985, 0, 0, 0, 0),
(349, 'Hi ali', 91, 101, 1657086686, 0, 0, 0, 0),
(350, 'Hi', 91, 102, 1657089377, 0, 0, 0, 0),
(351, 'Are you free right now', 0, 102, 1657089415, 1, 0, 0, 0),
(352, 'Hi', 91, 102, 1657089474, 0, 0, 0, 0),
(353, 'Are you available', 0, 102, 1657089487, 1, 0, 0, 0),
(361, 'checking', 90, 89, 1657189760, 1, 0, 0, 0),
(364, 'Ww', 89, 114, 1657199304, 1, 0, 0, 0),
(365, 'As', 89, 114, 1657199411, 1, 0, 0, 0),
(366, 'Dfg', 89, 114, 1657199424, 1, 0, 0, 0),
(367, 'Hhh', 89, 114, 1657199653, 1, 0, 0, 0),
(368, 'Hh6', 89, 114, 1657199663, 1, 0, 0, 0),
(369, 'Hyh', 89, 114, 1657199705, 1, 0, 0, 0),
(370, 'Jjnb', 89, 90, 1657230212, 1, 0, 0, 0),
(371, 'Jh', 89, 90, 1657230216, 1, 0, 0, 0),
(372, 'Hi', 89, 90, 1657230270, 1, 0, 0, 0),
(373, 'By', 89, 90, 1657230274, 1, 0, 0, 0),
(374, 'Hi', 89, 90, 1657230418, 1, 0, 0, 0),
(375, 'Fuuffu', 89, 116, 1657233925, 0, 0, 0, 0),
(376, 'Hello', 89, 125, 1657724577, 0, 0, 0, 0),
(377, 'Hi', 89, 125, 1657724594, 1, 0, 0, 0),
(378, 'Sa', 89, 125, 1657724990, 1, 0, 0, 0),
(379, 'Hssh', 89, 127, 1657734734, 0, 0, 0, 0),
(380, 'Hssh', 89, 127, 1657734751, 0, 0, 0, 0),
(381, 'Hsh', 89, 127, 1657734758, 1, 0, 0, 0),
(382, 'Shus', 89, 127, 1657734761, 1, 0, 0, 0),
(383, 'Hshs', 89, 127, 1657734766, 1, 0, 0, 0),
(384, 'Hhhgg', 89, 109, 1657778432, 0, 0, 0, 0),
(385, 'Hahaga', 89, 90, 1657779449, 1, 0, 0, 0),
(388, 'Hi', 89, 90, 1657782957, 1, 0, 0, 0),
(389, 'Hsh', 89, 90, 1657783022, 1, 0, 0, 0),
(390, 'Hash', 89, 90, 1657783032, 1, 0, 0, 0),
(391, 'ghdhfdh', 91, 89, 1657783254, 1, 0, 0, 0),
(392, 'ghdhfdh', 91, 89, 1657783297, 1, 0, 0, 0),
(393, 'Mukhtar', 89, 90, 1657783372, 1, 0, 0, 0),
(394, 'Nhu', 126, 129, 1657932930, 0, 0, 0, 0),
(395, 'Gutfvjkkmnvgg', 114, 129, 1658411813, 0, 0, 0, 0),
(396, 'Hi, Iâ€™d like toâ€¦', 89, 129, 1658655180, 0, 0, 0, 0),
(397, 'Hiii', 89, 90, 1658813365, 1, 0, 0, 0),
(398, 'Hi', 89, 90, 1658813395, 1, 0, 0, 0),
(399, 'Bye', 89, 90, 1658813530, 1, 0, 0, 0),
(400, 'Hi', 89, 90, 1658813576, 1, 0, 0, 0),
(401, 'Nyee', 89, 90, 1658813727, 1, 0, 0, 0),
(402, 'Fk', 89, 90, 1658813779, 1, 0, 0, 0),
(403, 'Helll', 89, 90, 1658813853, 1, 0, 0, 0),
(404, 'Hijggvjfufj', 89, 90, 1658813926, 1, 0, 0, 0),
(405, 'Jhg', 89, 90, 1658814076, 1, 0, 0, 0),
(406, 'Bhaoo', 89, 90, 1658814137, 0, 0, 0, 0),
(407, 'Bhaoo kjjhvcvhichcchc', 89, 90, 1658814203, 0, 0, 0, 0),
(408, 'Bbb', 89, 90, 1658814473, 1, 0, 0, 0),
(409, 'Bjccjcfjf', 89, 90, 1658814499, 1, 0, 0, 0),
(410, 'Checkbitesdhnnjhh', 89, 90, 1658814516, 1, 0, 0, 0),
(411, 'I\\\'m', 89, 90, 1658815001, 1, 0, 0, 0),
(412, 'Bbb', 89, 90, 1658815005, 1, 0, 0, 0),
(413, 'Ddd', 89, 114, 1659558380, 1, 0, 0, 0),
(414, 'Rrrr', 89, 114, 1659558386, 1, 0, 0, 0),
(415, 'Trrr', 89, 114, 1659558392, 1, 0, 0, 0),
(416, 'Hh', 89, 114, 1659558397, 1, 0, 0, 0),
(417, 'X', 89, 114, 1659558404, 1, 0, 0, 0),
(418, 'X', 89, 114, 1659558416, 1, 0, 0, 0),
(419, 'M', 89, 114, 1659558421, 1, 0, 0, 0),
(420, 'N', 89, 114, 1659558427, 1, 0, 0, 0),
(421, 'Rr', 89, 114, 1659558434, 1, 0, 0, 0),
(422, 'Q', 89, 114, 1659558442, 1, 0, 0, 0),
(423, 'Q', 89, 114, 1659558447, 1, 0, 0, 0),
(424, 'Bbh', 89, 114, 1659558455, 1, 0, 0, 0),
(425, 'G', 89, 114, 1659558472, 1, 0, 0, 0),
(426, 'Jh', 89, 114, 1659558478, 0, 0, 0, 0),
(427, 'Shsbsbbssbsbsshssbbksjsshsshjedjdamskdmsnjssndnsjbbshsbsbxndnjddjndndjjddsnsd', 89, 148, 1661577595, 0, 0, 0, 0),
(428, 'Bdbdbdbjddjdhddbddbdbbzbdbdbdssjjjssh', 148, 148, 1661577811, 0, 0, 0, 0),
(429, 'Bdbdbdbdb', 148, 148, 1661577815, 0, 0, 0, 0),
(430, 'Sjjdhdjjx', 148, 148, 1661577817, 0, 0, 0, 0),
(431, 'Hi\\nCan we talk', 89, 170, 1663271189, 0, 0, 0, 0),
(432, 'Yyyu', 89, 171, 1665684440, 0, 0, 0, 0),
(433, 'Jjj', 89, 171, 1665684538, 0, 0, 0, 0),
(434, 'Bhhnbhhbbbbbbbbb', 91, 141, 1665684755, 0, 0, 0, 0),
(435, 'Uuhgg', 89, 171, 1665684991, 0, 0, 0, 0),
(436, 'Hbh', 89, 171, 1665685078, 1, 0, 0, 0),
(437, 'Bbb', 89, 171, 1665685083, 1, 0, 0, 0),
(438, 'Ijj', 89, 171, 1665685085, 1, 0, 0, 0),
(439, 'Uh', 89, 171, 1665685087, 1, 0, 0, 0),
(440, 'Iu', 89, 171, 1665685088, 1, 0, 0, 0),
(441, 'Uuhg', 89, 171, 1665685091, 1, 0, 0, 0),
(442, 'Hb', 89, 171, 1665685094, 1, 0, 0, 0),
(443, 'Iij', 89, 171, 1665685095, 1, 0, 0, 0),
(444, 'Jhh', 89, 171, 1665685115, 1, 0, 0, 0),
(445, 'Hry', 89, 171, 1665685129, 1, 0, 0, 0),
(446, 'Hry', 89, 171, 1665685133, 1, 0, 0, 0),
(447, 'Hhhhh', 89, 171, 1665685135, 1, 0, 0, 0),
(448, 'Ojg', 89, 171, 1665685137, 1, 0, 0, 0),
(449, 'Okkj', 89, 171, 1665685139, 1, 0, 0, 0),
(450, 'Vcxfxg', 89, 171, 1665685141, 1, 0, 0, 0),
(451, 'Hiii', 173, 179, 1673696630, 0, 0, 0, 0),
(452, 'Vbjj', 173, 179, 1673696641, 1, 0, 0, 0),
(453, 'Hiii', 173, 179, 1673696646, 1, 0, 0, 0),
(454, 'Bb', 173, 179, 1673696647, 1, 0, 0, 0),
(455, 'Bbcff', 169, 182, 1674417786, 0, 0, 0, 0),
(456, 'Hi', 173, 182, 1674437870, 0, 0, 0, 0),
(459, 'Jjj', 173, 184, 1674812853, 0, 0, 0, 0),
(460, 'Hh', 173, 184, 1674812866, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `connects`
--

CREATE TABLE `connects` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `listing_id` int(11) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `connects`
--

INSERT INTO `connects` (`id`, `user_id`, `to_id`, `listing_id`, `msg`, `status`, `reason`, `timestamp`) VALUES
(35, 89, 88, 95, 'abcd', 1, '', '2022-06-21 10:30:08'),
(36, 89, 91, 97, '', 1, '', '2022-06-25 08:42:34'),
(37, 90, 91, 98, '', 2, '', '2022-06-25 10:45:46'),
(38, 92, 90, 99, '', 1, '', '2022-06-27 04:44:00');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `alpha2Code` varchar(2) NOT NULL,
  `alpha3Code` varchar(3) NOT NULL,
  `code` varchar(5) NOT NULL,
  `tld` varchar(10) NOT NULL,
  `currency_code` varchar(5) NOT NULL,
  `timezone` varchar(30) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `alpha2Code`, `alpha3Code`, `code`, `tld`, `currency_code`, `timezone`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '93', '.af', 'AFN', 'UTC+04:30', 1),
(3, 'Albania', 'AL', 'ALB', '355', '.al', 'ALL', 'UTC+01:00', 1),
(4, 'Algeria', 'DZ', 'DZA', '213', '.dz', 'DZD', 'UTC+01:00', 1),
(5, 'American Samoa', 'AS', 'ASM', '1684', '.as', 'USD', 'UTC-11:00', 1),
(6, 'Andorra', 'AD', 'AND', '376', '.ad', 'EUR', 'UTC+01:00', 1),
(7, 'Angola', 'AO', 'AGO', '244', '.ao', 'AOA', 'UTC+01:00', 1),
(8, 'Anguilla', 'AI', 'AIA', '1264', '.ai', 'XCD', 'UTC-04:00', 1),
(9, 'Antarctica', 'AQ', 'ATA', '672', '.aq', 'AUD', 'UTC-03:00', 1),
(10, 'Antigua and Barbuda', 'AG', 'ATG', '1268', '.ag', 'XCD', 'UTC-04:00', 1),
(11, 'Argentina', 'AR', 'ARG', '54', '.ar', 'ARS', 'UTC-03:00', 1),
(12, 'Armenia', 'AM', 'ARM', '374', '.am', 'AMD', 'UTC+04:00', 1),
(13, 'Aruba', 'AW', 'ABW', '297', '.aw', 'AWG', 'UTC-04:00', 1),
(14, 'Australia', 'AU', 'AUS', '61', '.au', 'AUD', 'UTC+05:00', 1),
(15, 'Austria', 'AT', 'AUT', '43', '.at', 'EUR', 'UTC+01:00', 1),
(16, 'Azerbaijan', 'AZ', 'AZE', '994', '.az', 'AZN', 'UTC+04:00', 1),
(17, 'Bahamas', 'BS', 'BHS', '1242', '.bs', 'BSD', 'UTC-05:00', 1),
(18, 'Bahrain', 'BH', 'BHR', '973', '.bh', 'BHD', 'UTC+03:00', 1),
(19, 'Bangladesh', 'BD', 'BGD', '880', '.bd', 'BDT', 'UTC+06:00', 1),
(20, 'Barbados', 'BB', 'BRB', '1246', '.bb', 'BBD', 'UTC-04:00', 1),
(21, 'Belarus', 'BY', 'BLR', '375', '.by', 'BYN', 'UTC+03:00', 1),
(22, 'Belgium', 'BE', 'BEL', '32', '.be', 'EUR', 'UTC+01:00', 1),
(23, 'Belize', 'BZ', 'BLZ', '501', '.bz', 'BZD', 'UTC-06:00', 1),
(24, 'Benin', 'BJ', 'BEN', '229', '.bj', 'XOF', 'UTC+01:00', 1),
(25, 'Bermuda', 'BM', 'BMU', '1441', '.bm', 'BMD', 'UTC-04:00', 1),
(26, 'Bhutan', 'BT', 'BTN', '975', '.bt', 'BTN', 'UTC+06:00', 1),
(27, 'Bolivia (Plurinational State of)', 'BO', 'BOL', '591', '.bo', 'BOB', 'UTC-04:00', 1),
(28, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '5997', '.an', 'USD', 'UTC-04:00', 1),
(29, 'Bosnia and Herzegovina', 'BA', 'BIH', '387', '.ba', 'BAM', 'UTC+01:00', 1),
(30, 'Botswana', 'BW', 'BWA', '267', '.bw', 'BWP', 'UTC+02:00', 1),
(32, 'Brazil', 'BR', 'BRA', '55', '.br', 'BRL', 'UTC-05:00', 1),
(33, 'British Indian Ocean Territory', 'IO', 'IOT', '246', '.io', 'USD', 'UTC+06:00', 1),
(35, 'Virgin Islands (British)', 'VG', 'VGB', '1284', '.vg', '', 'UTC-04:00', 1),
(36, 'Virgin Islands (U.S.)', 'VI', 'VIR', '1 340', '.vi', 'USD', 'UTC-04:00', 1),
(37, 'Brunei Darussalam', 'BN', 'BRN', '673', '.bn', 'BND', 'UTC+08:00', 1),
(38, 'Bulgaria', 'BG', 'BGR', '359', '.bg', 'BGN', 'UTC+02:00', 1),
(39, 'Burkina Faso', 'BF', 'BFA', '226', '.bf', 'XOF', 'UTC', 1),
(40, 'Burundi', 'BI', 'BDI', '257', '.bi', 'BIF', 'UTC+02:00', 1),
(41, 'Cambodia', 'KH', 'KHM', '855', '.kh', 'KHR', 'UTC+07:00', 1),
(42, 'Cameroon', 'CM', 'CMR', '237', '.cm', 'XAF', 'UTC+01:00', 1),
(43, 'Canada', 'CA', 'CAN', '1', '.ca', 'CAD', 'UTC-08:00', 1),
(44, 'Cabo Verde', 'CV', 'CPV', '238', '.cv', 'CVE', 'UTC-01:00', 1),
(45, 'Cayman Islands', 'KY', 'CYM', '1345', '.ky', 'KYD', 'UTC-05:00', 1),
(46, 'Central African Republic', 'CF', 'CAF', '236', '.cf', 'XAF', 'UTC+01:00', 1),
(47, 'Chad', 'TD', 'TCD', '235', '.td', 'XAF', 'UTC+01:00', 1),
(48, 'Chile', 'CL', 'CHL', '56', '.cl', 'CLP', 'UTC-06:00', 1),
(49, 'China', 'CN', 'CHN', '86', '.cn', 'CNY', 'UTC+08:00', 1),
(50, 'Christmas Island', 'CX', 'CXR', '61', '.cx', 'AUD', 'UTC+07:00', 1),
(51, 'Cocos (Keeling) Islands', 'CC', 'CCK', '61', '.cc', 'AUD', 'UTC+06:30', 1),
(52, 'Colombia', 'CO', 'COL', '57', '.co', 'COP', 'UTC-05:00', 1),
(53, 'Comoros', 'KM', 'COM', '269', '.km', 'KMF', 'UTC+03:00', 1),
(54, 'Congo', 'CG', 'COG', '242', '.cg', 'XAF', 'UTC+01:00', 1),
(55, 'Congo (Democratic Republic of the)', 'CD', 'COD', '243', '.cd', 'CDF', 'UTC+01:00', 1),
(56, 'Cook Islands', 'CK', 'COK', '682', '.ck', 'NZD', 'UTC-10:00', 1),
(57, 'Costa Rica', 'CR', 'CRI', '506', '.cr', 'CRC', 'UTC-06:00', 1),
(58, 'Croatia', 'HR', 'HRV', '385', '.hr', 'HRK', 'UTC+01:00', 1),
(59, 'Cuba', 'CU', 'CUB', '53', '.cu', 'CUC', 'UTC-05:00', 1),
(60, 'CuraÃ§ao', 'CW', 'CUW', '599', '.cw', 'ANG', 'UTC-04:00', 1),
(61, 'Cyprus', 'CY', 'CYP', '357', '.cy', 'EUR', 'UTC+02:00', 1),
(62, 'Czech Republic', 'CZ', 'CZE', '420', '.cz', 'CZK', 'UTC+01:00', 1),
(63, 'Denmark', 'DK', 'DNK', '45', '.dk', 'DKK', 'UTC-04:00', 1),
(64, 'Djibouti', 'DJ', 'DJI', '253', '.dj', 'DJF', 'UTC+03:00', 1),
(65, 'Dominica', 'DM', 'DMA', '1767', '.dm', 'XCD', 'UTC-04:00', 1),
(66, 'Dominican Republic', 'DO', 'DOM', '1809', '.do', 'DOP', 'UTC-04:00', 1),
(67, 'Ecuador', 'EC', 'ECU', '593', '.ec', 'USD', 'UTC-06:00', 1),
(68, 'Egypt', 'EG', 'EGY', '20', '.eg', 'EGP', 'UTC+02:00', 1),
(69, 'El Salvador', 'SV', 'SLV', '503', '.sv', 'USD', 'UTC-06:00', 1),
(70, 'Equatorial Guinea', 'GQ', 'GNQ', '240', '.gq', 'XAF', 'UTC+01:00', 1),
(71, 'Eritrea', 'ER', 'ERI', '291', '.er', 'ERN', 'UTC+03:00', 1),
(72, 'Estonia', 'EE', 'EST', '372', '.ee', 'EUR', 'UTC+02:00', 1),
(73, 'Ethiopia', 'ET', 'ETH', '251', '.et', 'ETB', 'UTC+03:00', 1),
(74, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '500', '.fk', 'FKP', 'UTC-04:00', 1),
(75, 'Faroe Islands', 'FO', 'FRO', '298', '.fo', 'DKK', 'UTC+00:00', 1),
(76, 'Fiji', 'FJ', 'FJI', '679', '.fj', 'FJD', 'UTC+12:00', 1),
(77, 'Finland', 'FI', 'FIN', '358', '.fi', 'EUR', 'UTC+02:00', 1),
(78, 'France', 'FR', 'FRA', '33', '.fr', 'EUR', 'UTC-10:00', 1),
(79, 'French Guiana', 'GF', 'GUF', '594', '.gf', 'EUR', 'UTC-03:00', 1),
(80, 'French Polynesia', 'PF', 'PYF', '689', '.pf', 'XPF', 'UTC-10:00', 1),
(82, 'Gabon', 'GA', 'GAB', '241', '.ga', 'XAF', 'UTC+01:00', 1),
(83, 'Gambia', 'GM', 'GMB', '220', '.gm', 'GMD', 'UTC+00:00', 1),
(84, 'Georgia', 'GE', 'GEO', '995', '.ge', 'GEL', 'UTC-05:00', 1),
(85, 'Germany', 'DE', 'DEU', '49', '.de', 'EUR', 'UTC+01:00', 1),
(86, 'Ghana', 'GH', 'GHA', '233', '.gh', 'GHS', 'UTC', 1),
(87, 'Gibraltar', 'GI', 'GIB', '350', '.gi', 'GIP', 'UTC+01:00', 1),
(88, 'Greece', 'GR', 'GRC', '30', '.gr', 'EUR', 'UTC+02:00', 1),
(89, 'Greenland', 'GL', 'GRL', '299', '.gl', 'DKK', 'UTC-04:00', 1),
(90, 'Grenada', 'GD', 'GRD', '1473', '.gd', 'XCD', 'UTC-04:00', 1),
(91, 'Guadeloupe', 'GP', 'GLP', '590', '.gp', 'EUR', 'UTC-04:00', 1),
(92, 'Guam', 'GU', 'GUM', '1671', '.gu', 'USD', 'UTC+10:00', 1),
(93, 'Guatemala', 'GT', 'GTM', '502', '.gt', 'GTQ', 'UTC-06:00', 1),
(94, 'Guernsey', 'GG', 'GGY', '44', '.gg', 'GBP', 'UTC+00:00', 1),
(95, 'Guinea', 'GN', 'GIN', '224', '.gn', 'GNF', 'UTC', 1),
(96, 'Guinea-Bissau', 'GW', 'GNB', '245', '.gw', 'XOF', 'UTC', 1),
(97, 'Guyana', 'GY', 'GUY', '592', '.gy', 'GYD', 'UTC-04:00', 1),
(98, 'Haiti', 'HT', 'HTI', '509', '.ht', 'HTG', 'UTC-05:00', 1),
(100, 'Holy See', 'VA', 'VAT', '379', '.va', 'EUR', 'UTC+01:00', 1),
(101, 'Honduras', 'HN', 'HND', '504', '.hn', 'HNL', 'UTC-06:00', 1),
(102, 'Hong Kong', 'HK', 'HKG', '852', '.hk', 'HKD', 'UTC+08:00', 1),
(103, 'Hungary', 'HU', 'HUN', '36', '.hu', 'HUF', 'UTC+01:00', 1),
(104, 'Iceland', 'IS', 'ISL', '354', '.is', 'ISK', 'UTC', 1),
(105, 'India', 'IN', 'IND', '91', '.in', 'INR', 'UTC+05:30', 1),
(106, 'Indonesia', 'ID', 'IDN', '62', '.id', 'IDR', 'UTC+07:00', 1),
(107, 'Iran (Islamic Republic of)', 'IR', 'IRN', '98', '.ir', 'IRR', 'UTC+03:30', 1),
(108, 'Iraq', 'IQ', 'IRQ', '964', '.iq', 'IQD', 'UTC+03:00', 1),
(109, 'Ireland', 'IE', 'IRL', '353', '.ie', 'EUR', 'UTC', 1),
(110, 'Isle of Man', 'IM', 'IMN', '44', '.im', 'GBP', 'UTC+00:00', 1),
(111, 'Israel', 'IL', 'ISR', '972', '.il', 'ILS', 'UTC+02:00', 1),
(112, 'Italy', 'IT', 'ITA', '39', '.it', 'EUR', 'UTC+01:00', 1),
(113, 'Jamaica', 'JM', 'JAM', '1876', '.jm', 'JMD', 'UTC-05:00', 1),
(114, 'Japan', 'JP', 'JPN', '81', '.jp', 'JPY', 'UTC+09:00', 1),
(115, 'Jersey', 'JE', 'JEY', '44', '.je', 'GBP', 'UTC+01:00', 1),
(116, 'Jordan', 'JO', 'JOR', '962', '.jo', 'JOD', 'UTC+03:00', 1),
(117, 'Kazakhstan', 'KZ', 'KAZ', '76', '.kz', 'KZT', 'UTC+05:00', 1),
(118, 'Kenya', 'KE', 'KEN', '254', '.ke', 'KES', 'UTC+03:00', 1),
(119, 'Kiribati', 'KI', 'KIR', '686', '.ki', 'AUD', 'UTC+12:00', 1),
(120, 'Kuwait', 'KW', 'KWT', '965', '.kw', 'KWD', 'UTC+03:00', 1),
(121, 'Kyrgyzstan', 'KG', 'KGZ', '996', '.kg', 'KGS', 'UTC+06:00', 1),
(122, 'Latvia', 'LV', 'LVA', '371', '.lv', 'EUR', 'UTC+02:00', 1),
(123, 'Lebanon', 'LB', 'LBN', '961', '.lb', 'LBP', 'UTC+02:00', 1),
(124, 'Lesotho', 'LS', 'LSO', '266', '.ls', 'LSL', 'UTC+02:00', 1),
(125, 'Liberia', 'LR', 'LBR', '231', '.lr', 'LRD', 'UTC', 1),
(126, 'Libya', 'LY', 'LBY', '218', '.ly', 'LYD', 'UTC+01:00', 1),
(127, 'Liechtenstein', 'LI', 'LIE', '423', '.li', 'CHF', 'UTC+01:00', 1),
(128, 'Lithuania', 'LT', 'LTU', '370', '.lt', 'EUR', 'UTC+02:00', 1),
(129, 'Luxembourg', 'LU', 'LUX', '352', '.lu', 'EUR', 'UTC+01:00', 1),
(130, 'Macao', 'MO', 'MAC', '853', '.mo', 'MOP', 'UTC+08:00', 1),
(131, 'Macedonia (the former Yugoslav Republic of)', 'MK', 'MKD', '389', '.mk', 'MKD', 'UTC+01:00', 1),
(132, 'Madagascar', 'MG', 'MDG', '261', '.mg', 'MGA', 'UTC+03:00', 1),
(133, 'Malawi', 'MW', 'MWI', '265', '.mw', 'MWK', 'UTC+02:00', 1),
(134, 'Malaysia', 'MY', 'MYS', '60', '.my', 'MYR', 'UTC+08:00', 1),
(135, 'Maldives', 'MV', 'MDV', '960', '.mv', 'MVR', 'UTC+05:00', 1),
(136, 'Mali', 'ML', 'MLI', '223', '.ml', 'XOF', 'UTC', 1),
(137, 'Malta', 'MT', 'MLT', '356', '.mt', 'EUR', 'UTC+01:00', 1),
(138, 'Marshall Islands', 'MH', 'MHL', '692', '.mh', 'USD', 'UTC+12:00', 1),
(139, 'Martinique', 'MQ', 'MTQ', '596', '.mq', 'EUR', 'UTC-04:00', 1),
(140, 'Mauritania', 'MR', 'MRT', '222', '.mr', 'MRO', 'UTC', 1),
(141, 'Mauritius', 'MU', 'MUS', '230', '.mu', 'MUR', 'UTC+04:00', 1),
(142, 'Mayotte', 'YT', 'MYT', '262', '.yt', 'EUR', 'UTC+03:00', 1),
(143, 'Mexico', 'MX', 'MEX', '52', '.mx', 'MXN', 'UTC-08:00', 1),
(144, 'Micronesia (Federated States of)', 'FM', 'FSM', '691', '.fm', '', 'UTC+10:00', 1),
(145, 'Moldova (Republic of)', 'MD', 'MDA', '373', '.md', 'MDL', 'UTC+02:00', 1),
(146, 'Monaco', 'MC', 'MCO', '377', '.mc', 'EUR', 'UTC+01:00', 1),
(147, 'Mongolia', 'MN', 'MNG', '976', '.mn', 'MNT', 'UTC+07:00', 1),
(148, 'Montenegro', 'ME', 'MNE', '382', '.me', 'EUR', 'UTC+01:00', 1),
(149, 'Montserrat', 'MS', 'MSR', '1664', '.ms', 'XCD', 'UTC-04:00', 1),
(150, 'Morocco', 'MA', 'MAR', '212', '.ma', 'MAD', 'UTC', 1),
(151, 'Mozambique', 'MZ', 'MOZ', '258', '.mz', 'MZN', 'UTC+02:00', 1),
(152, 'Myanmar', 'MM', 'MMR', '95', '.mm', 'MMK', 'UTC+06:30', 1),
(153, 'Namibia', 'NA', 'NAM', '264', '.na', 'NAD', 'UTC+01:00', 1),
(154, 'Nauru', 'NR', 'NRU', '674', '.nr', 'AUD', 'UTC+12:00', 1),
(155, 'Nepal', 'NP', 'NPL', '977', '.np', 'NPR', 'UTC+05:45', 1),
(156, 'Netherlands', 'NL', 'NLD', '31', '.nl', 'EUR', 'UTC-04:00', 1),
(157, 'New Caledonia', 'NC', 'NCL', '687', '.nc', 'XPF', 'UTC+11:00', 1),
(158, 'New Zealand', 'NZ', 'NZL', '64', '.nz', 'NZD', 'UTC-11:00', 1),
(159, 'Nicaragua', 'NI', 'NIC', '505', '.ni', 'NIO', 'UTC-06:00', 1),
(160, 'Niger', 'NE', 'NER', '227', '.ne', 'XOF', 'UTC+01:00', 1),
(161, 'Nigeria', 'NG', 'NGA', '234', '.ng', 'NGN', 'UTC+01:00', 1),
(162, 'Niue', 'NU', 'NIU', '683', '.nu', 'NZD', 'UTC-11:00', 1),
(163, 'Norfolk Island', 'NF', 'NFK', '672', '.nf', 'AUD', 'UTC+11:30', 1),
(164, 'Northern Mariana Islands', 'MP', 'MNP', '1670', '.mp', 'USD', 'UTC+10:00', 1),
(165, 'Norway', 'NO', 'NOR', '47', '.no', 'NOK', 'UTC+01:00', 1),
(166, 'Oman', 'OM', 'OMN', '968', '.om', 'OMR', 'UTC+04:00', 1),
(167, 'Pakistan', 'PK', 'PAK', '92', '.pk', 'PKR', 'UTC+05:00', 1),
(168, 'Palau', 'PW', 'PLW', '680', '.pw', '(none', 'UTC+09:00', 1),
(169, 'Palestine, State of', 'PS', 'PSE', '970', '.ps', 'ILS', 'UTC+02:00', 1),
(170, 'Panama', 'PA', 'PAN', '507', '.pa', 'PAB', 'UTC-05:00', 1),
(171, 'Papua New Guinea', 'PG', 'PNG', '675', '.pg', 'PGK', 'UTC+10:00', 1),
(172, 'Paraguay', 'PY', 'PRY', '595', '.py', 'PYG', 'UTC-04:00', 1),
(173, 'Peru', 'PE', 'PER', '51', '.pe', 'PEN', 'UTC-05:00', 1),
(174, 'Philippines', 'PH', 'PHL', '63', '.ph', 'PHP', 'UTC+08:00', 1),
(175, 'Pitcairn', 'PN', 'PCN', '64', '.pn', 'NZD', 'UTC-08:00', 1),
(176, 'Poland', 'PL', 'POL', '48', '.pl', 'PLN', 'UTC+01:00', 1),
(177, 'Portugal', 'PT', 'PRT', '351', '.pt', 'EUR', 'UTC-01:00', 1),
(178, 'Puerto Rico', 'PR', 'PRI', '1787', '.pr', 'USD', 'UTC-04:00', 1),
(179, 'Qatar', 'QA', 'QAT', '974', '.qa', 'QAR', 'UTC+03:00', 1),
(180, 'Republic of Kosovo', 'XK', 'KOS', '383', '', 'EUR', 'UTC+01:00', 1),
(181, 'RÃ©union', 'RE', 'REU', '262', '.re', 'EUR', 'UTC+04:00', 1),
(182, 'Romania', 'RO', 'ROU', '40', '.ro', 'RON', 'UTC+02:00', 1),
(183, 'Russian Federation', 'RU', 'RUS', '7', '.ru', 'RUB', 'UTC+03:00', 1),
(184, 'Rwanda', 'RW', 'RWA', '250', '.rw', 'RWF', 'UTC+02:00', 1),
(185, 'Saint BarthÃ©lemy', 'BL', 'BLM', '590', '.bl', 'EUR', 'UTC-04:00', 1),
(186, 'Saint Helena, Ascension and Tristan da Cunha', 'SH', 'SHN', '290', '.sh', 'SHP', 'UTC+00:00', 1),
(187, 'Saint Kitts and Nevis', 'KN', 'KNA', '1869', '.kn', 'XCD', 'UTC-04:00', 1),
(188, 'Saint Lucia', 'LC', 'LCA', '1758', '.lc', 'XCD', 'UTC-04:00', 1),
(189, 'Saint Martin (French part)', 'MF', 'MAF', '590', '.mf', 'EUR', 'UTC-04:00', 1),
(190, 'Saint Pierre and Miquelon', 'PM', 'SPM', '508', '.pm', 'EUR', 'UTC-03:00', 1),
(191, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '1784', '.vc', 'XCD', 'UTC-04:00', 1),
(192, 'Samoa', 'WS', 'WSM', '685', '.ws', 'WST', 'UTC+13:00', 1),
(193, 'San Marino', 'SM', 'SMR', '378', '.sm', 'EUR', 'UTC+01:00', 1),
(194, 'Sao Tome and Principe', 'ST', 'STP', '239', '.st', 'STD', 'UTC', 1),
(195, 'Saudi Arabia', 'SA', 'SAU', '966', '.sa', 'SAR', 'UTC+03:00', 1),
(196, 'Senegal', 'SN', 'SEN', '221', '.sn', 'XOF', 'UTC', 1),
(197, 'Serbia', 'RS', 'SRB', '381', '.rs', 'RSD', 'UTC+01:00', 1),
(198, 'Seychelles', 'SC', 'SYC', '248', '.sc', 'SCR', 'UTC+04:00', 1),
(199, 'Sierra Leone', 'SL', 'SLE', '232', '.sl', 'SLL', 'UTC', 1),
(200, 'Singapore', 'SG', 'SGP', '65', '.sg', 'BND', 'UTC+08:00', 1),
(201, 'Sint Maarten (Dutch part)', 'SX', 'SXM', '1721', '.sx', 'ANG', 'UTC-04:00', 1),
(202, 'Slovakia', 'SK', 'SVK', '421', '.sk', 'EUR', 'UTC+01:00', 1),
(203, 'Slovenia', 'SI', 'SVN', '386', '.si', 'EUR', 'UTC+01:00', 1),
(204, 'Solomon Islands', 'SB', 'SLB', '677', '.sb', 'SBD', 'UTC+11:00', 1),
(205, 'Somalia', 'SO', 'SOM', '252', '.so', 'SOS', 'UTC+03:00', 1),
(206, 'South Africa', 'ZA', 'ZAF', '27', '.za', 'ZAR', 'UTC+02:00', 1),
(207, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', '500', '.gs', 'GBP', 'UTC-02:00', 1),
(208, 'South Korea', 'KR', 'KOR', '82', '.kr', 'KRW', 'UTC+09:00', 1),
(209, 'South Sudan', 'SS', 'SSD', '211', '.ss', 'SSP', 'UTC+03:00', 1),
(210, 'Spain', 'ES', 'ESP', '34', '.es', 'EUR', 'UTC', 1),
(211, 'Sri Lanka', 'LK', 'LKA', '94', '.lk', 'LKR', 'UTC+05:30', 1),
(212, 'Sudan', 'SD', 'SDN', '249', '.sd', 'SDG', 'UTC+03:00', 1),
(213, 'Suriname', 'SR', 'SUR', '597', '.sr', 'SRD', 'UTC-03:00', 1),
(214, 'Svalbard and Jan Mayen', 'SJ', 'SJM', '4779', '.sj', 'NOK', 'UTC+01:00', 1),
(215, 'Swaziland', 'SZ', 'SWZ', '268', '.sz', 'SZL', 'UTC+02:00', 1),
(216, 'Sweden', 'SE', 'SWE', '46', '.se', 'SEK', 'UTC+01:00', 1),
(217, 'Switzerland', 'CH', 'CHE', '41', '.ch', 'CHF', 'UTC+01:00', 1),
(218, 'Syrian Arab Republic', 'SY', 'SYR', '963', '.sy', 'SYP', 'UTC+02:00', 1),
(219, 'Taiwan', 'TW', 'TWN', '886', '.tw', 'TWD', 'UTC+08:00', 1),
(220, 'Tajikistan', 'TJ', 'TJK', '992', '.tj', 'TJS', 'UTC+05:00', 1),
(221, 'Tanzania, United Republic of', 'TZ', 'TZA', '255', '.tz', 'TZS', 'UTC+03:00', 1),
(222, 'Thailand', 'TH', 'THA', '66', '.th', 'THB', 'UTC+07:00', 1),
(223, 'Timor-Leste', 'TL', 'TLS', '670', '.tl', 'USD', 'UTC+09:00', 1),
(224, 'Togo', 'TG', 'TGO', '228', '.tg', 'XOF', 'UTC', 1),
(225, 'Tokelau', 'TK', 'TKL', '690', '.tk', 'NZD', 'UTC+13:00', 1),
(226, 'Tonga', 'TO', 'TON', '676', '.to', 'TOP', 'UTC+13:00', 1),
(227, 'Trinidad and Tobago', 'TT', 'TTO', '1868', '.tt', 'TTD', 'UTC-04:00', 1),
(228, 'Tunisia', 'TN', 'TUN', '216', '.tn', 'TND', 'UTC+01:00', 1),
(229, 'Turkey', 'TR', 'TUR', '90', '.tr', 'TRY', 'UTC+02:00', 1),
(230, 'Turkmenistan', 'TM', 'TKM', '993', '.tm', 'TMT', 'UTC+05:00', 1),
(231, 'Turks and Caicos Islands', 'TC', 'TCA', '1649', '.tc', 'USD', 'UTC-04:00', 1),
(232, 'Tuvalu', 'TV', 'TUV', '688', '.tv', 'AUD', 'UTC+12:00', 1),
(233, 'Uganda', 'UG', 'UGA', '256', '.ug', 'UGX', 'UTC+03:00', 1),
(234, 'Ukraine', 'UA', 'UKR', '380', '.ua', 'UAH', 'UTC+02:00', 1),
(235, 'United Arab Emirates', 'AE', 'ARE', '971', '.ae', 'AED', 'UTC+04', 1),
(236, 'United Kingdom of Great Britain and Northern Ireland', 'GB', 'GBR', '44', '.uk', 'GBP', 'UTC-08:00', 1),
(237, 'United States of America', 'US', 'USA', '1', '.us', 'USD', 'UTC-12:00', 1),
(238, 'Uruguay', 'UY', 'URY', '598', '.uy', 'UYU', 'UTC-03:00', 1),
(239, 'Uzbekistan', 'UZ', 'UZB', '998', '.uz', 'UZS', 'UTC+05:00', 1),
(240, 'Vanuatu', 'VU', 'VUT', '678', '.vu', 'VUV', 'UTC+11:00', 1),
(241, 'Venezuela (Bolivarian Republic of)', 'VE', 'VEN', '58', '.ve', 'VEF', 'UTC-04:00', 1),
(242, 'Viet Nam', 'VN', 'VNM', '84', '.vn', 'VND', 'UTC+07:00', 1),
(243, 'Wallis and Futuna', 'WF', 'WLF', '681', '.wf', 'XPF', 'UTC+12:00', 1),
(244, 'Western Sahara', 'EH', 'ESH', '212', '.eh', 'MAD', 'UTC+00:00', 1),
(245, 'Yemen', 'YE', 'YEM', '967', '.ye', 'YER', 'UTC+03:00', 1),
(246, 'Zambia', 'ZM', 'ZMB', '260', '.zm', 'ZMW', 'UTC+02:00', 1),
(247, 'Zimbabwe', 'ZW', 'ZWE', '263', '.zw', 'BWP', 'UTC+02:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `credit_card`
--

CREATE TABLE `credit_card` (
  `id` int(10) NOT NULL,
  `card_name` varchar(255) NOT NULL,
  `card_no` int(10) NOT NULL,
  `exp_month` varchar(255) NOT NULL,
  `exp_year` varchar(255) NOT NULL,
  `cvc` int(10) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `credit_card`
--

INSERT INTO `credit_card` (`id`, `card_name`, `card_no`, `exp_month`, `exp_year`, `cvc`, `user_id`) VALUES
(1, 'Fahad Mansoor', 540378209, '02/25', '', 929, 1),
(7, '12', 3232212, '12', '213', 123, 6),
(14, '12', 23232, '123', '213', 123, 6),
(15, '12', 2147483647, '123', '213', 123, 6),
(17, 'danishgoheer', 122323, '123', '213', 123, 6),
(18, 'danish', 42424242, '1212', '121', 123, 6),
(19, 'test', 2147483647, '12', '2012', 123, 40),
(20, 'test', 2147483647, '12', '2012', 123, 40),
(21, 'ew', 121212121, '12', '211', 123, 41);

-- --------------------------------------------------------

--
-- Table structure for table `demands`
--

CREATE TABLE `demands` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_type` text NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(100) NOT NULL,
  `subcategory` varchar(100) NOT NULL,
  `country` text NOT NULL,
  `city` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `image` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `demands`
--

INSERT INTO `demands` (`id`, `user_id`, `post_type`, `title`, `description`, `category`, `subcategory`, `country`, `city`, `status`, `image`, `timestamp`) VALUES
(6, 48, 'Product', 'sa', 's', 'Popular Music', '', 'UAE', 'Dubai', 0, '[\"demands_79_6.jpg\"]', '2021-10-14 21:00:45'),
(7, 56, 'Product', 'test dmand post', 'lorem ipsum', 'Technology & Electronics', 'Spare Parts & Accessories', 'UAE', 'Dubai', 0, '[\"demands_25_7.jpg\"]', '2021-10-18 18:01:15'),
(8, 56, 'Product', 'itxmkan', 'sslssmmsksmksksksk', 'Automotive', 'Spare Parts & Accessories', 'UAE', 'Dubai', 0, '[\"demands_616_8.jpg\",\"demands_151_8.jpg\",\"demands_639_8.jpg\"]', '2021-10-18 18:04:38'),
(9, 48, 'Product', 'check demand post', 'demand post', 'Pets & Animals', 'Other idle inventory', 'UAE', 'Dubai', 0, '[\"demands_868_9.jpg\"]', '2021-11-18 08:10:41'),
(10, 63, 'Product', 'chair', 'comfortable chair', 'Home & Office Furniture', 'Other Valuables, Art & Investments', 'UAE', 'Abu-Dhabi', 0, '[\"demands_449_10.jpg\"]', '2021-11-20 15:47:23'),
(11, 64, 'Product', 'wireless mouse', 'Bluetooth mouse', 'Technology & Electronics', '', 'UAE', 'Abu-Dhabi', 0, '[\"demands_547_11.jpg\"]', '2021-11-20 16:54:42'),
(12, 66, 'Product', 'arman demand11', 'arman demand description', 'Entertainment & Tourism', 'Movie Tickets', 'UAE', 'Dubai', 0, '[\"demands_876_12.jpg\",\"demands_581_12.jpg\"]', '2021-11-22 12:52:07');

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `devicePlatform` varchar(20) NOT NULL,
  `deviceRid` text NOT NULL,
  `deviceModel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `user_id`, `devicePlatform`, `deviceRid`, `deviceModel`) VALUES
(1, 16, 'Android', 'ehJbswG1RRamT7nlveg1hF:APA91bEML4jTE2HJhhuZNGPLnDWFOZcS3pb894n27eji-yRI0fVLBZmXtBGsSEuUIwwZxVntyOxX9FGydwnrxvbVe-fYfG2-4yRgj6VOQ7nhhsUzmQtr1T-WAAGXXWs8cucPW9HEFNh1', 'sdk_gphone_x86_arm'),
(2, 17, 'Android', 'ceu3bsFvR2KhDADA6JXMpg:APA91bEqXka38odzqn6kqPDS5vESAPulTj4Vi5fyTi05rzS0fWwonHPPhyDk1TVb58iNZk6TH-5sq9GV9XA0acyN3c6g6YVnxST37xgYncEMAQD_P4PJafzW2mJY5Ivn1eKD8lo6uFLS', 'SM-G975U'),
(3, 17, 'Android', 'ceu3bsFvR2KhDADA6JXMpg:APA91bEqXka38odzqn6kqPDS5vESAPulTj4Vi5fyTi05rzS0fWwonHPPhyDk1TVb58iNZk6TH-5sq9GV9XA0acyN3c6g6YVnxST37xgYncEMAQD_P4PJafzW2mJY5Ivn1eKD8lo6uFLS', 'SM-G975U'),
(4, 18, 'Android', 'ceu3bsFvR2KhDADA6JXMpg:APA91bEqXka38odzqn6kqPDS5vESAPulTj4Vi5fyTi05rzS0fWwonHPPhyDk1TVb58iNZk6TH-5sq9GV9XA0acyN3c6g6YVnxST37xgYncEMAQD_P4PJafzW2mJY5Ivn1eKD8lo6uFLS', 'SM-G975U'),
(5, 19, 'Android', 'ceu3bsFvR2KhDADA6JXMpg:APA91bEqXka38odzqn6kqPDS5vESAPulTj4Vi5fyTi05rzS0fWwonHPPhyDk1TVb58iNZk6TH-5sq9GV9XA0acyN3c6g6YVnxST37xgYncEMAQD_P4PJafzW2mJY5Ivn1eKD8lo6uFLS', 'SM-G975U'),
(6, 23, 'Android', 'fgp9SVw3TjG_X3NUwisVVs:APA91bFPqPcFFwOa8_AHlcE3wfxfj5IzKzwOr0fRxq2jYRAM4iNP_Kxy3_xYcwhjzgZQuIUVbMZx8B1iCW6kTFuN1TbkKQ4iPP-tLOLga1vZ3osNwdvQkUmerSck-WVw88F1JuQHujfD', 'SM-G975U'),
(7, 23, 'Android', 'fgp9SVw3TjG_X3NUwisVVs:APA91bFPqPcFFwOa8_AHlcE3wfxfj5IzKzwOr0fRxq2jYRAM4iNP_Kxy3_xYcwhjzgZQuIUVbMZx8B1iCW6kTFuN1TbkKQ4iPP-tLOLga1vZ3osNwdvQkUmerSck-WVw88F1JuQHujfD', 'SM-G975U'),
(8, 24, 'Android', 'fgp9SVw3TjG_X3NUwisVVs:APA91bFPqPcFFwOa8_AHlcE3wfxfj5IzKzwOr0fRxq2jYRAM4iNP_Kxy3_xYcwhjzgZQuIUVbMZx8B1iCW6kTFuN1TbkKQ4iPP-tLOLga1vZ3osNwdvQkUmerSck-WVw88F1JuQHujfD', 'SM-G975U'),
(9, 26, 'Android', 'f4JMVw6xT3yo88qEx1ROng:APA91bGAENGlbK9xkpAgdiJgSWCNt3TkxSPLwM-nzOay_GFdXEK0O4OLDAvPC_-0LuNCDQF5sX-LKW7a6xRFPiR5TRwEhkdhMjzxBgelO3_ll3lhpBc6LXtFXPGAKqtLlV_JK-i4zC2y', 'sdk_gphone_x86_arm'),
(10, 26, 'Android', 'f4JMVw6xT3yo88qEx1ROng:APA91bGAENGlbK9xkpAgdiJgSWCNt3TkxSPLwM-nzOay_GFdXEK0O4OLDAvPC_-0LuNCDQF5sX-LKW7a6xRFPiR5TRwEhkdhMjzxBgelO3_ll3lhpBc6LXtFXPGAKqtLlV_JK-i4zC2y', 'sdk_gphone_x86_arm'),
(11, 30, 'Android', 'f0OaiwFxQF6QQYtC57zolo:APA91bFWkEqEfJv-5qKRWw5Uu55Mu44uvEi0UmIgdc9Zgva6vNu7iST3thT9gJhBzWdJI379pb79WuaNUD6tZGdRzvIlKodqrWKUM3GXF5_rExiPVVcHCOpXUI12EEG9-5sdwNxVvQ9W', 'SM-A505F'),
(12, 31, 'Android', 'cJCNFnlUQrijchUWmMjpP7:APA91bEks_PMvtDjovA4tuV84mpJP8ulQVDM07SEnEJZ6DQt17F6Ks1JUGzm10qk3sYkYuw8kZBf684ERL_n8fpLd4MnsNNVUAkO8pmk9aEbpuU4ICaJNmTguxB61mIviboqaOIFBKa-', 'SM-G975U'),
(13, 32, 'Android', 'evWCMYiUSSKIh4N8hfuf4P:APA91bHo6yc-0sxq0S1v_jlgj9kTVlgv9GVl5NBi7meMd2cZj44PCwtothF3hbDzSR8u4GLTrgz6rjTnZl4hlwn09RiG_O4mknTNqLFRTnnLs0-n6CmhGswPuPxXYvmBP2R4maHb0WUn', 'Infinix X690B'),
(14, 36, 'Android', 'd7PmTbf1RzmA5K9oPBM9g9:APA91bHtyQ-v_ICMSwIhODfsBsYqZGXPLOYGJl8TLuQvh0OQ111fIsEI7Jj85kwkFMJs9uRNFuIQdLO8avV1m5XHkcH7ZMon1YUht9zWL13L4SlqQD7vYKbo9uus4gyWO5SkWitYNZT0', 'vivo 1901'),
(15, 39, 'iOS', 'c2sv1ttt3UIbgQO03iF17N:APA91bECqizF5Oa_HuKDqXqPLMi4B20FIR8cMAqhSErnGcue97BDZXseXchLu7lZdYlP4mcF4l8XokKW3RhB_JXIKcEZn4oze9Qwnvnx8PSlFC8fnABkVrHMMDjBYK2hDNgcimQBxnSt', 'iPhone12,1'),
(16, 40, 'iOS', 'c2sv1ttt3UIbgQO03iF17N:APA91bECqizF5Oa_HuKDqXqPLMi4B20FIR8cMAqhSErnGcue97BDZXseXchLu7lZdYlP4mcF4l8XokKW3RhB_JXIKcEZn4oze9Qwnvnx8PSlFC8fnABkVrHMMDjBYK2hDNgcimQBxnSt', 'iPhone12,1'),
(17, 0, 'Android', 'dlLhUYajRLuoPFzGM18wZY:APA91bEKzHH6NEK-haL0hnEy9SiG5DO97xf_LNKRBSx7dGaQ0lKHhnOgOng9Ud-B1O7tR6-AjvAJHK_486wVpXZcPvcOjrgSedBxyLWm7dtyE0M9YJANvAsNEkIlXSXbJRpIQA-2JQD-', 'sdk_gphone_x86_arm'),
(18, 0, 'Android', 'dlLhUYajRLuoPFzGM18wZY:APA91bEKzHH6NEK-haL0hnEy9SiG5DO97xf_LNKRBSx7dGaQ0lKHhnOgOng9Ud-B1O7tR6-AjvAJHK_486wVpXZcPvcOjrgSedBxyLWm7dtyE0M9YJANvAsNEkIlXSXbJRpIQA-2JQD-', 'sdk_gphone_x86_arm'),
(19, 59, 'Android', 'fSjnGuY4T1OYsw5N7Y4GbJ:APA91bHy239BpIqN01oxvTeds1oMolLltjl8bc9xs60oAgL23GRp2NUC3TXXj0l-X5s5cybC7wUgenjCKXWFKnkOimluzwtS3NC5Bd-e8XK0ly4uftHk-3HNaIy4LlaScK40NqbhjXaY', 'sdk_gphone_x86_arm'),
(20, 59, 'Android', 'fSjnGuY4T1OYsw5N7Y4GbJ:APA91bHy239BpIqN01oxvTeds1oMolLltjl8bc9xs60oAgL23GRp2NUC3TXXj0l-X5s5cybC7wUgenjCKXWFKnkOimluzwtS3NC5Bd-e8XK0ly4uftHk-3HNaIy4LlaScK40NqbhjXaY', 'sdk_gphone_x86_arm'),
(21, 59, 'Android', 'fSjnGuY4T1OYsw5N7Y4GbJ:APA91bHy239BpIqN01oxvTeds1oMolLltjl8bc9xs60oAgL23GRp2NUC3TXXj0l-X5s5cybC7wUgenjCKXWFKnkOimluzwtS3NC5Bd-e8XK0ly4uftHk-3HNaIy4LlaScK40NqbhjXaY', 'sdk_gphone_x86_arm'),
(22, 59, 'Android', 'fSjnGuY4T1OYsw5N7Y4GbJ:APA91bHy239BpIqN01oxvTeds1oMolLltjl8bc9xs60oAgL23GRp2NUC3TXXj0l-X5s5cybC7wUgenjCKXWFKnkOimluzwtS3NC5Bd-e8XK0ly4uftHk-3HNaIy4LlaScK40NqbhjXaY', 'sdk_gphone_x86_arm'),
(23, 60, 'Android', 'eNjSLhjAQKqcJXcS43_QVz:APA91bEbEXxatlKMirzzXdn5ABBKQQ_4t2ezyz-I9XmvkcTrHCoufy3dpBQ-2f27VreFGbpoyOArcak33RMlQOWfg-qmavhUznjQxIqFwH5STqtA4Kz4HMWkTmDSmQD1a3TMRcU9CUKS', 'sdk_gphone_x86_arm'),
(24, 0, 'Android', 'dlXJg75vReWXgnFP-kBegX:APA91bFTYyNP31M3tLwF-LxEFHCgLlog8HYyc5mUKydWra9gmMQiMVL9PutwaZEz9J2RLbZPXqb5ugzlQ51VDIqL-SdAk-CjbOI7_jf17Iln-Jzl8LfLyC1nDAf5PjEfH7aDbdCC-1CZ', 'sdk_gphone_x86_arm'),
(25, 112, 'Android', 'dPACbP_VSba_ztWcaGZNTa:APA91bGA3o4TnyUGjKvkDk_BF6vx7345rErYQmy2e6IGiST-yh_eGUjGlYPKcl4Lg3bUfh4kq3m49xj0Bt0aHlp1laisPluXl_ueH095Fs47xsSW6PcpXfYA00kPxqYmK9WUVbFSa2Cf', 'G8141'),
(26, 112, 'Android', 'dPACbP_VSba_ztWcaGZNTa:APA91bGA3o4TnyUGjKvkDk_BF6vx7345rErYQmy2e6IGiST-yh_eGUjGlYPKcl4Lg3bUfh4kq3m49xj0Bt0aHlp1laisPluXl_ueH095Fs47xsSW6PcpXfYA00kPxqYmK9WUVbFSa2Cf', 'G8141'),
(27, 113, 'Android', 'frGQhJ0DQMmii8fsV9ORLD:APA91bFbwL6_ZN8fUsFkJFFRQzKUYqVkumu6owfgDRPem9shtyjAFZP6wBljS_4IRTto-gBU2_FH9jdxRGO1JaewmRo8vIhifFjzfgHdeTI9BhrzjRDPoELc_sVMYeTNSev5cEAurkEA', 'SM-N975F'),
(28, 113, 'Android', 'frGQhJ0DQMmii8fsV9ORLD:APA91bFbwL6_ZN8fUsFkJFFRQzKUYqVkumu6owfgDRPem9shtyjAFZP6wBljS_4IRTto-gBU2_FH9jdxRGO1JaewmRo8vIhifFjzfgHdeTI9BhrzjRDPoELc_sVMYeTNSev5cEAurkEA', 'SM-N975F'),
(29, 114, 'Android', 'dPACbP_VSba_ztWcaGZNTa:APA91bGA3o4TnyUGjKvkDk_BF6vx7345rErYQmy2e6IGiST-yh_eGUjGlYPKcl4Lg3bUfh4kq3m49xj0Bt0aHlp1laisPluXl_ueH095Fs47xsSW6PcpXfYA00kPxqYmK9WUVbFSa2Cf', 'G8141'),
(30, 115, 'Android', 'dPACbP_VSba_ztWcaGZNTa:APA91bGA3o4TnyUGjKvkDk_BF6vx7345rErYQmy2e6IGiST-yh_eGUjGlYPKcl4Lg3bUfh4kq3m49xj0Bt0aHlp1laisPluXl_ueH095Fs47xsSW6PcpXfYA00kPxqYmK9WUVbFSa2Cf', 'G8141'),
(31, 116, 'Android', 'dUAIYCVdSkyObmKfpJiG2P:APA91bHT_7YbU8bLln7FtB1Xq2qZgV8zVz5TnrTnyJYuYX0WN6AKPZbe0lFKUKP4ugapi-uW4TVtNfGYLX6fgf6hEpYREsZb5kX9BHYiJ0PV7i2YKBh_IqcYNPL0VaAC4aSs5cfJy7mX', 'SM-N975F'),
(32, 116, 'Android', 'dUAIYCVdSkyObmKfpJiG2P:APA91bHT_7YbU8bLln7FtB1Xq2qZgV8zVz5TnrTnyJYuYX0WN6AKPZbe0lFKUKP4ugapi-uW4TVtNfGYLX6fgf6hEpYREsZb5kX9BHYiJ0PV7i2YKBh_IqcYNPL0VaAC4aSs5cfJy7mX', 'SM-N975F'),
(33, 117, 'Android', 'cjgh-NcCQ7WdygUVqd_1yq:APA91bEgGyUBKv7OeKtsmz0A7HEypR23i4WYe21a6a4wMZwh2nE0Pgy8-XeBvtpAHM2BQ4Viza7rYkMtYfRmKR4IqcYryTC0jWaxylcvFgtGVoi0ygXF-eSP5AUoHla5jda270q4Pfy7', 'SM-N975F'),
(34, 117, 'Android', 'cjgh-NcCQ7WdygUVqd_1yq:APA91bEgGyUBKv7OeKtsmz0A7HEypR23i4WYe21a6a4wMZwh2nE0Pgy8-XeBvtpAHM2BQ4Viza7rYkMtYfRmKR4IqcYryTC0jWaxylcvFgtGVoi0ygXF-eSP5AUoHla5jda270q4Pfy7', 'SM-N975F');

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `like_type` varchar(20) NOT NULL,
  `status` enum('like','dislike') NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`id`, `user_id`, `to_id`, `like_type`, `status`, `datetime`) VALUES
(80, 90, 96, 'listing', 'like', '2022-07-07 09:23:02'),
(82, 114, 94, 'listing', 'like', '2022-07-07 13:09:45'),
(83, 128, 94, 'listing', 'like', '2022-07-13 20:57:04'),
(84, 148, 94, 'listing', 'like', '2022-08-27 05:19:24'),
(85, 170, 94, 'listing', 'like', '2022-09-15 19:46:33'),
(86, 170, 103, 'listing', 'like', '2022-09-15 19:46:35'),
(87, 141, 94, 'listing', 'like', '2022-10-11 13:51:54'),
(88, 172, 97, 'listing', 'like', '2022-10-15 11:48:05'),
(91, 179, 115, 'listing', 'like', '2023-01-14 11:42:07'),
(92, 179, 116, 'listing', 'like', '2023-01-14 11:42:10'),
(97, 182, 119, 'listing', 'like', '2023-01-22 20:03:21'),
(98, 182, 125, 'listing', 'like', '2023-01-22 20:03:34'),
(103, 183, 102, 'listing', 'like', '2023-01-27 09:34:33'),
(106, 184, 119, 'listing', 'like', '2023-01-27 10:44:37'),
(108, 184, 124, 'listing', 'like', '2023-01-27 10:44:43'),
(109, 184, 120, 'listing', 'like', '2023-01-27 10:44:45'),
(116, 48, 124, 'listing', 'like', '2023-01-27 11:53:30'),
(117, 186, 124, 'listing', 'like', '2023-02-02 03:15:26'),
(118, 186, 126, 'listing', 'like', '2023-02-02 03:15:36'),
(119, 187, 124, 'listing', 'like', '2023-02-10 10:09:21');

-- --------------------------------------------------------

--
-- Table structure for table `help`
--

CREATE TABLE `help` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `email` varchar(150) NOT NULL,
  `message` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ledger`
--

CREATE TABLE `ledger` (
  `id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `txn_type` enum('debit','credit','swap') NOT NULL,
  `trade_id` int(11) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `amount` double NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ledger`
--

INSERT INTO `ledger` (`id`, `from_id`, `to_id`, `txn_type`, `trade_id`, `detail`, `amount`, `timestamp`) VALUES
(1, 48, 58, 'swap', 11, 'Swap with item abd', 40, '2021-11-17 11:31:52'),
(2, 55, 48, 'credit', 0, 'balance added', 48, '2021-11-17 11:30:03');

-- --------------------------------------------------------

--
-- Table structure for table `listing`
--

CREATE TABLE `listing` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `estate_type` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `asking_price` int(11) NOT NULL,
  `omv_price` double NOT NULL,
  `price_range` varchar(50) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `estimated_date` varchar(100) NOT NULL,
  `year_built` year(4) NOT NULL,
  `parking` varchar(20) NOT NULL,
  `lot_size` varchar(50) NOT NULL,
  `home_sqft` varchar(50) NOT NULL,
  `baths` int(11) NOT NULL,
  `beds` int(11) NOT NULL,
  `water_source` varchar(50) NOT NULL,
  `hoa_fees` varchar(50) NOT NULL,
  `condo` varchar(20) NOT NULL,
  `flooding` varchar(20) NOT NULL,
  `renovation` text NOT NULL,
  `renovations` varchar(20) NOT NULL,
  `lead` varchar(20) NOT NULL,
  `fires` varchar(20) NOT NULL,
  `generator` varchar(10) NOT NULL,
  `sewer_source` varchar(10) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `lat` varchar(20) NOT NULL,
  `lng` varchar(20) NOT NULL,
  `image` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `listing`
--

INSERT INTO `listing` (`id`, `user_id`, `estate_type`, `description`, `asking_price`, `omv_price`, `price_range`, `unit`, `estimated_date`, `year_built`, `parking`, `lot_size`, `home_sqft`, `baths`, `beds`, `water_source`, `hoa_fees`, `condo`, `flooding`, `renovation`, `renovations`, `lead`, `fires`, `generator`, `sewer_source`, `city`, `state`, `address`, `lat`, `lng`, `image`, `status`, `created_at`, `timestamp`) VALUES
(119, 169, 'Single Family Home', '', 0, 0, '50000k-1500000k', 'Sqft', 'Within 1 Year', 2008, 'garage', '2880', '1200', 2, 2, 'Town Water', '500', 'No', 'No', '[\"Bedroom\",\"Kitchen\"]', 'No', 'No', 'No', 'No', 'Septic Sys', 'MA', 'Massachusetts, United States', '204 Humboldt Ave, Boston, MA 02121, USA', '42.3125672', '-71.0898796', '[\"listing_407_119.jpg\"]', 0, '2022-09-15 16:23:36', '2023-01-14 12:17:07'),
(120, 170, 'Single Family Home', '', 0, 0, '50000k-2722683k', 'Sqft', '1-3 Months', 1980, 'no parking available', '28000', '2586', 1, 1, 'Well Water', '600', 'No', 'No', '[\"Bedroom\",\"Kitchen\"]', 'yes', 'yes', 'yes', 'yes', 'Other', 'New Jersey', 'Ocean County, New Jersey', 'Adams Zenith College, N.J B/Stop, Off N..J Street, Odan-Otun, Ogun State, Jackson Township, NJ 08527', '40.0583238', '-74.4056612', '[\"listing_604_120.jpg\"]', 0, '2022-09-15 18:18:13', '2023-01-14 12:17:09'),
(121, 171, 'Multi Family Home', '', 0, 0, '50k-1500k', 'acreage', '1-3 Months', 2012, 'street parking', '22', '66', 1, 1, 'Town Water', '66', 'Yes', 'yes', '[\"Bedroom\",\"Kitchen\"]', 'yes', 'yes', 'yes', 'yes', 'Town Sewer', 'Alipur Chatha', 'Gujranwala, Punjab', 'mohallah mehboor pura, 7R86+5X5, Alipur Chatha, Gujranwala, Punjab, Pakistan', '32.2653772', '73.8124984', '[\"listing_471_121.jpg\"]', 0, '2022-10-13 18:06:32', '2023-01-14 12:17:10'),
(122, 172, 'Single Family Home', '', 0, 0, '419152k-838644k', 'Sqft', 'Within 1 Year', 2016, 'driveway', '5800', '2108', 1, 2, 'Well Water', '0', 'No', 'yes', '[\"Bedroom\",\"Kitchen\"]', 'yes', 'yes', 'yes', 'yes', 'Town Sewer', 'MA', 'Massachusetts, United States', '2 City Hall Square, Boston, MA 02203, USA', '42.3600825', '-71.0588801', '[\"listing_860_122.jpg\"]', 0, '2022-10-15 11:41:14', '2023-01-14 12:17:05'),
(123, 172, 'Single Family Home', '', 0, 0, '50000k-1500000k', 'Sqft', '3-6 Months', 0000, 'driveway', '288', '255', 1, 2, 'Town Water', '0', 'Yes', 'yes', '[\"Bedroom\",\"Kitchen\"]', 'yes', 'yes', 'yes', 'yes', 'Septic Sys', 'MA', 'Massachusetts, United States', '2 City Hall Square, Boston, MA 02203, USA', '42.3600825', '-71.0588801', '[\"listing_639_123.jpg\"]', 0, '2022-10-15 11:47:54', '2023-01-14 12:16:57'),
(124, 173, 'Single Family Home', '', 0, 0, '50000k-1500000k', 'Sqft', '3-6 Months', 0000, 'street parking', '50080', '2580', 1, 2, 'Town Water', '836', 'Yes', 'No', '[\"Bedroom\",\"Kitchen\"]', 'No', 'No', 'No', 'No', 'Septic Sys', 'NH', 'New Hampshire, United States', '180 Bridge St, Manchester, NH 03104, USA', '42.9956397', '-71.4547891', '[\"listing_676_124.jpg\"]', 0, '2022-10-15 11:56:05', '2023-01-14 12:16:26'),
(125, 181, 'Single Family Home', '', 0, 0, '50k-1500k', 'Sqft', '1-3 Months', 0000, 'street parking', '646', '55', 1, 1, 'Town Water', '25', 'Yes', 'yes', '[\"Addition\",\"Kitchen\"]', 'yes', 'yes', 'yes', 'yes', 'Town Sewer', 'West Bengal', 'West Bengal, India', 'At.po Alipore via Bilimora Taluka, Chikhli Distric Navsari Diwan Street, G8PJ+RM7, Alipur Zoological', '22.5370343', '88.33166969999999', '[\"listing_913_125.jpg\"]', 0, '2023-01-14 12:13:55', '2023-01-14 12:15:23'),
(126, 182, 'Single Family Home', '', 0, 0, '50000k-3221356k', 'Sqft', '3-6 Months', 0000, 'street parking', '28000', '2500', 1, 2, 'Town Water', '0', 'Yes', 'yes', '[\"Floors\"]', 'yes', 'yes', 'yes', 'yes', 'Septic Sys', 'MA', 'Massachusetts, United States', '2 City Hall Square, Boston, MA 02203, USA', '42.3600825', '-71.0588801', '[\"listing_781_126.jpg\"]', 0, '2023-01-22 20:01:50', '2023-01-22 20:01:50'),
(127, 183, 'Multi Family Home', '', 0, 0, '50k-1500k', 'Sqft', '1-3 Months', 2005, 'street parking', '646', '45', 1, 1, 'Town Water', '66', 'No', 'yes', '[\"Addition\",\"Kitchen\"]', 'yes', 'No', 'yes', 'yes', 'Town Sewer', 'West Bengal', 'West Bengal, India', 'At.po Alipore via Bilimora Taluka, Chikhli Distric Navsari Diwan Street, G8PJ+RM7, Alipur Zoological', '22.5370343', '88.33166969999999', '[\"listing_653_127.jpg\"]', 0, '2023-01-27 07:38:32', '2023-01-27 07:38:32'),
(128, 188, 'Single Family Home', '', 0, 0, '50k-1500k', 'acreage', '1-3 Months', 1998, 'street parking', '616', '545', 1, 1, 'Well Water', '515', 'Yes', 'yes', '[\"Addition\",\"Kitchen\"]', 'yes', 'yes', 'No', 'yes', 'Town Sewer', 'Gujranwala', 'Gujranwala, Punjab', '3 Allah Wala Bazar, Madina Colony Fatomand, Gujranwala, Punjab, Pakistan', '32.1876919', '74.1944529', '[\"listing_297_128.jpg\"]', 0, '2023-02-04 07:27:54', '2023-02-04 07:27:54'),
(129, 190, 'Single Family Home', '', 0, 0, '50000k-3998813k', 'Sqft', '3-6 Months', 2012, 'street parking', '12', '1', 1, 1, 'Town Water', '12', 'Yes', 'yes', '[\"Bathroom\"]', 'yes', 'yes', 'yes', 'yes', 'Town Sewer', 'Faisalabad', 'Punjab, Pakistan', '126 Street Number 6, Malikpur, Faisalabad, Punjab 38000, Pakistan', '31.45036619999999', '73.13496049999999', '[\"listing_458_129.jpg\"]', 0, '2023-02-10 10:16:14', '2023-02-10 10:16:14'),
(130, 195, 'Single Family Home', '.258', 0, 0, '50000-435932', 'Sqft', '3-6 Months', 2005, 'driveway', '20000', '2100', 2, 2, 'Well Water', '250', 'Yes', 'yes', '[\"Kitchen\",\"Bedroom\",\"Basement\",\"Floors\"]', 'yes', 'yes', 'yes', 'yes', 'Town Sewer', 'MA', 'Massachusetts, United States', '1 Broad St, Bridgewater, MA 02324, USA', '41.9903519', '-70.9750541', '[\"listing_296_130.jpg\"]', 0, '2023-02-11 21:11:57', '2023-02-11 21:11:57'),
(131, 196, 'Single Family Home', '855', 0, 0, '50000-1500000', 'Sqft', '1-3 Months', 2001, 'street parking', '12', '1', 4, 1, 'Town Water', '9', 'Yes', 'yes', '[\"Bathroom\"]', 'yes', 'yes', 'yes', 'yes', 'Town Sewer', 'Haryana', 'Haryana, India', 'C859+H47, ADB PWD Colony, Sector 16A, Faridabad, Haryana 121002, India', '28.4089123', '77.3177894', '[\"listing_478_131.jpg\"]', 0, '2023-02-13 11:09:27', '2023-02-13 11:09:27'),
(132, 196, 'Single Family Home', '777', 0, 0, '50000-2181017', 'Sqft', '1-3 Months', 2004, 'street parking', '12', '11', 3, 2, 'Well Water', '1', 'Yes', 'yes', '[\"Bathroom\"]', 'yes', 'yes', 'yes', 'yes', 'Septic Sys', 'Faisalabad', 'Punjab, Pakistan', '126 Street Number 6, Malikpur, Faisalabad, Punjab 38000, Pakistan', '31.45036619999999', '73.13496049999999', '[\"listing_576_132.jpg\"]', 0, '2023-02-17 10:59:22', '2023-02-17 10:59:22');

-- --------------------------------------------------------

--
-- Table structure for table `login_report`
--

CREATE TABLE `login_report` (
  `id` int(11) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `user_agent` varchar(150) NOT NULL,
  `u_timezone` varchar(10) NOT NULL,
  `u_res` varchar(15) NOT NULL,
  `datetime` datetime NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) NOT NULL,
  `from_id` int(11) NOT NULL,
  `notification` varchar(255) NOT NULL,
  `user_id` int(10) NOT NULL,
  `listing_id` int(11) NOT NULL,
  `type` enum('sent','received','accepted','') NOT NULL,
  `seen` tinyint(1) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `from_id`, `notification`, `user_id`, `listing_id`, `type`, `seen`, `timestamp`) VALUES
(1, 90, 'new offer received', 91, 97, 'sent', 0, '2022-06-21 11:03:07');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `listing_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `offer_kind` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `reason` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `user_id`, `listing_id`, `amount`, `payment_type`, `offer_kind`, `status`, `reason`, `timestamp`) VALUES
(6, 56, 0, 0, '', '', 0, '', '2021-11-13 09:36:04'),
(7, 56, 0, 0, '', '', 0, '', '2021-11-13 09:36:04'),
(8, 56, 0, 0, '', '', 0, '', '2021-11-13 09:36:04'),
(9, 48, 0, 0, '', '', 0, '', '2021-11-15 19:48:36'),
(10, 55, 0, 0, '', '', 0, '', '2021-11-13 09:36:04'),
(11, 58, 0, 0, '', '', 0, '', '2021-11-15 09:37:47'),
(12, 48, 0, 0, '', '', 0, '', '2021-11-15 20:45:07'),
(13, 58, 0, 0, '', '', 0, '', '2021-11-15 09:37:47'),
(14, 61, 0, 0, '', '', 0, '', '2021-11-16 18:30:36'),
(15, 59, 0, 0, '', '', 0, '', '2021-11-18 07:20:27'),
(16, 48, 0, 0, '', '', 0, '', '2021-11-18 08:11:26'),
(17, 63, 0, 0, '', '', 0, '', '2021-11-20 10:55:54'),
(18, 63, 0, 0, '', '', 0, '', '2021-11-20 15:29:23'),
(19, 63, 0, 0, '', '', 0, '', '2021-11-20 15:31:50'),
(20, 64, 0, 0, '', '', 0, '', '2021-11-20 16:51:27'),
(21, 63, 0, 0, '', '', 0, '', '2021-11-20 17:01:10'),
(22, 64, 0, 0, '', '', 0, '', '2021-11-20 17:29:21'),
(23, 63, 0, 0, '', '', 1, '', '2022-07-02 15:49:42'),
(24, 65, 0, 0, '', '', 0, '', '2021-11-21 04:15:32'),
(25, 66, 0, 0, '', '', 0, '', '2021-11-22 09:26:27'),
(26, 66, 0, 0, '', '', 0, '', '2021-11-22 13:32:56'),
(27, 1, 1, 0, '', '', 0, '', '2022-06-15 09:11:35'),
(28, 88, 94, 500, 'Cash', 'Buy As Is', 0, '', '2022-06-17 10:58:15'),
(29, 88, 94, 500, 'Cash', 'Buy As Is', 1, '', '2022-07-02 15:46:20'),
(30, 89, 94, 500, 'Finance', 'Buy As Is', 2, '', '2022-07-02 15:47:44'),
(31, 89, 97, 59, 'Finance', 'Let\'s Connect First!', 1, '', '2022-07-02 15:44:36'),
(32, 101, 97, 4588, 'Finance', 'Let\'s Connect First!', 0, '', '2022-07-06 05:50:48'),
(33, 114, 94, 55, 'Cash', 'Let\'s Connect First!', 1, '', '2022-07-07 13:19:29'),
(34, 125, 94, 23, 'Cash', 'Buy As Is', 0, '', '2022-07-13 15:10:07'),
(35, 125, 94, 23, 'Cash', 'Buy As Is', 0, '', '2022-07-13 15:10:08'),
(36, 129, 94, 255888, 'Cash', 'Pending Inspection', 0, '', '2022-07-14 01:51:02'),
(37, 109, 94, 899, 'Cash', 'Let\'s Connect First!', 0, '', '2022-07-14 06:00:21'),
(38, 90, 94, 200, 'Cash', 'Let\'s Connect First!', 0, '', '2022-07-14 06:19:17'),
(39, 129, 103, 508880, 'Cash', 'Pending Inspection', 0, '', '2022-07-21 13:56:09'),
(40, 129, 103, 508880, 'Cash', 'Pending Inspection', 0, '', '2022-07-21 13:56:10'),
(41, 129, 94, 250000, 'Finance', 'Let\'s Connect First!', 0, '', '2022-07-24 09:32:41'),
(42, 148, 97, 5484484848, 'Finance', 'Buy As Is', 1, '', '2022-08-27 05:22:28'),
(43, 151, 97, 0, 'Cash', 'Buy As Is', 0, '', '2022-08-31 09:50:20'),
(44, 150, 97, 23, 'Cash', 'Buy As Is', 0, '', '2022-08-31 10:00:00'),
(45, 172, 97, 280000, 'Finance', 'Let\'s Connect First!', 0, '', '2022-10-15 11:49:57'),
(46, 179, 124, 155, 'Finance', 'Let\'s Connect First!', 0, '', '2023-01-14 11:43:44'),
(47, 182, 124, 250000, 'Finance', 'Let\'s Connect First!', 1, '', '2023-01-23 01:47:30'),
(48, 184, 124, 6464, 'Cash', 'Buy As Is', 0, '', '2023-01-27 09:45:00'),
(49, 184, 124, 655, 'Cash', 'Buy As Is', 1, '', '2023-01-27 13:35:45'),
(50, 184, 124, 655, 'Cash', 'Buy As Is', 1, '', '2023-01-27 13:35:39'),
(51, 195, 122, 50000, 'Cash', 'Buy As Is', 1, '', '2023-02-12 01:42:58');

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` int(11) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `code` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`id`, `user_id`, `code`, `timestamp`) VALUES
(1, '32', 123456, '2021-03-26 13:22:09'),
(2, '33', 123456, '2021-03-30 10:08:41'),
(3, '34', 123456, '2021-03-30 10:21:53'),
(4, '35', 123456, '2021-03-30 10:23:28'),
(5, '1', 123456, '2021-03-30 11:16:03'),
(6, '1', 123456, '2021-03-30 11:28:22'),
(7, '1', 123456, '2021-03-30 11:28:30'),
(8, '1', 123456, '2021-03-30 11:43:50'),
(9, '36', 123456, '2021-03-30 12:59:31'),
(10, '36', 123456, '2021-03-30 12:59:47'),
(11, '37', 123456, '2021-04-07 12:53:47'),
(12, '37', 123456, '2021-04-07 12:54:34'),
(13, '38', 123456, '2021-04-07 20:02:02'),
(14, '39', 123456, '2021-04-07 20:04:59'),
(15, '40', 123456, '2021-04-07 20:10:09'),
(16, '41', 123456, '2021-04-07 20:51:22'),
(17, '42', 123456, '2021-04-07 20:55:34'),
(18, '43', 123456, '2021-04-07 21:11:12'),
(19, '44', 123456, '2021-04-09 15:01:07'),
(20, '45', 123456, '2021-04-10 21:27:02'),
(21, '46', 445184, '2021-04-16 16:34:51'),
(22, '47', 283214, '2021-04-16 16:37:09'),
(23, '48', 373693, '2021-04-16 16:39:12'),
(24, '49', 667582, '2021-04-16 16:41:30'),
(25, '50', 794182, '2021-04-16 18:59:18'),
(26, '51', 687802, '2021-04-16 19:16:33'),
(27, '52', 346910, '2021-04-16 19:17:22'),
(28, '53', 822320, '2021-04-16 19:21:24'),
(29, '54', 547482, '2021-04-16 19:24:33'),
(30, '17', 324712, '2021-04-27 13:32:58'),
(31, '2147483647', 5633, '2021-05-05 13:05:00'),
(32, '2147483647', 6433, '2021-05-05 19:29:08'),
(33, '2147483647', 5551, '2021-05-05 19:50:56'),
(34, '2147483647', 3549, '2021-05-10 20:55:03'),
(35, '2147483647', 3463, '2021-05-12 11:10:53'),
(36, '2147483647', 1213, '2021-05-12 11:11:16'),
(37, '2147483647', 3280, '2021-05-12 11:26:44'),
(38, '2147483647', 4905, '2021-05-12 11:27:00'),
(39, '2147483647', 1110, '2021-05-15 20:38:18'),
(40, '2147483647', 2004, '2021-05-15 20:49:52'),
(41, '2147483647', 1883, '2021-05-16 18:59:45'),
(42, '2147483647', 9522, '2021-05-17 12:20:29'),
(43, '2147483647', 6888, '2021-05-17 12:38:44'),
(44, '2147483647', 9548, '2021-05-17 12:38:59'),
(45, '2147483647', 2582, '2021-05-17 12:49:00'),
(46, '2147483647', 8269, '2021-05-17 12:49:21'),
(47, '2147483647', 8949, '2021-05-17 12:49:39'),
(48, '2147483647', 1837, '2021-05-18 09:00:59'),
(49, '2147483647', 3222, '2021-05-18 10:12:48'),
(50, '2147483647', 2513, '2021-05-18 10:52:02'),
(51, '2147483647', 5733, '2021-05-18 10:54:47'),
(52, '2147483647', 8912, '2021-05-18 11:28:36'),
(53, '2147483647', 1777, '2021-05-18 11:30:29'),
(54, '2147483647', 8883, '2021-05-18 12:06:47'),
(55, '2147483647', 3450, '2021-05-18 12:11:02'),
(56, '2147483647', 9520, '2021-05-18 12:21:54'),
(57, '2147483647', 4364, '2021-05-18 12:22:14'),
(58, '2147483647', 2263, '2021-05-18 13:18:19'),
(59, '2147483647', 4820, '2021-05-18 13:32:54'),
(60, '2147483647', 7600, '2021-05-18 14:36:09'),
(61, '2147483647', 2815, '2021-05-18 21:34:32'),
(62, '2147483647', 2300, '2021-05-19 06:15:09'),
(63, '2147483647', 6446, '2021-05-19 07:42:44'),
(64, '2147483647', 8574, '2021-05-19 07:43:00'),
(65, '2147483647', 7218, '2021-05-19 07:44:25'),
(66, '2147483647', 5830, '2021-05-19 07:44:42'),
(67, '2147483647', 3546, '2021-05-19 07:44:42'),
(68, '2147483647', 4102, '2021-05-19 07:44:45'),
(69, '2147483647', 3358, '2021-05-19 07:44:47'),
(70, '2147483647', 1353, '2021-05-19 07:46:22'),
(71, '2147483647', 2991, '2021-05-19 07:46:27'),
(72, '2147483647', 6958, '2021-05-19 07:47:20'),
(73, '2147483647', 9285, '2021-05-19 07:47:27'),
(74, '2147483647', 7765, '2021-05-19 07:48:23'),
(75, '2147483647', 6774, '2021-05-19 07:51:44'),
(76, '2147483647', 4345, '2021-05-19 07:52:01'),
(77, '3606', 7959, '2021-05-19 07:55:19'),
(78, '3606', 4356, '2021-05-19 07:55:36'),
(79, '3606', 1191, '2021-05-19 07:55:38'),
(80, '3606', 8450, '2021-05-19 07:55:39'),
(81, '3606', 8047, '2021-05-19 07:55:40'),
(82, '3606', 3559, '2021-05-19 07:55:40'),
(83, '3606', 2687, '2021-05-19 07:55:40'),
(84, '3606', 7436, '2021-05-19 07:55:40'),
(85, '3606', 3545, '2021-05-19 07:55:40'),
(86, '3606', 3053, '2021-05-19 07:55:40'),
(87, '3606', 2344, '2021-05-19 07:55:40'),
(88, '3606', 9226, '2021-05-19 07:55:41'),
(89, '3606', 7530, '2021-05-19 07:55:41'),
(90, '3606', 2611, '2021-05-19 07:55:41'),
(91, '3606', 7929, '2021-05-19 07:55:42'),
(92, '3606', 5426, '2021-05-19 07:55:42'),
(93, '3606', 8927, '2021-05-19 07:55:42'),
(94, '3606', 5440, '2021-05-19 07:55:42'),
(95, '3606', 9000, '2021-05-19 07:55:42'),
(96, '3606', 5973, '2021-05-19 07:55:42'),
(97, '3606', 3104, '2021-05-19 07:55:42'),
(98, '3606', 8946, '2021-05-19 07:55:42'),
(99, '3606', 9653, '2021-05-19 07:55:43'),
(100, '3606', 8325, '2021-05-19 07:55:43'),
(101, '3606', 8900, '2021-05-19 07:55:43'),
(102, '3606', 7798, '2021-05-19 07:55:43'),
(103, '3606', 2934, '2021-05-19 07:55:43'),
(104, '3606', 5519, '2021-05-19 07:55:44'),
(105, '3606', 7010, '2021-05-19 07:55:44'),
(106, '3606', 7402, '2021-05-19 07:55:44'),
(107, '3606', 3576, '2021-05-19 07:55:44'),
(108, '3606', 8333, '2021-05-19 07:55:44'),
(109, '3606', 9961, '2021-05-19 07:55:44'),
(110, '3606', 7085, '2021-05-19 07:55:45'),
(111, '3606', 7069, '2021-05-19 07:55:45'),
(112, '3606', 7734, '2021-05-19 07:55:45'),
(113, '3606', 9107, '2021-05-19 07:55:45'),
(114, '3606', 3635, '2021-05-19 07:55:45'),
(115, '3606', 7892, '2021-05-19 07:55:45'),
(116, '3606', 8218, '2021-05-19 07:55:46'),
(117, '3606', 8763, '2021-05-19 07:55:46'),
(118, '3606', 6566, '2021-05-19 07:55:46'),
(119, '3606', 6888, '2021-05-19 07:55:53'),
(120, '2147483647', 1686, '2021-05-19 07:58:13'),
(121, '3606', 4738, '2021-05-19 07:59:48'),
(122, '3606', 8603, '2021-05-19 08:00:01'),
(123, '3606', 5094, '2021-05-19 08:00:01'),
(124, '3606', 5509, '2021-05-19 08:00:02'),
(125, '3606', 6075, '2021-05-19 08:00:22'),
(126, '2147483647', 2247, '2021-05-19 08:15:10'),
(127, '2147483647', 9319, '2021-05-19 08:16:18'),
(128, '2147483647', 6282, '2021-05-19 08:18:19'),
(129, '3606', 8126, '2021-05-19 08:30:41'),
(130, '2147483647', 2796, '2021-05-19 08:31:30'),
(131, '2147483647', 6966, '2021-05-19 08:56:12'),
(132, '2147483647', 7177, '2021-05-19 08:57:01'),
(133, '36', 3413, '2021-05-19 08:57:21'),
(134, '36', 3681, '2021-05-19 08:57:38'),
(135, '36', 4102, '2021-05-19 08:57:38'),
(136, '36', 2751, '2021-05-19 08:57:38'),
(137, '36', 8097, '2021-05-19 08:57:38'),
(138, '36', 3531, '2021-05-19 08:57:38'),
(139, '36', 6868, '2021-05-19 08:57:39'),
(140, '36', 6113, '2021-05-19 08:57:39'),
(141, '36', 8391, '2021-05-19 08:57:39'),
(142, '36', 1752, '2021-05-19 08:57:39'),
(143, '36', 6513, '2021-05-19 08:57:39'),
(144, '36', 3616, '2021-05-19 08:57:40'),
(145, '36', 5012, '2021-05-19 08:57:40'),
(146, '36', 7705, '2021-05-19 08:57:40'),
(147, '36', 5761, '2021-05-19 08:57:40'),
(148, '2147483647', 2955, '2021-05-19 12:00:17'),
(149, '2147483647', 7753, '2021-05-19 12:00:41'),
(150, '2147483647', 7657, '2021-05-19 12:00:43'),
(151, '2147483647', 6220, '2021-05-19 12:10:50'),
(152, '2147483647', 2527, '2021-05-19 15:47:54'),
(153, '2147483647', 2340, '2021-05-19 15:48:18'),
(154, '2147483647', 4495, '2021-05-19 15:48:29'),
(155, '3606', 8380, '2021-05-19 15:49:56'),
(156, '36', 7552, '2021-05-19 15:51:11'),
(157, '3630', 2051, '2021-05-19 15:52:18'),
(158, '3630', 5680, '2021-05-19 15:52:31'),
(159, '3630', 3654, '2021-05-19 15:52:31'),
(160, '3630', 2875, '2021-05-19 15:52:32'),
(161, '3630', 4455, '2021-05-19 15:52:32'),
(162, '3630', 1840, '2021-05-19 15:52:32'),
(163, '2147483647', 1831, '2021-05-19 15:54:25'),
(164, '2147483647', 9857, '2021-05-19 15:54:50'),
(165, '2147483647', 5342, '2021-05-19 15:54:52'),
(166, '2147483647', 3081, '2021-05-19 15:54:52'),
(167, '2147483647', 2589, '2021-05-19 15:54:52'),
(168, '2147483647', 5043, '2021-05-19 15:54:52'),
(169, '2147483647', 8300, '2021-05-19 15:54:53'),
(170, '2147483647', 1659, '2021-05-19 15:54:53'),
(171, '2147483647', 3608, '2021-05-19 15:54:53'),
(172, '2147483647', 7227, '2021-05-19 15:54:53'),
(173, '2147483647', 2600, '2021-05-19 15:54:53'),
(174, '2147483647', 3332, '2021-05-19 15:54:53'),
(175, '2147483647', 5934, '2021-05-19 15:54:53'),
(176, '2147483647', 9530, '2021-05-19 15:54:54'),
(177, '2147483647', 4510, '2021-05-19 15:54:54'),
(178, '2147483647', 7799, '2021-05-19 15:54:54'),
(179, '2147483647', 4089, '2021-05-19 15:54:54'),
(180, '2147483647', 4472, '2021-05-19 15:54:54'),
(181, '2147483647', 9850, '2021-05-19 15:54:54'),
(182, '2147483647', 1388, '2021-05-19 15:54:54'),
(183, '2147483647', 3444, '2021-05-19 15:54:55'),
(184, '2147483647', 5153, '2021-05-19 15:54:55'),
(185, '2147483647', 4867, '2021-05-19 15:54:55'),
(186, '2147483647', 1392, '2021-05-19 15:54:55'),
(187, '2147483647', 2009, '2021-05-19 15:54:55'),
(188, '2147483647', 9618, '2021-05-19 15:54:55'),
(189, '2147483647', 9494, '2021-05-19 15:54:56'),
(190, '2147483647', 7772, '2021-05-19 15:54:56'),
(191, '2147483647', 6010, '2021-05-19 15:54:56'),
(192, '2147483647', 5694, '2021-05-19 15:54:56'),
(193, '2147483647', 2049, '2021-05-19 15:54:56'),
(194, '2147483647', 7209, '2021-05-19 15:54:56'),
(195, '2147483647', 1229, '2021-05-19 15:54:57'),
(196, '2147483647', 2275, '2021-05-19 15:54:57'),
(197, '2147483647', 8025, '2021-05-19 15:54:57'),
(198, '2147483647', 3733, '2021-05-19 15:54:57'),
(199, '2147483647', 6823, '2021-05-19 15:54:57'),
(200, '2147483647', 1075, '2021-05-19 15:54:57'),
(201, '2147483647', 8994, '2021-05-19 15:54:58'),
(202, '2147483647', 2575, '2021-05-19 15:54:58'),
(203, '2147483647', 2999, '2021-05-19 15:54:58'),
(204, '2147483647', 4850, '2021-05-19 15:54:58'),
(205, '2147483647', 2505, '2021-05-19 15:54:58'),
(206, '2147483647', 3423, '2021-05-19 15:54:58'),
(207, '2147483647', 6797, '2021-05-19 15:54:58'),
(208, '2147483647', 9926, '2021-05-19 15:54:59'),
(209, '2147483647', 9135, '2021-05-19 15:54:59'),
(210, '2147483647', 7569, '2021-05-19 15:54:59'),
(211, '2147483647', 3464, '2021-05-19 15:54:59'),
(212, '2147483647', 4156, '2021-05-19 15:54:59'),
(213, '2147483647', 5694, '2021-05-19 15:54:59'),
(214, '2147483647', 2662, '2021-05-19 15:54:59'),
(215, '2147483647', 3317, '2021-05-19 15:55:00'),
(216, '2147483647', 2160, '2021-05-19 15:55:00'),
(217, '2147483647', 5464, '2021-05-19 15:55:00'),
(218, '2147483647', 1982, '2021-05-19 15:55:00'),
(219, '2147483647', 9974, '2021-05-19 15:55:00'),
(220, '2147483647', 9528, '2021-05-19 15:55:00'),
(221, '2147483647', 7585, '2021-05-19 15:55:01'),
(222, '2147483647', 1790, '2021-05-19 15:55:01'),
(223, '2147483647', 9020, '2021-05-19 15:55:01'),
(224, '36', 4066, '2021-05-19 15:55:27'),
(225, '2147483647', 7727, '2021-05-19 15:55:47'),
(226, '2147483647', 5448, '2021-05-19 15:57:49'),
(227, '2147483647', 7803, '2021-05-19 15:57:50'),
(228, '2147483647', 7757, '2021-05-19 15:57:51'),
(229, '2147483647', 9024, '2021-05-19 15:57:51'),
(230, '2147483647', 5627, '2021-05-19 15:57:51'),
(231, '2147483647', 8264, '2021-05-19 15:57:52'),
(232, '2147483647', 8580, '2021-05-19 15:57:52'),
(233, '2147483647', 3351, '2021-05-19 15:58:10'),
(234, '2147483647', 3329, '2021-05-19 15:58:48'),
(235, '2147483647', 2203, '2021-05-19 15:59:39'),
(236, '2147483647', 2186, '2021-05-19 16:00:24'),
(237, '3606', 9787, '2021-05-19 16:06:33'),
(238, '2147483647', 8614, '2021-05-19 16:06:58'),
(239, '2147483647', 7592, '2021-05-19 16:07:24'),
(240, '2147483647', 4643, '2021-05-19 16:07:47'),
(241, '2147483647', 6815, '2021-05-19 16:08:15'),
(242, '2147483647', 1702, '2021-05-19 16:08:57'),
(243, '2147483647', 9302, '2021-05-19 16:11:52'),
(244, '2147483647', 6741, '2021-05-19 16:12:59'),
(245, '2147483647', 5780, '2021-05-19 16:15:46'),
(246, '2147483647', 3947, '2021-05-19 16:16:11'),
(247, '2147483647', 4684, '2021-05-19 16:16:12'),
(248, '2147483647', 4532, '2021-05-19 16:30:28'),
(249, '2147483647', 3293, '2021-05-19 16:30:47'),
(250, '2147483647', 2633, '2021-05-19 16:41:35'),
(251, '2147483647', 4365, '2021-05-19 17:00:33'),
(252, '2147483647', 3052, '2021-05-19 19:02:44'),
(253, '2147483647', 6643, '2021-05-19 19:03:00'),
(254, '2147483647', 3586, '2021-05-19 19:56:27'),
(255, '2147483647', 7907, '2021-05-19 23:50:54'),
(256, '2147483647', 7519, '2021-05-19 23:54:10'),
(257, '2147483647', 5767, '2021-05-19 23:54:10'),
(258, '2147483647', 1606, '2021-05-20 00:09:52'),
(259, '2147483647', 3338, '2021-05-20 00:10:20'),
(260, '2147483647', 5644, '2021-05-20 00:14:42'),
(261, '2147483647', 2152, '2021-05-20 00:15:29'),
(262, '2147483647', 4543, '2021-05-20 00:18:56'),
(263, '2147483647', 5362, '2021-05-20 00:21:58'),
(264, '2147483647', 3842, '2021-05-20 00:23:19'),
(265, '2147483647', 4138, '2021-05-20 00:24:21'),
(266, '2147483647', 7788, '2021-05-20 00:26:02'),
(267, '2147483647', 5838, '2021-05-20 00:27:01'),
(268, '2147483647', 8946, '2021-05-20 00:28:32'),
(269, '2147483647', 8736, '2021-05-20 00:29:34'),
(270, '+923467893622', 5580, '2021-05-21 15:49:39'),
(271, '+923467893622', 1186, '2021-05-21 15:56:21'),
(272, '+9203207878090', 3807, '2021-05-21 21:24:12'),
(273, '+923007932129', 6071, '2021-05-21 22:53:44'),
(274, '+923007932129', 5218, '2021-05-21 22:56:37'),
(275, '+923007932129', 4369, '2021-05-21 23:07:55'),
(276, '+923007932129', 9012, '2021-05-21 23:12:26'),
(277, '+923004932129', 1121, '2021-05-21 23:27:37'),
(278, '+923007932129', 3712, '2021-05-21 23:29:08'),
(279, 'PK3007932129', 5917, '2021-05-21 23:32:42'),
(280, 'PK3007932129', 5000, '2021-05-21 23:33:02'),
(281, 'PK3007932129', 7272, '2021-05-21 23:33:53'),
(282, 'PK3007932129', 5902, '2021-05-21 23:34:16'),
(283, 'PK3230073738', 3043, '2021-05-21 23:35:19'),
(284, 'PK3230073738', 1094, '2021-05-21 23:35:44'),
(285, 'PK03230073738', 3088, '2021-05-21 23:36:28'),
(286, 'PK3230073738', 6529, '2021-05-21 23:37:27'),
(287, '+923017932129', 4347, '2021-05-21 23:43:24'),
(288, '+923007932129', 9821, '2021-05-21 23:44:34'),
(289, '+923007932129', 4630, '2021-05-21 23:45:02'),
(290, '+923007932129', 1087, '2021-05-21 23:48:14'),
(291, '+923007932129', 7376, '2021-05-21 23:48:59'),
(292, '+923007932129', 6630, '2021-05-22 00:02:54'),
(293, '+923216399646', 1062, '2021-05-23 07:19:05'),
(294, '+923216399646', 9963, '2021-05-23 07:19:21'),
(295, '+923207878090', 8602, '2021-05-23 07:19:31'),
(296, '+923207878090', 9081, '2021-05-23 07:19:42'),
(297, '+9203207878090', 8146, '2021-05-23 12:33:23'),
(298, '+923467893622', 9242, '2021-05-26 09:40:07'),
(299, '+923007932129', 4064, '2021-05-26 09:40:39'),
(300, '+923007932129', 9670, '2021-05-26 09:41:24'),
(301, '+923163220000', 2568, '2021-05-26 12:53:52'),
(302, '+923163220000', 4066, '2021-05-26 12:54:36'),
(303, '+923467893622', 2871, '2021-05-26 13:47:26'),
(304, '+923163220000', 4865, '2021-05-26 13:50:40'),
(305, '+923007932129', 2745, '2021-05-27 15:30:42'),
(306, '+923336527001', 2997, '2021-05-27 20:22:05'),
(307, '+923012345678', 7692, '2021-05-27 20:23:54'),
(308, '+923012345679', 4293, '2021-05-27 20:24:16'),
(309, '+923012345612', 6095, '2021-05-27 20:24:55'),
(310, '+923336527001', 4389, '2021-05-27 20:46:58'),
(311, '+923336527001', 5280, '2021-05-27 20:47:42'),
(312, '+923336527001', 7053, '2021-05-27 20:48:18'),
(313, '+923336527001', 8934, '2021-05-27 20:48:44'),
(314, '+923336527001', 6647, '2021-05-27 20:48:52'),
(315, '+923336527001', 4201, '2021-05-27 20:49:13'),
(316, '+923336527001', 8470, '2021-05-28 11:26:21'),
(317, '+923467893622', 9277, '2021-05-31 13:23:58'),
(318, '+923467893622', 5437, '2021-05-31 21:40:18'),
(319, '+923037067639', 1675, '2021-05-31 21:44:48'),
(320, '+923007932129', 3778, '2021-05-31 21:46:21'),
(321, '+923467893622', 5221, '2021-05-31 22:05:25'),
(322, '+923467893622', 3097, '2021-05-31 22:38:09'),
(323, '+923467893622', 5674, '2021-05-31 22:39:35'),
(324, '+923467893622', 8353, '2021-05-31 22:42:08'),
(325, '+923467893622', 5516, '2021-05-31 23:15:32'),
(326, '+923467893622', 4396, '2021-05-31 23:20:17'),
(327, '+923467893622', 9622, '2021-06-01 00:38:55'),
(328, '+923467893622', 6030, '2021-06-01 01:12:25'),
(329, '+923467893622', 4729, '2021-06-01 01:15:53'),
(330, '+923467893622', 9860, '2021-06-01 01:18:18'),
(331, '+923467893622', 7440, '2021-06-01 01:33:37'),
(332, '+923467893622', 7078, '2021-06-01 10:04:07'),
(333, '+923007932129', 3565, '2021-06-01 15:14:27'),
(334, '+923007932129', 9634, '2021-06-01 15:15:37'),
(335, '+923007932129', 1445, '2021-06-01 16:03:14'),
(336, '+923007932129', 4117, '2021-06-01 16:12:44'),
(337, '+923007932031', 5549, '2021-06-01 17:12:06'),
(338, '+923007932129', 3768, '2021-06-01 17:12:50'),
(339, '+923489393931', 9971, '2021-06-01 17:27:47'),
(340, '+923489393931', 2404, '2021-06-01 17:28:39'),
(341, '+923489393931', 2432, '2021-06-01 17:29:38'),
(342, '+923489393931', 5300, '2021-06-01 17:34:50'),
(343, '+923489393931', 7702, '2021-06-01 17:35:15'),
(344, '+36301743895', 4011, '2021-06-01 17:43:48'),
(345, '+36301743895', 5422, '2021-06-01 18:24:26'),
(346, '+36301743895', 4440, '2021-06-01 18:25:55'),
(347, '+923489393931', 6623, '2021-06-01 18:26:38'),
(348, '+36301743895', 3002, '2021-06-01 18:29:11'),
(349, '+447391534117', 8867, '2021-06-01 18:43:06'),
(350, '+44undefined', 7628, '2021-06-01 18:44:53'),
(351, '+447391534117', 7440, '2021-06-01 18:52:00'),
(352, '+36301743895', 3081, '2021-06-03 19:55:13'),
(353, '+447391534117', 8699, '2021-06-03 19:57:37'),
(354, '+4407391534117', 8312, '2021-06-03 20:08:14'),
(355, '+4407391534117', 2516, '2021-06-03 20:08:27'),
(356, '+44', 2395, '2021-06-03 20:11:05'),
(357, '+447391534117', 2643, '2021-06-03 20:11:50'),
(358, '+447391534117', 9059, '2021-06-03 20:11:52'),
(359, '+447391534117', 9022, '2021-06-03 20:13:57'),
(360, '+923064945934', 7201, '2021-06-03 23:47:17'),
(361, '+923467893622', 6962, '2021-06-04 15:53:15'),
(362, '+923467893622', 9249, '2021-06-06 14:50:05'),
(363, '+923467893622', 4016, '2021-06-06 19:15:56'),
(364, '+923467893622', 5467, '2021-06-06 20:41:35'),
(365, '+923467893622', 9682, '2021-06-06 20:44:27'),
(366, 'PK3467893622', 9580, '2021-06-06 21:56:41'),
(367, 'PK3467893622', 5851, '2021-06-06 21:57:08'),
(368, 'PK3467893622', 2868, '2021-06-06 21:57:21'),
(369, '+923467893622', 7717, '2021-06-06 21:58:11'),
(370, '+923467893622', 5131, '2021-06-07 08:28:57'),
(371, '+923467893622', 3615, '2021-06-07 08:29:14'),
(372, '+447391534117', 6641, '2021-06-07 09:10:11'),
(373, '+36301743895', 1008, '2021-06-07 09:11:16'),
(374, '+4407391534117', 3062, '2021-06-07 09:17:08'),
(375, '+4407391534117', 7131, '2021-06-07 10:20:33'),
(376, '+447391534117', 7203, '2021-06-07 10:21:22'),
(377, '+923489393931', 4577, '2021-06-07 11:59:42'),
(378, '+923467893622', 8916, '2021-06-15 17:48:11'),
(379, '+923064945934', 4038, '2021-06-15 17:54:45'),
(380, '+923467893622', 9775, '2021-06-16 11:00:50'),
(381, '+36301743895', 5092, '2021-06-16 13:22:31'),
(382, '+44', 4578, '2021-06-16 13:33:02'),
(383, '+4407391534117', 4383, '2021-06-16 13:33:26'),
(384, '+444383', 9074, '2021-06-16 13:37:10'),
(385, '+4407391534117', 3372, '2021-06-16 13:37:40'),
(386, '+36301743895', 2838, '2021-06-16 13:37:54'),
(387, '+36301743895', 3921, '2021-06-16 13:43:07'),
(388, '+525569154818', 2802, '2021-06-18 17:42:05');

-- --------------------------------------------------------

--
-- Table structure for table `preferences`
--

CREATE TABLE `preferences` (
  `id` int(11) NOT NULL,
  `admin_email` varchar(255) NOT NULL DEFAULT '',
  `admin_contact` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `domain` varchar(50) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `report_type` varchar(50) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `report_type`, `offer_id`, `user_id`, `reason`, `detail`, `timestamp`) VALUES
(2, '', 10, 48, 'Harassment or hateful speech', 'sas', '2021-11-14 17:32:40');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `trade_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `offer_id`, `user_id`, `trade_id`, `rating`, `detail`, `timestamp`) VALUES
(1, 0, 48, 17, 4, 'dsds', '2021-11-17 15:50:03');

-- --------------------------------------------------------

--
-- Table structure for table `status_history`
--

CREATE TABLE `status_history` (
  `id` int(11) NOT NULL,
  `trade_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status_history`
--

INSERT INTO `status_history` (`id`, `trade_id`, `user_id`, `status`, `timestamp`) VALUES
(1, 10, 58, '1', '2021-11-15 13:48:02'),
(2, 10, 48, '4', '2021-11-15 13:49:46'),
(3, 10, 48, '3', '2021-11-15 13:59:05'),
(4, 10, 58, '1', '2021-11-15 14:03:49'),
(5, 10, 48, '4', '2021-11-15 14:04:03'),
(6, 10, 58, '2', '2021-11-15 14:05:28'),
(7, 10, 48, '3', '2021-11-15 14:23:42'),
(8, 10, 58, '2', '2021-11-15 14:27:26'),
(9, 17, 48, '3', '2021-11-15 21:29:41'),
(10, 17, 58, '1', '2021-11-16 14:19:59'),
(11, 17, 48, '4', '2021-11-16 14:24:14'),
(12, 17, 0, '1', '2021-11-16 16:22:15'),
(13, 17, 0, '1', '2021-11-16 16:23:00'),
(14, 17, 0, '1', '2021-11-16 16:24:05'),
(15, 17, 0, '1', '2021-11-16 16:39:36'),
(16, 19, 58, '1', '2021-11-17 05:59:55'),
(17, 17, 58, '1', '2021-11-17 06:04:33'),
(18, 21, 63, '1', '2021-11-20 14:47:27'),
(19, 23, 63, '1', '2021-11-20 17:02:06'),
(20, 23, 64, '4', '2021-11-20 17:05:00'),
(21, 24, 63, '3', '2021-11-20 17:10:45'),
(22, 29, 64, '1', '2021-11-20 17:16:47'),
(23, 29, 64, '1', '2021-11-20 17:17:47'),
(24, 29, 63, '4', '2021-11-20 17:20:44'),
(25, 30, 63, '1', '2021-11-20 17:33:28'),
(26, 25, 64, '3', '2021-11-20 17:36:13'),
(27, 30, 64, '4', '2021-11-20 17:38:59'),
(28, 36, 66, '1', '2021-11-22 09:29:45');

-- --------------------------------------------------------

--
-- Table structure for table `sub-category`
--

CREATE TABLE `sub-category` (
  `id` int(10) NOT NULL,
  `parent_id` int(10) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub-category`
--

INSERT INTO `sub-category` (`id`, `parent_id`, `name`) VALUES
(1, 1, 'Cars'),
(2, 1, 'Heavy Vehicles\r\n'),
(3, 1, 'Motorcycles & Scooters'),
(4, 1, 'Number plates'),
(5, 1, 'Spare Parts & Accessories'),
(6, 2, 'Books\r\n'),
(7, 2, 'Hotels & Travel\r\n'),
(8, 2, 'Luggage & Bags\r\n'),
(9, 2, 'Memberships'),
(10, 2, 'Movie Tickets'),
(11, 2, 'Other Entertainment'),
(12, 2, 'Restaurants & Cafes'),
(13, 2, 'Theatre & Events Tickets'),
(14, 2, 'Toys'),
(15, 2, 'Video Games & DVDs'),
(16, 2, 'Voucher & Gift Cards'),
(17, 3, 'Accessories'),
(18, 3, 'Bags'),
(19, 3, 'Beauty Products & Fragrance'),
(20, 3, 'Clothing'),
(21, 3, 'Other Fashion & Cosmetics'),
(22, 3, 'Shoes'),
(23, 4, 'Food & Beverage'),
(24, 4, 'Household Supplies'),
(25, 4, 'Other Groceries'),
(26, 4, 'Personal Care'),
(27, 4, 'Vouchers and Coupons'),
(28, 5, 'Curtains & Blinds\r\n'),
(29, 5, 'Garden & Outdoor'),
(30, 5, 'Home accessories'),
(31, 5, 'Home appliances'),
(32, 5, 'Home furniture'),
(33, 5, 'Lightning'),
(34, 5, 'Office accessories'),
(35, 5, 'Office furniture'),
(36, 5, 'Other furniture'),
(37, 5, 'Rugs & Carpets'),
(38, 5, 'Sports equipments'),
(39, 6, 'Agriculture'),
(40, 6, 'Consumables'),
(41, 6, 'Food Production'),
(42, 6, 'Healthcare, Safety & Pharma'),
(43, 6, 'Industrial Equipments'),
(44, 6, 'Infrastructure'),
(45, 6, 'Other Industrial & Business'),
(46, 6, 'Raw materials'),
(47, 6, 'Retail & consumers'),
(48, 6, 'Technology'),
(49, 6, 'Transportation (Air, Land, Sea)'),
(50, 7, 'Other extra belongings\r\n'),
(51, 7, 'Other idle inventory'),
(52, 8, 'Pets & Animals'),
(53, 8, 'Pets & Animals accessories'),
(54, 8, 'Pets & Animals care items'),
(55, 9, 'Accounting & Financial'),
(56, 9, 'Administrative & Customer Support'),
(57, 9, 'Arts & Paintings'),
(58, 9, 'Banking & Insurance'),
(59, 9, 'Beauty & Salon'),
(60, 9, 'Business Development & Sales'),
(61, 9, 'Caregiving & sitting services'),
(62, 9, 'Cleaning'),
(63, 9, 'Construction'),
(64, 9, 'Consultancy & Advisory'),
(65, 9, 'Design & Architectural'),
(66, 9, 'Education & Training'),
(67, 9, 'Engineering'),
(68, 9, 'Entertainment'),
(69, 9, 'Environment & Waste Management'),
(70, 9, 'Events & Hospitality management'),
(71, 9, 'Facility management'),
(72, 9, 'Human resources & Recruitment'),
(73, 9, 'Investment management'),
(74, 9, 'Landscaping'),
(75, 9, 'Project management'),
(76, 10, 'Building & raw material'),
(77, 10, 'Chalet'),
(78, 10, 'Commercial property'),
(79, 10, 'Land'),
(80, 10, 'Other Real Estate'),
(81, 10, 'Residential property'),
(82, 10, 'Short term property'),
(83, 10, 'Space, Storage & Warehouse'),
(84, 11, 'Cameras & Imaging'),
(85, 11, 'Cybersecurity'),
(86, 11, 'Gadgets & Wearables'),
(87, 11, 'Gaming'),
(88, 11, 'Laptops & Computers'),
(89, 11, 'Mobile Phones & Accessories'),
(90, 11, 'Networks & Connectivity'),
(91, 11, 'Other Electronics & Technology equipments'),
(92, 11, 'Printers & Scanners'),
(93, 11, 'TVs & Other Smart Home accessories'),
(94, 12, 'Antiques'),
(95, 12, 'Artisan Crafts'),
(96, 12, 'Arts & Crafts Supplies'),
(97, 12, 'Business ownerships'),
(98, 12, 'Financial instruments'),
(99, 12, 'Jewelry'),
(100, 12, 'Other Valuables, Art & Investments'),
(101, 12, 'Paintings'),
(102, 12, 'Stones');

-- --------------------------------------------------------

--
-- Table structure for table `trades`
--

CREATE TABLE `trades` (
  `id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `transaction_type` enum('points','barter') NOT NULL,
  `offer_qty` double NOT NULL,
  `barter_offer_id` int(11) NOT NULL,
  `barter_offer_qty` double NOT NULL,
  `points` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trades`
--

INSERT INTO `trades` (`id`, `offer_id`, `transaction_type`, `offer_qty`, `barter_offer_id`, `barter_offer_qty`, `points`, `description`, `user_id`, `status`, `created_at`, `timestamp`) VALUES
(17, 13, 'points', 1, 12, 3, 10, 'Hey! danishg goheer want to make a deal', 48, 1, '2021-11-15 21:29:02', '2021-11-17 06:04:33'),
(18, 13, 'barter', 1, 14, 1, 10, 'hi', 61, 0, '2021-11-16 18:32:46', '2021-11-16 18:32:46'),
(19, 13, 'barter', 1, 14, 1, 10, 'hellow how are you', 61, 1, '2021-11-16 20:54:52', '2021-11-17 05:59:55'),
(20, 12, 'barter', 1, 14, 1, 25, 'Hey! danishg goheer want to make a deal', 61, 0, '2021-11-18 17:07:22', '2021-11-18 17:07:22'),
(21, 17, 'barter', 1, 14, 5, 5, 'Hey! Salma Abulella want to make a deal', 61, 1, '2021-11-20 14:46:37', '2021-11-20 14:47:27'),
(22, 20, 'barter', 1, 19, 1, 10, 'Hello, this is for testing', 63, 0, '2021-11-20 16:55:53', '2021-11-20 16:55:53'),
(23, 19, 'barter', 1, 20, 1, 10, 'Hey! Salma Abulella want to make a deal', 64, 4, '2021-11-20 16:59:18', '2021-11-20 17:05:00'),
(24, 11, 'barter', 1, 21, 1, 0, 'Hello', 63, 3, '2021-11-20 17:08:19', '2021-11-20 17:10:45'),
(25, 10, 'barter', 1, 20, 1, 0, 'Hey! Salma Abulella want to make a deal', 64, 3, '2021-11-20 17:11:45', '2021-11-20 17:36:13'),
(26, 11, 'barter', 1, 21, 1, 0, 'hello', 63, 0, '2021-11-20 17:11:51', '2021-11-20 17:11:51'),
(27, 11, 'barter', 1, 21, 1, 0, 'Hey! Huds Meqdad want to make a deal', 63, 0, '2021-11-20 17:12:36', '2021-11-20 17:12:36'),
(28, 21, 'barter', 1, 20, 1, 20, 'Hey! Salma Abulella want to make a deal', 64, 0, '2021-11-20 17:16:17', '2021-11-20 17:16:17'),
(29, 20, 'barter', 1, 18, 1, 10, 'Hello', 63, 4, '2021-11-20 17:16:35', '2021-11-20 17:20:44'),
(30, 21, 'barter', 1, 0, 1, 20, 'Hey! Salma Abulella want to make a deal', 64, 4, '2021-11-20 17:30:46', '2021-11-20 17:38:59'),
(31, 10, 'barter', 1, 22, 1, 0, 'Hey! Salma Abulella want to make a deal', 64, 0, '2021-11-21 12:15:20', '2021-11-21 12:15:20'),
(32, 10, 'barter', 1, 22, 1, 0, 'Hey! Salma Abulella want to make a deal', 64, 0, '2021-11-21 12:17:17', '2021-11-21 12:17:17'),
(33, 10, 'barter', 1, 22, 1, 0, 'Hey! Salma Abulella want to make a deal', 64, 0, '2021-11-21 12:25:54', '2021-11-21 12:25:54'),
(34, 10, 'barter', 1, 22, 1, 0, 'Hey! Salma Abulella want to make a deal', 64, 0, '2021-11-21 12:27:22', '2021-11-21 12:27:22'),
(35, 13, 'points', 1, 0, 0, 10, 'Hey! check user want to make a deal', 48, 0, '2021-11-22 09:23:41', '2021-11-22 09:23:41'),
(36, 25, 'points', 1, 0, 0, 5, 'Hey! arman talib want to make a deal', 48, 1, '2021-11-22 09:27:57', '2021-11-22 09:29:45'),
(37, 25, 'barter', 1, 16, 1, 5, 'Hey! arman talib want to make a deal', 48, 0, '2021-11-22 09:31:41', '2021-11-22 09:31:41'),
(38, 26, 'barter', 1, 16, 1, 9, 'Hey! arman talib want to make a deal', 48, 0, '2021-11-22 17:53:25', '2021-11-22 17:53:25');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`) VALUES
(1, 'Per Visit'),
(2, 'Per Session'),
(3, 'Per Hour'),
(4, 'Per Unit'),
(5, 'Per Package\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `user_type` tinyint(1) NOT NULL,
  `address` varchar(100) NOT NULL,
  `address2` varchar(100) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `lat` varchar(20) NOT NULL,
  `lng` varchar(20) NOT NULL,
  `join_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `looking_to` varchar(100) NOT NULL,
  `like_to` varchar(100) NOT NULL,
  `min_budget` double NOT NULL,
  `max_budget` double NOT NULL,
  `residential` tinyint(1) NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `home_type` int(11) NOT NULL,
  `omv_price` int(11) NOT NULL,
  `price_range` varchar(50) NOT NULL,
  `timeline` varchar(50) NOT NULL,
  `estimation` varchar(50) NOT NULL,
  `year_built` int(11) NOT NULL,
  `parking` varchar(50) NOT NULL,
  `lot_size` varchar(30) NOT NULL,
  `home_sqft` double NOT NULL,
  `beds` int(11) NOT NULL,
  `baths` int(11) NOT NULL,
  `water_source` varchar(50) NOT NULL,
  `hoa_fees` double NOT NULL,
  `condo` tinyint(1) NOT NULL,
  `flooding` tinyint(1) NOT NULL,
  `renovations` tinyint(1) NOT NULL,
  `lead` tinyint(1) NOT NULL,
  `fires` tinyint(1) NOT NULL,
  `generator` tinyint(1) NOT NULL,
  `septic` tinyint(1) NOT NULL,
  `social_token` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `first_name`, `middle_name`, `last_name`, `dob`, `image`, `phone`, `gender`, `user_type`, `address`, `address2`, `postal_code`, `city`, `state`, `country`, `lat`, `lng`, `join_time`, `looking_to`, `like_to`, `min_budget`, `max_budget`, `residential`, `payment_type`, `home_type`, `omv_price`, `price_range`, `timeline`, `estimation`, `year_built`, `parking`, `lot_size`, `home_sqft`, `beds`, `baths`, `water_source`, `hoa_fees`, `condo`, `flooding`, `renovations`, `lead`, `fires`, `generator`, `septic`, `social_token`, `timestamp`) VALUES
(48, 'danishgoheer17@gmail.com', 'b8ae845eda4fa36b87520574b1894783efedf613f8c140bcc2a895c11750766a', 'danish', '', 'goheer', '', 'logo_55.jpg', '1212122112', '', 0, 'ds', 'ds', '', '', '', 'UAE', '', '', '2021-11-13 19:36:23', 's', 's', 12, 21, 0, 's', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-10-17 20:17:28'),
(55, 'admin@appicmarketing.com', 'c9ac6f86e3e7776d30cf70c1b92f3c8c1068b471295314f11e647232a9f4fd5a', 'miha', '', 'ahmad', '', '', '544545451', '', 0, '', '', '', 'Dubai', '', 'UAE', '', '', '2021-11-13 19:36:23', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2021-11-13 19:36:23'),
(56, 'itxmian99@gmail.com', 'f846a67e6ba077733a4838d5f03de4f5113d18c567ef20b2a4c58b55fd071591', 'Muhammad', '', 'Ahmad', '', '', '545454545', '', 0, '', '', '', 'Dubai', '', 'UAE', '', '', '2021-11-13 19:36:23', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2021-11-13 19:36:23'),
(57, 'sa@gmail.com', 'cbff9e8bf411b3d9abe20a98edd981a79d3cf47d53a63263909a7fa55bf439c1', '', '', '', '', '', '501234567', '', 0, '', '', '', 'Dubai', '', 'UAE', '', '', '2021-11-13 19:36:23', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2021-11-13 19:36:23'),
(58, 'checkuser@gmail.com', 'cbff9e8bf411b3d9abe20a98edd981a79d3cf47d53a63263909a7fa55bf439c1', 'check', '', 'user', '', '', '502312113', '', 0, '', '', '', 'Dubai', '', 'UAE', '', '', '2021-11-13 19:36:23', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2021-11-13 19:36:23'),
(59, 'galileom6@gmail.com', '187a53adfdc533579f442470e6cc3c3f85680941ff7b138ffc4101828a904166', 'M G', '', 'EL H', '', '', '569564824', '', 0, '', '', '', 'Dubai', '', 'UAE', '', '', '2021-11-13 19:36:23', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2021-11-13 19:36:23'),
(60, 'white.david.roger@gmail.com', '1f3fcad3f87beb3eb31f59da29e15143493fcafd898241ff5e05ed6cd323d53f', 'Roger', '', 'White', '', '', '526182590', '', 0, '', '', '', 'Dubai', '', 'UAE', '', '', '2021-11-13 19:36:23', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2021-11-13 19:36:23'),
(61, 'admin@appicmarketing.com', '49f08dff430de4a4bc2c1b2fb335bcc3f318126f7686388ecc12666f2448ec14', 'Muhammad', '', 'Ahmad', '', '', '525203831', '', 0, '', '', '', 'Dubai', '', 'UAE', '', '', '2021-11-16 18:26:46', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2021-11-16 18:26:46'),
(62, 'mohamad.mgm.84@gmail.com', '6b995c7a71e21dbc544210b4687969dcad568e8e6d6935ae53380052633138b9', 'mgm', '', 'mgm', '', '', '509774966', '', 0, '', '', '', 'Umm Al Quwain', '', 'UAE', '', '', '2021-11-17 18:38:55', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2021-11-17 18:38:55'),
(63, 'salmaali671@gmail.com', '6553c3803e3ee67b3c9702dd5ae140cc1ca9e2f1ca9290b39b8728c94dba9ef8', 'Salma', '', 'Abulella', '', '', '501234567', '', 0, '', '', '', 'Abu-Dhabi', '', 'UAE', '', '', '2021-11-19 11:06:45', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2021-11-30 09:24:32'),
(64, 'f-fs103@hotmail.com', 'bcd0343ae92aa5648cbbbb69b5cf4f7af40ad67f257c5645f451025238f4d89b', 'Huda', '', 'Meqdad', '', '', '521763260', '', 0, '', '', '', 'Abu-Dhabi', '', 'UAE', '', '', '2021-11-20 16:48:45', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2021-11-21 11:49:11'),
(65, 'mohamad.mgm.84@gmail.com', '547068265a5a48f7782bdfbc84619a50d21a9be9353ef790f9c87fc329b45584', 'mohamad', '', 'ghaleb', '', '', '509774966', '', 0, '', '', '', 'Abu-Dhabi', '', 'UAE', '', '', '2021-11-21 04:05:35', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2021-11-21 04:05:35'),
(66, 'armantalib@gmail.com', 'cbff9e8bf411b3d9abe20a98edd981a79d3cf47d53a63263909a7fa55bf439c1', 'arman', '', 'talib', '', '', '93203920', '', 0, '', '', '', 'Dubai', '', 'UAE', '', '', '2021-11-22 09:25:48', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2021-11-30 09:24:23'),
(67, 'danishgoheer172@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-08 11:29:17', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-08 11:29:17'),
(68, 'jabbarahmad540@gmail.com', '1212730cae454970e2fbac2ab128bb74522183e2d9ee6ad20a2731cccff17b07', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-09 07:57:43', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-09 07:57:43'),
(69, 'test', '1212730cae454970e2fbac2ab128bb74522183e2d9ee6ad20a2731cccff17b07', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-09 08:55:49', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-09 08:55:49'),
(70, 'jabbarahmad@gmail.com', 'f5b12f2b74f2c908b4ab298f3614227b273355f5ce767edc91eba10585bfdb7b', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-09 09:51:12', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-09 09:51:12'),
(71, 'jabbarahmad1@gmail.com', 'f5b12f2b74f2c908b4ab298f3614227b273355f5ce767edc91eba10585bfdb7b', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-09 09:52:22', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-09 09:52:22'),
(72, 'jabbarahmad2@gmail.com', 'f5b12f2b74f2c908b4ab298f3614227b273355f5ce767edc91eba10585bfdb7b', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-09 09:53:21', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-09 09:53:21'),
(73, 'jabbarahmad3@gmail.com', 'f5b12f2b74f2c908b4ab298f3614227b273355f5ce767edc91eba10585bfdb7b', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-09 09:54:33', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-09 09:54:33'),
(74, 'jabbarahmad4@gmail.com', 'f5b12f2b74f2c908b4ab298f3614227b273355f5ce767edc91eba10585bfdb7b', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-09 09:56:06', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-09 09:56:06'),
(75, 'jabbarahmad5@gmail.com', 'f5b12f2b74f2c908b4ab298f3614227b273355f5ce767edc91eba10585bfdb7b', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-09 09:56:35', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-09 09:56:35'),
(76, 'jabbarahmad6@gmail.com', 'f5b12f2b74f2c908b4ab298f3614227b273355f5ce767edc91eba10585bfdb7b', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-09 10:49:36', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-09 10:49:36'),
(77, 'jabbarahmad7@gmail.com', 'f5b12f2b74f2c908b4ab298f3614227b273355f5ce767edc91eba10585bfdb7b', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-09 10:50:29', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-09 10:50:29'),
(78, 'jabbarahmad8@gmail.com', 'f5b12f2b74f2c908b4ab298f3614227b273355f5ce767edc91eba10585bfdb7b', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-09 10:51:24', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-09 10:51:24'),
(79, 'jabbarahmad9@gmail.com', 'f5b12f2b74f2c908b4ab298f3614227b273355f5ce767edc91eba10585bfdb7b', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-10 05:38:47', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-10 05:38:47'),
(80, 'jabbarahmad10@gmail.com', 'f5b12f2b74f2c908b4ab298f3614227b273355f5ce767edc91eba10585bfdb7b', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-10 05:45:26', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-10 05:45:26'),
(81, 'jabbarahmad11@gmail.com', 'f5b12f2b74f2c908b4ab298f3614227b273355f5ce767edc91eba10585bfdb7b', 'Jabbar', '--', 'Ahmad', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-06-10 06:34:52', 'Sell and Buy', '', 371, 708, 0, 'Finance', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-10 06:51:06'),
(82, 'jabbarahmad12@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-16 10:20:04', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-16 10:20:04'),
(83, 'jabbarahmad13@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Jabbar', '', 'Ahmad', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-16 10:36:25', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-16 10:37:46'),
(84, 'jabbarahmad14@gmail.com', '47a7b56b6152cf68a4a963d0a4a03547db1c360e2e37d475ee6d3b5675006c33', 'Jabbar', '', 'Ahmad', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-17 06:45:46', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-17 06:45:57'),
(85, 'jabbarahmad15@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Test', '', 'Test', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-06-17 06:51:21', 'Sell and Buy', '', 0, 801, 0, 'All Types', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-17 06:53:24'),
(86, 'jabbarahmad16@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Jabbar', '', 'Ahmad', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-17 06:56:33', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-17 06:56:43'),
(87, 'jabbarahmad17@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Jabbar', '', 'Ahmad', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-17 10:14:57', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-17 10:15:05'),
(88, 'jabbarahmad18@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Jabbar', '', 'Ahmad', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-17 10:27:23', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-17 10:27:33'),
(89, 'jabbarahmad20@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Mukhtar', '', 'Ahmad', '', 'logo_55.jpg', '', '', 0, '', '', '', '', '', '', '', '', '2022-06-18 09:53:51', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-07 08:52:34'),
(90, 'jabbarahmad21@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Hasaaan', '', 'Ahmad', '', '', '124573', '', 0, '', '', '', '', '', '', '', '', '2022-06-19 16:37:44', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-05 05:23:21'),
(91, 'jabbarahmad22@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'ali', '', '', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-06-20 07:27:55', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-08-31 10:47:56'),
(92, 'jabbarahmad23@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Ali', '', 'Hassan', '', '', '', '', 2, '', '', '', '', '', '', '', '', '2022-06-25 13:09:45', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-06-25 13:09:58'),
(93, '', '', 'nnmn', '', 'nn', '', '', 'nnn', '', 0, '', '', '', '', '', '', '', '', '2022-07-02 12:28:37', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '7787hgjjhj', '2022-07-02 12:28:37'),
(94, 'jabbarahmad540@gmail.com', '', 'jabbar ahmad', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-05 11:59:12', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjI2NTBhMmNlNDdiMWFiM2JhNDA5OTc5N2Y4YzA2ZWJjM2RlOTI4YWMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI3NjI5NzM2OTEzNDgtbGthcmRxZW05czQ2NjgxM2psNjlkdHFmYm80b2VicmUuYXBwcy5nb29nbGV1c2VyY29udGVudC5j', '2022-07-05 11:59:12'),
(95, 'jabbarahmad540@gmail.com', '', 'jabbar ahmad', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-05 11:59:35', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjI2NTBhMmNlNDdiMWFiM2JhNDA5OTc5N2Y4YzA2ZWJjM2RlOTI4YWMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI3NjI5NzM2OTEzNDgtbGthcmRxZW05czQ2NjgxM2psNjlkdHFmYm80b2VicmUuYXBwcy5nb29nbGV1c2VyY29udGVudC5j', '2022-07-05 11:59:35'),
(96, 'jabbarahmad540@gmail.com', '', 'jabbar ahmad', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-05 12:01:09', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjI2NTBhMmNlNDdiMWFiM2JhNDA5OTc5N2Y4YzA2ZWJjM2RlOTI4YWMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI3NjI5NzM2OTEzNDgtbGthcmRxZW05czQ2NjgxM2psNjlkdHFmYm80b2VicmUuYXBwcy5nb29nbGV1c2VyY29udGVudC5j', '2022-07-05 12:01:09'),
(97, 'jabbarahmad540@gmail.com', '', 'jabbar ahmad', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-05 12:03:28', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjI2NTBhMmNlNDdiMWFiM2JhNDA5OTc5N2Y4YzA2ZWJjM2RlOTI4YWMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI3NjI5NzM2OTEzNDgtbGthcmRxZW05czQ2NjgxM2psNjlkdHFmYm80b2VicmUuYXBwcy5nb29nbGV1c2VyY29udGVudC5j', '2022-07-05 12:03:28'),
(98, 'jabbarahmad540@gmail.com', '', 'jabbar ahmad', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-05 12:04:29', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjI2NTBhMmNlNDdiMWFiM2JhNDA5OTc5N2Y4YzA2ZWJjM2RlOTI4YWMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI3NjI5NzM2OTEzNDgtbGthcmRxZW05czQ2NjgxM2psNjlkdHFmYm80b2VicmUuYXBwcy5nb29nbGV1c2VyY29udGVudC5j', '2022-07-05 12:04:29'),
(99, 'jabbarahmad540@gmail.com', '', 'jabbar ahmad', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-05 12:05:12', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjI2NTBhMmNlNDdiMWFiM2JhNDA5OTc5N2Y4YzA2ZWJjM2RlOTI4YWMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI3NjI5NzM2OTEzNDgtbGthcmRxZW05czQ2NjgxM2psNjlkdHFmYm80b2VicmUuYXBwcy5nb29nbGV1c2VyY29udGVudC5j', '2022-07-05 12:05:12'),
(100, 'jabbarahmad540@gmail.com', '', 'jabbar ahmad', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-06 05:23:10', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjI2NTBhMmNlNDdiMWFiM2JhNDA5OTc5N2Y4YzA2ZWJjM2RlOTI4YWMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI3NjI5NzM2OTEzNDgtbGthcmRxZW05czQ2NjgxM2psNjlkdHFmYm80b2VicmUuYXBwcy5nb29nbGV1c2VyY29udGVudC5j', '2022-07-06 05:23:10'),
(101, 'jabbarahmad540@gmail.com', '', 'jabbar ahmad', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-06 05:24:05', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjI2NTBhMmNlNDdiMWFiM2JhNDA5OTc5N2Y4YzA2ZWJjM2RlOTI4YWMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI3NjI5NzM2OTEzNDgtbGthcmRxZW05czQ2NjgxM2psNjlkdHFmYm80b2VicmUuYXBwcy5nb29nbGV1c2VyY29udGVudC5j', '2022-07-06 05:24:05'),
(102, 'jabbarahmad540@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'jabbar ahmad', '', '', '', 'profile_102.jpg', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-06 06:21:26', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjI2NTBhMmNlNDdiMWFiM2JhNDA5OTc5N2Y4YzA2ZWJjM2RlOTI4YWMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI3NjI5NzM2OTEzNDgtbGthcmRxZW05czQ2NjgxM2psNjlkdHFmYm80b2VicmUuYXBwcy5nb29nbGV1c2VyY29udGVudC5j', '2022-07-06 06:59:10'),
(103, 'jabbarahmad540@gmail.com', '', 'jabbar ahmad', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-06 08:37:23', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjI2NTBhMmNlNDdiMWFiM2JhNDA5OTc5N2Y4YzA2ZWJjM2RlOTI4YWMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI3NjI5NzM2OTEzNDgtbGthcmRxZW05czQ2NjgxM2psNjlkdHFmYm80b2VicmUuYXBwcy5nb29nbGV1c2VyY29udGVudC5j', '2022-07-06 08:37:23'),
(104, 'jabbarahmad540@gmail.com', '', 'jabbar ahmad', '', '', '', 'profile_104.jpg', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-06 08:50:35', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjI2NTBhMmNlNDdiMWFiM2JhNDA5OTc5N2Y4YzA2ZWJjM2RlOTI4YWMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI3NjI5NzM2OTEzNDgtbGthcmRxZW05czQ2NjgxM2psNjlkdHFmYm80b2VicmUuYXBwcy5nb29nbGV1c2VyY29udGVudC5j', '2022-07-06 08:54:20'),
(105, 'jabbarahmad540@gmail.com', '', 'jabbar ahmad', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-06 09:47:57', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjI2NTBhMmNlNDdiMWFiM2JhNDA5OTc5N2Y4YzA2ZWJjM2RlOTI4YWMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI3NjI5NzM2OTEzNDgtbGthcmRxZW05czQ2NjgxM2psNjlkdHFmYm80b2VicmUuYXBwcy5nb29nbGV1c2VyY29udGVudC5j', '2022-07-06 09:47:57'),
(106, 'jabbarahmad25@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Arslan', '', 'Ali', '', '', '', '', 2, '', '', '', '', '', '', '', '', '2022-07-07 05:27:21', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-07 05:27:34'),
(107, 'jabbarahmad540@gmail.com', '', 'jabbar ahmad', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-07 05:28:44', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjFiZDY4NWY1ZThmYzYyZDc1ODcwNWMxZWIwZThhNzUyNGM0NzU5NzUiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI3NjI5NzM2OTEzNDgtbGthcmRxZW05czQ2NjgxM2psNjlkdHFmYm80b2VicmUuYXBwcy5nb29nbGV1c2VyY29udGVudC5j', '2022-07-07 05:28:44'),
(108, 'jabbarahmad26@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Jabbar', '', 'Ahmad', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-07 10:51:11', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-07 10:51:20'),
(109, 'jabbarahmad29@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Dawood', '', 'Nawaz', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-07-07 12:16:40', 'Sell and Buy', '', 0, 1000, 0, 'Finance', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-07 12:17:29'),
(110, 'jabbarahmad30@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Dawood', '', 'Arslan', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-07 12:19:14', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-07 12:19:24'),
(111, 'jabbarahmad31@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Jabbar', '', 'Ahmad naqvi', '', 'profile_111.jpg', '', '', 1, '', '', '', '', '', '', '', '', '2022-07-07 12:30:50', 'Sell', '', 119, 544, 0, 'Finance', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-07 12:31:57'),
(112, 'danishgoheer@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Danish', 'Goheer', 'Fff', '', '', '', '', 2, '', '', '', '', '', '', '', '', '2022-07-07 12:51:21', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-07 12:54:15'),
(113, 'checkuser12@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Sn', 'Jsn', 'Msn', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-07-07 12:57:59', 'Sell', '', 0, 1000, 0, 'Finance', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-07 12:58:32'),
(114, 'test@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Ks', 'Kw', 'Ks', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-07 13:00:20', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-07 13:00:29'),
(115, 'jabbarahmad32@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Ahmad', '', 'Arslan', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-07-07 22:24:50', 'Sell', '', 329, 497, 0, 'Finance', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-07 22:27:35'),
(116, 'jabbarahmad34@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Alp', '', 'Arslan', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-07 22:29:08', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-07 22:29:20'),
(117, 'ham@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Danish', 'Goheer', 'Danish', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-07-13 12:26:50', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-13 12:27:01'),
(118, 'check@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-13 12:45:17', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-13 12:45:17'),
(119, 'check2@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Danishg', 'Goheer', 'Das', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-13 13:02:02', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-13 13:09:06'),
(120, 'danishgoheer177@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Danish', 'Goheer', 'Danish', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-07-13 13:54:57', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-13 13:55:09'),
(121, 'ahbilal@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-13 14:08:59', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-13 14:08:59'),
(122, 'checkuser33@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-13 14:12:35', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-13 14:12:35'),
(123, 'checkuu@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'D', 'Sd', 'S', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-13 14:14:28', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-13 14:17:09'),
(124, 'danishg@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Danish', 'Goheer', 'Danish', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-13 14:21:40', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-13 14:21:53'),
(125, 'basit@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Basit', 'Ali', 'Basit', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-13 14:53:55', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-13 14:54:21'),
(126, 'danis@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Danishg', 'Goheer', 'Ww', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-07-13 15:44:08', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-13 17:02:33'),
(127, 'danishgoheer18@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Danish', 'Goheer', 'Hahs', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-07-13 17:51:16', 'Sell', '', 20, 60, 0, 'Finance', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-13 17:51:44'),
(128, 'itxmian@icloud.com', '68a09a525e0baa750d60de7252e1fed9931683081c4ccb6210ad29fedd6a8927', 'Muhammad', 'Ahmad', 'Sir', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-13 20:53:40', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-13 20:53:57'),
(129, 'noahchristofer@gmail.com', '981f119305520cd97c6e933ad9d14579fc1c662352ecabc0a389324aa2d8c7d4', 'Noah', '', 'C', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-13 21:25:00', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-13 21:25:19'),
(130, 'jabbarahmad41@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Ajax', '', 'Ajkvx', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-07-14 05:45:16', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-14 05:45:32'),
(131, 'jabbarahmad42@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Havag', '', 'Bvab', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-07-14 06:02:44', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-14 06:04:09'),
(132, 'jabbarahmad43@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-14 06:05:00', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-14 06:05:00'),
(133, 'danishgoheer17@hotmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Danish', '', 'Goheet', '', '', '', '', 2, '', '', '', '', '', '', '', '', '2022-07-22 20:43:59', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-22 20:44:20'),
(134, 'tested@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Jabbar', '', 'Ahmad', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-07-26 05:58:25', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-26 05:58:40'),
(135, 'jabbarahmad2ja1@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Jahah', '', 'Hash', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-26 05:59:54', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-26 06:00:16'),
(136, 'testingadmivvvn@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Hash', '', 'Name', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-26 06:05:32', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-26 06:05:41'),
(137, 'jabbarahmaccvd21@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Ggg', '', 'Ggg', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-26 06:29:25', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-26 06:29:33'),
(138, 'jabbarahmadgugu540@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Jabbar', '', 'Ahmad', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-26 06:50:54', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-26 06:51:12'),
(139, 'testingadmffin@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Jabbar', '', 'Ali', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-07-26 07:24:09', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-07-26 07:24:20'),
(140, 'check12@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Danish', 'Goheer', 'Das', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-08-17 07:47:50', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-08-17 07:48:10'),
(141, 'danishgoheer171@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-08-26 10:45:15', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-08-26 10:45:15'),
(142, 'danishgoheer1712@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-08-26 10:46:09', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-08-26 10:46:09'),
(143, 'test@mail.com', '68a09a525e0baa750d60de7252e1fed9931683081c4ccb6210ad29fedd6a8927', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-08-26 10:47:57', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-08-26 10:47:57'),
(144, 'test123@mail.com', 'b0e1a14a5dbf3092120dc8f067e1ee269d936dd0004dc0bb6cc15fe1225f5dd9', 'Noah', '', 'Wells', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-08-26 10:49:47', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-08-26 10:55:26'),
(145, 'danishgoheer17122@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Danish', 'Goheer', '1221', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-08-26 20:58:56', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-08-26 20:59:11'),
(146, 'danishgoher21@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Da', 'Sa', 'S', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-08-26 22:32:56', 'Sell', '', 20, 60, 0, 'Finance', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-08-26 22:45:32'),
(147, 'nsnssb@mail.com', 'c396bc88b1ada191e7f710b2fe58b588e11069c6ef3e01da4c1c79938a4c5f16', 'Muhammad', 'Mian', 'Ahmad', '', 'profile_147.jpg', '', '', 0, '', '', '', '', '', '', '', '', '2022-08-27 05:05:10', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-08-27 05:09:12'),
(148, 'nsshn@mail.com', 'c396bc88b1ada191e7f710b2fe58b588e11069c6ef3e01da4c1c79938a4c5f16', 'Muhammad', 'Mian', 'Ahmad', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-08-27 05:10:54', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-08-27 05:11:05'),
(149, 'danishgoheer1725@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Danish', 'Goheer', 'Danish', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-08-31 06:54:47', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-08-31 06:55:07'),
(150, 'danishgoheer121@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-08-31 07:18:13', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-08-31 07:18:13'),
(151, 'itxmian999@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Mian', 'Ahmad', 'Ds', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-08-31 07:19:42', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-08-31 07:19:51'),
(152, 'red@mail.com', 'f5b12f2b74f2c908b4ab298f3614227b273355f5ce767edc91eba10585bfdb7b', 'Noah', '', 'Craig', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-08-31 14:14:39', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-08-31 14:14:49'),
(153, 'go@mail.com', '9b8bc5af4991857b3625b838168b83c60eb3d7939428fe70dfe602bccf1b52a6', 'Reed', '', 'Green', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-08-31 14:29:37', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-08-31 14:29:50'),
(154, 'greg@mail.com', 'f5b12f2b74f2c908b4ab298f3614227b273355f5ce767edc91eba10585bfdb7b', 'Greg', '', 'Reed', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-08-31 14:36:23', 'Sell and Buy', '', 20, 60, 0, 'Cash', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-08-31 14:39:53'),
(155, 'cee@mail.com', 'f5b12f2b74f2c908b4ab298f3614227b273355f5ce767edc91eba10585bfdb7b', 'Cee', '', 'Cee', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-08-31 14:40:34', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-08-31 14:40:43'),
(156, 'you@mail.com', 'e2ec42fe06d7fce1f4359b28af46e91db5d0c227cdfdf6dd021be4abd45664d4', 'You', '', 'Mail', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-08-31 14:43:32', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-08-31 14:43:46'),
(157, 'jabbarahmad200@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Jabb', 'Fif', 'Ifkgo', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-09-02 10:44:29', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-09-02 10:44:51'),
(158, 'jabbarahmad300@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Jabb', 'Bwb', 'Ahmad', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-09-02 11:35:07', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-09-02 11:35:17'),
(159, 'danishgoheer1.7@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Hah', 'Nsn', 'nna', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-09-06 16:11:37', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-09-06 16:11:48'),
(160, 'danishgoheer.17@hotmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Bsn', 'Nsw', 'S', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-09-06 16:13:09', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-09-06 16:13:18'),
(161, 'test1001a@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Jabb', '', 'Ah', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-09-07 05:00:45', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-09-07 05:01:03'),
(162, 'test1001b@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Jabb', '', 'Ahka', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-09-07 05:35:15', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-09-07 05:35:27'),
(163, 'test1001c@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Jabb', '', 'Ah', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-09-07 05:42:15', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-09-07 05:42:23'),
(164, 'testad40@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Jab', '', 'Ahm', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-09-07 06:23:01', 'Sell and Buy', '', 50, 5000, 0, 'Finance', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-09-07 06:31:31'),
(165, 'arman1jb@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Arman', 'Talib', 'E', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-09-07 19:58:37', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-09-07 19:58:47'),
(166, 'arman1.jb@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Jk', 'Jk1kj', 'J', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-09-07 20:51:08', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-09-07 20:51:16'),
(167, 'danishgoheer.1@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Jk', 'Jk', 'Oh', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-09-07 20:57:18', 'Sell and Buy', '', 50000, 1500000, 0, 'Cash', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-09-07 20:57:34'),
(168, 'testing@mail.com', 'a7159d0d1b9bf6310c9b28147d6fc348f5bd98153fc5b59b8d7624be6fbf7667', 'Noah', 'C', 'East', '', '', '', '', 2, '', '', '', '', '', '', '', '', '2022-09-15 00:40:30', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-09-15 00:42:39'),
(169, 'blue@mail.com', '804502c4f2c1294fdad9a4585feb1825cc1700b6372e28f0206e168ffe1260c7', 'Flu', '', 'Go', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-09-15 16:18:08', 'Sell and Buy', '', 50000, 2438019, 0, 'Finance', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-09-15 16:21:23'),
(170, 'together@mail.com', '940b93be01fa4d6d6ce493925ad605303be633c996d62fcf3b155c6bffb5fc11', 'Ho', '', 'Jo', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-09-15 18:14:29', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-09-15 18:14:43'),
(171, 'test@admin.com', 'f5b12f2b74f2c908b4ab298f3614227b273355f5ce767edc91eba10585bfdb7b', 'Jabbar', '', 'Ahmad', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-10-13 17:55:03', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-10-13 17:55:53'),
(172, 'gogo@gmail.com', 'f5b12f2b74f2c908b4ab298f3614227b273355f5ce767edc91eba10585bfdb7b', 'Noah', '', 'C', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-10-15 11:36:13', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-10-15 11:36:24'),
(173, 'ret@mail.com', 'f5b12f2b74f2c908b4ab298f3614227b273355f5ce767edc91eba10585bfdb7b', 'Noah', '', 'C', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-10-15 11:50:34', 'Sell and Buy', '', 50000, 1500000, 0, 'Finance', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-10-15 11:53:20'),
(174, 'ego@mail.com', '3ffc40f289b70df067faa8a56a2499413db65e9fd8785e3027cc0884175f4fdb', 'Gh', 'Cv', 'Gyf', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-10-15 12:01:50', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-10-15 12:02:00'),
(175, 'test21@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Jabbar', '', 'Ahmad', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-10-19 05:17:00', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-10-19 05:17:19'),
(176, 'test1@admin.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Jabbar', '', 'Ahmad', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-10-19 05:50:29', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-10-19 05:50:40'),
(177, 'tes1t@admin.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Test', '', 'Test', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2022-10-19 07:09:27', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-10-19 07:09:34'),
(178, 'tes2t@admin.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'First', '', 'Last', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2022-10-19 07:26:48', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2022-10-19 07:33:35'),
(179, 'test1000@gmail.com', '0d209b8a5d9043089a29ec384b0a373942e336df227175f93fba14c99a05d11d', 'Jabb', '', 'Ahmad', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2023-01-14 11:37:40', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2023-01-14 11:37:50'),
(180, 'tes1000@gmail.com', 'c6ecc5ae22f843956464d20dc3da742d33e031f2e01bc28412565720ef5bde4c', 'Jab', '', 'Ah', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2023-01-14 11:51:42', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2023-01-14 11:51:50'),
(181, 'te155@gmail.com', '23a681e5b274d62e61108d47883df33eda9e5eb7104d5b155c10767c99d69a32', 'Gaga', '', 'Whhs', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2023-01-14 12:00:35', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2023-01-14 12:00:51'),
(182, 'ncraig@gmail.com', '20b5102667f28df9ad2eafe521902779dbd3b6ec5b9454ecfb7ac83bbd5d39b4', 'Noah', '', 'Craig', '', 'profile_182.jpg', '', '', 1, '', '', '', '', '', '', '', '', '2023-01-22 20:00:01', 'Buy', '', 50000, 2449491, 0, 'Finance', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2023-01-23 02:05:05'),
(183, 't2000@gmail.com', 'c0066388be3aa1806bfe14b71be76dcc227d847bf224e3b429491044a19a96af', 'Test', '', 'Tested', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2023-01-27 07:34:28', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2023-01-27 07:34:37'),
(184, 'test2000@gmail.com', '268586287e2501f1d418094725b887efe51b65dd667ce5e0520a19d40b57837f', 'Jabbar', '', 'Buyer', '', '', '', '', 1, '', '', '', '', '', '', '', '', '2023-01-27 09:42:09', 'Sell and Buy', '', 787, 1500, 0, 'Finance', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2023-01-27 09:42:26'),
(185, 'testbsb2000@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2023-01-27 11:09:57', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2023-01-27 11:09:57'),
(186, 'noah@hotmail.com', 'f5b12f2b74f2c908b4ab298f3614227b273355f5ce767edc91eba10585bfdb7b', 'Noah', '', 'Craigwell', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2023-01-27 15:04:40', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2023-01-27 15:04:52'),
(187, 'danishgoheer127@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Hs', 'Ha', 'Ha', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2023-01-27 18:07:04', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2023-01-27 18:07:11'),
(188, 'test10000@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Ggg', '', 'Hsh', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2023-02-04 07:22:54', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2023-02-04 07:23:06'),
(189, 'danishgoheer1733@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2023-02-10 10:11:04', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2023-02-10 10:11:04'),
(190, 'danishgoheer1733q@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Z', 'X', 'Z', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2023-02-10 10:11:27', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2023-02-10 10:11:36'),
(191, 'tt100@gmail.com', '6673a7fb810c1ee5373ce83d4005fa50d7925b1caf20a558cba9b45a3610f60e', 'Jabbar', '', 'Ahmad', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2023-02-10 18:08:57', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2023-02-10 18:09:11'),
(192, 'tes@gmaol.ug', '5716c80a50e8c95fe8a3f52217c51914bab341f3eb42e118d7f3bb5c0885cd4b', 'HB b', '', 'Bb', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2023-02-10 18:49:38', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2023-02-10 18:49:47'),
(193, 'test@ham.com', '770b4c6c5625f30f3b7b808e029992be088c87e03a54e5393d52e777bd8e02d0', 'G', '', 'Ggg', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2023-02-10 18:51:53', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2023-02-10 18:51:57'),
(194, 'contact@beyondmeasureproductions.com', 'a7159d0d1b9bf6310c9b28147d6fc348f5bd98153fc5b59b8d7624be6fbf7667', 'Noah', '', 'C', '', '', '', '', 2, '', '', '', '', '', '', '', '', '2023-02-11 20:59:22', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2023-02-11 20:59:34'),
(195, 'director35mm@gmail.com', 'a7159d0d1b9bf6310c9b28147d6fc348f5bd98153fc5b59b8d7624be6fbf7667', 'Noah', '', 'Craigwell', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2023-02-11 21:07:55', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2023-02-11 21:08:44'),
(196, 'danishgoheer1711@gmail.com', '5a19495c7e46660fca3611d0dfef055d6390c261009f001515286b2b55b2ceea', 'Ns', 'He', 'Hss', '', '', '', '', 0, '', '', '', '', '', '', '', '', '2023-02-13 11:07:31', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '2023-02-13 11:08:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `appraisals`
--
ALTER TABLE `appraisals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `connects`
--
ALTER TABLE `connects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_card`
--
ALTER TABLE `credit_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `demands`
--
ALTER TABLE `demands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help`
--
ALTER TABLE `help`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ledger`
--
ALTER TABLE `ledger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listing`
--
ALTER TABLE `listing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_report`
--
ALTER TABLE `login_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preferences`
--
ALTER TABLE `preferences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_history`
--
ALTER TABLE `status_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub-category`
--
ALTER TABLE `sub-category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trades`
--
ALTER TABLE `trades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appraisals`
--
ALTER TABLE `appraisals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=461;

--
-- AUTO_INCREMENT for table `connects`
--
ALTER TABLE `connects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `credit_card`
--
ALTER TABLE `credit_card`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `demands`
--
ALTER TABLE `demands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `help`
--
ALTER TABLE `help`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ledger`
--
ALTER TABLE `ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `listing`
--
ALTER TABLE `listing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `login_report`
--
ALTER TABLE `login_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=389;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `status_history`
--
ALTER TABLE `status_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `sub-category`
--
ALTER TABLE `sub-category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `trades`
--
ALTER TABLE `trades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
