var db = require('../common/database');
var conn = db.getConection();

const getAll = () => {
    return new Promise((resolve, reject) => {
        conn.query('select * FROM customer', (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}


module.exports = {
    getAll: getAll
}