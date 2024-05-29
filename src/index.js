import express from 'express';
import logger from 'morgan';
import path from 'path';
import liveReload from 'livereload';
import connectLiveReload from 'connect-livereload';



import loginRouter from '../routes/first';
import manageRouter from '../routes/manage';
import employeeRouter from '../routes/employee';
import patientRouter from '../routes/patient';

const PORT = 3000;

const liveReloadServer = liveReload.createServer(); 
liveReloadServer.server.once("connection", () => {
  setTimeout(() => {
    liveReloadServer.refresh('/');
  }, 100)
});

const app = express();

app.use(connectLiveReload());

app.use(express.static(path.join(__dirname, '/src')));
app.use(express.urlencoded({ extended: false }))
app.use(express.json());




/*

app.use(
    expressSession({
        secret: "my key",
        resave: true,
        saveUninitialized: true,
    })
);
*/
app.set('views', path.join(__dirname, '../views'));
app.set("view engine", "hbs");

app.use(logger('dev'));

app.use('/', loginRouter);
app.use('/manage', manageRouter);
app.use('/employee', employeeRouter);
app.use('/patient', patientRouter);

app.listen(PORT, () => {
    console.log(`Server is running at http://localhost:${PORT}`)
});