var express = require('express');
var request = require('request');
var url = require('url');
var router = express.Router();
var URL = {
    game: 'https://vk.com/app3932147',
    vkAuth: 'https://login.vk.com/?act=login&q=1&al_frame=1&expire=&from_host=vk.com&email=',
    server: 'https://tmp1-fb.geronimo.su/VK_INV/invasion.php',
    referer: 'http://cs622819.vk.me/u117152075/306d823ce5f6fd.zip'
};
var getAppUsers = function(access_token, req, cb) {
    request.get('https://api.vk.com/method/friends.getAppUsers?access_token=' + access_token,
        function(err, data, body) {
            cb && cb(err, body);
        });
};
router.all('/', function(req, res) {
    try {
        var params = req.body.data || req.query.data;
        if (params) {
            params = JSON.parse(params);
        }
        if (!params || !params.auth_key || !params.viewer_id) {
            return res.redirect('/login');
        }
        getAppUsers(params.access_token, req, function(err, data) {
            if (data) data = JSON.parse(data);
            var friends = data.response ? data.response.join(',') : null;
            res.render('index', {
                title: 'invasion bot',
                auth_key: params.auth_key,
                friends: friends || params.friends || '',
                viewer_id: params.viewer_id,
                swfsrc: params.swfsrc || '/bot.swf',
                version: params.version || '',
                access_token: params.access_token || ''
            });
        });
    } catch (e) {
        res.render('error', {
            message: 'ERROR',
            error: e
        });
    }
});
router.all('/invasion.php', function(req, res) {
    var origin = url.parse(URL.referer);
    var headers = {
        referer: URL.referer,
        origin: origin.protocol + '://' + origin.hostname,
        'user-agent': req.headers['user-agent'],
        'accept-language': req.headers['accept-language']
    };
    request.post(URL.server, {
        form: req.body,
        headers: headers
    }, function(err, data, body) {
        res.end(body);
    });
});
router.get('/login', function(req, res) {
    res.render('login', {
        error: !!req.query.error,
        captcha: req.query.captcha
    });
});

router.post('/login', function(req, res) {
    var rq = request.defaults({
        jar: request.jar(),
        headers: {
            'user-agent': req.headers['user-agent'],
            'accept-language': req.headers['accept-language']
        }
    });
    rq.get('https://vk.com', function(err, data, body) {
        var ip_h, lg_h, captcha = '';
        try {
            ip_h = /ip_h" value="([^"]+)"/gi.exec(body)[1];
            lg_h = /lg_h" value="([^"]+)"/gi.exec(body)[1];
        } catch (e) {
            res.redirect('/login?error=1');
        }

        if (req.body.captcha_key) {
            captcha = ('&captcha_key=' + encodeURIComponent(req.body.captcha_key) + '&captcha_sid=' + req.body.captcha_sid);
        }
        console.log(captcha);
        rq.get(URL.vkAuth + encodeURIComponent(req.body.login) + '&pass=' + encodeURIComponent(req.body.password) + '&ip_h=' + ip_h + '&lg_h=' + lg_h + captcha,
            function(err, data, body) {
                if (body.search('onLoginCaptcha') != -1) {
                    var sid = /onLoginCaptcha\('([\d]+)'/gi.exec(body);
                    return res.redirect('/login?captcha=' + sid[1]);
                };
                rq.get(URL.game, function(err, data) {
                    try {
                        var link = /"src":"([^"]*)"/gi.exec(data.body)[1];
                        link = link.replace(/\\/g, '');
                        URL.referer = link;
                        res.redirect('/?data=' + encodeURIComponent(JSON.stringify({
                            auth_key: /"auth_key":"([0-9a-z]*)"/gi.exec(data.body)[1],
                            viewer_id: /id: ([0-9]*),/gi.exec(data.body)[1],
                            access_token: /"access_token":"([0-9a-z]*)"/gi.exec(data.body)[1],
                            link: link
                        })));
                    } catch (e) {
                        res.redirect('/login?error=1');
                    }
                });
            });
    });
});

module.exports = router;