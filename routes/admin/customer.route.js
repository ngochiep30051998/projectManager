const express = require('express');
const router = express.Router();

const customerModel = require('../../models/customer.model');

const middleware = require('../../helpers/middleware');



router.get('/', middleware.LoggedIn, async (req, res) => {
    const result = await customerModel.getAll();
    res.render('admin/pages/customer/customerManagement', {
        listCustomer: result
    });
});

module.exports = router;