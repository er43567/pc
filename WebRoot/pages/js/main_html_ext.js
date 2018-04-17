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
	android.show("网络异常，请检查网络连接是否打开");
}
function startReportHistory(url, unitName) {
	if(isWebView) {
		var s_url = "http://" +  location.host + "/unclezhang/pages/" + url;
		android.startHistoryReportsActivity(s_url, unitName);
		android.show("网络异常，请检查网络连接是否打开");
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
