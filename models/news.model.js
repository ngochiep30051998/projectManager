const db = require('../common/database');
const conn = db.getConection();


const getAll = () => {
    return new Promise((resolve, reject) => {
        conn.query('select * FROM news', (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}

const addNews = (params) => {
    return new Promise((resolve, reject) => {
        conn.query('INSERT INTO news SET ?', params, (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}

const getNewsById = (id) => {
    return new Promise((resolve, reject) => {
        conn.query('select * FROM news where Id = ?', id, (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}

const editNews = (params, id) => {
    return new Promise((resolve, reject) => {
        conn.query('UPDATE news SET ? where Id = ?', [params, id], (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}
const deleteNews = (id) => {
    return new Promise((resolve, reject) => {
        conn.query('DELETE FROM news WHERE  Id = ?', id, (err, result) => {
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
    deleteNews: deleteNews,
    editNews: editNews,
    getNewsById: getNewsById,
    addNews: addNews
}