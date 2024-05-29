use term_project;

CREATE INDEX name_index ON patient(name) USING BTREE;
CREATE INDEX ssn_index ON patient(ssn) USING BTREE;
CREATE INDEX gender_index ON patient(gender) USING BTREE;
CREATE INDEX blood_type_index ON patient(blood_type) USING BTREE;
CREATE INDEX phone_number_index ON patient(phone_number) USING BTREE;


