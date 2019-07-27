const express = require('express');
const router = express.Router();

const customerModel = require('../../models/customer.model');

const middleware = require('../../helpers/middleware');


router.get('/', middleware.LoggedIn, async (req, res) => {

    const limit = 6;
    const totalProject = await customerModel.countCustomer();
    const numPages = Math.ceil(totalProject[0].count / limit);
    const page = parseInt(req.query.page) || 1;
    const offset = page > 0 ? limit * page - limit : 0;
    const result = await customerModel.getAll(limit, offset);
    res.render('admin/pages/customer/customerManagement', {
        listCustomer: result,
        numPages: numPages,
        page: page
    });
});

module.exports = router;