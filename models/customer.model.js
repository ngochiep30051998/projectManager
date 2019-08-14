const db = require('../common/database');
const conn = db.getConection();


const getAll = (limit, offset) => {
    return new Promise((resolve, reject) => {
        let query = conn.query('SELECT customer.*,project.ProjectName FROM customer LEFT JOIN project on customer.ProjectId = project.Id LIMIT ? OFFSET ?', [limit, offset], (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}

const countCustomer = () => {
    return new Promise((resolve, reject) => {
        let query = conn.query('select count(*) as count FROM customer ', (err, result) => {
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
        let query = conn.query('DELETE FROM customer WHERE ProjectId = ?', id, (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}

const deleteById = (id) => {
    return new Promise((resolve, reject) => {
        let query = conn.query('DELETE FROM customer WHERE Id = ?', id, (err, result) => {
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
        let query = conn.query('INSERT INTO customer SET ?', params, (err, result) => {
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
    insert: insert,
    countCustomer: countCustomer,
    deleteById: deleteById
}