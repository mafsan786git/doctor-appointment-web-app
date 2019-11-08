const LocalStrategy = require('passport-local').Strategy;
const bcrypt = require('bcryptjs');
const util = require('util');

const pool = require('./database');

module.exports = function (passport) {

    passport.use(
        new LocalStrategy(
            {
                usernameField:'email',
                passwordField:'password',
            },
            (email,password,done)=>{ 

                var sql1 = 'select * from login where email = ?';
                pool.query(sql1,email,(err,result)=>{
                    if(err) throw err;

                    if (!result.length) {
                        return done(null,false,{
                            message:'Email does not exists'
                        });
                    }
                    bcrypt.compare(password,result[0].password,
                        (err,isMatched)=>{
                            if(err) throw err;

                            if (isMatched) {
                                //console.log(util.inspect(result[0], false, null, true /* enable colors */));
                                return done(null,result[0]);               
                            }else{
                                return done(null,false,{
                                    message:'Password is incorrect'
                                });
                            }
                        });

                });

            })
    );
    //serializeUser
    passport.serializeUser((user,done)=>{
        done(null,user.id);
    });

    //deserializeUser

    passport.deserializeUser((id,done)=>{
        var sql = 'select * from login where id = ?';
        pool.query(sql,id,(err,result)=>{
            if(err) throw err;
            done(err,result[0]);

        });
    });
};