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
module.exports = {
    getAll: getAll
}