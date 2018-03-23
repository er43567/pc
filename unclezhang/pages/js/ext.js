function show(obj) {
	obj.style.display = 'inhert';
}
function hide(obj) {
	obj.style.display = 'none';
}
function startUrl(url) {
	var s = "http://" +  location.host + "/unclezhang/pages/" + url;
	location.href = s;
	//android.startWebViewActivity(s, "hideTitleBar nongesture");
}
function closeWin() {
	history.back(-1);
}
