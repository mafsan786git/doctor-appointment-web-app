const express = require('express');
const router = express.Router();
const passport = require('passport');
const async = require('async');
const bcrypt = require('bcryptjs');
const {ensureAuthenticated,forwardAuthenticated} = require('../config/auth');
const pool = require('../config/database');





module.exports = router;