-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2022 at 02:50 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alumni_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumnus_bio`
--

CREATE TABLE `alumnus_bio` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `batch` year(4) NOT NULL,
  `course_id` int(30) NOT NULL,
  `email` varchar(250) NOT NULL,
  `connected_to` text NOT NULL,
  `semster` varchar(10) NOT NULL,
  `avatar` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0= Unverified, 1= Verified',
  `date_created` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alumnus_bio`
--

INSERT INTO `alumnus_bio` (`id`, `firstname`, `middlename`, `lastname`, `gender`, `batch`, `course_id`, `email`, `connected_to`, `semster`, `avatar`, `status`, `date_created`) VALUES
(1, 'Asif', '', 'Tyagi', 'Male', 2022, 1, 'asif@gmail.com', '2023Mca1015', 'I', '1639159200_A2.jpg', 1, '2021-12-10');

-- --------------------------------------------------------

--
-- Table structure for table `careers`
--

CREATE TABLE `careers` (
  `id` int(30) NOT NULL,
  `company` varchar(250) NOT NULL,
  `location` text NOT NULL,
  `job_title` text NOT NULL,
  `description` text NOT NULL,
  `user_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `careers`
--

INSERT INTO `careers` (`id`, `company`, `location`, `job_title`, `description`, `user_id`, `date_created`) VALUES
(4, 'Cognizant', 'Banglore , Mumbai ', 'System Analyst', '&lt;p style=&quot;text-align: center;&quot;&gt;CTC - 400000&lt;/p&gt;', 4, '2021-12-08 00:29:55');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(30) NOT NULL,
  `course` text NOT NULL,
  `about` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course`, `about`) VALUES
(1, 'MCA', 'Sample'),
(6, 'B.tech', ''),
(7, 'MBA', ''),
(8, 'B.Pharma', '');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(30) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `schedule` datetime NOT NULL,
  `banner` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `content`, `schedule`, `banner`, `date_created`) VALUES
