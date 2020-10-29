-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2020 at 03:04 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `craft`
--

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetindexdata`
--

CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assets`
--

CREATE TABLE `craft_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assettransformindex`
--

CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assettransforms`
--

CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categories`
--

CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categorygroups`
--

CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categorygroups_sites`
--

CREATE TABLE `craft_categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_changedattributes`
--

CREATE TABLE `craft_changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_changedattributes`
--

INSERT INTO `craft_changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(2, 1, 'uri', '2020-10-29 10:13:31', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `craft_changedfields`
--

CREATE TABLE `craft_changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_changedfields`
--

INSERT INTO `craft_changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES
(2, 1, 5, '2020-10-29 13:52:30', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `craft_content`
--

CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_siteDescription` text DEFAULT NULL,
  `field_richtext` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_content`
--

INSERT INTO `craft_content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_siteDescription`, `field_richtext`) VALUES
(1, 1, 1, NULL, '2020-10-28 09:43:27', '2020-10-28 09:43:27', '98512a5b-ec07-4d3a-9346-5942c8906df7', NULL, NULL),
(2, 2, 1, 'HomePage', '2020-10-28 09:57:35', '2020-10-29 13:52:29', 'a614a25f-80b7-4ea7-ae14-1ff35d08e7e4', NULL, '<h2><strong>20 Zomato Restaurants in Melbourne CBD:</strong></h2>'),
(3, 3, 1, 'HomePage', '2020-10-28 09:57:35', '2020-10-28 09:57:35', '95fb33f2-fa59-4312-b418-71fe30581b08', NULL, NULL),
(4, 4, 1, 'HomePage', '2020-10-28 10:02:31', '2020-10-28 10:02:31', '1f182d89-0569-4bdf-9017-19ad42553050', NULL, NULL),
(5, 5, 1, NULL, '2020-10-28 10:12:56', '2020-10-28 10:18:24', '85031dbc-6ab3-4760-ab45-6e35d043dfd5', 'This is a test site built to display restaurants from Zomato API - Ben Plunkett', NULL),
(6, 6, 1, 'HomePage', '2020-10-28 10:23:01', '2020-10-28 10:23:01', '43f14d62-e7cc-4e7d-bbfc-d48d3f2f8a2e', NULL, NULL),
(7, 8, 1, 'HomePage', '2020-10-28 10:24:42', '2020-10-28 10:24:42', '852940d2-34b2-4ade-8363-8188ea60c9c7', NULL, NULL),
(8, 11, 1, 'HomePage', '2020-10-28 10:25:05', '2020-10-28 10:25:05', '7459cc45-39bb-47e9-baa0-d68e74e46da2', NULL, NULL),
(9, 14, 1, 'HomePage', '2020-10-29 10:13:31', '2020-10-29 10:13:31', '806dc88b-f71b-48cb-a687-0dce098ee393', NULL, NULL),
(10, 17, 1, 'HomePage', '2020-10-29 10:15:18', '2020-10-29 10:15:18', 'abce025e-33fb-432f-9750-cc2e775a10c5', NULL, NULL),
(11, 20, 1, 'HomePage', '2020-10-29 10:15:18', '2020-10-29 10:15:18', 'a8c8ae1f-3a75-4d21-8ebe-8086ca7190aa', NULL, NULL),
(12, 23, 1, 'HomePage', '2020-10-29 10:28:03', '2020-10-29 10:28:03', 'a3329f75-aa3c-44b9-ab3b-2725558d4808', NULL, NULL),
(13, 24, 1, 'HomePage', '2020-10-29 10:28:46', '2020-10-29 10:28:46', 'a2fd34a4-8363-4371-9b03-a8795f517c50', NULL, '<p><strong>This is the sites Home Page</strong></p>\r\n<p>Zomato Restaurants:</p><ul><li></li></ul>'),
(14, 25, 1, 'HomePage', '2020-10-29 13:36:15', '2020-10-29 13:36:15', 'ce9ca379-1d60-4258-b817-0ecb20d8e9fb', NULL, '<h2><strong>This is the sites Home Page</strong></h2>\r\n<p>20 Zomato Restaurants in Melbourne CBD:</p>\r\n<ul><li></li></ul>'),
(15, 26, 1, 'HomePage', '2020-10-29 13:51:40', '2020-10-29 13:51:40', 'b57741c5-3871-4dab-8130-312e9e081a28', NULL, '<h2><strong>This is the sites Home Page</strong></h2>\r\n<p>20 Zomato Restaurants in Melbourne CBD:</p>\r\n'),
(16, 27, 1, 'HomePage', '2020-10-29 13:51:44', '2020-10-29 13:51:44', '09144e71-e1c4-495d-91de-324a2e6ba67b', NULL, '<h2><strong>This is the sites Home Page</strong></h2>\r\n<p>20 Zomato Restaurants in Melbourne CBD:</p>\r\n'),
(17, 28, 1, 'HomePage', '2020-10-29 13:52:02', '2020-10-29 13:52:02', '4ea9da97-2132-4f55-952a-6e9867832433', NULL, '<h2><strong>20 Zomato Restaurants in Melbourne CBD:</strong></h2>\r\n<p><br /></p>'),
(18, 29, 1, 'HomePage', '2020-10-29 13:52:30', '2020-10-29 13:52:30', '3d5eae07-5240-4a64-b624-8bbd119f104e', NULL, '<h2><strong>20 Zomato Restaurants in Melbourne CBD:</strong></h2>');

-- --------------------------------------------------------

--
-- Table structure for table `craft_craftidtokens`
--

CREATE TABLE `craft_craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_deprecationerrors`
--

CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_drafts`
--

CREATE TABLE `craft_drafts` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_elementindexsettings`
--

CREATE TABLE `craft_elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_elements`
--

CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_elements`
--

INSERT INTO `craft_elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2020-10-28 09:43:27', '2020-10-28 09:43:27', NULL, '2c19d958-6da4-4d78-825d-be7d99f634eb'),
(2, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2020-10-28 09:57:35', '2020-10-29 13:52:29', NULL, '28d153ae-a256-449c-bbdc-d54fef3267c1'),
(3, NULL, 1, 1, 'craft\\elements\\Entry', 1, 0, '2020-10-28 09:57:35', '2020-10-28 09:57:35', NULL, 'c0477c8f-0c8a-455d-8166-a1976156498e'),
(4, NULL, 2, 1, 'craft\\elements\\Entry', 1, 0, '2020-10-28 10:02:31', '2020-10-28 10:02:31', NULL, 'a028c573-60ee-462c-a8e0-d5e0ce225925'),
(5, NULL, NULL, 2, 'craft\\elements\\GlobalSet', 1, 0, '2020-10-28 10:12:56', '2020-10-28 10:18:24', NULL, '7e614a3f-ed5c-41de-8edd-923eca6d6d55'),
(6, NULL, 3, 1, 'craft\\elements\\Entry', 1, 0, '2020-10-28 10:23:01', '2020-10-28 10:23:01', NULL, 'cc1b5a72-b04c-43d5-90d2-5df35be79fd0'),
(7, NULL, NULL, 3, 'craft\\elements\\MatrixBlock', 1, 0, '2020-10-28 10:24:42', '2020-10-29 10:13:35', '2020-10-29 10:26:03', 'bdbe7b2e-7064-4c94-83e2-66c4acad5dc0'),
(8, NULL, 4, 1, 'craft\\elements\\Entry', 1, 0, '2020-10-28 10:24:41', '2020-10-28 10:24:41', NULL, 'dc2f8d35-3e07-4757-b022-1a4759990a65'),
(9, NULL, NULL, 3, 'craft\\elements\\MatrixBlock', 1, 0, '2020-10-28 10:24:42', '2020-10-28 10:24:42', NULL, 'e57a5c87-8f74-4c34-ac03-868f5b320937'),
(10, NULL, NULL, 3, 'craft\\elements\\MatrixBlock', 1, 0, '2020-10-28 10:25:05', '2020-10-29 10:13:35', '2020-10-29 10:26:03', '4e0d2775-8435-4011-b9f4-68e6c3cea244'),
(11, NULL, 5, 1, 'craft\\elements\\Entry', 1, 0, '2020-10-28 10:25:05', '2020-10-28 10:25:05', NULL, '9e726a8d-fcba-4958-b5f3-bbc5d02f1608'),
(12, NULL, NULL, 3, 'craft\\elements\\MatrixBlock', 1, 0, '2020-10-28 10:25:05', '2020-10-28 10:25:05', NULL, 'deb1073d-819a-4906-9297-ccdc93941fb0'),
(13, NULL, NULL, 3, 'craft\\elements\\MatrixBlock', 1, 0, '2020-10-28 10:25:05', '2020-10-28 10:25:05', NULL, '17dcee1a-da15-4a68-b445-701ecf7fb93f'),
(14, NULL, 6, 1, 'craft\\elements\\Entry', 1, 0, '2020-10-29 10:13:31', '2020-10-29 10:13:31', NULL, '8ce25e2d-5583-441f-9245-6da08ac4cea1'),
(15, NULL, NULL, 3, 'craft\\elements\\MatrixBlock', 1, 0, '2020-10-29 10:13:31', '2020-10-28 10:25:05', NULL, '31bedd01-7257-4a9b-ad4f-2a9ade775490'),
(16, NULL, NULL, 3, 'craft\\elements\\MatrixBlock', 1, 0, '2020-10-29 10:13:31', '2020-10-28 10:25:05', NULL, '6d4e1d28-5545-41f1-a214-3e97b032e6e2'),
(17, NULL, 7, 1, 'craft\\elements\\Entry', 1, 0, '2020-10-29 10:15:17', '2020-10-29 10:15:17', NULL, '08da892a-930a-40c8-8265-c6be6abb3304'),
(18, NULL, NULL, 3, 'craft\\elements\\MatrixBlock', 1, 0, '2020-10-29 10:15:18', '2020-10-29 10:13:35', NULL, 'd3d17350-b5e3-4681-8b89-de0de5c478fb'),
(19, NULL, NULL, 3, 'craft\\elements\\MatrixBlock', 1, 0, '2020-10-29 10:15:18', '2020-10-29 10:13:35', NULL, 'ba5f126f-e58d-4285-abb6-78e5df721dc8'),
(20, NULL, 8, 1, 'craft\\elements\\Entry', 1, 0, '2020-10-29 10:15:18', '2020-10-29 10:15:18', NULL, 'dd9d057d-8087-4e59-81a0-65ebf488f1b9'),
(21, NULL, NULL, 3, 'craft\\elements\\MatrixBlock', 1, 0, '2020-10-29 10:15:18', '2020-10-29 10:13:35', NULL, 'bc57cae8-2394-4eb7-b8d1-6e999d38842b'),
(22, NULL, NULL, 3, 'craft\\elements\\MatrixBlock', 1, 0, '2020-10-29 10:15:18', '2020-10-29 10:13:35', NULL, 'ca239ecb-6e36-44c9-947d-ea6a6f5a21f4'),
(23, NULL, 9, 1, 'craft\\elements\\Entry', 1, 0, '2020-10-29 10:28:02', '2020-10-29 10:28:02', NULL, '22e154e7-a9a4-4663-b93f-a3c6f7ae2a0f'),
(24, NULL, 10, 1, 'craft\\elements\\Entry', 1, 0, '2020-10-29 10:28:46', '2020-10-29 10:28:46', NULL, '244f894f-0a3f-49ec-8f9f-305b2373c547'),
(25, NULL, 11, 1, 'craft\\elements\\Entry', 1, 0, '2020-10-29 13:36:14', '2020-10-29 13:36:14', NULL, '6c03c908-a39f-4595-b800-6dbeb7bbc827'),
(26, NULL, 12, 1, 'craft\\elements\\Entry', 1, 0, '2020-10-29 13:51:40', '2020-10-29 13:51:40', NULL, '9137f48b-4317-4d31-b512-f71cc4aa3b50'),
(27, NULL, 13, 1, 'craft\\elements\\Entry', 1, 0, '2020-10-29 13:51:43', '2020-10-29 13:51:43', NULL, '3b55186b-d2af-413c-a6cc-b3410252c305'),
(28, NULL, 14, 1, 'craft\\elements\\Entry', 1, 0, '2020-10-29 13:52:02', '2020-10-29 13:52:02', NULL, '2e6fb7a0-1e62-4340-99d2-e53f60dae5b8'),
(29, NULL, 15, 1, 'craft\\elements\\Entry', 1, 0, '2020-10-29 13:52:29', '2020-10-29 13:52:29', NULL, 'eb92a31f-be8c-481a-b1ec-d3fd3d7976a9');

-- --------------------------------------------------------

--
-- Table structure for table `craft_elements_sites`
--

CREATE TABLE `craft_elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_elements_sites`
--

INSERT INTO `craft_elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2020-10-28 09:43:27', '2020-10-28 09:43:27', 'd565214f-b106-48b3-8f03-b4835e7a6abc'),
(2, 2, 1, 'homepage', 'homepage', 1, '2020-10-28 09:57:35', '2020-10-29 10:13:31', '375ce0a6-f9b7-4b6a-b930-6b7f91ad5985'),
(3, 3, 1, 'homepage', '__home__', 1, '2020-10-28 09:57:35', '2020-10-28 09:57:35', '9083883f-115a-4ab6-af5f-913a8584c639'),
(4, 4, 1, 'homepage', '__home__', 1, '2020-10-28 10:02:31', '2020-10-28 10:02:31', 'f5fca183-cbe9-4388-afc7-2183a0a41085'),
(5, 5, 1, NULL, NULL, 1, '2020-10-28 10:12:56', '2020-10-28 10:12:56', '44aa0d66-6b29-46d8-88c7-15a0f98f477c'),
(6, 6, 1, 'homepage', '__home__', 1, '2020-10-28 10:23:01', '2020-10-28 10:23:01', '32c1c1ce-4f58-4d2b-b1e9-1c08c2067be0'),
(7, 7, 1, NULL, NULL, 1, '2020-10-28 10:24:42', '2020-10-28 10:24:42', '9c571caf-f3d1-40e3-bdc6-7e138d77c1a9'),
(8, 8, 1, 'homepage', '__home__', 1, '2020-10-28 10:24:42', '2020-10-28 10:24:42', '701f62a3-24d1-4b4b-98fb-69220118f7bd'),
(9, 9, 1, NULL, NULL, 1, '2020-10-28 10:24:42', '2020-10-28 10:24:42', 'b9200e31-b26d-46c3-bf32-7a1d64e55bb5'),
(10, 10, 1, NULL, NULL, 1, '2020-10-28 10:25:05', '2020-10-28 10:25:05', '88a1a21e-aa6a-4cbd-a49d-d7a05843d367'),
(11, 11, 1, 'homepage', '__home__', 1, '2020-10-28 10:25:05', '2020-10-28 10:25:05', 'c4f5becc-ae69-42af-8218-77b02829b837'),
(12, 12, 1, NULL, NULL, 1, '2020-10-28 10:25:05', '2020-10-28 10:25:05', '32ea48d8-ff59-4cce-b286-e6e46fcaf0ea'),
(13, 13, 1, NULL, NULL, 1, '2020-10-28 10:25:05', '2020-10-28 10:25:05', '99a7edae-7579-4fb9-a93a-26f415a5985b'),
(14, 14, 1, 'homepage', 'homepage', 1, '2020-10-29 10:13:31', '2020-10-29 10:13:31', '1ee28b35-8883-4a79-8e36-fa9acd9e5a54'),
(15, 15, 1, NULL, NULL, 1, '2020-10-29 10:13:31', '2020-10-29 10:13:31', '2b653852-be72-4b03-9d70-807702cee7ef'),
(16, 16, 1, NULL, NULL, 1, '2020-10-29 10:13:31', '2020-10-29 10:13:31', 'b66ac1e6-a6de-4803-9f0b-a07bc4b20e75'),
(17, 17, 1, 'homepage', 'homepage', 1, '2020-10-29 10:15:18', '2020-10-29 10:15:18', '5a8ba07a-9e30-481c-823d-81058f63cf57'),
(18, 18, 1, NULL, NULL, 1, '2020-10-29 10:15:18', '2020-10-29 10:15:18', '52b8aeb8-8763-4359-95b3-1992b4b505a0'),
(19, 19, 1, NULL, NULL, 1, '2020-10-29 10:15:18', '2020-10-29 10:15:18', '470ab348-dd45-438c-9f35-9b2a777b6042'),
(20, 20, 1, 'homepage', 'homepage', 1, '2020-10-29 10:15:18', '2020-10-29 10:15:18', 'e495e562-3b02-4b5c-b14d-b2d361102d3d'),
(21, 21, 1, NULL, NULL, 1, '2020-10-29 10:15:18', '2020-10-29 10:15:18', '9b725911-f44c-4911-b2c6-fbc71b504551'),
(22, 22, 1, NULL, NULL, 1, '2020-10-29 10:15:18', '2020-10-29 10:15:18', '6c186bbf-01cb-4d43-acf5-a36f892dc18f'),
(23, 23, 1, 'homepage', 'homepage', 1, '2020-10-29 10:28:03', '2020-10-29 10:28:03', '6bc94e61-cbfc-480b-a8e7-b989dd588120'),
(24, 24, 1, 'homepage', 'homepage', 1, '2020-10-29 10:28:46', '2020-10-29 10:28:46', '9d9f7c57-9d7a-4ece-b5b2-369d6a75b815'),
(25, 25, 1, 'homepage', 'homepage', 1, '2020-10-29 13:36:15', '2020-10-29 13:36:15', 'cdeb0881-c61f-494e-bca9-d048e254bb71'),
(26, 26, 1, 'homepage', 'homepage', 1, '2020-10-29 13:51:40', '2020-10-29 13:51:40', '271a6f38-b350-4310-ad6f-d1089cc10e15'),
(27, 27, 1, 'homepage', 'homepage', 1, '2020-10-29 13:51:44', '2020-10-29 13:51:44', 'e025e0ca-6f1e-42fa-9ad1-8a7696eadc00'),
(28, 28, 1, 'homepage', 'homepage', 1, '2020-10-29 13:52:02', '2020-10-29 13:52:02', 'f4f897a5-7cbe-47f6-9fe6-af2155412d87'),
(29, 29, 1, 'homepage', 'homepage', 1, '2020-10-29 13:52:30', '2020-10-29 13:52:30', '1ac1a3a3-ec9f-48ce-ab46-518b451b84dc');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entries`
--

CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_entries`
--

INSERT INTO `craft_entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, NULL, 1, NULL, '2020-10-28 09:57:00', NULL, NULL, '2020-10-28 09:57:35', '2020-10-28 09:57:35', '425962b5-c397-48b6-aae3-2a362d22ddb4'),
(3, 1, NULL, 1, NULL, '2020-10-28 09:57:00', NULL, NULL, '2020-10-28 09:57:35', '2020-10-28 09:57:35', '00a14c41-076f-4e62-a635-d2b17f091d88'),
(4, 1, NULL, 1, NULL, '2020-10-28 09:57:00', NULL, NULL, '2020-10-28 10:02:31', '2020-10-28 10:02:31', 'cb59f0e7-e436-4b50-a309-1d1a9d793e38'),
(6, 1, NULL, 1, NULL, '2020-10-28 09:57:00', NULL, NULL, '2020-10-28 10:23:01', '2020-10-28 10:23:01', 'a45ab750-5c1a-4343-8477-8746e80e7b1b'),
(8, 1, NULL, 1, NULL, '2020-10-28 09:57:00', NULL, NULL, '2020-10-28 10:24:42', '2020-10-28 10:24:42', '9eec5152-63bc-4ea4-927d-6aa2c26cc2e9'),
(11, 1, NULL, 1, NULL, '2020-10-28 09:57:00', NULL, NULL, '2020-10-28 10:25:05', '2020-10-28 10:25:05', '4d545999-fb76-4e0b-bd25-dfe87afcebf4'),
(14, 1, NULL, 1, NULL, '2020-10-28 09:57:00', NULL, NULL, '2020-10-29 10:13:31', '2020-10-29 10:13:31', '6271160f-ea6e-44cc-ad5a-aa3792a4adf5'),
(17, 1, NULL, 1, NULL, '2020-10-28 09:57:00', NULL, NULL, '2020-10-29 10:15:18', '2020-10-29 10:15:18', 'ddeca5fe-43bf-40f1-be94-1de33c810474'),
(20, 1, NULL, 1, NULL, '2020-10-28 09:57:00', NULL, NULL, '2020-10-29 10:15:18', '2020-10-29 10:15:18', 'cdd395ea-f935-4c30-b749-1f0758d1eed9'),
(23, 1, NULL, 1, NULL, '2020-10-28 09:57:00', NULL, NULL, '2020-10-29 10:28:03', '2020-10-29 10:28:03', '82c9de01-849e-4729-98ad-3f4b3a23feac'),
(24, 1, NULL, 1, NULL, '2020-10-28 09:57:00', NULL, NULL, '2020-10-29 10:28:46', '2020-10-29 10:28:46', '7bde765f-a071-4ebd-a57e-63073baf773e'),
(25, 1, NULL, 1, NULL, '2020-10-28 09:57:00', NULL, NULL, '2020-10-29 13:36:15', '2020-10-29 13:36:15', 'f8ed0f8f-b56d-45d6-800c-d17f30c24f6e'),
(26, 1, NULL, 1, NULL, '2020-10-28 09:57:00', NULL, NULL, '2020-10-29 13:51:40', '2020-10-29 13:51:40', 'db9fbd4a-a037-4fba-9faf-8de9c7de6e1b'),
(27, 1, NULL, 1, NULL, '2020-10-28 09:57:00', NULL, NULL, '2020-10-29 13:51:44', '2020-10-29 13:51:44', 'd50b9bea-6665-40f6-88da-d66920c36c6d'),
(28, 1, NULL, 1, NULL, '2020-10-28 09:57:00', NULL, NULL, '2020-10-29 13:52:02', '2020-10-29 13:52:02', '156bafd1-7a64-4efe-b7a9-05b98a9dbc88'),
(29, 1, NULL, 1, NULL, '2020-10-28 09:57:00', NULL, NULL, '2020-10-29 13:52:30', '2020-10-29 13:52:30', '9318ee4d-7502-433f-9502-9c9753e19f41');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entrytypes`
--

CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_entrytypes`
--

INSERT INTO `craft_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'HomePage', 'homepage', 0, 'site', NULL, '{section.name|raw}', 1, '2020-10-28 09:57:35', '2020-10-28 09:57:35', NULL, 'fa43f097-e71b-410a-94d1-86e175d5feb6');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldgroups`
--

CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_fieldgroups`
--

INSERT INTO `craft_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Common', '2020-10-28 09:43:27', '2020-10-28 09:43:27', 'dbf78e06-d5b1-4d3b-a1a9-dd4a083d2c31'),
(2, 'HomePageFields', '2020-10-28 10:03:54', '2020-10-28 10:03:54', '51330eba-4fff-446c-a255-8f9f1c2318dd'),
(3, 'Global Fields', '2020-10-28 10:10:22', '2020-10-28 10:10:22', '132d1157-dd8a-43c8-a2c5-d09c1540c6f8');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayoutfields`
--

CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_fieldlayoutfields`
--

INSERT INTO `craft_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 3, 2, 0, 0, '2020-10-28 10:12:56', '2020-10-28 10:12:56', 'eb00ca2f-fd52-4219-8579-6c8b6850e003'),
(4, 1, 6, 5, 0, 1, '2020-10-29 10:28:02', '2020-10-29 10:28:02', '999cb542-f634-4f1a-b053-a2c3f6242340');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayouts`
--

CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_fieldlayouts`
--

INSERT INTO `craft_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '2020-10-28 09:57:35', '2020-10-28 09:57:35', NULL, '15274435-0e53-4dd4-aa11-c6f7b25f5ca9'),
(2, 'craft\\elements\\GlobalSet', '2020-10-28 10:12:56', '2020-10-28 10:12:56', NULL, 'aae49cbb-cfff-4eab-837f-98d051465fa1'),
(3, 'craft\\elements\\MatrixBlock', '2020-10-28 10:22:09', '2020-10-28 10:22:09', '2020-10-29 10:26:03', '3e585b2a-d07a-4da7-a1d2-d63d59ea5096');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayouttabs`
--

CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `elements` text DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_fieldlayouttabs`
--

