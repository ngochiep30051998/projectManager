var mysql = require('mysql');
var dbConfig = require('../constants/configs');

var connection = mysql.createConnection({
    host: dbConfig.DB_CONFIG.host,
    user: dbConfig.DB_CONFIG.user,
    password: dbConfig.DB_CONFIG.password,
    database: dbConfig.DB_CONFIG.database
});

connection.connect();

const getConection = () => {
    if (!connection) {
        connection.connect();
      }
      return connection;
}

module.exports = {
    getConection: getConection
}