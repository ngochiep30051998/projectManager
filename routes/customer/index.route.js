const express = require('express');
const router = express.Router();

const newsModel = require('../../models/news.model');
const customerModel = require('../../models/customer.model');
const projectModel = require('../../models/project.model');

const status = require('../../constants/status');
//project
router.get('/', async (req, res) => {
    const listProject = await projectModel.getOutstandingProject();
    const listNews = await newsModel.getOutstandingNews();
    const data = {
        listProject: listProject ? listProject : [],
        listNews: listNews ? listNews : []
    }
    res.render('customer/pages/index', { data });
})

router.get('/project', async (req, res) => {

    const limit = 6;
    const totalProject = await projectModel.getCountProject();
    const numPages = Math.ceil(totalProject[0].count / limit);
    const page = parseInt(req.query.page) || 1;
    const offset = page > 0 ? limit * page - limit : 0;
    const result = await projectModel.getAll(limit, offset);

    res.render('customer/pages/project', {
        listProject: result,
        numPages: numPages,
        page: page
    });
})

router.get('/project-detail/:id', async (req, res) => {
    const id = req.params.id;
    const project = await projectModel.getProjectById(id);
    res.render('customer/pages/projectDetail', {
        project: project[0],
        message: '',
        status: ''
    })
})

router.post('/project-detail/:id', async (req, res) => {
    const id = req.params.id;
    const customer = {
        Name: req.body.Name,
        Phone: req.body.Phone,
        Email: req.body.Email,
        Address: req.body.Address,
        Message: req.body.Message,
        ProjectId: id
    }
    const insert = await customerModel.insert(customer);
    if (insert.affectedRows > 0) {
        const project = await projectModel.getProjectById(id);
        res.render('customer/pages/projectDetail', {
            project: project[0],
            status: status.SUCCESS,
            message: "Gửi thành công"
        })
    } else {
        res.render('customer/pages/projectDetail', {
            project: project[0],
            status: status.ERROR,
            message: "Gửi thất bại"
        })
    }

})

router.get('/intro', (req, res) => {
    res.render('customer/pages/intro');
})

router.get('/news', async (req, res) => {
    const limit = 6;
    const totalProject = await newsModel.getCountNews();
    const numPages = Math.ceil(totalProject[0].count / limit);
    const page = parseInt(req.query.page) || 1;
    const offset = page > 0 ? limit * page - limit : 0;
    const result = await newsModel.getAll(limit, offset);
    res.render('customer/pages/news', {
        listNews: result,
        numPages: numPages,
        page: page
    });
})

router.get('/contact', async (req, res) => {

    res.render('customer/pages/contact', {
        message: '',
        status: '',
    });
})

router.post('/contact', async (req, res) => {

    const customer = {
        Name: req.body.Name,
        Phone: req.body.Phone,
        Email: req.body.Email,
        Address: req.body.Address,
        Message: req.body.Message
    }
    const insert = await customerModel.insert(customer);
    if (insert.affectedRows > 0) {
        res.render('customer/pages/contact', {
            status: status.SUCCESS,
            message: "Gửi thành công"
        })
    } else {
        res.render('customer/pages/contact', {
            status: status.ERROR,
            message: "Gửi thất bại"
        })
    }
})
module.exports = router;