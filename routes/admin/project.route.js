const express = require('express');
const router = express.Router();

const projectModel = require('../../models/project.model');

const middleware = require('../../helpers/middleware');
const status = require('../../constants/status');

//upload file
const multer = require('multer');

const upload = multer({ dest: 'public/upload/project/' });

const validateHelper = require('../../helpers/validate');


router.get('/', middleware.LoggedIn, async (req, res) => {
    const result = await projectModel.getAll();
    res.render('admin/pages/project/projectManagement', {
        listProject: result
    });
})

//add new project
router.get('/add', middleware.LoggedIn, (req, res) => {
    res.render('admin/pages/project/addProject', {
        message: '',
        status: ''
    });
})



router.post('/add', middleware.LoggedIn, upload.single('image'), async (req, res) => {
    const validate = validateHelper.validateProject(req);
    if (validate.status === status.ERROR) {
        res.render('admin/pages/project/addProject', {
            message: validate.message,
            status: status.ERROR
        });
    } else {
        let project = {
            ProjectName: req.body.projectName,
            Image: req.file.filename,
            Location: req.body.location,
            Content: req.body.content,
            Price: req.body.price,
            ViewNumber: req.body.viewNumber
        }
        await projectModel.addProject(project);
        res.render('admin/pages/project/addProject', {
            message: "Thêm mới thành công",
            status: status.SUCCESS
        });
    }
});
// edit project

router.get('/edit/:id', middleware.LoggedIn, async (req, res) => {
    const id = req.params.id;
    const project = await projectModel.getProjectById(id);
    res.render('admin/pages/project/editProject', {
        message: "",
        status: '',
        project: project[0]
    });
})

router.post('/edit/:id', middleware.LoggedIn, upload.single('image'), async (req, res) => {
    const id = req.params.id;
    let project = {
        Id: id,
        ProjectName: req.body.projectName,
        Image: req.file ? req.file.filename : req.body.oldImage,
        Location: req.body.location,
        Content: req.body.content,
        Price: req.body.price,
        ViewNumber: req.body.viewNumber
    }
    const validate = validateHelper.validateEditProject(req);
    if (validate.status === status.ERROR) {
        res.render('admin/pages/project/editProject', {
            message: validate.message,
            status: status.ERROR,
            project: project
        });
    } else {
        const update = await projectModel.editProject(project, id);
        res.render('admin/pages/project/editProject', {
            message: "Sửa thành công",
            status: status.SUCCESS,
            project: project
        });
    }
})

// delete project
router.delete('/delete/:id', middleware.LoggedIn, async (req, res) => {
    try {
        const del = await projectModel.deleteProject(req.params.id);
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