(8, 'Ideathon', 'an event where you can show up your ideas.', '2021-12-13 10:58:00', '1639111620_14962174791443707268KIETNew.jpg', '2021-12-10 10:15:23'),
(9, 'Quizzinga', 'a departmental quiz .', '2021-12-17 10:18:00', '1639111740_banner.png', '2021-12-10 10:16:09'),
(10, ' KIET KODERS KORNER ( ALGORITHM UNLOCK 2.0 )', '&lt;font face=&quot;times new roman, serif&quot; size=&quot;4&quot; style=&quot;color: rgb(34, 34, 34);&quot;&gt;&lt;font color=&quot;#0000ff&quot;&gt;CodeChef KIET Chapter is elated to announce its coding contest Algorithm Unlock 2.0.&lt;/font&gt;&lt;/font&gt;&lt;p style=&quot;color: rgb(34, 34, 34); font-size: small;&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;times new roman&amp;quot;, serif; font-size: large;&quot;&gt;&lt;b&gt;This time we have tried to make the contest beginner-friendly so we are hoping for maximum participation from our college.&lt;/b&gt;&lt;/span&gt;&lt;font face=&quot;times new roman, serif&quot; size=&quot;4&quot;&gt;&lt;font color=&quot;#0000ff&quot;&gt;&lt;br&gt;&lt;/font&gt;The coding questions are based on popular algorithms and data structure concepts. It&amp;#x2019;s a great opportunity for all the students.&amp;nbsp;&lt;font color=&quot;#0000ff&quot;&gt;Students from all the years and any branch can participate.&lt;/font&gt;&amp;nbsp;The contest is extremely beneficial and is going to enhance the programming skills. So, show your active participation and improve your skills.&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(34, 34, 34); font-size: small;&quot;&gt;Consistency is what transforms average to excellence. A little progress each day adds up to big results.&amp;nbsp;&lt;b&gt;Contest Link: This will be shared soon.&lt;/b&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(34, 34, 34); font-size: small;&quot;&gt;&lt;font face=&quot;times new roman, serif&quot; size=&quot;4&quot;&gt;&lt;b&gt;Date:&amp;nbsp;&lt;/b&gt;Sunday, 12 Dec 2021&lt;br&gt;&lt;b&gt;Timings&lt;/b&gt;: 7:00 pm to 9:00 pm&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(34, 34, 34); font-size: small;&quot;&gt;&lt;font size=&quot;4&quot;&gt;&lt;b&gt;&lt;font face=&quot;times new roman, serif&quot;&gt;Problem Setters&lt;/font&gt;&lt;/b&gt;: Soumy Jain, Lakshay Kumar, Dev Bhaskar Singh, Anugya Jain&lt;br&gt;&lt;b&gt;&lt;font face=&quot;times new roman, serif&quot;&gt;Problem Tester&lt;/font&gt;&lt;/b&gt;: Divyank Goyal&amp;nbsp;&lt;/font&gt;&lt;font face=&quot;times new roman, serif&quot; size=&quot;4&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(34, 34, 34); font-size: small;&quot;&gt;&lt;font face=&quot;times new roman, serif&quot; size=&quot;4&quot;&gt;&lt;b&gt;Prize:&lt;/b&gt;&amp;nbsp;250 CodeChef Laddus each for top 3 winners.&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(34, 34, 34); font-size: small;&quot;&gt;&lt;font face=&quot;times new roman, serif&quot; size=&quot;4&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(34, 34, 34); font-size: small;&quot;&gt;&lt;span style=&quot;color: rgb(34, 34, 34); font-family: &amp;quot;times new roman&amp;quot;, serif; font-size: large;&quot;&gt;Using Laddus you can order exciting and cool goodies from&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://goodies.codechef.com/goodies&quot; target=&quot;_blank&quot; data-saferedirecturl=&quot;https://www.google.com/url?q=https://goodies.codechef.com/goodies&amp;amp;source=gmail&amp;amp;ust=1639280793634000&amp;amp;usg=AOvVaw0HlUiXn9f6Dg_1pWnpkQKW&quot; style=&quot;color: rgb(17, 85, 204); font-family: &amp;quot;times new roman&amp;quot;, serif; font-size: large; background-color: rgb(255, 255, 255);&quot;&gt;CodeChef&lt;/a&gt;&lt;span style=&quot;color: rgb(34, 34, 34); font-family: &amp;quot;times new roman&amp;quot;, serif; font-size: large;&quot;&gt;.&lt;/span&gt;&lt;font face=&quot;times new roman, serif&quot; size=&quot;4&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/p&gt;', '2021-12-11 07:00:00', '1639194540_Presents1.jpg', '2021-12-11 09:19:28'),
(11, 'An opportunity for the students to join us at E-Cell KIET', '&lt;p dir=&quot;ltr&quot; style=&quot;color: rgb(34, 34, 34); font-size: small; line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;&quot;&gt;&lt;span style=&quot;font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;&quot;&gt;&quot;Don&rsquo;t let the noise of others&rsquo; opinions drown out your own inner voice.&rdquo;&lt;/span&gt;&lt;/p&gt;&lt;br style=&quot;color: rgb(34, 34, 34); font-size: small;&quot;&gt;&lt;p dir=&quot;ltr&quot; style=&quot;color: rgb(34, 34, 34); font-size: small; line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;&quot;&gt;&lt;span style=&quot;font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;&quot;&gt;Greetings from the Entrepreneurship Cell, KIET!&lt;/span&gt;&lt;/p&gt;&lt;br style=&quot;color: rgb(34, 34, 34); font-size: small;&quot;&gt;&lt;p dir=&quot;ltr&quot; style=&quot;color: rgb(34, 34, 34); font-size: small; line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;&quot;&gt;&lt;span style=&quot;font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;&quot;&gt;It&amp;#x2019;s time for you to brush up on your abilities as e-Cell KIET is here with its &lt;b&gt;core committee recruitment drive&lt;/b&gt;. e-Cell KIET works in partnership with the Technology Business Incubator (TBI-KIET) which helps students to launch their career. Get ready to broaden the spectrum of your skills and push your limits to another level.&lt;/span&gt;&lt;/p&gt;&lt;br style=&quot;color: rgb(34, 34, 34); font-size: small;&quot;&gt;&lt;p dir=&quot;ltr&quot; style=&quot;color: rgb(34, 34, 34); font-size: small; line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;&quot;&gt;&lt;span style=&quot;font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;&quot;&gt;Here you will get a chance to shape your entrepreneurial mindset, get hands-on experience, network, learn and grow in all domains. Take this opportunity to learn more about your interests, skills and explore various domains.&lt;/span&gt;&lt;/p&gt;&lt;br style=&quot;color: rgb(34, 34, 34); font-size: small;&quot;&gt;&lt;p dir=&quot;ltr&quot; style=&quot;color: rgb(34, 34, 34); font-size: small; line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;&quot;&gt;&lt;span style=&quot;font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;&quot;&gt;&lt;b&gt;REGISTRATION FORM:&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p dir=&quot;ltr&quot; style=&quot;color: rgb(34, 34, 34); font-size: small; line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;&quot;&gt;&lt;b&gt;&lt;a href=&quot;https://forms.gle/qsjEXxeoSKcvfE3H8&quot; target=&quot;_blank&quot; data-saferedirecturl=&quot;https://www.google.com/url?q=https://forms.gle/qsjEXxeoSKcvfE3H8&amp;amp;source=gmail&amp;amp;ust=1639286789646000&amp;amp;usg=AOvVaw2jWhOPhTw8zKCh65CnBj0v&quot; style=&quot;color: rgb(17, 85, 204); text-decoration-line: none;&quot;&gt;&lt;span style=&quot;font-size: 11pt; font-family: Arial; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;&quot;&gt;https://forms.gle/&lt;wbr&gt;qsjEXxeoSKcvfE3H8&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/b&gt;&lt;/p&gt;&lt;br style=&quot;color: rgb(34, 34, 34); font-size: small;&quot;&gt;&lt;br style=&quot;color: rgb(34, 34, 34); font-size: small;&quot;&gt;&lt;p dir=&quot;ltr&quot; style=&quot;color: rgb(34, 34, 34); font-size: small; line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;&quot;&gt;&lt;span style=&quot;font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;&quot;&gt;Skills required for each domain are mentioned below:&lt;/span&gt;&lt;/p&gt;&lt;br style=&quot;color: rgb(34, 34, 34); font-size: small;&quot;&gt;&lt;p dir=&quot;ltr&quot; style=&quot;color: rgb(34, 34, 34); font-size: small; line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;&quot;&gt;&lt;span style=&quot;font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;&quot;&gt;&lt;b&gt;Public Relations:&lt;/b&gt; Keen interest in content creation and social media affairs. Content Writing, English Proficiency &amp;amp; strategic communication skills.&lt;/span&gt;&lt;/p&gt;&lt;p dir=&quot;ltr&quot; style=&quot;color: rgb(34, 34, 34); font-size: small; line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;&quot;&gt;&lt;span style=&quot;font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;&quot;&gt;&lt;b&gt;Technical Team: &lt;/b&gt;WEB TEAM- Interest in Web Development. APP TEAM- Interest in App Development.&lt;/span&gt;&lt;/p&gt;&lt;p dir=&quot;ltr&quot; style=&quot;color: rgb(34, 34, 34); font-size: small; line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;&quot;&gt;&lt;span style=&quot;font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;&quot;&gt;&lt;b&gt;Graphics Team: &lt;/b&gt;Creative mindset with interest in poster making and video editing.&lt;/span&gt;&lt;/p&gt;&lt;p dir=&quot;ltr&quot; style=&quot;color: rgb(34, 34, 34); font-size: small; line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;&quot;&gt;&lt;span style=&quot;font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;&quot;&gt;&lt;b&gt;Corporate Relations:&lt;/b&gt; Convincing mindset and optimistic approach to work on collaborations and sponsorship deals.&lt;/span&gt;&lt;/p&gt;&lt;p dir=&quot;ltr&quot; style=&quot;color: rgb(34, 34, 34); font-size: small; line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;&quot;&gt;&lt;span style=&quot;font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;&quot;&gt;&lt;b&gt;&lt;span class=&quot;il&quot;&gt;Event&lt;/span&gt; Management:&lt;/b&gt; Creative Thinking and &lt;span class=&quot;il&quot;&gt;Event&lt;/span&gt; Planning.&lt;/span&gt;&lt;/p&gt;', '2021-12-12 14:00:00', '1639200660_E-CELLKIET.jpg', '2021-12-11 11:01:59');

