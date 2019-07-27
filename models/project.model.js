const db = require('../common/database');
const conn = db.getConection();

const getAll = (limit, offset) => {
    return new Promise((resolve, reject) => {
        conn.query('select * FROM project LIMIT ? OFFSET ?', [limit, offset], (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}

const getCountProject = () => {
    return new Promise((resolve, reject) => {
        conn.query('select count(*) as count FROM project ', (err, result) => {
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

const searchProject = (param) => {
    return new Promise((resolve, reject) => {
        conn.query(`SELECT * FROM project WHERE ProjectName LIKE '%${param}%' OR Location LIKE '%${param}%'`, (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}
const getOutstandingProject = () => {
    return new Promise((resolve, reject) => {
        conn.query(`SELECT * FROM project ORDER BY ViewNumber DESC LIMIT 6`, (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}

const getImageFromProject = (id) => {
    return new Promise((resolve, reject) => {
        conn.query(`SELECT Image FROM project WHERE Id = ?`, id, (err, result) => {
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
    deleteProject: deleteProject,
    searchProject: searchProject,
    getOutstandingProject: getOutstandingProject,
    getImageFromProject: getImageFromProject,
    getCountProject: getCountProject
}