<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE HTML>
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
		<div id="tab-content-1" class="aui-show tab-content">
         	<!--=====民爆行业折叠 Start=======-->
         	民爆行业
		</div>
		<div id="tab-content-2" class="aui-hide tab-content">
			<!--=====旅馆业折叠 Start=======-->
			旅馆业
		</div>
		<div id="tab-content-3" class="aui-hide tab-content">
			<!--=====三级消防折叠 Start=======-->
			三级消防
		</div>
	</div>
	
	<script type="text/javascript" src="../script/api.js"></script>
	<script type="text/javascript" src="../script/aui-tab.js"></script>
	<script type="text/javascript">
		apiready = function() {
			api.parseTapmode();
		};
		var tab = new auiTab({
			element: document.getElementById("tab"),
		}, function(ret) {
			var parent = document.getElementsByClassName("tab-content");
			for(var i=0;i<parent.length;i++) {
				parent[i].className = parent[i].className.replace("aui-show","aui-hide");
			}
			var o = document.getElementById("tab-content-" + ret.index);
			o.className = o.className.replace("aui-hide","aui-show");
		});
	</script>
	
	<script type="text/javascript">
	function onChooseDate(t) {
		android.show(t);
	}
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