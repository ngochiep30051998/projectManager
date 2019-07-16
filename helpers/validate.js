const status = require('../constants/status');

const validateProject = (req) => {
    let responseData = {
        status: '',
        message: ''
    };
    if (!req.body.projectName || req.body.projectName === '') {
        const responseData = {
            status: status.ERROR,
            message: 'Phải nhập tên dự án'
        };
        return responseData;
    }

    if (!req.body.price || req.body.price === '') {
        const responseData = {
            status: status.ERROR,
            message: 'Phải nhập giá'
        };
        return responseData;
    }

    if (!req.file || req.file.filename === '') {
        const responseData = {
            status: status.ERROR,
            message: 'Phải chọn ảnh'
        };
        return responseData;
    }
    responseData = {
        status: status.SUCCESS,
        message: 'Kiểm tra thành công'
    }
    return responseData;
}

const validateEditProject = (req) => {
    let responseData = {
        status: '',
        message: ''
    };
    if (!req.body.projectName || req.body.projectName === '') {
        const responseData = {
            status: status.ERROR,
            message: 'Phải nhập tên dự án'
        };
        return responseData;
    }

    if (!req.body.price || req.body.price === '') {
        const responseData = {
            status: status.ERROR,
            message: 'Phải nhập giá'
        };
        return responseData;
    }
    responseData = {
        status: status.SUCCESS,
        message: 'Kiểm tra thành công'
    }
    return responseData;
}

const validateLogin = (params) => {
    if (!params.UserName || params.UserName === '') {
        const responseData = {
            status: status.ERROR,
            message: 'Phải nhập tên đăng nhập'
        };
        return responseData;
    }
    if (!params.Password || params.Password === '') {
        const responseData = {
            status: status.ERROR,
            message: 'Phải nhập mật khẩu'
        };
        return responseData;
    }

    responseData = {
        status: status.SUCCESS,
        message: 'Kiểm tra thành công'
    }
    return responseData;
}
module.exports = {
    validateProject: validateProject,
    validateEditProject: validateEditProject,
    validateLogin: validateLogin
}