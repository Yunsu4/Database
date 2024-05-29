



-- -----------------------------------------------------
-- Table 'medical_specialty'
-- -----------------------------------------------------
INSERT INTO medical_specialty VALUES(301, 'cardiothoracic surgery', '000-0000');
INSERT INTO medical_specialty VALUES(302, 'mental clinic', '000-0001');
INSERT INTO medical_specialty VALUES(303, 'surgery', '000-0002');
INSERT INTO medical_specialty VALUES(304, 'internal medicine', '000-0003');
INSERT INTO medical_specialty VALUES(305, 'orthopedics', '000-0004');



-- -----------------------------------------------------
-- Table 'doctor'
-- -----------------------------------------------------
INSERT INTO doctor VALUES(301001, 'KIM', '1001-001', '100-0001', '3001001a');
INSERT INTO doctor VALUES(302001, 'YUN', '1001-002', '100-0002', '3002001a');
INSERT INTO doctor VALUES(303001, 'LEE', '1001-003', '100-0003', '3003001a');
INSERT INTO doctor VALUES(304001, 'PARK', '1001-004', '100-0004', '3004001a');
INSERT INTO doctor VALUES(305001, 'SIN', '1001-005', '100-0005', '3005001a');
INSERT INTO doctor VALUES(301002, 'KIG', '1002-001', '200-0001', '3001002a');
INSERT INTO doctor VALUES(302002, 'YUM', '1002-002', '200-0002', '3002002a');
INSERT INTO doctor VALUES(303002, 'KEE', '1002-003', '200-0003', '3003002a');
INSERT INTO doctor VALUES(304002, 'PAB', '1002-004', '200-0004', '3004002a');
INSERT INTO doctor VALUES(305002, 'SHA', '1002-005', '200-0005', '3005002a');



-- -----------------------------------------------------
-- Table 'nurse'
-- -----------------------------------------------------
INSERT INTO nurse VALUES(301003, 'LINA', '1003-001', '300-0001', '3001003a');
INSERT INTO nurse VALUES(302003, 'JUNA', '1003-002', '300-0002', '3002003a');
INSERT INTO nurse VALUES(303003, 'KINDA', '1003-003', '300-0003', '3003003a');
INSERT INTO nurse VALUES(304003, 'MIN', '1003-004', '300-0004', '3004003a');
INSERT INTO nurse VALUES(305003, 'COP', '1003-005', '300-0005', '3005003a');



-- -----------------------------------------------------
-- Table 'patient'
-- -----------------------------------------------------
INSERT INTO patient VALUES(1221001, 'KIM', '020426', 'F','1004-001', 'A', '160', '48', '400-0005', '1221001a',301001);
INSERT INTO patient VALUES(1221002, 'HINA', '020427', 'F','1004-002', 'AB', '168', '51', '400-0001', '1221002a',302001);
INSERT INTO patient VALUES(1221003, 'KUDO', '020428', 'M','1004-003', 'O', '188', '80', '400-0002', '1221003a',303001);
INSERT INTO patient VALUES(1221004, 'KUMA', '020429', 'M','1004-004', 'B', '173', '60', '400-0003', '1221004a',304001);
INSERT INTO patient VALUES(1221005, 'HURUKU', '020430', 'M','1004-005', 'A', '169', '53', '400-0004', '1221005a',305001);



-- -----------------------------------------------------
-- Table 'examination'
-- -----------------------------------------------------
INSERT INTO examination VALUES(100, '12/14-17:35', 'basic');
INSERT INTO examination VALUES(101, '12/14-17:40', 'basic');
INSERT INTO examination VALUES(102, '12/15-10:40', 'basic');
INSERT INTO examination VALUES(103, '12/15-20:10', 'brain MRI');
INSERT INTO examination VALUES(104, '12/16-08:40', 'basic');
INSERT INTO examination VALUES(105, '12/17-17:20', 'leg MRI');



-- -----------------------------------------------------
-- Table 'inpatient'
-- -----------------------------------------------------
INSERT INTO inpatient VALUES(201, 'H001', '12/14', '12/15-20:50', 1221001); 
INSERT INTO inpatient VALUES(202, 'H001', '12/14', '12/15-17:50', 1221002); 
INSERT INTO inpatient VALUES(203, 'H002', '12/14', '12/16-20:50', 1221003); 
INSERT INTO inpatient VALUES(204, 'H003', '12/14', '12/19-21:50', 1221004); 
INSERT INTO inpatient VALUES(205, 'H004', '12/14', '12/20-10:50', 1221005);



