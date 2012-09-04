-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 31, 2012 at 11:37 AM
-- Server version: 5.1.33
-- PHP Version: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `extended`
--

-- --------------------------------------------------------

--
-- Table structure for table `consultingrooms`
--

CREATE TABLE IF NOT EXISTS `consultingrooms` (
  `consultingroomid` int(11) NOT NULL AUTO_INCREMENT,
  `consultingroom` varchar(200) NOT NULL,
  PRIMARY KEY (`consultingroomid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `consultingrooms`
--

INSERT INTO `consultingrooms` (`consultingroomid`, `consultingroom`) VALUES
(1, 'Room 1');

-- --------------------------------------------------------

--
-- Table structure for table `folder`
--

CREATE TABLE IF NOT EXISTS `folder` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `foldernumber` varchar(10) DEFAULT NULL,
  `shelvenumber` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `folder`
--

INSERT INTO `folder` (`fid`, `foldernumber`, `shelvenumber`, `status`) VALUES
(14, 'PAT-004', 'K-0001', 'Records'),
(8, 'PAT-002', 'M-0001', 'Records'),
(15, 'PAT-005', 'K-0001', 'Records'),
(10, 'PAT-003', 'M-0001', 'Room 1'),
(16, 'PAT-006', 'M-0001', 'Records'),
(17, 'FIN0023', 'D-0001', 'Laboratory');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE IF NOT EXISTS `patient` (
  `patientid` varchar(10) NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `midname` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `emergencycontact` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dateofregistration` date DEFAULT NULL,
  PRIMARY KEY (`patientid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientid`, `fname`, `lname`, `midname`, `address`, `dateofbirth`, `contact`, `emergencycontact`, `email`, `dateofregistration`) VALUES
('PAT-001', 'Isaac', 'McSey', 'Arnold', 'East legon', '1985-08-25', '0275211219', '0275211219', 'e@d.com', '2012-03-31'),
('PAT-002', 'Isaac', 'McSey', 'Arnold', 'East legon', '1985-08-25', '0275211219', '0275211219', 'a@a.com', '2012-03-31'),
('PAT-003', 'Isaac', 'McSey', 'Arnold', 'East legon', '1985-08-25', '0275211219', '0275211219', 'a@a.com', '2012-03-31'),
('PAT-004', 'Kwame', 'Kofi', 'Kwesi', 'Legon', '1982-03-01', '0275211219', '0275211219', 'a@a.com', '2012-03-31'),
('PAT-005', 'Kwame', 'Kofi', 'Kwesi', 'Legon', '1982-03-01', '0275211219', '0275211219', 'a@a.com', '2012-03-31'),
('PAT-006', 'Isaac', 'McSey', 'Arnold', 'East legon', '1982-03-01', '0275211219', '0275211219', 'a@a.com', '2012-03-31'),
('FIN0023', 'Nancy', 'Drew', 'Naabia', 'Box 12, Asamankese', '1998-09-15', '0243232123', '03432234432', 'drew@crimelab.com', '2012-04-03');

-- --------------------------------------------------------

--
-- Table structure for table `sponsorhipdetails`
--

CREATE TABLE IF NOT EXISTS `sponsorhipdetails` (
  `patientid` varchar(10) NOT NULL,
  `membershipid` varchar(10) DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL,
  `benefitplan` varchar(200) DEFAULT NULL,
  `sponsorid` int(150) DEFAULT NULL,
  PRIMARY KEY (`patientid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sponsorhipdetails`
--

INSERT INTO `sponsorhipdetails` (`patientid`, `membershipid`, `type`, `benefitplan`, `sponsorid`) VALUES
('PAT-003', 'MOM-123', 'private', 'Executive', 2),
('PAT-004', 'NAT_001', 'private', 'Executive', 3),
('PAT-005', 'NAT_001', 'private', 'Executive', 3),
('PAT-006', 'MOM-456', 'private', 'Diamond', 2),
('FIN0023', 'PRE0032', 'private', 'Premier', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sponsorship`
--

CREATE TABLE IF NOT EXISTS `sponsorship` (
  `sponshorshipid` int(11) NOT NULL AUTO_INCREMENT,
  `sponsorname` varchar(150) DEFAULT NULL,
  `type` varchar(150) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `contact` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sponshorshipid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sponsorship`
--

INSERT INTO `sponsorship` (`sponshorshipid`, `sponsorname`, `type`, `address`, `contact`, `email`) VALUES
(2, 'Momentum Health', 'Private Insurance', 'Ridge', '0275211219', 'm@mhealth.com'),
(3, 'Nationwide Mutual', 'private', 'Ridge', '0275211219', 'a@a.com');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE IF NOT EXISTS `units` (
  `unitid` int(11) NOT NULL AUTO_INCREMENT,
  `unitname` varchar(200) NOT NULL,
  PRIMARY KEY (`unitid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`unitid`, `unitname`) VALUES
(3, 'OPD'),
(4, 'Pharmacy'),
(5, 'Laboratory'),
(6, 'WARD');

-- --------------------------------------------------------

--
-- Table structure for table `visitationtable`
--

CREATE TABLE IF NOT EXISTS `visitationtable` (
  `visitid` int(11) NOT NULL AUTO_INCREMENT,
  `patientid` varchar(100) NOT NULL,
  `date` date DEFAULT NULL,
  `vitals` varchar(500) DEFAULT NULL,
  `doctor` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`visitid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `visitationtable`
--

INSERT INTO `visitationtable` (`visitid`, `patientid`, `date`, `vitals`, `doctor`, `status`) VALUES
(2, 'PAT-006', NULL, NULL, NULL, 'OPD'),
(3, 'PAT-006', '2012-03-31', '', '', 'OPD'),
(4, 'FIN0023', '2012-04-03', 'hb - 24\r\ntemperature - 18', NULL, 'Con Room 1'),
(5, 'FIN0023', '2012-05-30', NULL, NULL, 'Pharmacy'),
(6, 'FIN0023', '2012-05-30', NULL, NULL, 'Pharmacy'),
(7, 'FIN0023', '2012-05-30', NULL, NULL, 'Laboratory'),
(8, 'PAT-003', '2012-05-30', NULL, NULL, 'WARD'),
(9, 'PAT-003', '2012-05-30', NULL, NULL, 'Room 1'),
(10, 'PAT-003', '2012-05-30', NULL, NULL, 'Pharmacy'),
(11, 'PAT-003', '2012-05-30', NULL, NULL, 'Room 1'),
(12, 'FIN0023', '2012-05-30', NULL, NULL, 'Pharmacy'),
(13, 'FIN0023', '2012-05-30', NULL, NULL, 'Laboratory');
