CREATE TABLE IF NOT EXISTS `hcerdocs` (
  `documentbody` text NOT NULL,
  `creationDate` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `patient` varchar(255) DEFAULT NULL,
  `fromcountry` varchar(20) DEFAULT NULL,
  `docid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`docid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;