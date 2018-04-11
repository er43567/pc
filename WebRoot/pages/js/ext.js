function show(obj) {
	obj.style.display = 'inhert';
}
function hide(obj) {
	obj.style.display = 'none';
}

function getParam(name) {
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null) return unescape(r[2]); return null;
}
isWebView = false;
function startUrl(url) {
	startUrl(url, null, null);
}

function startUrl(url, attrs, param) {
	var s = "http://" +  location.host + "/unclezhang/pages/" + url;
	if(isWebView) {
		/*if(attrs == null || (''+attrs)=='undefined') {
			android.startActivity(s, null, param);
		} else {
			android.startActivity(s, attrs, param);
		}*/
		if(attrs!=null)
			attrs.push('refresh');
		else
			attrs = ['refresh', 'title', 'nogesture'];
		android.startActivity(s, attrs, param);
	} else {
		location.href = s;
	}
	//android.startWebViewActivity(s, "hideTitleBar nongesture");
}

function startReportHistory(url, userId) {
	if(isWebView) {
		var s_url = "http://" +  location.host + "/unclezhang/pages/" + url;
		android.startHistoryReportsActivity(s_url + "?userId=" + userId, userId);
	} else {
		startUrl(url);
	}
}

function startUrlWithoutResult(url) {
	var s_url = "http://" +  location.host + "/unclezhang/pages/" + url;
	android.startActivityWithoutResult(s_url, null, null);
}

function onPageFinished(param) {
	isWebView = true;
	onLoadData(param);
}

function closeWin() {
	history.back(-1);
}

function onWebView() {
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
	var source = "<html>" + document.getElementsByTagName("html")[0].innerHTML + "</html>";
	android.show(source)
	//return escape(source);
}

function ajaxPost(url, callback, params) {
	ajax({
        type : 'POST',
        url : url,
        data : params,
        success : callback
	});
}
/**
 * main.jsp页面中
 */
function ajaxPostWithEval(url, callback, params) {
	ajax({
        type : 'POST',
        url : url,
        data : params,
        success : function(r) {
        	var res = eval("("+r+")");
        	var result = res['result'];
        	callback(res, result);
        }
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
        method: 'POST', //提交方法
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
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}



