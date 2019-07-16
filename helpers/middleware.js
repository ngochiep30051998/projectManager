
const status = require('../constants/status');
const LoggedIn = (req, res, next) => {
    if (req.session.loggedin) {
        next()
    } else {
        res.render('admin/pages/login', {
            message: 'phải đăng nhập trước',
            status: status.ERROR
        });
    }
}

module.exports = {
    LoggedIn: LoggedIn
}