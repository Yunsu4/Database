

-- -----------------------------------------------------
-- View 'user_login_data'
-- -----------------------------------------------------

CREATE VIEW `hospital`.`user_login_data` AS
SELECT `doctor_id` AS `id`, `password` AS `password`, 'DOCTOR' AS `source_table` FROM `hospital`.`DOCTOR`
UNION
SELECT `patient_id` AS `id`, `password` AS `password`, 'PATIENT' AS `source_table` FROM `hospital`.`PATIENT`
UNION
SELECT `nurse_id` AS `id`, `password` AS `password`, 'NURSE' AS `source_table` FROM `hospital`.`NURSE`
UNION
SELECT `manager_id` AS `id`, `manager_password` AS `password`, 'MANAGER' AS `source_table` FROM `hospital`.`MANAGER`;
