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
});

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
});

router.get('/project-detail/:id', async (req, res) => {
    const id = req.params.id;
    const project = await projectModel.getProjectById(id);
    res.render('customer/pages/projectDetail', {
        project: project[0],
        message: '',
        status: ''
    })
});

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

});

router.get('/intro', (req, res) => {
    res.render('customer/pages/intro');
});

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
});

router.get('/contact', async (req, res) => {

    res.render('customer/pages/contact', {
        message: '',
        status: '',
    });
});

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
});

//search
router.get('/search', async (req, res) => {
    const param = req.query.q;
    const result = await projectModel.searchProject(param);
    res.render('customer/pages/search', {
        listProject: result
    })
})

//filter 

router.get('/filter', async (req, res) => {
    const option = req.query.option;
    let query = '';
    switch(option){
        case 'option1': {
            query = 'SELECT * FROM project WHERE Price < 1000000000';
            break;
        }
        case 'option2': {
            query = 'SELECT * FROM project WHERE Price BETWEEN 1000000000 AND 3000000000';
            break;
        }
        case 'option3': {
            query = 'SELECT * FROM project WHERE Price > 3000000000';
            break;
        }
        default: {
            query = 'SELECT * FROM project';
            break; 
        }
    }
    const result = await projectModel.filterProject(query);
    res.render('customer/pages/search', {
        listProject: result
    })
})

module.exports = router;