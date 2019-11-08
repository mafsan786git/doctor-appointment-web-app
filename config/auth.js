module.exports = {
    ensureAuthenticated: function (req,res,next){
        // console.log('inside ensur');
        if(req.isAuthenticated())
            return next();
        // req.flash('error_msg','Please log in to view the home page');
        res.redirect('/meet/login');
    },
    forwardAuthenticated: function (req,res,next) {
        if(!req.isAuthenticated())
             return next();
        res.redirect('/meet');  
    } 
};