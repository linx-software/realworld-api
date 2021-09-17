CREATE DATABASE IF NOT EXISTS `RealWorld`;
USE `RealWorld`;

DROP TABLE IF EXISTS `APIUser`;
CREATE TABLE IF NOT EXISTS `APIUser` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(1000) NOT NULL,
  `Email` varchar(50) NOT NULL,  
  `CreatedAt` datetime NOT NULL,
  `UpdatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `Image` Text NULL,
  `Bio` varchar(1000) NULL,
  `Following` boolean DEFAULT FALSE,
  PRIMARY KEY (`ID`),
  UNIQUE KEY unique_Username (Username)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Article`;
CREATE TABLE IF NOT EXISTS `Article` (
    `ID` int NOT NULL AUTO_INCREMENT,
	`Slug` varchar(1000)  NOT NULL,
	`Title` varchar(1000) NOT NULL,
	`Description` varchar(1000)  NULL,
	`Body` Text NOT NULL,
	`Author` varchar(100) NOT NULL,
	`CreatedAt` datetime NOT NULL,
	`UpdatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  	`FavouritesCount` int  DEFAULT 0,
	PRIMARY KEY (`ID`),
    UNIQUE KEY unique_slug (Slug)
 
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Favourite`;
CREATE TABLE IF NOT EXISTS `Favourite` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Slug` varchar(100) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (Slug) REFERENCES Article(Slug),
  FOREIGN KEY (UserName) REFERENCES APIUser(Username)  
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Following`;
CREATE TABLE IF NOT EXISTS `Following` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Author` varchar(100) NOT NULL,
  `Follower` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (Author) REFERENCES APIUser(Username),
  FOREIGN KEY (Follower) REFERENCES APIUser(Username)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `Tag`;
CREATE TABLE IF NOT EXISTS `Tag` ( 
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
   UNIQUE KEY unique_name (Name),
  PRIMARY KEY (ID)
  
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `ArticleTag`;
CREATE TABLE IF NOT EXISTS `ArticleTag` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ArticleID` int NOT NULL,
  `Tag` varchar(1000) NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (ArticleID) REFERENCES Article(ID)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
DELIMITER $$

DROP PROCEDURE IF EXISTS `InsertArticle`;
CREATE PROCEDURE `InsertArticle`(
        IN p_Slug varchar(1000),
	IN p_Title varchar(1000),
	IN p_Description varchar(1000),
	IN p_Body Text,
	IN p_Author varchar(100) ,
        IN p_CreatedAt datetime,
    OUT id int )
BEGIN
INSERT INTO Article
           (Slug
           ,Title           
           ,Description 
           ,Body
           ,Author
           ,CreatedAt
           )
     VALUES
           (
          p_Slug, p_Title, p_Description, p_Body, p_Author, p_CreatedAt
           );
SELECT LAST_INSERT_ID() INTO id;
END$$
DELIMITER ;
INSERT INTO Tag
           (Name)
     VALUES
           (
           'tag1'
           );
DROP TABLE IF EXISTS `Comment`;	   
CREATE TABLE IF NOT EXISTS `Comment` (
  `ID` int NOT NULL AUTO_INCREMENT, 
  `Body` text NOT NULL,
  `Author` varchar(100) NOT NULL,
  `CreatedAt` datetime NOT NULL,
  `UpdatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `ArticleID` int NOT NULL,
  
  PRIMARY KEY (`ID`),
 
  FOREIGN KEY (ArticleID) REFERENCES Article(ID)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
DELIMITER $$

DROP PROCEDURE IF EXISTS `InsertArticleComment`;
CREATE PROCEDURE `InsertArticleComment`(
       IN p_createdAt datetime,
	IN p_Body text,
	IN p_Author varchar(100) ,
    IN p_ArticleID int,
    OUT id int )
BEGIN
INSERT INTO Comment
           (
           Body
           ,Author
           ,CreatedAt           
           ,ArticleID)
     VALUES
           ( p_Body,
             p_Author,
             p_createdAt,
             p_ArticleID
           );
SELECT LAST_INSERT_ID() INTO id;
END$$
DELIMITER $$

DROP PROCEDURE IF EXISTS `InsertUser`;
CREATE PROCEDURE `InsertUser`(IN p_username varchar(100) , IN user_password varchar(1000), IN p_email varchar(50),  IN p_CreatedAt datetime, OUT id int )
BEGIN
INSERT INTO APIUser
           (username
           ,password           
           ,email 
          
           ,CreatedAt 
           )
     VALUES
           (
          p_username, user_password, p_email, p_CreatedAt 
           );
SELECT LAST_INSERT_ID() INTO id;
END$$
DELIMITER ;
DELIMITER $$

DROP PROCEDURE IF EXISTS `UpdateUser`;
CREATE PROCEDURE `UpdateUser` (IN p_Email varchar(1000),
	IN p_Username varchar(1000))
BEGIN
UPDATE APIUser   SET 
      email = p_Email
 WHERE Username = p_Username ;
   
END$$
DELIMITER ;
