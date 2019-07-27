const db = require('../common/database');
const conn = db.getConection();


const getAll = (limit, offset) => {
    return new Promise((resolve, reject) => {
        conn.query('select * FROM news LIMIT ? OFFSET ?', [limit, offset], (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}

const getCountNews = () => {
    return new Promise((resolve, reject) => {
        conn.query('select count(*) as count FROM news ', (err, result) => {
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
//search
const searchNews = (param) => {
    return new Promise((resolve, reject) => {
        conn.query(`SELECT * FROM news WHERE Title LIKE '%${param}%'`, (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}

const getOutstandingNews = () => {
    return new Promise((resolve, reject) => {
        conn.query(`SELECT * FROM news ORDER BY Id DESC LIMIT 5`, (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}

const getImageFromNews = (id) => {
    return new Promise((resolve, reject) => {
        conn.query(`SELECT Image FROM news WHERE Id = ?`, id, (err, result) => {
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
    addNews: addNews,
    searchNews: searchNews,
    getOutstandingNews: getOutstandingNews,
    getImageFromNews: getImageFromNews,
    getCountNews: getCountNews
}