SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

DELIMITER $$
--
-- Prozeduren
--
CREATE PROCEDURE `resetPlayerSide`()
    NO SQL
UPDATE players SET side = NULL$$

CREATE PROCEDURE `resetPunishedPlayers`()
UPDATE players SET banned = 0$$

CREATE PROCEDURE `resetTeamkills`()
    NO SQL
UPDATE players SET teamkills = 0$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `playerid` varchar(50) COLLATE latin1_bin NOT NULL,
  `name` varchar(32) COLLATE latin1_bin NOT NULL,
  `side` varchar(15) COLLATE latin1_bin NOT NULL,
  `level` int(100) NOT NULL DEFAULT '1',
  `kills` int(255) NOT NULL DEFAULT '0',
  `banned` int(100) NOT NULL DEFAULT '0',
  `teamkills` int(100) NOT NULL DEFAULT '0',
  `xp` int(255) NOT NULL DEFAULT '0',
  `deaths` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `playerid` (`playerid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=0 ;