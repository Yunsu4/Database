
import express from "express";
import expressSession from 'express-session';
import cookieParser from "cookie-parser";
import { selectSql, deleteSql, updateSql, createSql } from '../database/sql';


const router = express.Router();

router.get('/', async function (req, res) {
    
    if (req.cookies.user && String(req.session.user.role) === 'MANAGER') {
        const loginUser = req.cookies.user;
        const DoctorList = await selectSql.getDoctor();
        const NurseList = await selectSql.getNurse();
        //console.log('root');
        res.render('manage', { 
            user: loginUser,
            title: "Doctor List",
            DoctorList,
            title2: "Nurse List",
            NurseList, });
    } else {
        res.render('/');
    }

});



//Add
router.post('/AddDoctor', async (req, res) => {
    const vars = req.body;
    const data = {
        new_doctor_id: vars.new_doctor_id,
        new_name: vars.new_name,
        new_address: vars.new_address,
        new_phone_number: vars.new_phone_number,
        new_password: vars.new_password,
    }
    await createSql.addDoctor(data);

    res.redirect('/manage');
});
router.post('/AddNurse', async (req, res) => {
    const vars = req.body;
    const data = {
        new_nurse_id: vars.new_nurse_id,
        new_name: vars.new_name,
        new_address: vars.new_address,
        new_phone_number: vars.new_phone_number,
        new_password: vars.new_password,
    }
    await createSql.addNurse(data);

    res.redirect('/manage');
});









//update
router.post('/UpdateDoctor', async (req, res) => {
    const vars = req.body;
    const data = {
        doctor_id: vars.doctor_id,
        name: vars.name,
        address: vars.address,
        phone_number: vars.phone_number,
    }
    await updateSql.updateDoctor(data);

    res.redirect('/manage');
});
router.post('/UpdateNurse', async (req, res) => {
    const vars = req.body;
    const data = {
        nurse_id: vars.nurse_id,
        name: vars.name,
        address: vars.address,
        phone_number: vars.phone_number,
    }
    await updateSql.updateNurse(data);

    res.redirect('/manage');
});







router.post('/DeleteDoctor', async(req, res) => {
   console.log("delete : ", req.body.delBtn);
   const data = {
        doctor_id: req.body.delBtn,
   };

   await deleteSql.deleteDoctor(data);

   res.redirect('/manage');
});

router.post('/DeleteNurse', async(req, res) => {
    console.log("delete : ", req.body.delBtn);
    const data = {
         nurse_id: req.body.delBtn
    };
 
    await deleteSql.deleteNurse(data);

   res.redirect('/manage');

});

module.exports = router;

