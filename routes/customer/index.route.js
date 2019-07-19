const express = require('express');
const router = express.Router();

const newsModel = require('../../models/news.model');
const customerModel = require('../../models/customer.model');
const projectModel = require('../../models/project.model');

//project
router.get('/', async (req, res) => {
    const listProject = await projectModel.getOutstandingProject();
    const listNews = await newsModel.getOutstandingNews();
    const data = {
        listProject: listProject,
        listNews: listNews
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
    res.json(project)
})

router.get('/intro', (req, res) => {
    res.render('customer/pages/intro');
})

module.exports = router;