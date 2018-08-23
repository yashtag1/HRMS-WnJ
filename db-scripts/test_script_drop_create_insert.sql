SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `test` ;
CREATE SCHEMA IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 ;
USE `test` ;

-- -----------------------------------------------------
-- Table `test`.`country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`country` ;

CREATE  TABLE IF NOT EXISTS `test`.`country` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(25) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`state` ;

CREATE  TABLE IF NOT EXISTS `test`.`state` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(25) NOT NULL ,
  `country_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_state_country_idx` (`country_id` ASC) ,
  CONSTRAINT `fk_state_country`
    FOREIGN KEY (`country_id` )
    REFERENCES `test`.`country` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`address` ;

CREATE  TABLE IF NOT EXISTS `test`.`address` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `line1` VARCHAR(45) NOT NULL ,
  `line2` VARCHAR(45) NULL ,
  `city` VARCHAR(45) NOT NULL ,
  `pincode` VARCHAR(10) NULL ,
  `state_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_address_state_idx` (`state_id` ASC) ,
  CONSTRAINT `fk_address_state`
    FOREIGN KEY (`state_id` )
    REFERENCES `test`.`state` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = latin1
COMMENT = ' /* comment truncated */ /*Address Details*/';


-- -----------------------------------------------------
-- Table `test`.`gender`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`gender` ;

CREATE  TABLE IF NOT EXISTS `test`.`gender` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`user_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`user_role` ;

