<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title></title>
    
    <link rel="stylesheet" type="text/css" href="../css/aui.css" />
    
    <link rel="stylesheet" href="css/ext.css" />
    
    <script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
    
    <script type="text/javascript" src="js/ext.js" ></script>
    
    <style type="text/css">
    html,body {height:100%}
    </style>
    
</head>

<body>
	<!--<header class="aui-bar aui-bar-nav" id="header" style="padding-top:15px; position:fixed;">
		<div class="aui-pull-left aui-padded-l-0">
			<a class=" aui-btn aui-iconfont aui-icon-left" tapmode onclick="closeWin();"></a>
		</div>
		<div class="aui-title">
			上报历史
		</div>
		<div class="aui-pull-right">
			<a class="aui-btn aui-iconfont aui-icon-refresh" href=""></a>
		</div>
	</header>
	<div class="header-bottom"></div>-->
	
	
	<div class="aui-tab" id="tab">
		<div class="aui-tab-item aui-active">民爆行业</div>
		<div class="aui-tab-item">旅馆业</div>
		<div class="aui-tab-item">三级消防</div>
	</div>
	<div style="height:45px;"></div>
	<style>
	.aui-tab {
		position: fixed;
	    z-index: 10;
	    right: 0;
	    left: 0;
    }
	</style>
	<div class="tab-contents">
		<div id="tab-content-1" class="aui-show tab-content" style="height: 100%">
         	<!--=====民爆行业折叠 Start=======-->
         	<iframe id="explosiveFrame" src="" style="width: 100%;height:100%;border: none;" ></iframe>
		</div>
		<div id="tab-content-2" class="aui-hide tab-content">
			<!--=====旅馆业折叠 Start=======-->2
			<iframe id="hotalFrame" src="" style="width: 100%;height:100%;border: none;" ></iframe>
		</div>
		<div id="tab-content-3" class="aui-hide tab-content">
			<!--=====三级消防折叠 Start=======-->3
			<iframe id="firefightingFrame" src="" style="width: 100%;height:100%;border: none;" ></iframe>
		</div>
	</div>
	<script type="text/javascript" src="../script/api.js"></script>
	<script type="text/javascript" src="../script/aui-tab.js"></script>
	<script type="text/javascript">
		apiready = function() {
			api.parseTapmode();
		};
		var currentTab = 1;
		var tab = new auiTab({
			element: document.getElementById("tab"),
		}, function(ret) {
			var parent = document.getElementsByClassName("tab-content");
			for(var i=0;i<parent.length;i++) {
				parent[i].className = parent[i].className.replace("aui-show","aui-hide");
			}
			var o = document.getElementById("tab-content-" + ret.index);
			o.className = o.className.replace("aui-hide","aui-show");
			currentTab = ret.index;
			onChooseDate(date);
		});
	</script>
	
	<script type="text/javascript">
	
	onChooseDate(getNowFormatDate());
	
	var date;
	function onChooseDate(t) {
		date = t;
		if(currentTab == 1) {
			document.getElementById('explosiveFrame').src = "PageAction!loadReportsByDate?report.type=ExplosiveReport&report.time=" + escape(t);
		} else if(currentTab == 2) {
			document.getElementById('hotalFrame').src = "PageAction!loadReportsByDate?report.type=HotalReport&report.time=" + escape(t);
		} else if(currentTab == 3) {
			document.getElementById('firefightingFrame').src = "PageAction!loadReportsByDate?report.type=FirefightingReport&report.time=" + escape(t);
		}
	}
	
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
	//android.setChoosedTime("2018-03-25");
 	/* startUrl("login.jsp");
	
	function startUrl(url) {
		startUrl(url, null, null);
	}
	function startUrl(url, attrs, param) {
		var s = "http://" +  location.host + "/unclezhang/pages/" + url;
		if(attrs!=null)
			attrs.push('refresh');
		else
			attrs = ['refresh', 'title', 'nogesture'];
		android.startActivity(s, attrs, param);
	} */
 
	</script>
	<!--<section>
        <ul class="aui-list aui-collapse">
            <div class="aui-collapse-item aui-active">
                <div class="aui-list-item aui-collapse-header">
                    <div class="aui-list-item-inner">
                        <div class="aui-list-item-title">库管检查</div>
                        <div class="aui-list-item-right">
                            <i class="aui-iconfont aui-icon-down aui-collapse-arrow"></i>
                        </div>
                    </div>
                </div>
                <div class="aui-collapse-content aui-show">
                </div>
            </div>
            
            <div class="aui-collapse-item">
                <li class="aui-list-item aui-collapse-header">
                    <div class="aui-list-item-inner">
                        <div class="aui-list-item-title">安全检查</div>
                        <div class="aui-list-item-right">
                            <i class="aui-iconfont aui-icon-down aui-collapse-arrow"></i>
                        </div>
                    </div>
                </li>
                <div class="aui-collapse-content">
                    
                </div>
            </div>
        </ul>
    </section>
    <script type="text/javascript" src="../script/api.js" ></script>
	<script type="text/javascript" src="../script/aui-collapse.js" ></script>
	<script type="text/javascript">
	    apiready = function () {
	        api.parseTapmode();
	    }
	    var collapse = new auiCollapse({
	        autoHide:true //是否自动隐藏已经展开的容器
	    });
	</script>
    -->
	
</body>
</html>