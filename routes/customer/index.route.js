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
    const listProject = await projectModel.getAll();
    res.render('customer/pages/project', { listProject });
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
        ProjectId: id
    }
    const insert = await customerModel.insert(customer);
    if(insert.affectedRows>0){
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

router.get('/news',async (req, res) => {

    const result = await newsModel.getAll();
    res.render('customer/pages/news',{
        listNews: result
    });
})
module.exports = router;