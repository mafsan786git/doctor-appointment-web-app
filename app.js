const express = require('express');
const bodyparser = require('body-parser');
const session = require('express-session');
const passport = require('passport');
const path = require('path');
const flash = require('connect-flash');
const expressLayouts = require('express-ejs-layouts');
const app = express();

//directory
app.use(express.static(path.join((__dirname , 'public'))));

// for body parser
app.use(bodyparser.urlencoded({ extended: false }));
app.use(bodyparser.json());
const pool = require('./config/database');

//ejs
app.use(expressLayouts);
app.set('view engine', 'ejs');


//passport
require('./config/passport')(passport);


app.use(session({
    secret:'hsdisdgisdugv',
    resave:false,
    saveUninitialized:true
}));

//passport middleware
app.use(passport.initialize());
app.use(passport.session());

app.use(flash());
//global
app.use((req,res,next)=>{
    res.locals.success_msg = req.flash('success_msg');
    res.locals.error_msg = req.flash('error_msg');
    res.locals.error = req.flash('error');
    next();
});

//bring all routes
const meet = require('./routes/meet');

//Routes
app.use('/meet',meet);

app.get('/logout',(req,res)=>{
    req.logOut();
    req.flash('success_msg','You are successfully logout');
    res.redirect('/meet/login');
});


//server setup
const port = process.env.PORT || 5500;
app.listen(port,()=> console.log(`App is running at ${port}`));