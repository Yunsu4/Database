
import express from "express";
import expressSession from 'express-session';
import cookieParser from "cookie-parser";
import { selectSql, deleteSql, updateSql, createSql } from '../database/sql';


const router = express.Router();

router.get('/', async function (req, res) {
    
    if (req.cookies.user && (String(req.session.user.role) === 'DOCTOR' || String(req.session.user.role) === 'NURSE')) {
        const loginUser = req.cookies.user;
        const ExaminationList = await selectSql.getExamination();
        const TreatmentList = await selectSql.getTreatment();
        //console.log('root');
        res.render('employee', { 
            user: loginUser,
            title: "Examination List",
            ExaminationList,
            title2: "Treatment List",
            TreatmentList, });
    } else {
        res.render('/');
    }

});



//Add
router.post('/AddExamination', async (req, res) => {
    const vars = req.body;
    const data = {
        new_examination_id: vars.new_examination_id,
        new_examination_date_time: vars.new_examination_date_time,
        new_examination_details: vars.new_examination_details,
    }
    await createSql.addExamination(data);

    res.redirect('/employee');
});
router.post('/AddTreatment', async (req, res) => {
    const vars = req.body;
    const data = {
        new_treatment_id: vars.new_treatment_id,
        new_treatment_date_time: vars.new_treatment_date_time,
        new_treatment_details: vars.new_treatment_details,
    }
    await createSql.addTreatment(data);

    res.redirect('/employee');
});








//update
router.post('/UpdateExamination', async (req, res) => {
    const vars = req.body;
    const data = {
        examination_id: vars.examination_id,
        examination_date_time: vars.examinaton_date_time,
        examination_details: vars.examination_details,
    }
    await updateSql.updateExamination(data);

    res.redirect('/employee');
});
router.post('/UpdateTreatment', async (req, res) => {
    const vars = req.body;
    const data = {
        treatment_id: vars.new_treatment_id,
        treatment_date_time: vars.new_treatment_date_time,
        treatment_details: vars.new_treatment_details,
    }
    await updateSql.updateTreatment(data);

    res.redirect('/employee');
});







router.post('/DeleteExamination', async(req, res) => {
   console.log("delete : ", req.body.delBtn);
   const data = {
        examination_id: req.body.delBtn,
   };

   await deleteSql.deleteExamination(data);

   res.redirect('/employee');
});

router.post('/DeleteTreatment', async(req, res) => {
    console.log("delete : ", req.body.delBtn);
    const data = {
         treatment_id: req.body.delBtn
    };
 
    await deleteSql.deleteTreatment(data);

   res.redirect('/employee');

});

module.exports = router;



