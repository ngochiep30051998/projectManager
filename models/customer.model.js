const db = require('../common/database');
const conn = db.getConection();


const getAll = () => {
    return new Promise((resolve, reject) => {
        conn.query('SELECT customer.*,project.ProjectName FROM customer LEFT JOIN project on customer.ProjectId = project.Id', (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}

const deleteCustomer = (id) => {
    return new Promise((resolve, reject) => {
        conn.query('DELETE FROM customer WHERE ProjectId = ?', id, (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}

const insert = (params) => {
    return new Promise((resolve, reject) => {
        conn.query('INSERT INTO customer SET ?', params, (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}
module.exports = {
    getAll: getAll,
    deleteCustomer: deleteCustomer,
    insert: insert
}