-- --------------------------------------------------------

--
-- Table structure for table `event_commits`
--

CREATE TABLE `event_commits` (
  `id` int(30) NOT NULL,
  `event_id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_commits`
--

INSERT INTO `event_commits` (`id`, `event_id`, `user_id`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 2, 1),
(4, 2, 4),
(5, 3, 4),
(6, 4, 4),
(7, 5, 1),
(8, 6, 5),
(9, 6, 4),
(10, 8, 7),
(11, 10, 22);

-- --------------------------------------------------------

--
-- Table structure for table `forum_comments`
--

CREATE TABLE `forum_comments` (
  `id` int(30) NOT NULL,
  `topic_id` int(30) NOT NULL,
  `comment` text NOT NULL,
  `user_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `forum_comments`
--

INSERT INTO `forum_comments` (`id`, `topic_id`, `comment`, `user_id`, `date_created`) VALUES
(1, 3, 'Sample updated Comment', 3, '2020-10-15 15:46:03'),
(3, 3, 'Sample', 1, '2020-10-16 08:48:02'),
(5, 0, '', 1, '2020-10-16 09:49:34');

-- --------------------------------------------------------

--
-- Table structure for table `forum_topics`
--

CREATE TABLE `forum_topics` (
  `id` int(30) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `forum_topics`
--

INSERT INTO `forum_topics` (`id`, `title`, `description`, `user_id`, `date_created`) VALUES
(2, 'Sample Topic 2', '&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;&lt;/span&gt;', 3, '2020-10-15 15:20:51'),
(3, 'Sample Topic 3', '&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;Vivamus gravida nunc orci. Proin ut tristique odio. Nulla suscipit ipsum arcu, a luctus lorem vulputate et. Maecenas magna lorem, tempor id ultrices id, vehicula eu diam. Aliquam erat volutpat. Praesent in sem tincidunt, mattis odio nec, ultrices justo. Vivamus sit amet sapien ornare tortor porttitor congue vel et lorem. In interdum eget metus ut sagittis. In accumsan nec purus vel ornare. Quisque non scelerisque libero, et aliquam risus. Mauris tincidunt ullamcorper efficitur. Nullam venenatis in massa et elementum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; In mollis, tortor sed pellentesque ultrices, sem sem interdum lectus, a laoreet nulla lacus at risus. Ut placerat orci at enim fermentum, eget pretium ante pharetra. Nam id nunc congue augue feugiat egestas.&lt;/span&gt;', 3, '2020-10-15 15:22:30'),
(4, 'Topic by Admin', '&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: bolder; margin: 0px; padding: 0px; text-align: justify;&quot;&gt;Lorem Ipsum&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;&amp;nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&rsquo;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/span&gt;', 1, '2020-10-16 08:31:45');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(30) NOT NULL,
  `about` text NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `about`, `created`) VALUES
(12, 'Hey folks! \r\n\r\nThe most awaited poetic moment is finally knocking your door. Seize the opportunity to step into the whirlpool of breath-taking poems. KIET-Kavyanjali is recruiting the first year and second year artists who have the calibre to rhyme the poems and be the voice of abounding hearts.Hurry up! If you think that you have the potential to mesmerize the audience, get yourself registered and become a member of the Kavyanjali family by showcasing your talent.\r\n\r\nक्या आपके अदरं का कलाकार आपकी कॉपियों के आखिरी पन्नों के बीच छिपा हैँ?\r\n\r\n  क्या आपकी डायरी में रहते हैँ कुछ अनकहे शब्द? तो आइये, अपने शब्दों को पँख देकर उन्हें दिलों के आसमान से मिलाइये|\r\n\r\n\r\nDetails of the event:-\r\n\r\nDate :- 13 December,21 (Monday)\r\n\r\nTime :- 04:50 pm onwards\r\n\r\nVenue :- E-001', '2021-12-11 11:03:54'),
(13, 'Greetings from Team Quizzinga!!\r\nQUIZZINGA-The Quiz Club of KIET GROUP OF INSTITUTIONS extends its warm greetings to you all.\r\n\r\nContinuing our tradition of providing the best quizzes, we are hereby introducing the Cric-Meme Quiz (Cricket + Memes) quiz. Give yourself a memory check and participate in the quiz, after all, you might have come across most of the questions scrolling down your Instagram feed.\r\n\r\nNo registration fees.\r\nParticipation certificates to all.\r\nCertificate of merit to top 3.', '2021-12-11 11:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Student Event Participation', 'asif.2023mca1015@kiet.edu', '+919536133303', '1638963780_banner.png', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:24px;&quot;&gt;The main objective of this website is to provide the ease to both the students and the faculty of a particular organisation in spectating the events ongoing in their organisation and the participants on those events . There is also a additional feature in our website that a user can also view the recruitment of the company that are ongoing . it can be uploaded by the user according to his current knowledge.&amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/b&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=Admin,2=Alumni officer, 3= alumnus',
  `auto_generated_pass` text NOT NULL,
  `alumnus_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`, `auto_generated_pass`, `alumnus_id`) VALUES
(1, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 1, '', 0),
(22, 'Asif Tyagi', 'asif@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 3, '', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumnus_bio`
--
ALTER TABLE `alumnus_bio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `careers`
--
ALTER TABLE `careers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_commits`
--
ALTER TABLE `event_commits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum_comments`
--
ALTER TABLE `forum_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum_topics`
--
ALTER TABLE `forum_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
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
-- AUTO_INCREMENT for table `alumnus_bio`
--
ALTER TABLE `alumnus_bio`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `careers`
--
ALTER TABLE `careers`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `event_commits`
--
ALTER TABLE `event_commits`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `forum_comments`
--
ALTER TABLE `forum_comments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `forum_topics`
--
ALTER TABLE `forum_topics`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