INSERT INTO `craft_fieldlayouttabs` (`id`, `layoutId`, `name`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 2, 'Description', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"a94ae377-3e1e-4487-9641-8315eada1f93\"}]', 1, '2020-10-28 10:12:56', '2020-10-28 10:12:56', '3ebb2fa6-1073-4cad-8a67-8136067b6781'),
(4, 3, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1734d275-af73-47f6-8bc5-088f05c54a68\"}]', 1, '2020-10-28 10:22:09', '2020-10-28 10:22:09', 'f9a1693b-68a5-4c09-8824-6ca6b4935a2f'),
(6, 1, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d5223dc6-9038-4391-a42e-1884516812a4\"}]', 1, '2020-10-29 10:28:02', '2020-10-29 10:28:02', '882e1668-6f9f-40c0-8fc1-78e62a8dc3df');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fields`
--

CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_fields`
--

INSERT INTO `craft_fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 3, 'Site Description', 'siteDescription', 'global', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-10-28 10:10:53', '2020-10-28 10:10:53', 'a94ae377-3e1e-4487-9641-8315eada1f93'),
(5, 1, 'RichText', 'richtext', 'global', '', 0, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}', '2020-10-29 10:27:07', '2020-10-29 10:27:07', 'd5223dc6-9038-4391-a42e-1884516812a4');

-- --------------------------------------------------------

--
-- Table structure for table `craft_globalsets`
--

CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_globalsets`
--

INSERT INTO `craft_globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(5, 'Site Info', 'siteInfo', 2, '2020-10-28 10:12:56', '2020-10-28 10:12:56', '7e614a3f-ed5c-41de-8edd-923eca6d6d55');

-- --------------------------------------------------------

--
-- Table structure for table `craft_gqlschemas`
--

CREATE TABLE `craft_gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `scope` text DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_gqltokens`
--

CREATE TABLE `craft_gqltokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_info`
--

CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_info`
--

INSERT INTO `craft_info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.5.14', '3.5.13', 0, 'hknojjhyujhp', 'cilnemqzozcb', '2020-10-28 09:43:27', '2020-10-29 10:28:03', '0a5bb668-3c86-416a-bbd6-de2c2a160071');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixblocks`
--

CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixblocktypes`
--

CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_migrations`
--

CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_migrations`
--

INSERT INTO `craft_migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '20cdb751-7ade-4af3-93d1-1c5b2a7da46e'),
(2, 'craft', 'm150403_183908_migrations_table_changes', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '9b63df48-e7c3-4d60-8a5c-17bdbed07051'),
(3, 'craft', 'm150403_184247_plugins_table_changes', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '30a3ecc9-b33f-4ae8-b81d-81ba86e3dc57'),
(4, 'craft', 'm150403_184533_field_version', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '1c9cd6f0-9e3f-4d73-930a-c3c345886e45'),
(5, 'craft', 'm150403_184729_type_columns', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '95a6fd76-bfa6-474b-92e8-cde9a23b2c7b'),
(6, 'craft', 'm150403_185142_volumes', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'f3c6a679-d9f3-432f-ace5-50fc1e4c7fac'),
(7, 'craft', 'm150428_231346_userpreferences', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '7695b3d5-eee2-4310-8b1b-573c94a3e135'),
(8, 'craft', 'm150519_150900_fieldversion_conversion', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'cae3e870-c6fe-430c-95b8-5263b82c80d0'),
(9, 'craft', 'm150617_213829_update_email_settings', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '35d5fb53-990f-4fd8-9d0b-97f9471c1360'),
(10, 'craft', 'm150721_124739_templatecachequeries', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '4feef229-9776-48d2-8832-8fcabe632f03'),
(11, 'craft', 'm150724_140822_adjust_quality_settings', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2d00759d-ff74-4bb4-a943-506b9f16f91c'),
(12, 'craft', 'm150815_133521_last_login_attempt_ip', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '8bf4de62-afc4-412a-b669-cb30ea6193e2'),
(13, 'craft', 'm151002_095935_volume_cache_settings', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'f02dce78-663b-477c-99de-672d00ef1ba0'),
(14, 'craft', 'm151005_142750_volume_s3_storage_settings', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '5dc517b6-cfa9-4e70-8621-14ec3d3d60cf'),
(15, 'craft', 'm151016_133600_delete_asset_thumbnails', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'bdc1a345-2047-4fee-99b8-3a931dcbc713'),
(16, 'craft', 'm151209_000000_move_logo', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '397892a9-1bbe-4f90-8071-448b9f2cae5c'),
(17, 'craft', 'm151211_000000_rename_fileId_to_assetId', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '6c07755a-ba2b-4f81-bb22-f1cc3cd744dc'),
(18, 'craft', 'm151215_000000_rename_asset_permissions', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '13053e12-eb93-4a40-ba78-061f0ec52f2f'),
(19, 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '059c5853-599e-464b-98dd-373cd4850afb'),
(20, 'craft', 'm160708_185142_volume_hasUrls_setting', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'b1688281-e22a-482b-b064-655cf60deb99'),
(21, 'craft', 'm160714_000000_increase_max_asset_filesize', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '15ffbca6-b94c-4ff3-bd7e-e35e2634f3d5'),
(22, 'craft', 'm160727_194637_column_cleanup', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2e1d81eb-d22f-49cb-aef3-846b7ea11583'),
(23, 'craft', 'm160804_110002_userphotos_to_assets', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '9d5f849a-4437-48b5-aae5-d313e576043b'),
(24, 'craft', 'm160807_144858_sites', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '52cc6e45-354d-41b8-b327-ad46783dc050'),
(25, 'craft', 'm160829_000000_pending_user_content_cleanup', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '3cd338f2-2aff-4ec4-ad9b-109f775b27bd'),
(26, 'craft', 'm160830_000000_asset_index_uri_increase', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'b86d7727-b8e8-4e16-a996-21c859d8fdc8'),
(27, 'craft', 'm160912_230520_require_entry_type_id', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'ec5ae7f2-9081-4a2f-a056-4487e10b3b20'),
(28, 'craft', 'm160913_134730_require_matrix_block_type_id', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '03ce435c-99b4-4984-849e-99cae0f1b562'),
(29, 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '0c2f1659-9228-4364-894b-4942c869fa5e'),
(30, 'craft', 'm160920_231045_usergroup_handle_title_unique', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'f25a2664-14b0-47de-b336-1df1e4415231'),
(31, 'craft', 'm160925_113941_route_uri_parts', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'a0230d04-34b3-44b4-9b9c-56096c9cea7e'),
(32, 'craft', 'm161006_205918_schemaVersion_not_null', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2f38d9f8-0b20-473a-b370-41b23ab86a8d'),
(33, 'craft', 'm161007_130653_update_email_settings', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'dd5f6338-d9a8-4438-a903-16070cef2ab2'),
(34, 'craft', 'm161013_175052_newParentId', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '16c913d7-7fd2-4a01-8566-3cc3fe337bc4'),
(35, 'craft', 'm161021_102916_fix_recent_entries_widgets', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '10c87851-6ec0-42a2-b8df-0aac8888e06f'),
(36, 'craft', 'm161021_182140_rename_get_help_widget', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '0ca8ac59-809a-484a-9774-fb92ab690a64'),
(37, 'craft', 'm161025_000000_fix_char_columns', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'f157b955-79cf-4dc3-ab2f-7450ad992385'),
(38, 'craft', 'm161029_124145_email_message_languages', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '6eb629d5-cf01-4f47-8bbd-7cf9cea4746d'),
(39, 'craft', 'm161108_000000_new_version_format', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'aeec651f-dcb5-49d0-9093-ed783ba5e9e5'),
(40, 'craft', 'm161109_000000_index_shuffle', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '4c4b913f-23c6-41dc-8803-8fddb6a59419'),
(41, 'craft', 'm161122_185500_no_craft_app', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'e0454b8c-d855-4ebc-b5ac-d0ddf758e777'),
(42, 'craft', 'm161125_150752_clear_urlmanager_cache', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'dc57489c-e578-405d-8d53-8ce68052ba86'),
(43, 'craft', 'm161220_000000_volumes_hasurl_notnull', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'da950574-d23e-44f3-9344-883462b7881e'),
(44, 'craft', 'm170114_161144_udates_permission', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '556fca4b-8721-4f5d-a0e1-1990d2530b61'),
(45, 'craft', 'm170120_000000_schema_cleanup', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '3e588801-eef0-43bc-b581-7f9fe39bcbb0'),
(46, 'craft', 'm170126_000000_assets_focal_point', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '431ff9d4-a659-497a-a1c5-0d57e74d659e'),
(47, 'craft', 'm170206_142126_system_name', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '4db34051-42dd-43ca-abe7-5ea708f4cde2'),
(48, 'craft', 'm170217_044740_category_branch_limits', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'fdf90c52-259f-445f-9eb5-7b3e9fc50445'),
(49, 'craft', 'm170217_120224_asset_indexing_columns', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '47f5a1bc-bf4b-441f-8a7f-a70a70a35610'),
(50, 'craft', 'm170223_224012_plain_text_settings', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'cbeac4b9-f972-4642-8456-e3708ef38b04'),
(51, 'craft', 'm170227_120814_focal_point_percentage', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2e8d4a67-5352-49e9-86e1-21f6b3f2fe76'),
(52, 'craft', 'm170228_171113_system_messages', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '461b9b51-9cde-4a20-a9bf-5479e20aa9b7'),
(53, 'craft', 'm170303_140500_asset_field_source_settings', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '7220aee5-7c97-482c-bac0-4f3bba641158'),
(54, 'craft', 'm170306_150500_asset_temporary_uploads', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '65bda735-1e19-4547-aa3b-10b7149a2e01'),
(55, 'craft', 'm170523_190652_element_field_layout_ids', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'be1af53e-a5ba-436e-bc0a-b6520763a7f4'),
(56, 'craft', 'm170621_195237_format_plugin_handles', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '30d8728f-94d0-4ce9-9e1b-290f90f3070c'),
(57, 'craft', 'm170630_161027_deprecation_line_nullable', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '950ae434-e911-4da6-877d-c0a55c425d6e'),
(58, 'craft', 'm170630_161028_deprecation_changes', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'd7e8e273-475d-4768-a7ea-4aae50c04468'),
(59, 'craft', 'm170703_181539_plugins_table_tweaks', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'bd6373a3-1e92-476f-b45e-ddda0257ec2c'),
(60, 'craft', 'm170704_134916_sites_tables', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'c1f31b40-7d0c-485c-b3fa-dee25b682913'),
(61, 'craft', 'm170706_183216_rename_sequences', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '0185add8-9d92-43ee-9b0c-c95000b70711'),
(62, 'craft', 'm170707_094758_delete_compiled_traits', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'd9b665e0-befd-44a5-bd29-8fcfe1845293'),
(63, 'craft', 'm170731_190138_drop_asset_packagist', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'fc7ca313-fad5-4317-813d-376dcc9e3f1e'),
(64, 'craft', 'm170810_201318_create_queue_table', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'c58c929c-9360-48d4-ad4d-c54bacbabe6c'),
(65, 'craft', 'm170903_192801_longblob_for_queue_jobs', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '9b5a8675-7323-4d16-9480-41df2623953a'),
(66, 'craft', 'm170914_204621_asset_cache_shuffle', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '8dd27712-1b5f-4e58-a940-7c9bec4a7f64'),
(67, 'craft', 'm171011_214115_site_groups', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'fc43bb9f-e9ee-4174-adff-a461cabdbf7d'),
(68, 'craft', 'm171012_151440_primary_site', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '48ca272e-09ab-4852-bf69-a6b1de25582e'),
(69, 'craft', 'm171013_142500_transform_interlace', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '61ce8939-5f01-4545-8336-f68f9430fb43'),
(70, 'craft', 'm171016_092553_drop_position_select', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'b3918917-804c-40e5-9674-58bc1939899c'),
(71, 'craft', 'm171016_221244_less_strict_translation_method', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '04fbc687-7660-4d42-94de-76dab4b90053'),
(72, 'craft', 'm171107_000000_assign_group_permissions', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'd834e756-1871-4724-844e-3e7f122b68d2'),
(73, 'craft', 'm171117_000001_templatecache_index_tune', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'f1ef0fef-f2c4-4cd3-8d7c-4b1e6aa46819'),
(74, 'craft', 'm171126_105927_disabled_plugins', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'be6c72a4-4381-49bb-8a9b-8676509041bb'),
(75, 'craft', 'm171130_214407_craftidtokens_table', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'ad3e7654-0938-4c8b-9d98-55cc64d76e3f'),
(76, 'craft', 'm171202_004225_update_email_settings', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '8650bae5-813a-4657-a2a5-ca8fb360d433'),
(77, 'craft', 'm171204_000001_templatecache_index_tune_deux', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '3a9a8328-186c-4cd6-96ab-38db79caa5d1'),
(78, 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'f31e1a7a-7a9f-42db-8829-efbdf6233e4f'),
(79, 'craft', 'm171218_143135_longtext_query_column', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '46996b35-c20c-4e9d-8fbc-783b75bfb764'),
(80, 'craft', 'm171231_055546_environment_variables_to_aliases', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '6c20c436-7cb3-450f-bb37-0010ad3c635c'),
(81, 'craft', 'm180113_153740_drop_users_archived_column', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'f12efe64-cf42-4319-ae0f-5ac1bfe9b7fe'),
(82, 'craft', 'm180122_213433_propagate_entries_setting', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '9e4a0e02-b727-4355-a740-92fb421f58c6'),
(83, 'craft', 'm180124_230459_fix_propagate_entries_values', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '7afd3c2f-1bf4-48c1-bb44-37cbb06d7ad7'),
(84, 'craft', 'm180128_235202_set_tag_slugs', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '5fe8baa5-aaf3-40c9-9694-9a97510199f3'),
(85, 'craft', 'm180202_185551_fix_focal_points', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '29ab1ae8-6833-4255-93db-a21891b51901'),
(86, 'craft', 'm180217_172123_tiny_ints', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'bab3e7e3-6dd2-4938-9a67-d5a663a6f662'),
(87, 'craft', 'm180321_233505_small_ints', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'c4c6d27c-d295-4782-9437-a0577151c12d'),
(88, 'craft', 'm180328_115523_new_license_key_statuses', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'e06f57b9-2490-4581-80b5-6dc853f3d20f'),
(89, 'craft', 'm180404_182320_edition_changes', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '3dbbd79c-eaf6-464a-8204-e8d47b5280cd'),
(90, 'craft', 'm180411_102218_fix_db_routes', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '4651867c-ddf4-4d4d-aac7-4cf7efd189e3'),
(91, 'craft', 'm180416_205628_resourcepaths_table', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2335cdf6-5c75-45d8-85f2-f50d32a50987'),
(92, 'craft', 'm180418_205713_widget_cleanup', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '105ab971-7235-40c9-a37d-dae2ef2a13c8'),
(93, 'craft', 'm180425_203349_searchable_fields', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '5119fe04-3efe-4da2-9a6c-2399afc27eac'),
(94, 'craft', 'm180516_153000_uids_in_field_settings', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'b4aab382-a788-45a8-892d-1cb05354d5b7'),
(95, 'craft', 'm180517_173000_user_photo_volume_to_uid', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '3ef6c45f-1e2e-484b-98fb-d944252cc966'),
(96, 'craft', 'm180518_173000_permissions_to_uid', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '075e08b4-bc0e-4f43-8ac2-4d326b01f02d'),
(97, 'craft', 'm180520_173000_matrix_context_to_uids', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '8e628ccb-eed2-4122-b5d4-c25fe97000f4'),
(98, 'craft', 'm180521_172900_project_config_table', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '0f48aab4-f322-4320-82d6-163faaccff15'),
(99, 'craft', 'm180521_173000_initial_yml_and_snapshot', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '4188f716-8791-4abc-a26b-c8e78217746d'),
(100, 'craft', 'm180731_162030_soft_delete_sites', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'ca486fa4-704b-492c-868b-899d639a1167'),
(101, 'craft', 'm180810_214427_soft_delete_field_layouts', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '4dd5dd7d-9c04-4edd-998c-8ebe7d875119'),
(102, 'craft', 'm180810_214439_soft_delete_elements', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'f160de89-e9ea-4e96-8bbc-8ac95b8121c8'),
(103, 'craft', 'm180824_193422_case_sensitivity_fixes', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '4e6bb67c-a46d-41e5-bae6-ff87cc34f7ea'),
(104, 'craft', 'm180901_151639_fix_matrixcontent_tables', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '4137cc4c-7b44-40b5-a64d-00763be3b75a'),
(105, 'craft', 'm180904_112109_permission_changes', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'a75e0d85-e2b2-4c70-8268-8c127ddfec3e'),
(106, 'craft', 'm180910_142030_soft_delete_sitegroups', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'aca78aa4-50f8-44a3-b7a1-33ea818d80bd'),
(107, 'craft', 'm181011_160000_soft_delete_asset_support', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'a22e2339-50c6-46da-a90d-66b444094eeb'),
(108, 'craft', 'm181016_183648_set_default_user_settings', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '08e2b62c-58a0-4ac6-9d2e-cfac9edd87b1'),
(109, 'craft', 'm181017_225222_system_config_settings', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2149ef40-87ca-4c24-92d9-c374604abfe0'),
(110, 'craft', 'm181018_222343_drop_userpermissions_from_config', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '0b7c1257-2825-455d-9b97-df94b4128f13'),
(111, 'craft', 'm181029_130000_add_transforms_routes_to_config', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'eb0f1fa9-c821-46c7-a3f1-f34cfdf74467'),
(112, 'craft', 'm181112_203955_sequences_table', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '19f66dbb-aca1-4305-aa32-aa931afbf3ae'),
(113, 'craft', 'm181121_001712_cleanup_field_configs', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'd9c63702-0fb3-4e9e-b3ae-1505ad63d2b0'),
(114, 'craft', 'm181128_193942_fix_project_config', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'a98b588f-8cbc-4212-b33f-6e2daf188136'),
(115, 'craft', 'm181130_143040_fix_schema_version', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'eb096fab-8231-4115-a004-f8d961f482e1'),
(116, 'craft', 'm181211_143040_fix_entry_type_uids', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '1c2df696-fb9d-483e-aca3-b93790f44158'),
(117, 'craft', 'm181217_153000_fix_structure_uids', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '32a87b05-bb0e-41de-ada4-f1cd158e7ede'),
(118, 'craft', 'm190104_152725_store_licensed_plugin_editions', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'f73a0f37-7503-4aa4-92e0-3d57c565ba6c'),
(119, 'craft', 'm190108_110000_cleanup_project_config', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', 'f3ef2a40-9007-41cf-9b44-fe0cfa52b9e6'),
(120, 'craft', 'm190108_113000_asset_field_setting_change', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '47aad957-9a0c-437a-b68e-884c81bd7d52'),
(121, 'craft', 'm190109_172845_fix_colspan', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-28 09:43:28', '5f4e97f6-feb6-4f5e-a787-45d2329a1c30'),
(122, 'craft', 'm190110_150000_prune_nonexisting_sites', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '23ffc14b-e7e9-4f05-8aa2-d529e95b75fd'),
(123, 'craft', 'm190110_214819_soft_delete_volumes', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'eb783d32-0c49-4280-ac50-5c80a44553eb'),
(124, 'craft', 'm190112_124737_fix_user_settings', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '107b80de-25b4-43b7-b111-672f14b27e78'),
(125, 'craft', 'm190112_131225_fix_field_layouts', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'c497f04e-9c57-4d49-bde6-ac4b880812fa'),
(126, 'craft', 'm190112_201010_more_soft_deletes', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'a2d3ea99-9b3e-429a-8477-fea1f3e0b0f6'),
(127, 'craft', 'm190114_143000_more_asset_field_setting_changes', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'b01fe61f-2092-4663-8712-03a4fdfb0e77'),
(128, 'craft', 'm190121_120000_rich_text_config_setting', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'bdd2fe18-bb38-4dc6-b972-58619bad7961'),
(129, 'craft', 'm190125_191628_fix_email_transport_password', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '167427bc-7491-4949-bbe0-34c67a2dfa05'),
(130, 'craft', 'm190128_181422_cleanup_volume_folders', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'd2971e44-bc65-4e37-99fc-83e709cc782a'),
(131, 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'a45a2728-ab5d-431a-9a06-681d6889e358'),
(132, 'craft', 'm190218_143000_element_index_settings_uid', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '899f35e7-4711-4dae-9f23-841483a877ab'),
(133, 'craft', 'm190312_152740_element_revisions', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '59ae9347-e683-4b2f-bad1-6d373d7443dd'),
(134, 'craft', 'm190327_235137_propagation_method', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '688c223a-dce7-4412-99e9-76bb8a74551d'),
(135, 'craft', 'm190401_223843_drop_old_indexes', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '360b1423-153b-4e6f-be27-39ea20e4928b'),
(136, 'craft', 'm190416_014525_drop_unique_global_indexes', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '9bc77a65-e3f4-495c-95ab-0260c6aef5c4'),
(137, 'craft', 'm190417_085010_add_image_editor_permissions', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'f17cf822-5e33-42cc-871a-7a8d5c559926'),
(138, 'craft', 'm190502_122019_store_default_user_group_uid', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'db168e21-e65f-4fe6-8628-6dba646032db'),
(139, 'craft', 'm190504_150349_preview_targets', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '7b9380fb-a665-45e0-a515-b294f995e56f'),
(140, 'craft', 'm190516_184711_job_progress_label', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'bc16a41e-9751-4cf5-94e0-a3bc6878533f'),
(141, 'craft', 'm190523_190303_optional_revision_creators', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'a73eb893-201e-480f-9b38-2b9dd519e37c'),
(142, 'craft', 'm190529_204501_fix_duplicate_uids', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '29b6a81e-fbf1-40a8-8043-b26db40ca652'),
(143, 'craft', 'm190605_223807_unsaved_drafts', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '905c6950-441a-41e9-90a6-c179a59ab101'),
(144, 'craft', 'm190607_230042_entry_revision_error_tables', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '83e4fbd2-e260-43d9-b20d-53b127b856b5'),
(145, 'craft', 'm190608_033429_drop_elements_uid_idx', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '24436648-ed5a-49a5-9ba0-6c1b1b742b8a'),
(146, 'craft', 'm190617_164400_add_gqlschemas_table', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'b6a9e541-ac91-471b-9c83-b8760072f387'),
(147, 'craft', 'm190624_234204_matrix_propagation_method', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '91d4056d-2bd7-4f12-ab6a-21cd5affb83e'),
(148, 'craft', 'm190711_153020_drop_snapshots', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '752febe2-7894-4f36-b82e-6d1a6da8bdc7'),
(149, 'craft', 'm190712_195914_no_draft_revisions', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '5ced2b38-7cc8-4278-8b39-e4d47f3edaa6'),
(150, 'craft', 'm190723_140314_fix_preview_targets_column', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '0dda3f42-d284-4f2e-a7ea-7dee795e33dd'),
(151, 'craft', 'm190820_003519_flush_compiled_templates', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2c5bd760-57fc-4fe9-88fc-25ff3c676c21'),
(152, 'craft', 'm190823_020339_optional_draft_creators', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '3c24cfe2-ebf3-4755-b538-8bdb22fa11f9'),
(153, 'craft', 'm190913_152146_update_preview_targets', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '3ca1de83-0855-4505-bf31-ac2ae18ac911'),
(154, 'craft', 'm191107_122000_add_gql_project_config_support', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '4cb445c5-bfd6-4514-8ee1-6750ee81f4a4'),
(155, 'craft', 'm191204_085100_pack_savable_component_settings', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '0dbff0ae-8b44-4d0c-9cda-a4e5623bffd4'),
(156, 'craft', 'm191206_001148_change_tracking', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '344032d5-9e75-43ae-80af-a1207f8f1794'),
(157, 'craft', 'm191216_191635_asset_upload_tracking', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'd88c1ce6-40d1-4f3c-9e8f-661121a1df52'),
(158, 'craft', 'm191222_002848_peer_asset_permissions', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'e3a74772-1ded-4337-bdf1-8d6691419df3'),
(159, 'craft', 'm200127_172522_queue_channels', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '9b8b43cd-1d0b-43c8-af2a-c235d4080cf0'),
(160, 'craft', 'm200211_175048_truncate_element_query_cache', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '36fa7e45-8df6-454e-8e92-4d7215e8aae8'),
(161, 'craft', 'm200213_172522_new_elements_index', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '6891bcdd-99b6-4560-a545-2615a2a6feb3'),
(162, 'craft', 'm200228_195211_long_deprecation_messages', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '04c1c4f7-918e-4ade-92e3-e4f1dfa76f26'),
(163, 'craft', 'm200306_054652_disabled_sites', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '272e8df6-357f-4a1e-880b-da994677438e'),
(164, 'craft', 'm200522_191453_clear_template_caches', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '1444647d-1eec-48fc-8889-ce7d38691548'),
(165, 'craft', 'm200606_231117_migration_tracks', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '8c2cbc72-079a-4cdb-86ac-d40f2d565d9c'),
(166, 'craft', 'm200619_215137_title_translation_method', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'f08b80a6-89ec-4a30-a92f-752ff36b42e1'),
(167, 'craft', 'm200620_005028_user_group_descriptions', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '4fe6a07e-c358-46d9-91a2-394d41973912'),
(168, 'craft', 'm200620_230205_field_layout_changes', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'fec736e4-ab47-42ed-84e5-629fc0b0cf6d'),
(169, 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'f816ffee-2bed-446a-8849-a8ecdffb9190'),
(170, 'craft', 'm200629_112700_remove_project_config_legacy_files', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'a80236a1-b3ad-4dd2-bd7e-5695678c162f'),
(171, 'craft', 'm200630_183000_drop_configmap', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'd78840c9-6b74-47f0-997f-007c743dd81f'),
(172, 'craft', 'm200715_113400_transform_index_error_flag', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '23821b6a-1879-4450-9422-53ae88cee894'),
(173, 'craft', 'm200716_110900_replace_file_asset_permissions', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'baa7edbb-be10-47f6-a21a-a62233fd3943'),
(174, 'craft', 'm200716_153800_public_token_settings_in_project_config', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'a8e0dfe1-8c8a-4f84-9971-c779b909f9f4'),
(175, 'craft', 'm200720_175543_drop_unique_constraints', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', 'adacb329-57f1-41cc-9fce-831a5847ed05'),
(176, 'craft', 'm200825_051217_project_config_version', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '2020-10-28 09:43:29', '3b155ede-ab4e-4ae4-85b2-9fe4ff35783a'),
(177, 'plugin:redactor', 'm180430_204710_remove_old_plugins', '2020-10-29 10:25:39', '2020-10-29 10:25:39', '2020-10-29 10:25:39', '54773db6-3912-4b11-8de8-bbd23f8b221e'),
(178, 'plugin:redactor', 'Install', '2020-10-29 10:25:39', '2020-10-29 10:25:39', '2020-10-29 10:25:39', 'dc663acf-c262-4ad3-af77-b32abf9fa975'),
(179, 'plugin:redactor', 'm190225_003922_split_cleanup_html_settings', '2020-10-29 10:25:40', '2020-10-29 10:25:40', '2020-10-29 10:25:40', '553743e4-7a41-4d9f-80aa-8f215fa8fed6');

-- --------------------------------------------------------

--
-- Table structure for table `craft_plugins`
--

CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_plugins`
--

INSERT INTO `craft_plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'redactor', '2.8.3', '2.3.0', 'unknown', NULL, '2020-10-29 10:25:39', '2020-10-29 10:25:39', '2020-10-29 11:54:34', 'bd219ee1-c53b-404c-b356-977e4698df3e');

-- --------------------------------------------------------

--
-- Table structure for table `craft_projectconfig`
--

CREATE TABLE `craft_projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_projectconfig`
--

INSERT INTO `craft_projectconfig` (`path`, `value`) VALUES
('dateModified', '1603967282'),
('email.fromEmail', '\"benjaminplunkett15@gmail.com\"'),
('email.fromName', '\"Zomato\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.class', 'null'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.disabled', 'false'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.id', 'null'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.instructions', 'null'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.label', 'null'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.max', 'null'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.min', 'null'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.name', 'null'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.orientation', 'null'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.readonly', 'false'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.requirable', 'false'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.size', 'null'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.step', 'null'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.tip', 'null'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.title', 'null'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.warning', 'null'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.0.width', '100'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.1.fieldUid', '\"d5223dc6-9038-4391-a42e-1884516812a4\"'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.1.instructions', 'null'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.1.label', 'null'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.1.required', 'false'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.1.tip', 'null'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.1.warning', 'null'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.elements.1.width', '100'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.name', '\"Content\"'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.fieldLayouts.15274435-0e53-4dd4-aa11-c6f7b25f5ca9.tabs.0.sortOrder', '1'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.handle', '\"homepage\"'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.hasTitleField', 'false'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.name', '\"HomePage\"'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.section', '\"38d989e5-885a-4a86-91ef-41f5724a5aaf\"'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.sortOrder', '1'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.titleTranslationKeyFormat', 'null'),
('entryTypes.fa43f097-e71b-410a-94d1-86e175d5feb6.titleTranslationMethod', '\"site\"'),
('fieldGroups.132d1157-dd8a-43c8-a2c5-d09c1540c6f8.name', '\"Global Fields\"'),
('fieldGroups.51330eba-4fff-446c-a255-8f9f1c2318dd.name', '\"HomePageFields\"'),
('fieldGroups.dbf78e06-d5b1-4d3b-a1a9-dd4a083d2c31.name', '\"Common\"'),
('fields.a94ae377-3e1e-4487-9641-8315eada1f93.contentColumnType', '\"text\"'),
('fields.a94ae377-3e1e-4487-9641-8315eada1f93.fieldGroup', '\"132d1157-dd8a-43c8-a2c5-d09c1540c6f8\"'),
('fields.a94ae377-3e1e-4487-9641-8315eada1f93.handle', '\"siteDescription\"'),
('fields.a94ae377-3e1e-4487-9641-8315eada1f93.instructions', '\"\"'),
('fields.a94ae377-3e1e-4487-9641-8315eada1f93.name', '\"Site Description\"'),
('fields.a94ae377-3e1e-4487-9641-8315eada1f93.searchable', 'false'),
('fields.a94ae377-3e1e-4487-9641-8315eada1f93.settings.byteLimit', 'null'),
('fields.a94ae377-3e1e-4487-9641-8315eada1f93.settings.charLimit', 'null'),
('fields.a94ae377-3e1e-4487-9641-8315eada1f93.settings.code', '\"\"'),
('fields.a94ae377-3e1e-4487-9641-8315eada1f93.settings.columnType', 'null'),
('fields.a94ae377-3e1e-4487-9641-8315eada1f93.settings.initialRows', '\"4\"'),
('fields.a94ae377-3e1e-4487-9641-8315eada1f93.settings.multiline', '\"1\"'),
('fields.a94ae377-3e1e-4487-9641-8315eada1f93.settings.placeholder', '\"\"'),
('fields.a94ae377-3e1e-4487-9641-8315eada1f93.settings.uiMode', '\"normal\"'),
('fields.a94ae377-3e1e-4487-9641-8315eada1f93.translationKeyFormat', 'null'),
('fields.a94ae377-3e1e-4487-9641-8315eada1f93.translationMethod', '\"none\"'),
('fields.a94ae377-3e1e-4487-9641-8315eada1f93.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.contentColumnType', '\"text\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.fieldGroup', '\"dbf78e06-d5b1-4d3b-a1a9-dd4a083d2c31\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.handle', '\"richtext\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.instructions', '\"\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.name', '\"RichText\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.searchable', 'false'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.settings.availableTransforms', '\"*\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.settings.availableVolumes', '\"*\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.settings.cleanupHtml', 'true'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.settings.columnType', '\"text\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.settings.configSelectionMode', '\"choose\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.settings.defaultTransform', '\"\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.settings.manualConfig', '\"\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.settings.purifierConfig', '\"\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.settings.purifyHtml', '\"1\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.settings.redactorConfig', '\"\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.settings.removeEmptyTags', '\"1\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.settings.removeInlineStyles', '\"1\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.settings.removeNbsp', '\"1\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.settings.showHtmlButtonForNonAdmins', '\"\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.settings.showUnpermittedFiles', 'false'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.settings.showUnpermittedVolumes', 'false'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.settings.uiMode', '\"enlarged\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.translationKeyFormat', 'null'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.translationMethod', '\"none\"'),
('fields.d5223dc6-9038-4391-a42e-1884516812a4.type', '\"craft\\\\redactor\\\\Field\"'),
('globalSets.7e614a3f-ed5c-41de-8edd-923eca6d6d55.fieldLayouts.aae49cbb-cfff-4eab-837f-98d051465fa1.tabs.0.elements.0.fieldUid', '\"a94ae377-3e1e-4487-9641-8315eada1f93\"'),
('globalSets.7e614a3f-ed5c-41de-8edd-923eca6d6d55.fieldLayouts.aae49cbb-cfff-4eab-837f-98d051465fa1.tabs.0.elements.0.instructions', 'null'),
('globalSets.7e614a3f-ed5c-41de-8edd-923eca6d6d55.fieldLayouts.aae49cbb-cfff-4eab-837f-98d051465fa1.tabs.0.elements.0.label', 'null'),
('globalSets.7e614a3f-ed5c-41de-8edd-923eca6d6d55.fieldLayouts.aae49cbb-cfff-4eab-837f-98d051465fa1.tabs.0.elements.0.required', 'false'),
('globalSets.7e614a3f-ed5c-41de-8edd-923eca6d6d55.fieldLayouts.aae49cbb-cfff-4eab-837f-98d051465fa1.tabs.0.elements.0.tip', 'null'),
('globalSets.7e614a3f-ed5c-41de-8edd-923eca6d6d55.fieldLayouts.aae49cbb-cfff-4eab-837f-98d051465fa1.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.7e614a3f-ed5c-41de-8edd-923eca6d6d55.fieldLayouts.aae49cbb-cfff-4eab-837f-98d051465fa1.tabs.0.elements.0.warning', 'null'),
('globalSets.7e614a3f-ed5c-41de-8edd-923eca6d6d55.fieldLayouts.aae49cbb-cfff-4eab-837f-98d051465fa1.tabs.0.elements.0.width', '100'),
('globalSets.7e614a3f-ed5c-41de-8edd-923eca6d6d55.fieldLayouts.aae49cbb-cfff-4eab-837f-98d051465fa1.tabs.0.name', '\"Description\"'),
('globalSets.7e614a3f-ed5c-41de-8edd-923eca6d6d55.fieldLayouts.aae49cbb-cfff-4eab-837f-98d051465fa1.tabs.0.sortOrder', '1'),
('globalSets.7e614a3f-ed5c-41de-8edd-923eca6d6d55.handle', '\"siteInfo\"'),
('globalSets.7e614a3f-ed5c-41de-8edd-923eca6d6d55.name', '\"Site Info\"'),
('plugins.redactor.edition', '\"standard\"'),
('plugins.redactor.enabled', 'true'),
('plugins.redactor.schemaVersion', '\"2.3.0\"'),
('sections.38d989e5-885a-4a86-91ef-41f5724a5aaf.enableVersioning', 'true'),
('sections.38d989e5-885a-4a86-91ef-41f5724a5aaf.handle', '\"homepage\"'),
('sections.38d989e5-885a-4a86-91ef-41f5724a5aaf.name', '\"HomePage\"'),
('sections.38d989e5-885a-4a86-91ef-41f5724a5aaf.propagationMethod', '\"all\"'),
('sections.38d989e5-885a-4a86-91ef-41f5724a5aaf.siteSettings.233f8e5b-8ffe-4245-a075-3a327973c8a0.enabledByDefault', 'true'),
('sections.38d989e5-885a-4a86-91ef-41f5724a5aaf.siteSettings.233f8e5b-8ffe-4245-a075-3a327973c8a0.hasUrls', 'true'),
('sections.38d989e5-885a-4a86-91ef-41f5724a5aaf.siteSettings.233f8e5b-8ffe-4245-a075-3a327973c8a0.template', '\"_home\"'),
('sections.38d989e5-885a-4a86-91ef-41f5724a5aaf.siteSettings.233f8e5b-8ffe-4245-a075-3a327973c8a0.uriFormat', '\"homepage\"'),
('sections.38d989e5-885a-4a86-91ef-41f5724a5aaf.type', '\"single\"'),
('siteGroups.61bb41d0-4e99-4f53-9f19-54d0299e28a0.name', '\"Zomato\"'),
('sites.233f8e5b-8ffe-4245-a075-3a327973c8a0.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.233f8e5b-8ffe-4245-a075-3a327973c8a0.handle', '\"default\"'),
('sites.233f8e5b-8ffe-4245-a075-3a327973c8a0.hasUrls', 'true'),
('sites.233f8e5b-8ffe-4245-a075-3a327973c8a0.language', '\"en-US\"'),
('sites.233f8e5b-8ffe-4245-a075-3a327973c8a0.name', '\"Zomato\"'),
('sites.233f8e5b-8ffe-4245-a075-3a327973c8a0.primary', 'true'),
('sites.233f8e5b-8ffe-4245-a075-3a327973c8a0.siteGroup', '\"61bb41d0-4e99-4f53-9f19-54d0299e28a0\"'),
('sites.233f8e5b-8ffe-4245-a075-3a327973c8a0.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"Zomato\"'),
('system.schemaVersion', '\"3.5.13\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `craft_queue`
--

CREATE TABLE `craft_queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) UNSIGNED NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_relations`
--

CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_resourcepaths`
--

CREATE TABLE `craft_resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_resourcepaths`
--

INSERT INTO `craft_resourcepaths` (`hash`, `path`) VALUES
('1497df3e', '@app/web/assets/editentry/dist'),
('1584134e', '@craft/redactor/assets/field/dist'),
('1b484db6', '@lib/jquery-ui'),
('1c485bca', '@app/web/assets/dashboard/dist'),
('20d3b18', '@craft/web/assets/cp/dist'),
('21e584b1', '@lib/axios'),
('22fe5214', '@lib/selectize'),
('24bf1c5c', '@lib/element-resize-detector'),
('26ad7168', '@app/web/assets/craftsupport/dist'),
('2892169e', '@lib/xregexp'),
('2d5323ee', '@craft/web/assets/matrix/dist'),
('2e9dbe57', '@craft/web/assets/fields/dist'),
('3124ece8', '@app/web/assets/updateswidget/dist'),
('3229f5b9', '@lib/jquery-ui'),
('341745dc', '@craft/redactor/assets/redactor-plugins/dist/fullscreen'),
('34311d3e', '@app/web/assets/dashboard/dist'),
('386a8f96', '@app/web/assets/updater/dist'),
('39f25eef', '@app/web/assets/utilities/dist'),
('3b594bb', '@app/web/assets/updates/dist'),
('3cae7ee8', '@app/web/assets/admintable/dist'),
('3df1c63a', '@app/web/assets/editsection/dist'),
('3e3d99c7', '@app/web/assets/installer/dist'),
('436a6656', '@craft/web/assets/fieldsettings/dist'),
('439a9164', '@app/web/assets/matrix/dist'),
('4466f6ab', '@lib/d3'),
('446e216e', '@bower/jquery/dist'),
('46c43bf3', '@app/web/assets/recententries/dist'),
('4793d952', '@lib/iframe-resizer'),
('47c5ad38', '@lib/fabric'),
('49c679fb', '@lib/jquery.payment'),
('4b30e645', '@lib/fileupload'),
('4bf7ff35', '@app/web/assets/updates/dist'),
('52837906', '@lib/garnishjs'),
('53d8e7bb', '@lib/picturefill'),
('540a3044', '@app/web/assets/dashboard/dist'),
('547cdb79', '@lib/jquery-touch-events'),
('55a38211', '@app/web/assets/editentry/dist'),
('55e1d613', '@lib/velocity'),
('5b8403d5', '@lib/element-resize-detector'),
('5ede9b38', '@lib/axios'),
('60a7c1f4', '@lib/jquery.payment'),
('629d3513', '@lib/fabric'),
('66c08fb9', '@lib/axios'),
('682b2ba2', '@app/web/assets/updater/dist'),
('683f7213', '@lib/jquery-touch-events'),
('68f2d045', '@craft/web/assets/admintable/dist'),
('6d0f9961', '@bower/jquery/dist'),
('6ec0d06c', '@lib/garnishjs'),
('6f9b4ed1', '@lib/picturefill'),
('72626e5f', '@app/web/assets/fields/dist'),
('72d3f3f4', '@app/web/assets/feed/dist'),
('75054011', '@app/web/assets/dashboard/dist'),
('7601ff20', '@craft/web/assets/pluginstore/dist'),
('77734f2f', '@lib/fileupload'),
('787e799d', '@app/web/assets/updateswidget/dist'),
('7a6ca3f', '@lib/selectize'),
('7bd07038', '@lib/iframe-resizer'),
('7c806e1c', '@lib/velocity'),
('7cc59b15', '@app/web/assets/editsection/dist'),
('8054b7e4', '@lib/jquery-ui'),
('8230ccf3', '@lib/vue'),
('843e6cdf', '@app/web/assets/cp/dist'),
('87799d43', '@app/web/assets/updates/dist'),
('87858b2e', '@lib/picturefill'),
('8a4a5985', '@app/web/assets/recententries/dist'),
('93396b76', '@app/web/assets/login/dist'),
('966e5bc8', '@craft/web/assets/editentry/dist'),
('96d674e7', '@lib/xregexp'),
('97077e08', '@app/web/assets/cp/dist'),
('98bc48e7', '@app/web/assets/fieldsettings/dist'),
('9ae61e91', '@app/web/assets/installer/dist'),
('9b6dc77f', '@app/web/assets/craftsupport/dist'),
('9bc61a35', '@craft/redactor/assets/redactor-plugins/dist/video'),
('9cba306d', '@lib/selectize'),
('a379866b', '@app/web/assets/craftsupport/dist'),
('a4a549d4', '@app/web/assets/updater/dist'),
('a76854d8', '@lib/vue'),
('ab2d2a62', '@app/web/assets/login/dist'),
('acc0b923', '@lib/selectize'),
('adeb2aaa', '@app/web/assets/updateswidget/dist'),
('b01f89c8', '@app/web/assets/utilities/dist'),
('b13ebffe', '@lib/d3'),
('b6c899c8', '@craft/web/assets/dashboard/dist'),
('b87dc5b5', '@app/web/assets/cp/dist'),
('b8b5952f', '@lib/axios'),
('bbe96ec4', '@app/web/assets/installer/dist'),
('bc171e8e', '@lib/jquery-ui'),
('bd3e5717', '@app/web/assets/utilities/dist'),
('bfb7cce8', '@lib/xregexp'),
('c208320b', '@app/web/assets/recententries/dist'),
('c53d792c', '@craft/web/assets/recententries/dist'),
('c6613db8', '@lib/d3'),
('c9f637bd', '@app/web/assets/admintable/dist'),
('caae5708', '@craft/web/assets/login/dist'),
('cca1d9a3', '@lib/element-resize-detector'),
('cefd2c41', '@lib/velocity'),
('cf60212b', '@lib/jquery-touch-events'),
('d02c1c17', '@lib/fileupload'),
('d0e0774e', '@lib/fabric'),
('d2da83a9', '@lib/jquery.payment'),
('d6d29f51', '@craft/redactor/assets/redactor/dist'),
('d9746bc1', '@app/web/assets/generalsettings/dist'),
('da599a50', '@app/web/assets/craftsupport/dist'),
('dbd243be', '@app/web/assets/installer/dist'),
('dc8f2300', '@lib/iframe-resizer'),
('dca8eb5', '@lib/xregexp'),
('dcbd9231', '@lib/garnishjs'),
('de327cdb', '@app/web/assets/pluginstore/dist'),
('df451586', '@app/web/assets/cp/dist'),
('df72db3c', '@bower/jquery/dist'),
('e019267e', '@craft/web/assets/plugins/dist'),
('e0569559', '@lib/fileupload'),
('e09afe00', '@lib/fabric'),
('e3317256', '@bower/jquery/dist'),
('e404bf17', '@app/web/assets/recententries/dist'),
('e6019924', '@lib/jquery-touch-events'),
('e7411632', '@app/web/assets/matrix/dist'),
('e7c220cd', '@app/web/assets/matrixsettings/dist'),
('e8633406', '@app/web/assets/editentry/dist'),
('e944a64', '@app/web/assets/updates/dist'),
('e9f94188', '@lib/element-resize-detector'),
('eba5b46a', '@lib/velocity'),
('ecf5aa4e', '@lib/iframe-resizer'),
('ee992ac3', '@lib/jquery.payment'),
('f09e8247', '@craft/web/assets/craftsupport/dist'),
('f193aeba', '@app/web/assets/updateswidget/dist'),
('f57c3c99', '@app/web/assets/utilities/dist'),
('f5dc2a3e', '@lib/garnishjs'),
('f61bb4f6', '@lib/d3'),
('f70704f7', '@app/web/assets/feed/dist'),
('f8be94a7', '@lib/picturefill'),
('fb873b42', '@craft/web/assets/updateswidget/dist');

-- --------------------------------------------------------

--
-- Table structure for table `craft_revisions`
--

CREATE TABLE `craft_revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_revisions`
--

INSERT INTO `craft_revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`) VALUES
(1, 2, 1, 1, NULL),
(2, 2, 1, 2, NULL),
(3, 2, 1, 3, NULL),
(4, 2, 1, 4, ''),
(5, 2, 1, 5, ''),
(6, 2, 1, 6, NULL),
(7, 2, 1, 7, NULL),
(8, 2, 1, 8, NULL),
(9, 2, 1, 9, NULL),
(10, 2, 1, 10, ''),
(11, 2, 1, 11, ''),
(12, 2, 1, 12, ''),
(13, 2, 1, 13, ''),
(14, 2, 1, 14, ''),
(15, 2, 1, 15, '');

-- --------------------------------------------------------

--
-- Table structure for table `craft_searchindex`
--

CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_searchindex`
--

INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' admin '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' benjaminplunkett15 gmail com '),
(1, 'slug', 0, 1, ''),
(2, 'slug', 0, 1, ' homepage '),
(2, 'title', 0, 1, ' homepage '),
(5, 'slug', 0, 1, ''),
(7, 'slug', 0, 1, ''),
(10, 'slug', 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sections`
--

CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_sections`
--

INSERT INTO `craft_sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'HomePage', 'homepage', 'single', 1, 'all', NULL, '2020-10-28 09:57:35', '2020-10-28 09:57:35', NULL, '38d989e5-885a-4a86-91ef-41f5724a5aaf');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sections_sites`
--

CREATE TABLE `craft_sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_sections_sites`
--

INSERT INTO `craft_sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, 'homepage', '_home', 1, '2020-10-28 09:57:35', '2020-10-29 10:15:17', 'b95ccf66-597f-4fa4-9e62-26c9c6ac4fb8');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sequences`
--

CREATE TABLE `craft_sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_sessions`
--

CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_sessions`
--

INSERT INTO `craft_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 1, 'JOjsejMzXyYAxGV7a9mSAimbhQJUeSCQrj-N2aNqF8o4Utui6BXUjrULn647x9K07Fa-2Rq24iMJxOhWxvELg3WNHgD9AizEqHTv', '2020-10-29 11:54:22', '2020-10-29 13:52:34', 'c598848e-c73d-498b-b064-4aff2eace2a9');

-- --------------------------------------------------------

--
-- Table structure for table `craft_shunnedmessages`
--

CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_sitegroups`
--

CREATE TABLE `craft_sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_sitegroups`
--

INSERT INTO `craft_sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Zomato', '2020-10-28 09:43:27', '2020-10-28 09:43:27', NULL, '61bb41d0-4e99-4f53-9f19-54d0299e28a0');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sites`
--

CREATE TABLE `craft_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_sites`
--

INSERT INTO `craft_sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 1, 'Zomato', 'default', 'en-US', 1, '$PRIMARY_SITE_URL', 1, '2020-10-28 09:43:27', '2020-10-28 09:43:27', NULL, '233f8e5b-8ffe-4245-a075-3a327973c8a0');

-- --------------------------------------------------------

--
-- Table structure for table `craft_structureelements`
--

CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_structures`
--

CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_systemmessages`
--

CREATE TABLE `craft_systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_taggroups`
--

CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_tags`
--

CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecacheelements`
--

CREATE TABLE `craft_templatecacheelements` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecachequeries`
--

CREATE TABLE `craft_templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecaches`
--

CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_tokens`
--

CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_usergroups`
--

CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_usergroups_users`
--

CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions`
--

CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions_usergroups`
--

CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions_users`
--

CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpreferences`
--

CREATE TABLE `craft_userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_userpreferences`
--

INSERT INTO `craft_userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Table structure for table `craft_users`
--

CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_users`
--

INSERT INTO `craft_users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'admin', NULL, NULL, NULL, 'benjaminplunkett15@gmail.com', '$2y$13$KPY39ogvhC/u.0aIBGrGt.6S5RyX9yMLfbkHiSfFJOI2/mNRT0zXm', 1, 0, 0, 0, '2020-10-29 11:54:22', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2020-10-28 09:43:28', '2020-10-28 09:43:28', '2020-10-29 11:54:22', 'a034c2a0-9c21-4e89-8937-19c27901f931');

-- --------------------------------------------------------

--
-- Table structure for table `craft_volumefolders`
--

CREATE TABLE `craft_volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_volumes`
--

CREATE TABLE `craft_volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `url` varchar(255) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_widgets`
--

CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_widgets`
--

INSERT INTO `craft_widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', 1, '2020-10-28 09:49:30', '2020-10-28 09:49:30', '78cbf8f2-47fb-409a-b3ee-cabd9ac2f810'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2020-10-28 09:49:30', '2020-10-28 09:49:30', 'f1ae91b4-c96c-4e84-8dbb-31d6607c364b'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2020-10-28 09:49:31', '2020-10-28 09:49:31', '905a689b-191b-4359-aae4-b7f5ce0b891a'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2020-10-28 09:49:31', '2020-10-28 09:49:31', '7e552329-51c9-430d-ae03-4253e18d651d');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  ADD KEY `craft_assetindexdata_volumeId_idx` (`volumeId`);

--
-- Indexes for table `craft_assets`
--
ALTER TABLE `craft_assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_assets_filename_folderId_idx` (`filename`,`folderId`),
  ADD KEY `craft_assets_folderId_idx` (`folderId`),
  ADD KEY `craft_assets_volumeId_idx` (`volumeId`),
  ADD KEY `craft_assets_uploaderId_fk` (`uploaderId`);

--
-- Indexes for table `craft_assettransformindex`
--
ALTER TABLE `craft_assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `craft_assettransforms`
--
ALTER TABLE `craft_assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_assettransforms_name_idx` (`name`),
  ADD KEY `craft_assettransforms_handle_idx` (`handle`);

--
-- Indexes for table `craft_categories`
--
ALTER TABLE `craft_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_categories_groupId_idx` (`groupId`),
  ADD KEY `craft_categories_parentId_fk` (`parentId`);

--
-- Indexes for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_categorygroups_name_idx` (`name`),
  ADD KEY `craft_categorygroups_handle_idx` (`handle`),
  ADD KEY `craft_categorygroups_structureId_idx` (`structureId`),
  ADD KEY `craft_categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `craft_categorygroups_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `craft_categorygroups_sites`
--
ALTER TABLE `craft_categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  ADD KEY `craft_categorygroups_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `craft_changedattributes`
--
ALTER TABLE `craft_changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `craft_changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `craft_changedattributes_siteId_fk` (`siteId`),
  ADD KEY `craft_changedattributes_userId_fk` (`userId`);

--
-- Indexes for table `craft_changedfields`
--
ALTER TABLE `craft_changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `craft_changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `craft_changedfields_siteId_fk` (`siteId`),
  ADD KEY `craft_changedfields_fieldId_fk` (`fieldId`),
  ADD KEY `craft_changedfields_userId_fk` (`userId`);

--
-- Indexes for table `craft_content`
--
ALTER TABLE `craft_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `craft_content_siteId_idx` (`siteId`),
  ADD KEY `craft_content_title_idx` (`title`);

--
-- Indexes for table `craft_craftidtokens`
--
ALTER TABLE `craft_craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_craftidtokens_userId_fk` (`userId`);

--
-- Indexes for table `craft_deprecationerrors`
--
ALTER TABLE `craft_deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indexes for table `craft_drafts`
--
ALTER TABLE `craft_drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_drafts_creatorId_fk` (`creatorId`),
  ADD KEY `craft_drafts_sourceId_fk` (`sourceId`);

--
-- Indexes for table `craft_elementindexsettings`
--
ALTER TABLE `craft_elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_elementindexsettings_type_unq_idx` (`type`);

--
-- Indexes for table `craft_elements`
--
ALTER TABLE `craft_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_elements_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `craft_elements_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `craft_elements_type_idx` (`type`),
  ADD KEY `craft_elements_enabled_idx` (`enabled`),
  ADD KEY `craft_elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  ADD KEY `craft_elements_archived_dateDeleted_draftId_revisionId_idx` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  ADD KEY `craft_elements_draftId_fk` (`draftId`),
  ADD KEY `craft_elements_revisionId_fk` (`revisionId`);

--
-- Indexes for table `craft_elements_sites`
--
ALTER TABLE `craft_elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `craft_elements_sites_siteId_idx` (`siteId`),
  ADD KEY `craft_elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  ADD KEY `craft_elements_sites_enabled_idx` (`enabled`),
  ADD KEY `craft_elements_sites_uri_siteId_idx` (`uri`,`siteId`);

--
-- Indexes for table `craft_entries`
--
ALTER TABLE `craft_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_entries_postDate_idx` (`postDate`),
  ADD KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  ADD KEY `craft_entries_authorId_idx` (`authorId`),
  ADD KEY `craft_entries_sectionId_idx` (`sectionId`),
  ADD KEY `craft_entries_typeId_idx` (`typeId`),
  ADD KEY `craft_entries_parentId_fk` (`parentId`);

--
-- Indexes for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  ADD KEY `craft_entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  ADD KEY `craft_entrytypes_sectionId_idx` (`sectionId`),
  ADD KEY `craft_entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `craft_entrytypes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `craft_fieldgroups`
--
ALTER TABLE `craft_fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_fieldgroups_name_idx` (`name`);

--
-- Indexes for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `craft_fieldlayoutfields_tabId_idx` (`tabId`),
  ADD KEY `craft_fieldlayoutfields_fieldId_idx` (`fieldId`);

--
-- Indexes for table `craft_fieldlayouts`
--
ALTER TABLE `craft_fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `craft_fieldlayouts_type_idx` (`type`);

--
-- Indexes for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `craft_fieldlayouttabs_layoutId_idx` (`layoutId`);

--
-- Indexes for table `craft_fields`
--
ALTER TABLE `craft_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_fields_handle_context_idx` (`handle`,`context`),
  ADD KEY `craft_fields_groupId_idx` (`groupId`),
  ADD KEY `craft_fields_context_idx` (`context`);

--
-- Indexes for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_globalsets_name_idx` (`name`),
  ADD KEY `craft_globalsets_handle_idx` (`handle`),
  ADD KEY `craft_globalsets_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `craft_gqlschemas`
--
ALTER TABLE `craft_gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `craft_gqltokens`
--
ALTER TABLE `craft_gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_gqltokens_accessToken_unq_idx` (`accessToken`),
  ADD UNIQUE KEY `craft_gqltokens_name_unq_idx` (`name`),
  ADD KEY `craft_gqltokens_schemaId_fk` (`schemaId`);

--
-- Indexes for table `craft_info`
--
ALTER TABLE `craft_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `craft_matrixblocks`
--
ALTER TABLE `craft_matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`);

--
-- Indexes for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_matrixblocktypes_name_fieldId_idx` (`name`,`fieldId`),
  ADD KEY `craft_matrixblocktypes_handle_fieldId_idx` (`handle`,`fieldId`),
  ADD KEY `craft_matrixblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `craft_matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_migrations_track_name_unq_idx` (`track`,`name`);

--
-- Indexes for table `craft_plugins`
--
ALTER TABLE `craft_plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_plugins_handle_unq_idx` (`handle`);

--
-- Indexes for table `craft_projectconfig`
--
ALTER TABLE `craft_projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `craft_queue`
--
ALTER TABLE `craft_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `craft_queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `craft_relations`
--
ALTER TABLE `craft_relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `craft_relations_sourceId_idx` (`sourceId`),
  ADD KEY `craft_relations_targetId_idx` (`targetId`),
  ADD KEY `craft_relations_sourceSiteId_idx` (`sourceSiteId`);

--
-- Indexes for table `craft_resourcepaths`
--
ALTER TABLE `craft_resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `craft_revisions`
--
ALTER TABLE `craft_revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  ADD KEY `craft_revisions_creatorId_fk` (`creatorId`);

--
-- Indexes for table `craft_searchindex`
--
ALTER TABLE `craft_searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `craft_searchindex` ADD FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`);

--
-- Indexes for table `craft_sections`
--
ALTER TABLE `craft_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_sections_handle_idx` (`handle`),
  ADD KEY `craft_sections_name_idx` (`name`),
  ADD KEY `craft_sections_structureId_idx` (`structureId`),
  ADD KEY `craft_sections_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `craft_sections_sites`
--
ALTER TABLE `craft_sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  ADD KEY `craft_sections_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `craft_sequences`
--
ALTER TABLE `craft_sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_sessions_uid_idx` (`uid`),
  ADD KEY `craft_sessions_token_idx` (`token`),
  ADD KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `craft_sessions_userId_idx` (`userId`);

--
-- Indexes for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indexes for table `craft_sitegroups`
--
ALTER TABLE `craft_sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_sitegroups_name_idx` (`name`);

--
-- Indexes for table `craft_sites`
--
ALTER TABLE `craft_sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_sites_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `craft_sites_handle_idx` (`handle`),
  ADD KEY `craft_sites_sortOrder_idx` (`sortOrder`),
  ADD KEY `craft_sites_groupId_fk` (`groupId`);

--
-- Indexes for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  ADD KEY `craft_structureelements_root_idx` (`root`),
  ADD KEY `craft_structureelements_lft_idx` (`lft`),
  ADD KEY `craft_structureelements_rgt_idx` (`rgt`),
  ADD KEY `craft_structureelements_level_idx` (`level`),
  ADD KEY `craft_structureelements_elementId_idx` (`elementId`);

--
-- Indexes for table `craft_structures`
--
ALTER TABLE `craft_structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_structures_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `craft_systemmessages`
--
ALTER TABLE `craft_systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_systemmessages_key_language_unq_idx` (`key`,`language`),
  ADD KEY `craft_systemmessages_language_idx` (`language`);

--
-- Indexes for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_taggroups_name_idx` (`name`),
  ADD KEY `craft_taggroups_handle_idx` (`handle`),
  ADD KEY `craft_taggroups_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_tags`
--
ALTER TABLE `craft_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_tags_groupId_idx` (`groupId`);

--
-- Indexes for table `craft_templatecacheelements`
--
ALTER TABLE `craft_templatecacheelements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_templatecacheelements_cacheId_idx` (`cacheId`),
  ADD KEY `craft_templatecacheelements_elementId_idx` (`elementId`);

--
-- Indexes for table `craft_templatecachequeries`
--
ALTER TABLE `craft_templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_templatecachequeries_cacheId_idx` (`cacheId`),
  ADD KEY `craft_templatecachequeries_type_idx` (`type`);

--
-- Indexes for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `craft_templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `craft_templatecaches_siteId_idx` (`siteId`);

--
-- Indexes for table `craft_tokens`
--
ALTER TABLE `craft_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_tokens_token_unq_idx` (`token`),
  ADD KEY `craft_tokens_expiryDate_idx` (`expiryDate`);

--
-- Indexes for table `craft_usergroups`
--
ALTER TABLE `craft_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_usergroups_handle_idx` (`handle`),
  ADD KEY `craft_usergroups_name_idx` (`name`);

--
-- Indexes for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `craft_usergroups_users_userId_idx` (`userId`);

--
-- Indexes for table `craft_userpermissions`
--
ALTER TABLE `craft_userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`);

--
-- Indexes for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `craft_userpermissions_usergroups_groupId_idx` (`groupId`);

--
-- Indexes for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `craft_userpermissions_users_userId_idx` (`userId`);

--
-- Indexes for table `craft_userpreferences`
--
ALTER TABLE `craft_userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `craft_users`
--
ALTER TABLE `craft_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_users_uid_idx` (`uid`),
  ADD KEY `craft_users_verificationCode_idx` (`verificationCode`),
  ADD KEY `craft_users_email_idx` (`email`),
  ADD KEY `craft_users_username_idx` (`username`),
  ADD KEY `craft_users_photoId_fk` (`photoId`);

--
-- Indexes for table `craft_volumefolders`
--
ALTER TABLE `craft_volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  ADD KEY `craft_volumefolders_parentId_idx` (`parentId`),
  ADD KEY `craft_volumefolders_volumeId_idx` (`volumeId`);

--
-- Indexes for table `craft_volumes`
--
ALTER TABLE `craft_volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_volumes_name_idx` (`name`),
  ADD KEY `craft_volumes_handle_idx` (`handle`),
  ADD KEY `craft_volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `craft_volumes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_widgets_userId_idx` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_assettransformindex`
--
ALTER TABLE `craft_assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_assettransforms`
--
ALTER TABLE `craft_assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_categorygroups_sites`
--
ALTER TABLE `craft_categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_content`
--
ALTER TABLE `craft_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `craft_craftidtokens`
--
ALTER TABLE `craft_craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_deprecationerrors`
--
ALTER TABLE `craft_deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_drafts`
--
ALTER TABLE `craft_drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_elementindexsettings`
--
ALTER TABLE `craft_elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_elements`
--
ALTER TABLE `craft_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `craft_elements_sites`
--
ALTER TABLE `craft_elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_fieldgroups`
--
ALTER TABLE `craft_fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `craft_fieldlayouts`
--
ALTER TABLE `craft_fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `craft_fields`
--
ALTER TABLE `craft_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `craft_gqlschemas`
--
ALTER TABLE `craft_gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_gqltokens`
--
ALTER TABLE `craft_gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_info`
--
ALTER TABLE `craft_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `craft_plugins`
--
ALTER TABLE `craft_plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_queue`
--
ALTER TABLE `craft_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `craft_relations`
--
ALTER TABLE `craft_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_revisions`
--
ALTER TABLE `craft_revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `craft_sections`
--
ALTER TABLE `craft_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_sections_sites`
--
ALTER TABLE `craft_sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_sitegroups`
--
ALTER TABLE `craft_sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_sites`
--
ALTER TABLE `craft_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_structures`
--
ALTER TABLE `craft_structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_systemmessages`
--
ALTER TABLE `craft_systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_templatecacheelements`
--
ALTER TABLE `craft_templatecacheelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_templatecachequeries`
--
ALTER TABLE `craft_templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_tokens`
--
ALTER TABLE `craft_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_usergroups`
--
ALTER TABLE `craft_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_userpermissions`
--
ALTER TABLE `craft_userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_userpreferences`
--
ALTER TABLE `craft_userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_volumefolders`
--
ALTER TABLE `craft_volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_volumes`
--
ALTER TABLE `craft_volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  ADD CONSTRAINT `craft_assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assets`
--
ALTER TABLE `craft_assets`
  ADD CONSTRAINT `craft_assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_assets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categories`
--
ALTER TABLE `craft_categories`
  ADD CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  ADD CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categorygroups_sites`
--
ALTER TABLE `craft_categorygroups_sites`
  ADD CONSTRAINT `craft_categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_changedattributes`
--
ALTER TABLE `craft_changedattributes`
  ADD CONSTRAINT `craft_changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `craft_changedfields`
--
ALTER TABLE `craft_changedfields`
  ADD CONSTRAINT `craft_changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `craft_content`
--
ALTER TABLE `craft_content`
  ADD CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_craftidtokens`
--
ALTER TABLE `craft_craftidtokens`
  ADD CONSTRAINT `craft_craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_drafts`
--
ALTER TABLE `craft_drafts`
  ADD CONSTRAINT `craft_drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_elements`
--
ALTER TABLE `craft_elements`
  ADD CONSTRAINT `craft_elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `craft_drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `craft_revisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_elements_sites`
--
ALTER TABLE `craft_elements_sites`
  ADD CONSTRAINT `craft_elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_entries`
--
ALTER TABLE `craft_entries`
  ADD CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  ADD CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  ADD CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  ADD CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fields`
--
ALTER TABLE `craft_fields`
  ADD CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
  ADD CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_gqltokens`
--
ALTER TABLE `craft_gqltokens`
  ADD CONSTRAINT `craft_gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `craft_gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_matrixblocks`
--
ALTER TABLE `craft_matrixblocks`
  ADD CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  ADD CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_relations`
--
ALTER TABLE `craft_relations`
  ADD CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_revisions`
--
ALTER TABLE `craft_revisions`
  ADD CONSTRAINT `craft_revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_sections`
--
ALTER TABLE `craft_sections`
  ADD CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_sections_sites`
--
ALTER TABLE `craft_sections_sites`
  ADD CONSTRAINT `craft_sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  ADD CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  ADD CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_sites`
--
ALTER TABLE `craft_sites`
  ADD CONSTRAINT `craft_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  ADD CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  ADD CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_tags`
--
ALTER TABLE `craft_tags`
  ADD CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecacheelements`
--
ALTER TABLE `craft_templatecacheelements`
  ADD CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecachequeries`
--
ALTER TABLE `craft_templatecachequeries`
  ADD CONSTRAINT `craft_templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  ADD CONSTRAINT `craft_templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  ADD CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  ADD CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  ADD CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpreferences`
--
ALTER TABLE `craft_userpreferences`
  ADD CONSTRAINT `craft_userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_users`
--
ALTER TABLE `craft_users`
  ADD CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `craft_assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_volumefolders`
--
ALTER TABLE `craft_volumefolders`
  ADD CONSTRAINT `craft_volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_volumes`
--
ALTER TABLE `craft_volumes`
  ADD CONSTRAINT `craft_volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  ADD CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
