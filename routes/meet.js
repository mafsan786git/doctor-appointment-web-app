const express = require('express');
const router = express.Router();
const passport = require('passport');
const async = require('async');
const bcrypt = require('bcryptjs');
const {ensureAuthenticated,forwardAuthenticated} = require('../config/auth');
const pool = require('../config/database');

router.get('/',ensureAuthenticated,(req,res)=>{
    res.render('home',{
        user:req.user
    });
}); 

router.get('/login',forwardAuthenticated,(req,res)=>{
    res.render('login'); 
});

router.post('/login',(req,res,next)=>{
    passport.authenticate('local',{
        successRedirect:'/meet',
        failureRedirect:'/meet/login',
        failureFlash:true
    })(req,res,next);
});

router.get('/signup',forwardAuthenticated,(req,res)=>{
    res.render('signup'); 
});

router.post('/signup',(req,res)=>{
    const {email,password,cpassword} = req.body;
    const errors=[];
    if(password!=cpassword){
        errors.push({msg:'Password do not match'});
    }
    if(password.length < 6){
        errors.push({msg:'Password must be atleast 6 character'});
    }
    if (errors.length>0) { 
        res.render('signup',{
            errors,
        });  
    }else{
        var db = 'login';
        var sql = `SELECT COUNT(*) AS cnt FROM login WHERE email=?`;
        pool.query(sql,email,(err,result)=>{
            if(err) throw err;
            if (result[0].cnt){
                errors.push({msg:'Email is already exists'});
                res.render('signup',{
                    errors,
                });
            }else{
                
                var login = {
                    "email":email,
                    "password":req.body.password,
                    "flag":0
                };
                bcrypt.genSalt(10,(err,salt)=>{
                    if(err) throw err;
                    bcrypt.hash(password,salt,(err,hash)=>{
                        if(err) throw err;
                        login.password = hash;
                        var sql = 'INSERT INTO login SET ?';
                        pool.query(sql,login,(err,result)=>{
                            if(err)
                                throw err;
                            req.flash('success_msg','You are succesfully registered now you can login');
                            console.log('inside insert into login');
                            res.redirect('/meet/login');
                        });
                        
                    });
                });
            }
        });
    }
});


router.get('/list/:id',ensureAuthenticated,(req,res)=>{
    // console.log(req.query);
    var city = 'fgdfh';
    city = req.query.city;
    // console.log(typeof city);
    if (typeof city === "undefined") {
        // console.log(" inside if");
        var sql = `SELECT * FROM doctor`;
        pool.query(sql,(err,result)=>{
            // console.log(result[0]);
            if(err) throw err;
            res.render('doctorlist',{
                user:req.user,
                doctor:result
            });
        });
    }else{
        // console.log('indeis else');
        // console.log( city);
        var sql1 = `SELECT * FROM doctor WHERE location=?`;
        pool.query(sql1,city,(err,result)=>{
            if(err) throw err;
            res.render('doctorlist',{
                user:req.user,
                doctor:result
            });
        });
    }
});

router.get('/appointment/:id',ensureAuthenticated,(req,res)=>{
 
    var id = req.params.id;
    var sql1 = `SELECT * FROM doctor WHERE doctorid=?`;
    pool.query(sql1,id,(err,result)=>{
        if(err) throw err;
        res.render('appointment',{
            user:req.user,
            doctor:result[0].doctorname,
            id
        });
    });
});

router.post('/appointment/:id',ensureAuthenticated,(req,res)=>{
    // console.log(req.body);
    var doctorid = req.params.id;
    const {firstname,lastname,age,mstatus,gender,doctorname,date,address} = req.body;
    var loginid = req.user.id;
    // var d = new Date();
    // var s = d.getFullYear()+'-'+d.getMonth()+'-'+d.getDate();
    // console.log(s);
    const patient = {
        lastname,
        firstname,
        gender,
        age,
        mstatus,
        address,
        date,
        loginid
    };
    var sql = `INSERT INTO patient SET ?`;
    pool.query(sql,patient,(err,result)=>{
        if (err) throw err;
        var patientid = result.insertId;
        const ptdoctor = {
            patientid,
            doctorid,
            bookdate:date,
            loginid
        };
        // console.log(ptdoctor);
        sql = `INSERT INTO ptdoctor SET ?`;
        pool.query(sql,ptdoctor,(err,result)=>{
            if(err) throw err;
            res.redirect(`/meet/status/${loginid}`);
        });
    });    
});

function formatDate() {
    var d = new Date(),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) 
        month = '0' + month;
    if (day.length < 2) 
        day = '0' + day;

    return [year, month, day].join('-');
}

router.get('/status/:id',ensureAuthenticated,(req,res)=>{
    var loginid = req.params.id;
    // var d = new Date();
    // console.log(d);
    var currentdate = formatDate();
    // var currentdate = d.getFullYear()+'-'+d.getMonth()+'-'+d.getDate();
    // console.log(currentdate);
    const errors = [];
    var sql = `SELECT patientid,doctorid,appointment_date FROM ptdoctor WHERE appointment_date  >=? AND loginid=?`;
    pool.query(sql,[currentdate,loginid],(err,result)=>{
        if(err) throw err;
        if(!result.length){
            errors.push({msg:'No appointment is availabe'});
            res.render('status',{
                errors,
                user:req.user,
                mng:result,
            });
        }else{
            const pts = [];
            async.forEachOf(result,(value,key,callback)=>{
                var sql2 = `SELECT * FROM patient WHERE patientid = ?;SELECT doctorname FROM doctor WHERE doctorid = ?`;
                pool.query(sql2,[value.patientid,value.doctorid],(err,row)=>{
                if(!err)
                {
                    if(row.length > 0){
                   
                    row[0].push(row[1][0]);
                        pts.push(row[0]);
                    }

                    callback(null);
                }else{
                    console.log('Error while performing inside patient ');
                    callback(err);
                }
                });
            },(err)=>{
                if(err) throw err;
                console.log(pts[0]);
                console.log(pts[1]);
                console.log(pts[2]);

                res.render('status',{
                        user:req.user,
                        mng:result,
                        pts:pts,
                        
                        // dc:dc
                    });
            });
        }
    });
});

module.exports = router;
