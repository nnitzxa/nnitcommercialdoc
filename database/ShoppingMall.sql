-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema shoppingmall
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema shoppingmall
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shoppingmall` DEFAULT CHARACTER SET utf8 ;
USE `shoppingmall` ;

-- -----------------------------------------------------
-- Table `shoppingmall`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingmall`.`category` (
  `ID` VARCHAR(25) NOT NULL,
  `LABEL` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shoppingmall`.`type_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingmall`.`type_status` (
  `ID` VARCHAR(25) NOT NULL,
  `LABEL` VARCHAR(20) NULL DEFAULT NULL,
  `SHORT_LABEL` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shoppingmall`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingmall`.`member` (
  `ID` VARCHAR(25) NOT NULL,
  `CELL_PHONE` VARCHAR(15) NOT NULL,
  `NICK_NAME` VARCHAR(45) NULL DEFAULT NULL,
  `PASSWORD` VARCHAR(45) NULL DEFAULT NULL,
  `SESSION_ID` VARCHAR(120) NULL DEFAULT NULL,
  `LATEST_LOGIN` DATETIME NULL DEFAULT NULL,
  `FETCH_BACK_PWD` VARCHAR(120) NULL DEFAULT NULL,
  `ACCOUNT_NUMBER` VARCHAR(45) NOT NULL,
  `GRADE` VARCHAR(255) NULL DEFAULT NULL,
  `IS_ONLINE` VARCHAR(48) NOT NULL,
  `GENDER` VARCHAR(48) NULL DEFAULT NULL,
  `PIC` VARCHAR(300) NULL DEFAULT NULL,
  `EMAIL_ADDR` VARCHAR(48) NULL DEFAULT NULL,
  `TYPE` VARCHAR(48) NULL DEFAULT NULL,
  `STATUS_ID` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `member_ab8daf50` (`STATUS_ID` ASC),
  CONSTRAINT `member_STATUS_ID_2fe42508_fk_type_status_ID`
    FOREIGN KEY (`STATUS_ID`)
    REFERENCES `shoppingmall`.`type_status` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shoppingmall`.`couponbackage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingmall`.`couponbackage` (
  `ID` VARCHAR(25) NOT NULL,
  `CODE` VARCHAR(45) NULL DEFAULT NULL,
  `COUPON_TYPE` VARCHAR(48) NULL DEFAULT NULL,
  `MEMBER_ID` VARCHAR(25) NOT NULL,
  `STATUS_ID` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `couponbackage_c7d5c7dd` (`MEMBER_ID` ASC),
  INDEX `couponbackage_ab8daf50` (`STATUS_ID` ASC),
  CONSTRAINT `couponbackage_MEMBER_ID_9dc41ad7_fk_member_ID`
    FOREIGN KEY (`MEMBER_ID`)
    REFERENCES `shoppingmall`.`member` (`ID`),
  CONSTRAINT `couponbackage_STATUS_ID_f88c5eaa_fk_type_status_ID`
    FOREIGN KEY (`STATUS_ID`)
    REFERENCES `shoppingmall`.`type_status` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shoppingmall`.`shop`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingmall`.`shop` (
  `ID` VARCHAR(25) NOT NULL,
  `SHOP_NAME` VARCHAR(255) NOT NULL,
  `FLOOR` INT(11) NOT NULL,
  `LOCATION` VARCHAR(255) NOT NULL,
  `LOGO` VARCHAR(1000) NOT NULL,
  `TRUE_SCENE` VARCHAR(300) NULL DEFAULT NULL,
  `TELEPHONE` VARCHAR(20) NOT NULL,
  `CONTACT` VARCHAR(32) NOT NULL,
  `CONTACT_TEL` VARCHAR(20) NULL DEFAULT NULL,
  `INTRODUCTION` LONGTEXT NOT NULL,
  `CREATE_TIME` DATETIME NOT NULL,
  `OPENING_TIME` DATETIME NULL DEFAULT NULL,
  `CATEGORY_ID` VARCHAR(25) NOT NULL,
  `MEMBER_ID` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `shop_CATEGORY_ID_641483fe_fk_category_ID` (`CATEGORY_ID` ASC),
  INDEX `shop_MEMBER_ID_910e8eba_fk_member_ID` (`MEMBER_ID` ASC),
  CONSTRAINT `shop_CATEGORY_ID_641483fe_fk_category_ID`
    FOREIGN KEY (`CATEGORY_ID`)
    REFERENCES `shoppingmall`.`category` (`ID`),
  CONSTRAINT `shop_MEMBER_ID_910e8eba_fk_member_ID`
    FOREIGN KEY (`MEMBER_ID`)
    REFERENCES `shoppingmall`.`member` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shoppingmall`.`discount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingmall`.`discount` (
  `ID` VARCHAR(25) NOT NULL,
  `TITLE` VARCHAR(100) NULL DEFAULT NULL,
  `PICTURE` VARCHAR(200) NULL DEFAULT NULL,
  `START_DATE` DATE NULL DEFAULT NULL,
  `END_DATE` DATE NULL DEFAULT NULL,
  `DETAILS` VARCHAR(300) NULL DEFAULT NULL,
  `CREATE_TIME` DATETIME NULL DEFAULT NULL,
  `DISCOUNT_VALUE` INT(11) NULL DEFAULT NULL,
  `DISCOUNT_UNIT` VARCHAR(45) NULL DEFAULT NULL,
  `SHOP_ID` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `discount_64e70c2e` (`SHOP_ID` ASC),
  CONSTRAINT `discount_SHOP_ID_baa22929_fk_shop_ID`
    FOREIGN KEY (`SHOP_ID`)
    REFERENCES `shoppingmall`.`shop` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shoppingmall`.`discount_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingmall`.`discount_user` (
  `ID` VARCHAR(25) NOT NULL,
  `CODE` VARCHAR(45) NULL DEFAULT NULL,
  `DISCOUNT_ID` VARCHAR(25) NOT NULL,
  `MEMBER_ID` VARCHAR(25) NOT NULL,
  `STATUS_ID` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `discount_user_DISCOUNT_ID_60b72449_fk_discount_ID` (`DISCOUNT_ID` ASC),
  INDEX `discount_user_c7d5c7dd` (`MEMBER_ID` ASC),
  INDEX `discount_user_ab8daf50` (`STATUS_ID` ASC),
  CONSTRAINT `discount_user_DISCOUNT_ID_60b72449_fk_discount_ID`
    FOREIGN KEY (`DISCOUNT_ID`)
    REFERENCES `shoppingmall`.`discount` (`ID`),
  CONSTRAINT `discount_user_MEMBER_ID_db9b7b92_fk_member_ID`
    FOREIGN KEY (`MEMBER_ID`)
    REFERENCES `shoppingmall`.`member` (`ID`),
  CONSTRAINT `discount_user_STATUS_ID_fd385eba_fk_type_status_ID`
    FOREIGN KEY (`STATUS_ID`)
    REFERENCES `shoppingmall`.`type_status` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shoppingmall`.`django_migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingmall`.`django_migrations` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `app` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `applied` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shoppingmall`.`evaluation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingmall`.`evaluation` (
  `ID` VARCHAR(25) NOT NULL,
  `SCORE` DOUBLE NULL DEFAULT NULL,
  `CONTENT` LONGTEXT NOT NULL,
  `POST_TIME` DATETIME NOT NULL,
  `PIC` VARCHAR(300) NULL DEFAULT NULL,
  `MEMBER_ID` VARCHAR(25) NOT NULL,
  `SHOP_ID` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `evaluation_c7d5c7dd` (`MEMBER_ID` ASC),
  INDEX `evaluation_64e70c2e` (`SHOP_ID` ASC),
  CONSTRAINT `evaluation_MEMBER_ID_1be03be9_fk_member_ID`
    FOREIGN KEY (`MEMBER_ID`)
    REFERENCES `shoppingmall`.`member` (`ID`),
  CONSTRAINT `evaluation_SHOP_ID_d9ab6905_fk_shop_ID`
    FOREIGN KEY (`SHOP_ID`)
    REFERENCES `shoppingmall`.`shop` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shoppingmall`.`favorit_shop`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingmall`.`favorit_shop` (
  `ID` VARCHAR(25) NOT NULL,
  `MEMBER_ID` VARCHAR(25) NOT NULL,
  `SHOP_ID` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `favorit_shop_SHOP_ID_543ef588_uniq` (`SHOP_ID` ASC, `MEMBER_ID` ASC),
  INDEX `favorit_shop_c7d5c7dd` (`MEMBER_ID` ASC),
  INDEX `favorit_shop_64e70c2e` (`SHOP_ID` ASC),
  CONSTRAINT `favorit_shop_MEMBER_ID_a3423abf_fk_member_ID`
    FOREIGN KEY (`MEMBER_ID`)
    REFERENCES `shoppingmall`.`member` (`ID`),
  CONSTRAINT `favorit_shop_SHOP_ID_28aabe61_fk_shop_ID`
    FOREIGN KEY (`SHOP_ID`)
    REFERENCES `shoppingmall`.`shop` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shoppingmall`.`groupon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingmall`.`groupon` (
  `ID` VARCHAR(25) NOT NULL,
  `TITLE` VARCHAR(100) NOT NULL,
  `PICTURE` VARCHAR(300) NULL DEFAULT NULL,
  `ORIGINAL_PRICE` DECIMAL(10,2) NOT NULL,
  `CURRENT_PRICE` DECIMAL(10,2) NOT NULL,
  `START_TIME` DATE NOT NULL,
  `END_TIME` DATE NOT NULL,
  `DETAILS` LONGTEXT NOT NULL,
  `CREATE_TIME` DATETIME NULL DEFAULT NULL,
  `SHOP_ID` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `groupon_64e70c2e` (`SHOP_ID` ASC),
  CONSTRAINT `groupon_SHOP_ID_262c6125_fk_shop_ID`
    FOREIGN KEY (`SHOP_ID`)
    REFERENCES `shoppingmall`.`shop` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shoppingmall`.`groupon_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingmall`.`groupon_order` (
  `ID` VARCHAR(25) NOT NULL,
  `CREATE_TIME` DATETIME NOT NULL,
  `AMOUNT` DECIMAL(10,2) NOT NULL,
  `SETTLEMENT_TIME` DATETIME NULL DEFAULT NULL,
  `ORDER_TYPE` VARCHAR(48) NULL DEFAULT NULL,
  `GROUPON_ID` VARCHAR(25) NOT NULL,
  `MEMBER_ID` VARCHAR(25) NOT NULL,
  `SHOP_ID` VARCHAR(25) NOT NULL,
  `STATUS_ID` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `groupon_order_GROUPON_ID_715673ed_fk_groupon_ID` (`GROUPON_ID` ASC),
  INDEX `groupon_order_c7d5c7dd` (`MEMBER_ID` ASC),
  INDEX `groupon_order_64e70c2e` (`SHOP_ID` ASC),
  INDEX `groupon_order_ab8daf50` (`STATUS_ID` ASC),
  CONSTRAINT `groupon_order_GROUPON_ID_715673ed_fk_groupon_ID`
    FOREIGN KEY (`GROUPON_ID`)
    REFERENCES `shoppingmall`.`groupon` (`ID`),
  CONSTRAINT `groupon_order_MEMBER_ID_843eb51e_fk_member_ID`
    FOREIGN KEY (`MEMBER_ID`)
    REFERENCES `shoppingmall`.`member` (`ID`),
  CONSTRAINT `groupon_order_SHOP_ID_b5c95ec9_fk_shop_ID`
    FOREIGN KEY (`SHOP_ID`)
    REFERENCES `shoppingmall`.`shop` (`ID`),
  CONSTRAINT `groupon_order_STATUS_ID_9863c718_fk_type_status_ID`
    FOREIGN KEY (`STATUS_ID`)
    REFERENCES `shoppingmall`.`type_status` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shoppingmall`.`integral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingmall`.`integral` (
  `ID` VARCHAR(25) NOT NULL,
  `BALANCE` INT(11) NOT NULL,
  `EXPIRED_DATE` DATETIME NULL DEFAULT NULL,
  `MEMBER_ID` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `integral_c7d5c7dd` (`MEMBER_ID` ASC),
  CONSTRAINT `integral_MEMBER_ID_e440b92e_fk_member_ID`
    FOREIGN KEY (`MEMBER_ID`)
    REFERENCES `shoppingmall`.`member` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shoppingmall`.`integraltransaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingmall`.`integraltransaction` (
  `ID` VARCHAR(25) NOT NULL,
  `AMOUNT` INT(11) NOT NULL,
  `TRX_DATETIME` DATETIME NOT NULL,
  `MEMBER_ID` VARCHAR(25) NOT NULL,
  `SHOP_ID` VARCHAR(25) NOT NULL,
  `STATUS_ID` VARCHAR(25) NOT NULL,
  `trx_type_id` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `integraltransaction_c7d5c7dd` (`MEMBER_ID` ASC),
  INDEX `integraltransaction_64e70c2e` (`SHOP_ID` ASC),
  INDEX `integraltransaction_ab8daf50` (`STATUS_ID` ASC),
  INDEX `integraltransaction_27c004d2` (`trx_type_id` ASC),
  CONSTRAINT `integraltransaction_MEMBER_ID_ab98b095_fk_member_ID`
    FOREIGN KEY (`MEMBER_ID`)
    REFERENCES `shoppingmall`.`member` (`ID`),
  CONSTRAINT `integraltransaction_SHOP_ID_8876204c_fk_shop_ID`
    FOREIGN KEY (`SHOP_ID`)
    REFERENCES `shoppingmall`.`shop` (`ID`),
  CONSTRAINT `integraltransaction_STATUS_ID_be27985f_fk_type_status_ID`
    FOREIGN KEY (`STATUS_ID`)
    REFERENCES `shoppingmall`.`type_status` (`ID`),
  CONSTRAINT `integraltransaction_trx_type_id_9f5b07c2_fk_type_status_ID`
    FOREIGN KEY (`trx_type_id`)
    REFERENCES `shoppingmall`.`type_status` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shoppingmall`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingmall`.`product` (
  `ID` VARCHAR(25) NOT NULL,
  `PRODUCT_NAME` VARCHAR(80) NOT NULL,
  `PICTURE` VARCHAR(300) NULL DEFAULT NULL,
  `UNIT_PRICE` DECIMAL(10,0) NULL DEFAULT NULL,
  `TOP_CARRIAGE_TIME` DATETIME NULL DEFAULT NULL,
  `SHOP_ID` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `product_ID_2e6bfc99_uniq` (`ID` ASC, `PRODUCT_NAME` ASC),
  INDEX `product_64e70c2e` (`SHOP_ID` ASC),
  CONSTRAINT `product_SHOP_ID_29b491c5_fk_shop_ID`
    FOREIGN KEY (`SHOP_ID`)
    REFERENCES `shoppingmall`.`shop` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shoppingmall`.`integraltransaction_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingmall`.`integraltransaction_product` (
  `ID` VARCHAR(25) NOT NULL,
  `QUANTITY` INT(11) NULL DEFAULT NULL,
  `IntegralTransaction_productcol` VARCHAR(45) NOT NULL,
  `PRODUCT_ID` VARCHAR(25) NOT NULL,
  `TRANSACTION_ID` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `integraltransaction_product_PRODUCT_ID_7e50e8f6_uniq` (`PRODUCT_ID` ASC, `TRANSACTION_ID` ASC),
  INDEX `integraltransaction_product_137e1bc1` (`PRODUCT_ID` ASC),
  INDEX `integraltransaction_product_00efaa4e` (`TRANSACTION_ID` ASC),
  CONSTRAINT `integraltransa_TRANSACTION_ID_cef20b8b_fk_integraltransaction_ID`
    FOREIGN KEY (`TRANSACTION_ID`)
    REFERENCES `shoppingmall`.`integraltransaction` (`ID`),
  CONSTRAINT `integraltransaction_product_PRODUCT_ID_a2d0643c_fk_product_ID`
    FOREIGN KEY (`PRODUCT_ID`)
    REFERENCES `shoppingmall`.`product` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shoppingmall`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingmall`.`order` (
  `ID` VARCHAR(25) NOT NULL,
  `ORDER_DATETIME` DATETIME NULL DEFAULT NULL,
  `AMOUNT` DECIMAL(10,0) NULL DEFAULT NULL,
  `IS_USED_DISCOUNT` INT(11) NULL DEFAULT NULL,
  `DISCOUNT_ID` VARCHAR(25) NOT NULL,
  `MEMBER_ID` VARCHAR(25) NOT NULL,
  `ORDER_TYPE_ID` VARCHAR(25) NOT NULL,
  `STATUS_ID` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `order_DISCOUNT_ID_1520b01c_fk_discount_ID` (`DISCOUNT_ID` ASC),
  INDEX `order_MEMBER_ID_d6cc598f_fk_member_ID` (`MEMBER_ID` ASC),
  INDEX `order_4a1685ea` (`ORDER_TYPE_ID` ASC),
  INDEX `order_ab8daf50` (`STATUS_ID` ASC),
  CONSTRAINT `order_DISCOUNT_ID_1520b01c_fk_discount_ID`
    FOREIGN KEY (`DISCOUNT_ID`)
    REFERENCES `shoppingmall`.`discount` (`ID`),
  CONSTRAINT `order_MEMBER_ID_d6cc598f_fk_member_ID`
    FOREIGN KEY (`MEMBER_ID`)
    REFERENCES `shoppingmall`.`member` (`ID`),
  CONSTRAINT `order_ORDER_TYPE_ID_cc5e5d73_fk_type_status_ID`
    FOREIGN KEY (`ORDER_TYPE_ID`)
    REFERENCES `shoppingmall`.`type_status` (`ID`),
  CONSTRAINT `order_STATUS_ID_b6a6656a_fk_type_status_ID`
    FOREIGN KEY (`STATUS_ID`)
    REFERENCES `shoppingmall`.`type_status` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shoppingmall`.`order_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingmall`.`order_product` (
  `ID` VARCHAR(25) NOT NULL,
  `QUANTITY` INT(11) NULL DEFAULT NULL,
  `ORDER_ID` VARCHAR(25) NOT NULL,
  `PRODUCT_ID` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `order_product_PRODUCT_ID_1f99f592_uniq` (`PRODUCT_ID` ASC, `ORDER_ID` ASC),
  INDEX `order_product_ORDER_ID_834e6371_fk_order_ID` (`ORDER_ID` ASC),
  INDEX `order_product_137e1bc1` (`PRODUCT_ID` ASC),
  CONSTRAINT `order_product_ORDER_ID_834e6371_fk_order_ID`
    FOREIGN KEY (`ORDER_ID`)
    REFERENCES `shoppingmall`.`order` (`ID`),
  CONSTRAINT `order_product_PRODUCT_ID_82f87258_fk_product_ID`
    FOREIGN KEY (`PRODUCT_ID`)
    REFERENCES `shoppingmall`.`product` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
