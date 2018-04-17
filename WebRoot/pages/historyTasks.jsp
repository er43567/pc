<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<link rel="stylesheet" type="text/css" href="../css/aui.css" />
		<title>任务列表</title>
		<style type="text/css">
		  .float-img{background-color:white;position: fixed;top: 78%;left: 78%;z-index: 999;border-radius: 25px;box-shadow:5px 2px 6px #000;}
		  .float-img:ACTIVE {box-shadow:2px 1px 3px #000;top: 78.1%;left: 78.1%;}
		  .loadMoreBtn {
		  	width: 100%;
		  	height: 2.5rem;
		  	line-height: 2.5rem;
		  	text-align:center;
		  	border-top: 1px solid #d3d3d3;
		  	border-bottom: 1px solid #d3d3d3;
		  	color: gray;
		  }
		  #taskList{min-height: 26rem}
		  </style>
		  <script type="text/javascript" src="js/ext.js"></script>
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
		<!-- <header class="aui-bar aui-bar-nav" id="header" style="padding-top:15px; position:fixed;">
		<div class="aui-pull-left aui-padded-l-0">
			<a class=" aui-btn aui-iconfont aui-icon-left" tapmode onclick="closeWin();">返回</a>
		</div>
		<div style="font-weight:bold;" class="aui-title">
			<font size="+1">推送列表</font>
		</div>
		<div class="aui-pull-right">
		</div>
	</header> -->
	<div id="taskList" class="aui-content">
        <!-- <div class="aui-card-list">
            <div class="aui-card-list-header">
                	任务标题<div>⭐⭐⭐</div>
            </div>
            <div class="aui-card-list-content-padded">
                	任务内容。。。。
            </div>
            <div class="aui-card-list-footer">
                <div></div>2018-01-26 XXX公安局XXX发布
            </div>
        </div> -->
     </div>
     <s:if test="#session.user.rank>1">
	 	<img id="float-btn" class="float-img" src="images/加号.png" width="50" height="50" onclick="startUrl('addTask.jsp',['notitle', 'refresh', 'gesture'])"/>
	 </s:if>
	 <div id="loadMoreBtn" class="loadMoreBtn" onclick="loadMore()">加载更多</div>
	</body>
	
	<script src="../script/api.js"></script>
	<script type="text/javascript">
	function onActivityResult(result) {
		location.reload();
	}
	var nextPage = 1;
	var hasNext = true;
	function loadMore() {
		if(hasNext) {
			loadMoreBtn.innerText = "加载中...";
		} else {
			return;
		}
		ajaxPost("AjaxAction!loadTasks", function(r) {
			var res = eval("("+r+")");
			var result = res['result'];
			hasNext = false;
			if("success"==result) {
				var tasks = res['tasks'];
				for(var i=0;i<tasks.length;i++) {
					var item = tasks[i];
					taskList.innerHTML += getItem(item.sid, item.title, item.content, item.time
							, "", item.position, item.userName, item.impt, item.targetNames);
					hasNext = true;
				}
				if(hasNext) {
					nextPage ++;
					loadMoreBtn.innerText = "加载更多";
				} else {
					loadMoreBtn.innerText = "没有更多数据了";
					if(page == 1) {
						//一个数据也没有的时候
						
					}
				}
			};
		}, {"page":nextPage});
	}
	loadMore();
	setTimeout(function() {
		var sid = location.href.substring(location.href.indexOf("#")+1);
		var obj = document.getElementById(sid);
		if(obj==null) {return;}
		obj.style.backgroundColor = "rgba(100,100,0,0.1)";
		location.href = "#" + (sid+1);
		history.back(-1);
	}, 500);
	</script>
	<script type="text/javascript">
	function getItem(sid, title, content, time, scope, position, userName, impt, targetUserNames) {
		var stars = ["⭐","⭐⭐","⭐⭐⭐"];
		var star = stars[impt];
		var itemHtml = 
			"<div id='"+sid+"' class='aui-card-list'>"
			+"        <div class='aui-card-list-header'>"
			+"    	<font size=+1>"+title+"</font><div style='color: gray'>"+star+"</div>"
			+"</div>"
			+"<div class='aui-card-list-content-padded'>"
			+"    	"+content + "<br/><font color='gray' size=-1>(可见人员："+targetUserNames.substring(1)+")</font>"
			+"</div>"
			+"<div class='aui-card-list-footer'>"
			+"    <div>"+scope + position + userName+"&nbsp;发布</div>"+time
			+"</div>"
			+"</div>";
		return itemHtml;
	}
	</script>
</html>
