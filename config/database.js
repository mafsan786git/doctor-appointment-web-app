const mysql = require('mysql');

const pool = mysql.createPool({
    connectionLimit:100,
    host: 'localhost',
    user: 'root',
    password: '12180058',
    database: 'meet',
    multipleStatements: true
});

pool.getConnection((err, connection) => {
    if (err) {
        if (err.code === 'PROTOCOL_CONNECTION_LOST') {
            console.error('Database connection was closed.');
        }
        if (err.code === 'ER_CON_COUNT_ERROR') {
            console.error('Database has too many connections.');
        }
        if (err.code === 'ECONNREFUSED') {
            console.error('Database connection was refused.');
        }
    }else{
        console.log('Database is connected successfully..');
    }
    if (connection) connection.release();
    return;
});
module.exports = pool;