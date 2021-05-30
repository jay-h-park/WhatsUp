USE `whatsup`;

CREATE TABLE `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `account` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `is_deleted` TINYINT NOT NULL DEFAULT 0,
  `popularity` INT NULL DEFAULT 0,
  `profile_image_path` VARCHAR(100) NULL,
  PRIMARY KEY (`id`));
  
CREATE TABLE `article` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `dong` VARCHAR(45) NULL,
  `latitude` DECIMAL(9,6) NOT NULL,
  `longitude` DECIMAL(9,6) NOT NULL,
  `popularity` INT NULL DEFAULT 0,
  `time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
    
CREATE TABLE `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `article_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `content` VARCHAR(200) NOT NULL,
  `time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `article_id_idx` (`article_id` ASC) VISIBLE,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `article_id`
    FOREIGN KEY (`article_id`)
    REFERENCES `article` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `comment_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

