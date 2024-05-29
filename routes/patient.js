
import express from "express";
import expressSession from 'express-session';
import cookieParser from "cookie-parser";
import { selectSql, deleteSql, updateSql, createSql } from '../database/sql';

 

const router = express.Router();

router.get('/', async function (req, res) {
    
    if (req.cookies.user && String(req.session.user.role) === 'PATIENT') {
        const loginUser = req.cookies.user;
        const ReservationList = await selectSql.getUserReservation(loginUser);
        console.log(req.cookies);
        console.log(loginUser);
        res.render('patient', { 
            user: loginUser,
            title: "Reservation List",
            ReservationList,
             });
    } else {
        res.render('/');
    }

});



//Add
router.post('/AddReservation', async (req, res) => {
    const vars = req.body;
    const loginUser = req.cookies.user;
    const data = {
        new_reservation_number: vars.new_reservation_number,
        new_reservation_date_time: vars.new_reservation_date_time,
        new_PATIENT_patient_id: loginUser,
        new_MEDICAL_SPECIALTY_department_id: vars.new_MEDICAL_SPECIALTY_department_id,
    }
    await createSql.addReservation(data);

    res.redirect('/patient');
});





//update
router.post('/UpdateReservation', async (req, res) => {
    const vars = req.body;
    const data = {
        reservation_number: vars.reservation_number,
        reservation_date_time: vars.reservation_date_time,
        PATIENT_patient_id: vars.PATIENT_patient_id,
        MEDICAL_SPECIALTY_department_id: vars.MEDICAL_SPECIALTY_department_id,
    }
    await updateSql.updateReservation(data);

    res.redirect('/patient');
});







router.post('/DeleteReservation', async(req, res) => {
   console.log("delete : ", req.body.delBtn);
   const data = {
    reservation_number: req.body.delBtn,
   };

   await deleteSql.deleteReservation(data);

   res.redirect('/patient');
});


module.exports = router;