-- -----------------------------------------------------
-- Table 'reservation'
-- -----------------------------------------------------
INSERT INTO reservation VALUES(400, '12/14-17:30', 1221001, 304); 
INSERT INTO reservation VALUES(401, '12/14-17:30', 1221002, 304); 
INSERT INTO reservation VALUES(402, '12/15-10:30', 1221003, 304); 
INSERT INTO reservation VALUES(403, '12/15-20:00', 1221004, 302); 
INSERT INTO reservation VALUES(404, '12/16-08:30', 1221005, 304); 



-- -----------------------------------------------------
-- Table 'treatment'
-- -----------------------------------------------------
INSERT INTO treatment VALUES(500, '12/14-18:00', 'examination result description'); 
INSERT INTO treatment VALUES(501, '12/14-18:00', 'examination result description'); 
INSERT INTO treatment VALUES(502, '12/15-11:00', 'examination result description'); 
INSERT INTO treatment VALUES(503, '12/15-20:30', 'MRI result explain and surgery description'); 
INSERT INTO treatment VALUES(504, '12/16-09:00', 'examination result description'); 



-- -----------------------------------------------------
-- Table 'patient_has_treatment'
-- -----------------------------------------------------
INSERT INTO patient_has_treatment VALUES(1221001, 500);
INSERT INTO patient_has_treatment VALUES(1221002, 501);
INSERT INTO patient_has_treatment VALUES(1221003, 502);
INSERT INTO patient_has_treatment VALUES(1221004, 503);
INSERT INTO patient_has_treatment VALUES(1221005, 504);



-- -----------------------------------------------------
-- Table 'nurse_has_treatment'
-- -----------------------------------------------------
INSERT INTO nurse_has_treatment VALUES(301003, 500);
INSERT INTO nurse_has_treatment VALUES(301003, 501);
INSERT INTO nurse_has_treatment VALUES(301003, 502);
INSERT INTO nurse_has_treatment VALUES(302003, 503);
INSERT INTO nurse_has_treatment VALUES(301003, 504);



-- -----------------------------------------------------
-- Table 'patient_has_examination'
-- -----------------------------------------------------
INSERT INTO patient_has_examination VALUES(1221001, 100);
INSERT INTO patient_has_examination VALUES(1221002, 101);
INSERT INTO patient_has_examination VALUES(1221003, 102);
INSERT INTO patient_has_examination VALUES(1221004, 103);
INSERT INTO patient_has_examination VALUES(1221005, 104);



-- -----------------------------------------------------
-- Table 'doctor_has_examination'
-- -----------------------------------------------------
INSERT INTO doctor_has_examination VALUES(301001, 100);
INSERT INTO doctor_has_examination VALUES(301001, 101);
INSERT INTO doctor_has_examination VALUES(301002, 102);
INSERT INTO doctor_has_examination VALUES(302001, 103);
INSERT INTO doctor_has_examination VALUES(301002, 104);



-- -----------------------------------------------------
-- Table 'nurse_has_patient'
-- -----------------------------------------------------
INSERT INTO nurse_has_patient VALUES(301003, 1221001);
INSERT INTO nurse_has_patient VALUES(301003, 1221002);
INSERT INTO nurse_has_patient VALUES(301003, 1221003);
INSERT INTO nurse_has_patient VALUES(302003, 1221004);
INSERT INTO nurse_has_patient VALUES(301003, 1221005);



-- -----------------------------------------------------
-- Table 'nurse_has_medical_specialty'
-- -----------------------------------------------------
INSERT INTO nurse_has_medical_specialty VALUES(301003, 301);
INSERT INTO nurse_has_medical_specialty VALUES(302003, 302);
INSERT INTO nurse_has_medical_specialty VALUES(303003, 303);
INSERT INTO nurse_has_medical_specialty VALUES(304003, 304);
INSERT INTO nurse_has_medical_specialty VALUES(305003, 305);



-- -----------------------------------------------------
-- Table 'doctor_has_medical_specialty'
-- -----------------------------------------------------
INSERT INTO doctor_has_medical_specialty VALUES(301001, 301);
INSERT INTO doctor_has_medical_specialty VALUES(301002, 301);
INSERT INTO doctor_has_medical_specialty VALUES(302001, 302);
INSERT INTO doctor_has_medical_specialty VALUES(302002, 302);
INSERT INTO doctor_has_medical_specialty VALUES(303001, 303);
INSERT INTO doctor_has_medical_specialty VALUES(303002, 303);
INSERT INTO doctor_has_medical_specialty VALUES(304001, 304);
INSERT INTO doctor_has_medical_specialty VALUES(304002, 304);
INSERT INTO doctor_has_medical_specialty VALUES(305001, 305);
INSERT INTO doctor_has_medical_specialty VALUES(305002, 305);



-- -----------------------------------------------------
-- Table 'manager'
-- -----------------------------------------------------
INSERT INTO manager VALUES(1,'manager','1');