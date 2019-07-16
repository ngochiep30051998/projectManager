const db = require('../common/database');
const conn = db.getConection();

const login = (UserName, Password) => {
    return new Promise((resolve, reject) => {
        conn.query('select UserName FROM account WHERE UserName = ? and Password = ? ', [UserName, Password], (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}

module.exports = {
    login: login
}