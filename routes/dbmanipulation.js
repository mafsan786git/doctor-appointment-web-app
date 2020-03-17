// const pool = require('../config/database');
// const express = require('express');
// const async = require('async');
// const {ensureAuthenticated} = require('../config/auth');

// const router = express.Router();


// router.get('/createdoctor',(req,res)=>{

//     var count = 0;
//     for(var i=1;i<=49;i++)
//     {
//         var maxlimit = {
//             'doctorid':`${i}`,
//             'max_number':50
//         };
//         var sql = `INSERT INTO max_limit SET ?`;
//         pool.query(sql,maxlimit,(err,result)=>{
//             if(err)
//                 throw err;
// else{
//     console.log(`doctorid ${i} is inserted.`);
// count++;
// }
//         });
//     }

//     if(count == 49)
//     {
//         res.render('home',{
//             user:req.user
//         }
//         );
//     }
// });


// module.exports = router;