const express = require('express');
const router = express.Router();

const authModel = require('../../models/authen.model');

const status = require('../../constants/status');

const validateHelper = require('../../helpers/validate');

/* GET home page. */
router.get('/', (req, res, next) => {
    res.redirect('/admin/project/');
});

//login
router.get('/login', (req, res) => {
    res.render('admin/pages/login', {
        message: '',
        status: ''
    });
})

router.post('/login', async (req, res) => {
    const validate = validateHelper.validateLogin(req.body);
    if (validate.status === status.ERROR) {
        res.render('admin/pages/login', {
            message: validate.message,
            status: status.ERROR
        });
    } else {
        const result = await authModel.login(req.body.UserName, req.body.Password);
        if (result.length > 0) {
            req.session.loggedin = true;
            req.session.username = req.body.UserName;
            return res.redirect('/admin/project/');
        } else {
            res.render('admin/pages/login', {
                message: 'Sai tài khoản hoặc mật khẩu',
                status: status.ERROR
            });
        }
    }

})

//logout

router.get('/logout', (req, res) => {
    if (req.session.loggedin) {
        req.session.destroy();
    }
    return res.redirect('/admin/login');
})

//
module.exports = router;