CREATE  TABLE IF NOT EXISTS `test`.`user_role` (
  `id` INT(10) UNSIGNED NOT NULL ,
  `authority` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`user` ;

CREATE  TABLE IF NOT EXISTS `test`.`user` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(30) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `enabled` TINYINT(1) NOT NULL ,
  `role_id` INT(10) UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `user_name_UNIQUE` (`name` ASC) ,
  INDEX `fk_user_user_role_idx` (`role_id` ASC) ,
  CONSTRAINT `fk_user_user_role`
    FOREIGN KEY (`role_id` )
    REFERENCES `test`.`user_role` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`employee` ;

CREATE  TABLE IF NOT EXISTS `test`.`employee` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(35) NOT NULL ,
  `last_name` VARCHAR(35) NULL DEFAULT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `dob` DATE NOT NULL ,
  `phone` VARCHAR(45) NULL DEFAULT NULL ,
  `mobile` VARCHAR(15) NOT NULL ,
  `alt_contact` VARCHAR(45) NOT NULL ,
  `gender_id` INT(11) NOT NULL ,
  `temp_address_id` INT(11) NULL ,
  `permanent_address_id` INT(11) NULL ,
  `tempSamePermtAddr` TINYINT(1) NULL ,
  `user_id` INT(10) UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_employee_gender_idx` (`gender_id` ASC) ,
  INDEX `fk_employee_address1_idx` (`temp_address_id` ASC) ,
  INDEX `fk_employee_address2_idx` (`permanent_address_id` ASC) ,
  INDEX `fk_employee_user1_idx` (`user_id` ASC) ,
  CONSTRAINT `fk_employee_gender`
    FOREIGN KEY (`gender_id` )
    REFERENCES `test`.`gender` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_address1`
    FOREIGN KEY (`temp_address_id` )
    REFERENCES `test`.`address` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_address2`
    FOREIGN KEY (`permanent_address_id` )
    REFERENCES `test`.`address` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_user`
    FOREIGN KEY (`user_id` )
    REFERENCES `test`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`benefit_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`benefit_type` ;

CREATE  TABLE IF NOT EXISTS `test`.`benefit_type` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`benefit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`benefit` ;

CREATE  TABLE IF NOT EXISTS `test`.`benefit` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `employee_id` INT(11) NOT NULL ,
  `benefit_type_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_benefit_employee1_idx` (`employee_id` ASC) ,
  INDEX `fk_benefit_benefit_type1_idx` (`benefit_type_id` ASC) ,
  CONSTRAINT `fk_benefit_employee1`
    FOREIGN KEY (`employee_id` )
    REFERENCES `test`.`employee` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_benefit_benefit_type1`
    FOREIGN KEY (`benefit_type_id` )
    REFERENCES `test`.`benefit_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`department` ;

CREATE  TABLE IF NOT EXISTS `test`.`department` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1
COMMENT = ' /* comment truncated */ /*Department Details*/';


-- -----------------------------------------------------
-- Table `test`.`education`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`education` ;

CREATE  TABLE IF NOT EXISTS `test`.`education` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `school` VARCHAR(45) NOT NULL ,
  `degree` VARCHAR(10) NULL DEFAULT NULL ,
  `start_year` VARCHAR(4) NOT NULL ,
  `end_year` VARCHAR(4) NOT NULL ,
  `latest` TINYINT(1) NOT NULL ,
  `employee_id` INT(11) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_education_employee1_idx` (`employee_id` ASC) ,
  CONSTRAINT `fk_education_employee1`
    FOREIGN KEY (`employee_id` )
    REFERENCES `test`.`employee` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`employment_mode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`employment_mode` ;

CREATE  TABLE IF NOT EXISTS `test`.`employment_mode` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1
COMMENT = ' /* comment truncated */ /*Employment_Mode*/';


-- -----------------------------------------------------
-- Table `test`.`employment_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`employment_status` ;

CREATE  TABLE IF NOT EXISTS `test`.`employment_status` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`floor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`floor` ;

CREATE  TABLE IF NOT EXISTS `test`.`floor` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `address_id` INT(11) NULL ,
  INDEX `fk_floor_address1_idx` (`address_id` ASC) ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_floor_address1`
    FOREIGN KEY (`address_id` )
    REFERENCES `test`.`address` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`cabin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`cabin` ;

CREATE  TABLE IF NOT EXISTS `test`.`cabin` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `floor_id` INT(11) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_cabin_floor1_idx` (`floor_id` ASC) ,
  CONSTRAINT `fk_cabin_floor1`
    FOREIGN KEY (`floor_id` )
    REFERENCES `test`.`floor` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`company_branch`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`company_branch` ;

CREATE  TABLE IF NOT EXISTS `test`.`company_branch` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `url` VARCHAR(45) NULL ,
  `phone` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `address_id` INT(11) NULL ,
  `admin_employee_id` INT(11) NULL ,
  `md_employee_id` INT(11) NULL ,
  INDEX `fk_company_branch_address1_idx` (`address_id` ASC) ,
  INDEX `fk_company_branch_employee1_idx` (`admin_employee_id` ASC) ,
  INDEX `fk_company_branch_employee2_idx` (`md_employee_id` ASC) ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_company_branch_address1`
    FOREIGN KEY (`address_id` )
    REFERENCES `test`.`address` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_company_branch_employee1`
    FOREIGN KEY (`admin_employee_id` )
    REFERENCES `test`.`employee` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_company_branch_employee2`
    FOREIGN KEY (`md_employee_id` )
    REFERENCES `test`.`employee` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`location` ;

CREATE  TABLE IF NOT EXISTS `test`.`location` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `cabin_id` INT(11) NULL ,
  `company_branch_id` INT(11) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_location_cabin1_idx` (`cabin_id` ASC) ,
  INDEX `fk_location_company_branch1_idx` (`company_branch_id` ASC) ,
  CONSTRAINT `fk_location_cabin1`
    FOREIGN KEY (`cabin_id` )
    REFERENCES `test`.`cabin` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_location_company_branch1`
    FOREIGN KEY (`company_branch_id` )
    REFERENCES `test`.`company_branch` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`job_designation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`job_designation` ;

CREATE  TABLE IF NOT EXISTS `test`.`job_designation` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`employment_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`employment_detail` ;

CREATE  TABLE IF NOT EXISTS `test`.`employment_detail` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `start_date` DATE NOT NULL ,
  `end_date` DATE NULL DEFAULT NULL ,
  `current` TINYINT(1) NOT NULL ,
  `status_id` INT(11) NOT NULL ,
  `department_id` INT(11) NOT NULL ,
  `mode_id` INT(11) NOT NULL ,
  `employee_id` INT(11) NULL ,
  `location_id` INT(11) NULL ,
  `company_name` VARCHAR(45) NULL ,
  `job_designation_id` INT(11) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_employment_detail_employment_status_idx` (`status_id` ASC) ,
  INDEX `fk_employment_detail_department_idx` (`department_id` ASC) ,
  INDEX `fk_employment_detail_employment_mode_idx` (`mode_id` ASC) ,
  INDEX `fk_employment_detail_employee_idx` (`employee_id` ASC) ,
  INDEX `fk_employment_detail_location_idx` (`location_id` ASC) ,
  INDEX `fk_employment_detail_job_designation1_idx` (`job_designation_id` ASC) ,
  CONSTRAINT `fk_employment_detail_department`
    FOREIGN KEY (`department_id` )
    REFERENCES `test`.`department` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employment_detail_employee`
    FOREIGN KEY (`employee_id` )
    REFERENCES `test`.`employee` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employment_detail_employment_mode`
    FOREIGN KEY (`mode_id` )
    REFERENCES `test`.`employment_mode` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employment_detail_employment_status`
    FOREIGN KEY (`status_id` )
    REFERENCES `test`.`employment_status` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employment_detail_location`
    FOREIGN KEY (`location_id` )
    REFERENCES `test`.`location` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employment_detail_job_designation1`
    FOREIGN KEY (`job_designation_id` )
    REFERENCES `test`.`job_designation` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1
COMMENT = ' /* comment truncated */ /*Employment_Details*/';


-- -----------------------------------------------------
-- Table `test`.`events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`events` ;

CREATE  TABLE IF NOT EXISTS `test`.`events` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`project` ;

CREATE  TABLE IF NOT EXISTS `test`.`project` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`request_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`request_type` ;

CREATE  TABLE IF NOT EXISTS `test`.`request_type` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`request`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`request` ;

CREATE  TABLE IF NOT EXISTS `test`.`request` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `employee_id` INT(11) NOT NULL ,
  `request_type_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_request_employee1_idx` (`employee_id` ASC) ,
  INDEX `fk_request_request_type1_idx` (`request_type_id` ASC) ,
  CONSTRAINT `fk_request_employee1`
    FOREIGN KEY (`employee_id` )
    REFERENCES `test`.`employee` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_request_request_type1`
    FOREIGN KEY (`request_type_id` )
    REFERENCES `test`.`request_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`team`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`team` ;

CREATE  TABLE IF NOT EXISTS `test`.`team` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `department_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_team_department_idx` (`department_id` ASC) ,
  CONSTRAINT `fk_team_department`
    FOREIGN KEY (`department_id` )
    REFERENCES `test`.`department` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;

USE `test` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `test`.`country`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`country` (`id`, `name`) VALUES (1, 'India');
INSERT INTO `test`.`country` (`id`, `name`) VALUES (2, 'USA');

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`state`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`state` (`id`, `name`, `country_id`) VALUES (1, 'Tamil Nadu', 1);
INSERT INTO `test`.`state` (`id`, `name`, `country_id`) VALUES (2, 'Kerala', 1);
INSERT INTO `test`.`state` (`id`, `name`, `country_id`) VALUES (3, 'Karnataka', 1);
INSERT INTO `test`.`state` (`id`, `name`, `country_id`) VALUES (4, 'CA', 2);

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`address`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`address` (`id`, `line1`, `line2`, `city`, `pincode`, `state_id`) VALUES (1, '2400 Camino Ramon Suite 176', '', 'San Ramon', '', 4);
INSERT INTO `test`.`address` (`id`, `line1`, `line2`, `city`, `pincode`, `state_id`) VALUES (2, 'Ramakrishna Nagar', 'New Siddhapudhur', 'Coimbatore', '641 044', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`gender`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`gender` (`id`, `name`) VALUES (1, 'Male');
INSERT INTO `test`.`gender` (`id`, `name`) VALUES (2, 'Female');

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`user_role`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`user_role` (`id`, `authority`) VALUES (1, 'ROLE_ADMIN');
INSERT INTO `test`.`user_role` (`id`, `authority`) VALUES (2, 'ROLE_USER');

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`user` (`id`, `name`, `password`, `enabled`, `role_id`) VALUES (1, 'admin', 'admin', true, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`employee` (`id`, `first_name`, `last_name`, `email`, `dob`, `phone`, `mobile`, `alt_contact`, `gender_id`, `temp_address_id`, `permanent_address_id`, `tempSamePermtAddr`, `user_id`) VALUES (1, 'Kowsalya', 'T', 'xx@yy.in', '1990-02-07', '04268254827', '9500235958', '9787271358', 2, 1, 1, true, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`benefit_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`benefit_type` (`id`, `name`) VALUES (1, 'Mobile');

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`benefit`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`benefit` (`id`, `name`, `employee_id`, `benefit_type_id`) VALUES (1, 'Mobile', 1, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`department`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`department` (`id`, `name`) VALUES (1, 'Engineering');
INSERT INTO `test`.`department` (`id`, `name`) VALUES (2, 'Administration');
INSERT INTO `test`.`department` (`id`, `name`) VALUES (3, 'Testing');
INSERT INTO `test`.`department` (`id`, `name`) VALUES (4, 'Managment');

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`education`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`education` (`id`, `school`, `degree`, `start_year`, `end_year`, `latest`, `employee_id`) VALUES (1, 'ADU', 'BE', '2007', '2011', true, 1);
INSERT INTO `test`.`education` (`id`, `school`, `degree`, `start_year`, `end_year`, `latest`, `employee_id`) VALUES (2, 'VMHS', 'HSC', '2005', '2007', false, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`employment_mode`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`employment_mode` (`id`, `name`) VALUES (1, 'Permanent');

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`employment_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`employment_status` (`id`, `name`) VALUES (1, 'Active');

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`floor`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`floor` (`id`, `name`, `address_id`) VALUES (1, '3', 2);
INSERT INTO `test`.`floor` (`id`, `name`, `address_id`) VALUES (2, '4', 2);

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`cabin`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`cabin` (`id`, `name`, `floor_id`) VALUES (1, '28', 1);
INSERT INTO `test`.`cabin` (`id`, `name`, `floor_id`) VALUES (2, '27', 2);
INSERT INTO `test`.`cabin` (`id`, `name`, `floor_id`) VALUES (3, '25', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`company_branch`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`company_branch` (`id`, `name`, `url`, `phone`, `email`, `address_id`, `admin_employee_id`, `md_employee_id`) VALUES (1, 'Coimbatore', 'http://www.aximsoft.com', '91 422 2240620', 'info@aximsoft.com', 2, 1, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`location`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`location` (`id`, `cabin_id`, `company_branch_id`) VALUES (1, 1, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`job_designation`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`job_designation` (`id`, `name`) VALUES (1, 'Managing Director');
INSERT INTO `test`.`job_designation` (`id`, `name`) VALUES (2, 'Office Administrator');
INSERT INTO `test`.`job_designation` (`id`, `name`) VALUES (3, 'System Administrator');
INSERT INTO `test`.`job_designation` (`id`, `name`) VALUES (4, 'Java Architect');
INSERT INTO `test`.`job_designation` (`id`, `name`) VALUES (5, 'Software Engineer');
INSERT INTO `test`.`job_designation` (`id`, `name`) VALUES (6, 'Jr Software Engineer');
INSERT INTO `test`.`job_designation` (`id`, `name`) VALUES (7, 'Trainee');

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`employment_detail`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`employment_detail` (`id`, `start_date`, `end_date`, `current`, `status_id`, `department_id`, `mode_id`, `employee_id`, `location_id`, `company_name`, `job_designation_id`) VALUES (1, '2011-10-18', NULL, true, 1, 1, 1, 1, 1, 'Aximsoft', 6);

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`request_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`request_type` (`id`, `name`) VALUES (1, 'Bonafide');

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`request`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`request` (`id`, `name`, `employee_id`, `request_type_id`) VALUES (1, 'Bonafide', 1, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`team`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`team` (`id`, `name`, `department_id`) VALUES (1, 'Java', 1);
INSERT INTO `test`.`team` (`id`, `name`, `department_id`) VALUES (2, '.Net', 1);

COMMIT;
