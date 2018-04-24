<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<meta name="format-detection"
	content="telephone=no,email=no,date=no,address=no">
<title>列表</title>
<link rel="stylesheet" type="text/css" href="../css/aui.css" />
<script type="text/javascript" src="js/ext.js"></script>
<style type="text/css">
.aui-list {
	display: none;
}

.aui-list-item .aui-list-item-text {
	padding: 3px;
}

.aui-list-item-text font {
	float: left;
}
.loadMoreBtn {
	width: 100%;
	height: 2.5rem;
	line-height: 2.5rem;
	text-align:center;
	border-bottom: 1px solid #d3d3d3;
	color: gray;
}
#ulList {min-height: 26rem}
</style>
<script>
window.onscroll = function () {
    var a = document.documentElement.scrollTop == 0 ? document.body.clientHeight : document.documentElement.clientHeight;
    var b = document.documentElement.scrollTop == 0 ? document.body.scrollTop : document.documentElement.scrollTop;
    var c = document.documentElement.scrollTop == 0 ? document.body.scrollHeight : document.documentElement.scrollHeight;
    if (b != 0) {
        if (a + b == c) {
        	loadMore();
        }
    }
};
</script>
</head>
<body>
	<div class="aui-content aui-margin-b-15">
		<ul class="aui-list aui-media-list" id="ulList"></ul>
	</div>
	<div id="loadMoreBtn" class="loadMoreBtn" onclick="loadMore()">加载更多</div>
</body>
<style type="text/css">
.aui-list {
	display: block;
}
</style>
<script type="text/javascript">
	 var page = 1;
	 var hasNext = true;
	 loadMore();
	 function loadMore() {
		 if(hasNext == false) {
			 return;
		 }
		 ajaxPostWithEval("AjaxAction!loadMyRelUnitsProblemList", function(res, result) {
			 if(result == "success") {
				 var li = res['problems'];
				 hasNext = false;
				 for(var i=0;i<li.length;i++) {
					 var item = li[i];
					 ulList.innerHTML += getItem(item.sid, item.text, item.state, item.rem);
					 hasNext = true;
				 }
				 if(hasNext) {
					 page ++;
					 loadMoreBtn.innerText = "加载更多";
				  } else {
					 loadMoreBtn.innerText = "没有更多数据了";
				 }
			 }
		 }, {
			 "page":page
		 });
	}
	
	function itemClicked(sid) {
		startUrl("PageAction!loadProblemPage?problem.sid=" + sid);
	}
	
	function onActivityResult(result) {
			location.reload();
	}
</script>
<script type="text/javascript">
function getItem(sid, text, state, rem) {
	if(state=="dealing") {
		state = "<div class='aui-label aui-label-info'>处理中</div>";
	} else if(state=="finished") {
		state = "<div class='aui-label aui-label-success'>已解决</div>";
	} else {
		state = "<div class='aui-label aui-label-warning'>新问题</div>";
	}
	var itemHtml = "<li class='aui-list-item aui-list-item-middle' onclick='itemClicked("+sid+");'>"
    +"<div class='aui-list-item-inner'>"
        +"<div class='aui-list-item-text'>"
            +"<div class='aui-list-item-title aui-font-size-14' style='width: 15.5rem'>"+text+"</div>"
            +"<div class='aui-list-item-right'>"
					+ state
            +"</div>"
        +"</div>"
        +"<div class='aui-list-item-text'>"
        + rem
        +"</div>"
    	+"</div>"
	+"</li>";
	return itemHtml;
}
</script>
</html>