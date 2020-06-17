const express = require('express');
const router = express.Router();
const passport = require('passport');
const async = require('async');
const bcrypt = require('bcryptjs');
const {
    ensureAuthenticated,
    forwardAuthenticated
} = require('../config/auth');
const pool = require('../config/database');


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

router.get('/history/:id', ensureAuthenticated, (req, res) => {
    var flagid = req.params.id;
    // var d = new Date();
    // console.log(d);
    var currentdate = formatDate();
    // var currentdate = d.getFullYear()+'-'+d.getMonth()+'-'+d.getDate();
    // console.log(currentdate);
    const errors = [];
    var sql = `SELECT patientid,doctorid,appointment_date FROM ptdoctor WHERE appointment_date  <? AND doctorid=?`;
    pool.query(sql, [currentdate, flagid], (err, result) => {
        if (err) throw err;
        if (!result.length) {
            errors.push({
                msg: 'No appointment is availabe'
            });
            res.render('history', {
                errors,
                user: req.user,
                mng: result,
                f: "history"
            });
        } else {
            const pts = [];
            async.forEachOf(result, (value, key, callback) => {
                var sql2 = `SELECT * FROM patient WHERE patientid = ?;SELECT doctorname FROM doctor WHERE doctorid = ?`;
                pool.query(sql2, [value.patientid, value.doctorid], (err, row) => {
                    if (!err) {
                        if (row.length > 0) {
                            row[0].push(row[1][0]);
                            pts.push(row[0]);
                        }
                        callback(null);
                    } else {
                        console.log('Error while performing inside patient ');
                        callback(err);
                    }
                });
            }, (err) => {
                if (err) throw err;
                console.log(pts);
                res.render('history', {
                    user: req.user,
                    mng: result,
                    pts: pts,
                    f: "history"
                });
            });
        }
    });
});


router.get('/status/:id', ensureAuthenticated, (req, res) => {
    var loginid = req.params.id;
    // var d = new Date();
    // console.log(d);
    var currentdate = formatDate();
    // var currentdate = d.getFullYear()+'-'+d.getMonth()+'-'+d.getDate();
    // console.log(currentdate);
    const errors = [];
    var sql1 = 'SELECT doctorid FROM doctor WHERE loginid=?';
    pool.query(sql1, loginid, (err, doc) => {
        console.log(doc);
        var sql = `SELECT patientid,doctorid,appointment_date,appointment_number FROM ptdoctor WHERE appointment_date  >=? AND doctorid=?`;
        pool.query(sql, [currentdate, doc[0].doctorid], (err, result) => {
            if (err) throw err;
            if (!result.length) {
                errors.push({
                    msg: 'No appointment is availabe'
                });
                res.render('status', {
                    errors,
                    user: req.user,
                    mng: result,
                    f: "status"
                });
            } else {
                const pts = [];
                async.forEachOf(result, (value, key, callback) => {
                    var sql2 = `SELECT * FROM patient WHERE patientid = ?;SELECT doctorname,fee,doctorid FROM doctor WHERE doctorid = ?;SELECT * FROM doctor_check WHERE doctorid=? and patientid=?`;
                    pool.query(sql2, [value.patientid, value.doctorid, value.doctorid, value.patientid], (err, row) => {
                        if (!err) {
                            if (row.length > 0 && row[2][0].checked_or_canceled === 0) {
                                row[0][0].appointment_number = value.appointment_number;
                                row[0].push(row[1][0]);
                                pts.push(row[0]);
                            }
                            callback(null);
                        } else {
                            console.log('Error while performing inside patient ');
                            callback(err);
                        }
                    });
                }, (err) => {
                    if (err) throw err;
                    console.log(pts);
                    res.render('status', {
                        user: req.user,
                        mng: result,
                        pts: pts,
                        f: "status"
                    });
                });
            }
        });
    })
});


module.exports = router;