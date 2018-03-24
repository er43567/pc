

function show(obj) {
	obj.style.display = 'inhert';
}
function hide(obj) {
	obj.style.display = 'none';
}
var isWebView = false;
function startUrl(url) {
	startUrl(url, null);
}

function startUrl(url, attrs) {
	var s = "http://" +  location.host + "/unclezhang/pages/" + url;
	if(isWebView) {
		if(attrs == null || (''+attrs)=='undefined') {
			android.startActivity(s);
		} else {
			android.startActivity(s, attrs);
		}
	} else {
		location.href = s;
	}
	//android.startWebViewActivity(s, "hideTitleBar nongesture");
}

function startReportHistory(url) {
	if(isWebView) {
		var s_url = "http://" +  location.host + "/unclezhang/pages/" + url;
		android.startReportActivity(s_url);
	} else {
		startUrl(url);
	}
}

function closeWin() {
	history.back(-1);
}

function onFinished(v) {
	isWebView = true;
}


Array.prototype.contains = function (obj) {
    var i = this.length;
    while (i--) {
        if (this[i] === obj) {  
            return true;
        }
    }
    return false; 
}
Array.prototype.remove = function (obj) {
	if(this.length === 1) {
		this.length = 0;
	}
	var i;
	for(i=0;i<this.length;i++) {
		if(obj===this[i]) {
			break;
		}
	}
	if(i<this.length) {
		for(var j=i;j<this.length-1;j++) {
			this[j] = this[j+1];
		}
		this.length--;
	}
};

function getSource() {
	return "<html>" + document.getElementsByTagName("html")[0].innerHTML + "</html>";
}

function load(url, callback, params) {
	ajax({
        type : 'POST',
        url : url,
        data : params,  
        success : callback
	});
}

function ajax(options) {
    function empty() {}
    function obj2Url(obj) {
        if (obj && obj instanceof Object) {
            var arr = [];
            for (var i in obj) {
                if (obj.hasOwnProperty(i)) {
                    if (typeof obj[i] == 'function') obj[i] = obj[i]();
                    if (obj[i] == null) obj[i] = '';
                    arr.push(escape(i) + '=' + escape(obj[i]));
                }
            }
            return arr.join('&').replace(/%20/g, '+');
        } else {
            return obj;
        }
    };
    var opt = {
        url: '', //请求地址
        sync: true, //true，异步 | false　同步，会锁死浏览器，并且open方法会报浏览器警告
        method: 'GET', //提交方法
        data: null, //提交数据
        username: null, //账号
        password: null, //密码
        dataType: null, //返回数据类型
        success: empty, //成功返回回调
        error: empty, //错误信息回调
        timeout: 0, //请求超时ms
    };
    for (var i in options) if (options.hasOwnProperty(i)) opt[i] = options[i];
    var accepts = {
        script: 'text/javascript, application/javascript, application/x-javascript',
        json: 'application/json',
        xml: 'application/xml, text/xml',
        html: 'text/html',
        text: 'text/plain'
    };
    var abortTimeout = null;
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
            xhr.onreadystatechange = empty;
            clearTimeout(abortTimeout);
            var result,dataType, error = false;
            if ((xhr.status >= 200 && xhr.status < 300) || xhr.status == 304 || (xhr.status == 0 && protocol == 'file:')) {
                if (xhr.responseType == 'arraybuffer' || xhr.responseType == 'blob') {
                    result = xhr.response;
                } else {
                    result = xhr.responseText;
                    dataType = opt.dataType ? opt.dataType : xhr.getResponseHeader('content-type').split(';', 1)[0];
                    for (var i in accepts) {
                        if (accepts.hasOwnProperty(i) && accepts[i].indexOf(dataType) > -1) dataType = i;
                    }
                    try {
                        if (dataType == 'script') {
                            eval(result);
                        } else if (dataType == 'xml') {
                            result = xhr.responseXML
                        } else if (dataType == 'json') {
                            result = result.trim() == '' ? null : JSON.parse(result)
                        }
                    } catch (e) {
                        opt.error(e, xhr);
                        xhr.abort();
                    }
                }
                opt.success(result, xhr);
            } else {
                opt.error(xhr.statusText, xhr);
            }
        }
    };
    if (opt.method == 'GET') {
        var parse = opt.url.parseURL();
        opt.data = Object.assign({}, opt.data, parse.params);
        opt.url = parse.pathname + '?' + obj2Url(opt.data);
        opt.data = null;
    }
    xhr.open(opt.method, opt.url, opt.sync, opt.username, opt.password);
    if (opt.method == 'POST') xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    if (opt.timeout > 0) {
        abortTimeout = setTimeout(function() {
            xhr.onreadystatechange = empty
            xhr.abort();
            opt.error('timeout', xhr);
        }, opt.timeout)
    }
    xhr.send(opt.data ? obj2Url(opt.data) : null);
}
String.prototype.parseURL = function() {
    'use strict';
    //url解析
    var url = this.toString()
    var a = document.createElement('a');
    a.href = url;
    return {
        source: url,
        protocol: a.protocol,
        origin: a.origin,
        hostname: a.hostname,
        port: a.port,
        search: a.search,
        file: (a.pathname.match(/\/([^\/?#]+)$/i) || [, ''])[1],
        hash: a.hash.replace('#', ''),
        pathname: a.pathname.replace(/^([^\/])/, '/$1'),
        relative: (a.href.match(/tps?:\/\/[^\/]+(.+)/) || [, ''])[1],
        segments: a.pathname.replace(/^\//, '').split('/'),
        params: (function() {
            var ret = {};
            var seg = a.search.replace(/^\?/, '').split('&').filter(function(v, i) {
                if (v !== '' && v.indexOf('=')) {
                    return true;
                }
            });
            for (var i = 0, element; element = seg[i++];) {
                var idx = element.indexOf('=');
                var key = element.substring(0, idx);
                var val = element.substring(idx + 1);
                ret[key] = val;
            }
            return ret
        })()
    }
};


