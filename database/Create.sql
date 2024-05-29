-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Schema term_project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema term_project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `term_project` DEFAULT CHARACTER SET utf8 ;
USE `term_project` ;

-- -----------------------------------------------------
-- Table `term_project`.`doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `term_project`.`doctor` (
  `doctor_id` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `phone_number` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`doctor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `term_project`.`examination`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `term_project`.`examination` (
  `examination_id` INT NOT NULL,
  `examinaton_date_time` VARCHAR(45) NULL DEFAULT NULL,
  `examination_details` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`examination_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `term_project`.`doctor_has_examination`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `term_project`.`doctor_has_examination` (
  `DOCTOR_doctor_id` INT NOT NULL,
  `EXAMINATION_examination_id` INT NOT NULL,
  PRIMARY KEY (`DOCTOR_doctor_id`, `EXAMINATION_examination_id`),
  INDEX `fk_DOCTOR_has_EXAMINATION_EXAMINATION1_idx` (`EXAMINATION_examination_id` ASC) VISIBLE,
  INDEX `fk_DOCTOR_has_EXAMINATION_DOCTOR1_idx` (`DOCTOR_doctor_id` ASC) VISIBLE,
  CONSTRAINT `fk_DOCTOR_has_EXAMINATION_DOCTOR1`
    FOREIGN KEY (`DOCTOR_doctor_id`)
    REFERENCES `term_project`.`doctor` (`doctor_id`),
  CONSTRAINT `fk_DOCTOR_has_EXAMINATION_EXAMINATION1`
    FOREIGN KEY (`EXAMINATION_examination_id`)
    REFERENCES `term_project`.`examination` (`examination_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `term_project`.`medical_specialty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `term_project`.`medical_specialty` (
  `department_id` INT NOT NULL,
  `department_name` VARCHAR(45) NULL DEFAULT NULL,
  `phone_number` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`department_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `term_project`.`doctor_has_medical_specialty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `term_project`.`doctor_has_medical_specialty` (
  `doctor_doctor_id` INT NOT NULL,
  `medical_specialty_department_id` INT NOT NULL,
  PRIMARY KEY (`doctor_doctor_id`, `medical_specialty_department_id`),
  INDEX `fk_doctor_has_medical_specialty_medical_specialty1_idx` (`medical_specialty_department_id` ASC) VISIBLE,
  INDEX `fk_doctor_has_medical_specialty_doctor1_idx` (`doctor_doctor_id` ASC) VISIBLE,
  CONSTRAINT `fk_doctor_has_medical_specialty_doctor1`
    FOREIGN KEY (`doctor_doctor_id`)
    REFERENCES `term_project`.`doctor` (`doctor_id`),
  CONSTRAINT `fk_doctor_has_medical_specialty_medical_specialty1`
    FOREIGN KEY (`medical_specialty_department_id`)
    REFERENCES `term_project`.`medical_specialty` (`department_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `term_project`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `term_project`.`patient` (
  `patient_id` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `ssn` VARCHAR(45) NULL DEFAULT NULL,
  `gender` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `blood_type` VARCHAR(45) NULL DEFAULT NULL,
  `height` VARCHAR(45) NULL DEFAULT NULL,
  `weight` VARCHAR(45) NULL DEFAULT NULL,
  `phone_number` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `DOCTOR_doctor_id` INT NOT NULL,
  PRIMARY KEY (`patient_id`),
  INDEX `fk_PATIENT_DOCTOR1_idx` (`DOCTOR_doctor_id` ASC) VISIBLE,
  CONSTRAINT `fk_PATIENT_DOCTOR1`
    FOREIGN KEY (`DOCTOR_doctor_id`)
    REFERENCES `term_project`.`doctor` (`doctor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `term_project`.`inpatient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `term_project`.`inpatient` (
  `inpatient_id` INT NOT NULL,
  `room_information` VARCHAR(45) NULL DEFAULT NULL,
  `admission_date` VARCHAR(45) NULL DEFAULT NULL,
  `discharge_date_time` VARCHAR(45) NULL DEFAULT NULL,
  `PATIENT_patient_id` INT NOT NULL,
  PRIMARY KEY (`inpatient_id`),
  INDEX `fk_INPATIENT_PATIENT1_idx` (`PATIENT_patient_id` ASC) VISIBLE,
  CONSTRAINT `fk_INPATIENT_PATIENT1`
    FOREIGN KEY (`PATIENT_patient_id`)
    REFERENCES `term_project`.`patient` (`patient_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `term_project`.`manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `term_project`.`manager` (
  `manager_id` INT NOT NULL,
  `manager_name` VARCHAR(45) NOT NULL,
  `manager_password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`manager_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `term_project`.`nurse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `term_project`.`nurse` (
  `nurse_id` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `phone_number` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`nurse_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `term_project`.`nurse_has_medical_specialty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `term_project`.`nurse_has_medical_specialty` (
  `nurse_nurse_id` INT NOT NULL,
  `medical_specialty_department_id` INT NOT NULL,
  PRIMARY KEY (`nurse_nurse_id`, `medical_specialty_department_id`),
  INDEX `fk_nurse_has_medical_specialty_medical_specialty1_idx` (`medical_specialty_department_id` ASC) VISIBLE,
  INDEX `fk_nurse_has_medical_specialty_nurse1_idx` (`nurse_nurse_id` ASC) VISIBLE,
  CONSTRAINT `fk_nurse_has_medical_specialty_medical_specialty1`
    FOREIGN KEY (`medical_specialty_department_id`)
    REFERENCES `term_project`.`medical_specialty` (`department_id`),
  CONSTRAINT `fk_nurse_has_medical_specialty_nurse1`
    FOREIGN KEY (`nurse_nurse_id`)
    REFERENCES `term_project`.`nurse` (`nurse_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `term_project`.`nurse_has_patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `term_project`.`nurse_has_patient` (
  `NURSE_nurse_id` INT NOT NULL,
  `PATIENT_patient_id` INT NOT NULL,
  PRIMARY KEY (`NURSE_nurse_id`, `PATIENT_patient_id`),
  INDEX `fk_NURSE_has_PATIENT_PATIENT1_idx` (`PATIENT_patient_id` ASC) VISIBLE,
  INDEX `fk_NURSE_has_PATIENT_NURSE1_idx` (`NURSE_nurse_id` ASC) VISIBLE,
  CONSTRAINT `fk_NURSE_has_PATIENT_NURSE1`
    FOREIGN KEY (`NURSE_nurse_id`)
    REFERENCES `term_project`.`nurse` (`nurse_id`),
  CONSTRAINT `fk_NURSE_has_PATIENT_PATIENT1`
    FOREIGN KEY (`PATIENT_patient_id`)
    REFERENCES `term_project`.`patient` (`patient_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `term_project`.`treatment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `term_project`.`treatment` (
  `treatment_id` INT NOT NULL,
  `treatment_date_time` VARCHAR(45) NULL DEFAULT NULL,
  `treatment_details` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`treatment_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `term_project`.`nurse_has_treatment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `term_project`.`nurse_has_treatment` (
  `NURSE_nurse_id` INT NOT NULL,
  `TREATMENT_treatment_id` INT NOT NULL,
  PRIMARY KEY (`NURSE_nurse_id`, `TREATMENT_treatment_id`),
  INDEX `fk_NURSE_has_TREATMENT_TREATMENT1_idx` (`TREATMENT_treatment_id` ASC) VISIBLE,
  INDEX `fk_NURSE_has_TREATMENT_NURSE1_idx` (`NURSE_nurse_id` ASC) VISIBLE,
  CONSTRAINT `fk_NURSE_has_TREATMENT_NURSE1`
    FOREIGN KEY (`NURSE_nurse_id`)
    REFERENCES `term_project`.`nurse` (`nurse_id`),
  CONSTRAINT `fk_NURSE_has_TREATMENT_TREATMENT1`
    FOREIGN KEY (`TREATMENT_treatment_id`)
    REFERENCES `term_project`.`treatment` (`treatment_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `term_project`.`patient_has_examination`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `term_project`.`patient_has_examination` (
  `PATIENT_patient_id` INT NOT NULL,
  `EXAMINATION_examination_id` INT NOT NULL,
  PRIMARY KEY (`PATIENT_patient_id`, `EXAMINATION_examination_id`),
  INDEX `fk_PATIENT_has_EXAMINATION_EXAMINATION1_idx` (`EXAMINATION_examination_id` ASC) VISIBLE,
  INDEX `fk_PATIENT_has_EXAMINATION_PATIENT1_idx` (`PATIENT_patient_id` ASC) VISIBLE,
  CONSTRAINT `fk_PATIENT_has_EXAMINATION_EXAMINATION1`
    FOREIGN KEY (`EXAMINATION_examination_id`)
    REFERENCES `term_project`.`examination` (`examination_id`),
  CONSTRAINT `fk_PATIENT_has_EXAMINATION_PATIENT1`
    FOREIGN KEY (`PATIENT_patient_id`)
    REFERENCES `term_project`.`patient` (`patient_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `term_project`.`patient_has_treatment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `term_project`.`patient_has_treatment` (
  `PATIENT_patient_id` INT NOT NULL,
  `TREATMENT_treatment_id` INT NOT NULL,
  PRIMARY KEY (`PATIENT_patient_id`, `TREATMENT_treatment_id`),
  INDEX `fk_PATIENT_has_TREATMENT_TREATMENT1_idx` (`TREATMENT_treatment_id` ASC) VISIBLE,
  INDEX `fk_PATIENT_has_TREATMENT_PATIENT1_idx` (`PATIENT_patient_id` ASC) VISIBLE,
  CONSTRAINT `fk_PATIENT_has_TREATMENT_PATIENT1`
    FOREIGN KEY (`PATIENT_patient_id`)
    REFERENCES `term_project`.`patient` (`patient_id`),
  CONSTRAINT `fk_PATIENT_has_TREATMENT_TREATMENT1`
    FOREIGN KEY (`TREATMENT_treatment_id`)
    REFERENCES `term_project`.`treatment` (`treatment_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `term_project`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `term_project`.`reservation` (
  `reservation_number` INT NOT NULL,
  `reservation_date_time` VARCHAR(45) NULL DEFAULT NULL,
  `PATIENT_patient_id` INT NOT NULL,
  `MEDICAL_SPECIALTY_department_id` INT NOT NULL,
  PRIMARY KEY (`reservation_number`),
  INDEX `fk_RESERVATION_PATIENT1_idx` (`PATIENT_patient_id` ASC) VISIBLE,
  INDEX `fk_RESERVATION_MEDICAL_SPECIALTY1_idx` (`MEDICAL_SPECIALTY_department_id` ASC) VISIBLE,
  CONSTRAINT `fk_RESERVATION_MEDICAL_SPECIALTY1`
    FOREIGN KEY (`MEDICAL_SPECIALTY_department_id`)
    REFERENCES `term_project`.`medical_specialty` (`department_id`),
  CONSTRAINT `fk_RESERVATION_PATIENT1`
    FOREIGN KEY (`PATIENT_patient_id`)
    REFERENCES `term_project`.`patient` (`patient_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

USE `term_project` ;

-- -----------------------------------------------------
-- Placeholder table for view `term_project`.`user_login_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `term_project`.`user_login_data` (`id` INT, `password` INT, `source_table` INT);

-- -----------------------------------------------------
-- View `term_project`.`user_login_data`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `term_project`.`user_login_data`;
USE `term_project`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `term_project`.`user_login_data` AS select `hospital`.`doctor`.`doctor_id` AS `id`,`hospital`.`doctor`.`password` AS `password`,'DOCTOR' AS `source_table` from `hospital`.`doctor` union select `hospital`.`patient`.`patient_id` AS `id`,`hospital`.`patient`.`password` AS `password`,'PATIENT' AS `source_table` from `hospital`.`patient` union select `hospital`.`nurse`.`nurse_id` AS `id`,`hospital`.`nurse`.`password` AS `password`,'NURSE' AS `source_table` from `hospital`.`nurse` union select `hospital`.`manager`.`manager_id` AS `id`,`hospital`.`manager`.`manager_password` AS `password`,'MANAGER' AS `source_table` from `hospital`.`manager`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



