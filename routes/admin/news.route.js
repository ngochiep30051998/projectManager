const express = require('express');
const router = express.Router();

const newsModel = require('../../models/news.model');

const middleware = require('../../helpers/middleware');
const status = require('../../constants/status');

const fs = require('fs');

//upload file
const multer = require('multer');

const upload = multer({ dest: 'public/upload/news/' });

const validateHelper = require('../../helpers/validate');


router.get('/', middleware.LoggedIn, async (req, res) => {
    const limit = 6;
    const totalProject = await newsModel.getCountNews();
    const numPages = Math.ceil(totalProject[0].count / limit);
    const page = parseInt(req.query.page) || 1;
    const offset = page > 0 ? limit * page - limit : 0;
    const result = await newsModel.getAll(limit, offset);
    res.render('admin/pages/news/newsManagement', {
        listNews: result,
        numPages: numPages,
        page: page
    });
})


//add News
router.get('/add', middleware.LoggedIn, (req, res) => {
    res.render('admin/pages/news/addNews', {
        message: '',
        status: ''
    });
})

router.post('/add', middleware.LoggedIn, upload.single('image'), async (req, res) => {
    const validate = validateHelper.validateNews(req);
    if (validate.status === status.ERROR) {
        res.render('admin/pages/news/addNews', {
            message: validate.message,
            status: status.ERROR
        });
    } else {
        let news = {
            Title: req.body.newsTitle,
            Content: req.body.newsContent,
            Image: req.file.filename,
            Link: req.body.newsLink
        }
        await newsModel.addNews(news);
        res.render('admin/pages/news/addNews', {
            message: "Thêm mới thành công",
            status: status.SUCCESS
        });
    }
})

//edit news 

router.get('/edit/:id', middleware.LoggedIn, async (req, res) => {
    const id = req.params.id;
    const news = await newsModel.getNewsById(id);
    res.render('admin/pages/news/editNews', {
        message: "",
        status: '',
        news: news[0]
    });
})


router.post('/edit/:id', middleware.LoggedIn, upload.single('image'), async (req, res) => {
    const id = req.params.id;
    const oldImagePath = `public/upload/news/${req.body.oldImage}`;
    let news = {
        Id: id,
        Title: req.body.newsTitle,
        Content: req.body.newsContent,
        Image: req.file ? req.file.filename : req.body.oldImage,
        Link: req.body.newsLink
    }

    if(req.file){
        fs.unlinkSync(oldImagePath);
    }

    const validate = validateHelper.validateNews(req);
    if (validate.status === status.ERROR) {
        res.render('admin/pages/news/editNews', {
            message: validate.message,
            status: status.ERROR,
            news: news
        });
    } else {
        const update = await newsModel.editNews(news, id);
        res.render('admin/pages/news/editNews', {
            message: "Sửa thành công",
            status: status.SUCCESS,
            news: news
        });
    }
})

// delete news
router.delete('/delete/:id', middleware.LoggedIn, async (req, res) => {
    try {
        const image = await newsModel.getImageFromNews(req.params.id);
        const oldImagePath = `public/upload/news/${image[0].Image}`;

        const del = await newsModel.deleteNews(req.params.id);

        fs.unlinkSync(oldImagePath);

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

//search
router.get('/search', middleware.LoggedIn, async (req, res) => {
    const param = req.query.q;
    const result = await newsModel.searchNews(param);
    res.render('admin/pages/news/searchNews', {
        listNews: result
    });
})
module.exports = router;