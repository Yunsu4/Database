import cookieParser from "cookie-parser";
import express from "express";
import expressSession from 'express-session';
import { selectSql } from "../database/sql";

const router = express.Router();

router.use(cookieParser());
router.use(expressSession({
    secret: 'dilab',
    resave: true,
    saveUninitialized: true,
}))



router.get('/', (req, res) => {
    /*
    if (req.cookies.user) {
        res.render('main', { 
            'user': req.cookies.user,
        });
    } else {
        res.render('first');
    }
    */
    res.render('first');
});



router.post('/', async (req, res) => {
    const vars = req.body;
    const users = await selectSql.getUser();


    let loginSuccess = false;
    let whoAmI=1;

    users.map((user) => {
        
        //console.log('ID :', user.id);
        //console.log('ID :', vars.id);
        //console.log('pwd :', vars.password);
        

        if (String(vars.id) === String(user.id) && String(vars.password) === String(user.password)) {
            console.log('login success!');
            req.session.user = { id: user.id, role: user.source_table, checkLogin: true };
            whoAmI = user.id;
            loginSuccess = true;
        }
    });

    if (!loginSuccess) {
        
        console.log('login failed!');
        res.send(`<script>
                    alert('login failed!');
                    location.href='/';
                </script>`)
    } else if (req.session.user.checkLogin && String(req.session.user.role) === 'DOCTOR') {
        res.cookie('user', whoAmI, {
            expires: new Date(Date.now() + 3600000), // ms 단위 (3600000: 1시간 유효)
            httpOnly: true
        })
        res.redirect('/employee');
    } else if (req.session.user.checkLogin && String(req.session.user.role) === 'PATIENT') {
        res.cookie('user', whoAmI, {
            expires: new Date(Date.now() + 3600000), // ms 단위 (3600000: 1시간 유효)
            httpOnly: true
        })
        res.redirect('/patient');
    } else if (req.session.user.checkLogin && (String(req.session.user.role) === 'MANAGER' || String(req.session.user.role) === 'NURSE')) {
        res.cookie('user', whoAmI, {
            expires: new Date(Date.now() + 3600000), // ms 단위 (3600000: 1시간 유효)
            httpOnly: true
        })
        res.redirect('/manage');
    }
    
});

module.exports = router;