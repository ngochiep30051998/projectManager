const db = require('../common/database');
const conn = db.getConection();


const getAll = () => {
    return new Promise((resolve, reject) => {
        conn.query('select * FROM project', (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}

const addProject = (params) => {
    return new Promise((resolve, reject) => {
        conn.query('INSERT INTO project SET ?', params, (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}

const getProjectById = (id) => {
    return new Promise((resolve, reject) => {
        conn.query('select * FROM project where Id = ?', id, (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}

const editProject = (params, id) => {
    return new Promise((resolve, reject) => {
        conn.query('UPDATE project SET ? where Id = ?', [params, id], (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}
const deleteProject = (id) => {
    return new Promise((resolve, reject) => {
        conn.query('DELETE FROM project WHERE  Id = ?', id, (err, result) => {
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
    addProject: addProject,
    getProjectById: getProjectById,
    editProject: editProject,
    deleteProject: deleteProject
}