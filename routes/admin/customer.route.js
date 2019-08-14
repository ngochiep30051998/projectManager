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

// delete project
router.delete('/delete/:id', middleware.LoggedIn, async (req, res) => {
    try {
        
        const delCustomer = await customerModel.deleteById(req.params.id);
        let responseData = {
            status: true
        }
        return res.json(responseData)
    } catch (e) {
        let responseData = {
            status: false,
            err: e
        }
        return res.json(responseData)
    }

})
module.exports = router;