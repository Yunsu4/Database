import mysql from 'mysql2';

require("dotenv").config();

const pool = mysql.createPool({
    host: '127.0.0.1',
    port: 3306,
    user: 'root',
    password: '020428',
    database: 'term_project',
});

const promisePool = pool.promise();

export const selectSql = {
    getUser: async () => {
        const sql = `select * from user_login_data`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getPatient: async () => {
        const sql = `select * from patient order by patient_id ASC`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getDoctor: async () => {
        const sql = `select * from doctor order by doctor_id ASC`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getNurse: async () => {
        const sql = `select * from nurse order by nurse_id ASC`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getManager: async () => {
        const sql = `select * from manager order by manager_id ASC`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getExamination: async () => {
        const sql = `select * from examination order by examination_id ASC`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getTreatment: async () => {
        const sql = `select * from treatment order by treatment_id ASC`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getReservation: async () => {
      const sql = `select * from reservation order by reservation_id ASC`;
      const [result] = await promisePool.query(sql);
      return result;
  },
  getUserReservation: async (data) => {
    const sql = `select * from reservation where "${data}"=PATIENT_patient_id`;
    const [result] = await promisePool.query(sql);
    return result;
},

    
}


export const deleteSql = {
    deleteDoctor: async (data) => {
        console.log('delete doctor where doctor_id =', data);
        const sql = `delete from doctor where doctor_id=${data.doctor_id}`
        console.log(sql);
        await promisePool.query(sql);
    },
    deleteNurse: async (data) => {
        console.log('delete nurse where nurse_id =', data);
        const sql = `delete from nurse where nurse_id=${data.nurse_id}`
        console.log(sql);     
        await promisePool.query(sql);
    },
    deleteExamination: async (data) => {
        console.log('delete examination where examination_id =', data);
        const sql = `delete from examination where examination_id=${data.examination_id}`
        console.log(sql);     
        await promisePool.query(sql);
    },
    deleteTreatment: async (data) => {
        console.log('delete treatment where treatment_id =', data);
        const sql = `delete from treatment where treatment_id=${data.treatment_id}`
        console.log(sql);     
        await promisePool.query(sql);
    },
    deleteReservation: async (data) => {
      console.log('delete reservation where reservation_number =', data);
      const sql = `delete from reservation where reservation_number=${data.reservation_number}`
      console.log(sql);     
      await promisePool.query(sql);
  },
    
};







// add query
export const createSql = {
    addDoctor: async (data) => { 
        const results = await promisePool.query (
          `insert into doctor values (${data.new_doctor_id}, "${data.new_name}", "${data.new_address}", "${data.new_phone_number}", "${data.new_password}");`
        )
        return results;
    },
    addNurse: async (data) => {   
        const results = await promisePool.query (
          `insert into nurse values (${data.new_nurse_id}, "${data.new_name}", "${data.new_address}", "${data.new_phone_number}", "${data.new_password}");`
        )
        return results;
    },
    addExamination: async (data) => {   
        const results = await promisePool.query (
          `insert into examination values (${data.new_examination_id}, "${data.new_examinaton_date_time}", "${data.new_examination_details}");`
        )
        return results;
    },
    addTreatment: async (data) => {   
        const results = await promisePool.query (
          `insert into treatment values (${data.new_treatment_id}, "${data.new_treatment_date_time}", "${data.new_treatment_details}");`
        )
        return results;
    },
    addReservation: async (data) => {   
      try {
        const results = await promisePool.query(
          `INSERT INTO reservation 
            VALUES (${data.new_reservation_number}, "${data.new_reservation_date_time}", "${data.new_PATIENT_patient_id}", "${data.new_MEDICAL_SPECIALTY_department_id}");`
        );
    
        if (results.affectedRows === 1) {
          return { success: true, message: 'Reservation added successfully.' };
        } else {
          return { success: false, message: 'Unexpected result.' };
        }
      } catch (error) {
        if (error.code === 'ER_DUP_ENTRY') {
          return { success: false, message: 'Reservation already exists.' };
        } else {
          console.error(error);
          return { success: false, message: 'An error occurred.' };
        }
      }
  },

};











// update query
export const updateSql = {
    updateDoctor: async (data) => {
        try {
            const { doctor_id, name, address, phone_number, password } = data;
        
           
            const setClause = [];
            if (name !== undefined) setClause.push(`name = "${name}"`);
            if (address !== undefined) setClause.push(`address = "${address}"`);
            if (phone_number !== undefined) setClause.push(`phone_number = "${phone_number}"`);
            if (password !== undefined) setClause.push(`password = "${password}"`);
        
            if (setClause.length === 0) {
              return;
            }
        
            const updateQuery = `UPDATE doctor SET ${setClause.join(', ')} WHERE doctor_id = "${doctor_id}"`;
            const [result] = await promisePool.query(updateQuery);
        
            return result;
          } catch (error) {
            throw error;
          }
    },
    
    updateNurse: async (data) => {

        try {
            const { nurse_id, name, address, phone_number, password } = data;
        
           
            const setClause = [];
            if (name !== undefined) setClause.push(`name = "${name}"`);
            if (address !== undefined) setClause.push(`address = "${address}"`);
            if (phone_number !== undefined) setClause.push(`phone_number = "${phone_number}"`);
            if (password !== undefined) setClause.push(`password = "${password}"`);
        
            if (setClause.length === 0) {
              return;
            }
        
            const updateQuery = `UPDATE nurse SET ${setClause.join(', ')} WHERE nurse_id = "${nurse_id}"`;
            const [result] = await promisePool.query(updateQuery);
        
            return result;
          } catch (error) {
            throw error;
          }
    },

    updateExamination: async (data) => {
        try {
            const { examination_id, examination_date_time, examination_details } = data;
        
           
            const setClause = [];
            if (examinaton_date_time !== undefined) setClause.push(`examinaton_date_time = "${examinaton_date_time}"`);
            if (examination_details !== undefined) setClause.push(`examination_details = "${examination_details}"`);
            
        
            if (setClause.length === 0) {
              return;
            }
        
            const updateQuery = `UPDATE examination SET ${setClause.join(', ')} WHERE examination_id = "${examination_id}"`;
            const [result] = await promisePool.query(updateQuery);
        
            return result;
          } catch (error) {
            throw error;
          }
    },

    updateTreatment: async (data) => {
        try {
            const { treatment_id, treatment_date_time, treatment_details } = data;
        
           
            const setClause = [];
            if (treatment_date_time !== undefined) setClause.push(`treatment_date_time = "${treatment_date_time}"`);
            if (treatment_details !== undefined) setClause.push(`treatment_details = "${treatment_details}"`);
            
        
            if (setClause.length === 0) {
              return;
            }
        
            const updateQuery = `UPDATE treatment SET ${setClause.join(', ')} WHERE treatment_id = "${treatment_id}"`;
            const [result] = await promisePool.query(updateQuery);
        
            return result;
          } catch (error) {
            throw error;
          }
    },
    updateReservation: async (data) => {
      try {
          const { reservation_number, reservation_date_time, PATIENT_patient_id, MEDICAL_SPECIALTY_department_id } = data;
      
         
          const setClause = [];
          if (reservation_date_time !== undefined) setClause.push(`reservation_date_time = "${reservation_date_time}"`);
          if (PATIENT_patient_id !== undefined) setClause.push(`PATIENT_patient_id = "${PATIENT_patient_id}"`);
          if (MEDICAL_SPECIALTY_department_id !== undefined) setClause.push(`MEDICAL_SPECIALTY_department_id = "${MEDICAL_SPECIALTY_department_id}"`);
          
      
          if (setClause.length === 0) {
            return;
          }
      
          const updateQuery = `UPDATE reservation SET ${setClause.join(', ')} WHERE reservation_number = "${reservation_number}"`;
          const [result] = await promisePool.query(updateQuery);
      
          return result;
        } catch (error) {
          throw error;
        }
  },


};






