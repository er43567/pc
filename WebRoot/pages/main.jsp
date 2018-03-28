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
    <script type="text/javascript" src="js/ext.js" ></script>
    <style type="text/css">
        .text-white {
            color: #ffffff !important;
        }
        .aui-grid [class*=aui-col-] {
            padding: 0.75rem 0;
        }
        .aui-bg-info{background-color: #16b4f2 !important;}
    </style>
</head>
<body>
    <!-- 顶部 -->
    <section class="aui-content" id="user-info" onclick="startUrl('setting.jsp')">
        <div class="aui-list aui-media-list aui-list-noborder aui-bg-info">
            <div class="aui-list-item-middle"> <!-- class='aui-list-item aui-list-item-middle' -->
                <div class="aui-media-list-item-inner ">
                    <div class="aui-list-item-media" style="width:3rem;">
                        <img src="${session.user.headImg}" class="aui-img-round" style="margin-left: 10px">
                    </div>
                    <div class="aui-list-item-inner aui-list-item-arrow">
                        <div class="aui-list-item-text text-white aui-font-size-18">${session.user.userId}</div>
                        <div class="aui-list-item-text text-white">
                           <div><i class="aui-iconfont aui-icon-my aui-font-size-14"></i> ${session.user.name}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="aui-content aui-grid aui-margin-b-15">
        <div class="aui-row">
            <div class="aui-col-xs-4 aui-border-r">
                <div class="aui-text-warning">
                <img src="img/安全.png" style="width: 35px;margin: auto;">
                </div>
                <div class="aui-gird-lable aui-font-size-14 " style="color: gray;"
                	onclick="startUrl('reportExplosive.jsp')">民爆行业质检</div>
            </div>
            <div class="aui-col-xs-4 aui-border-r">
            	<div class="aui-text-warning">
            	<img src="img/房子.png" style="width: 35px;margin: auto;">
            	</div>
                <div class="aui-gird-lable aui-font-size-14 " style="color: gray;"
                	onclick="startUrl('reportHotal.jsp')">旅馆行业质检</div>
            </div>
            <div class="aui-col-xs-4">
            	<div class="aui-text-warning">
            	<img src="img/消防车.png" style="width: 35px;margin: auto;">
            	</div>
                <div class="aui-gird-lable aui-font-size-14 " style="color: gray;"
                	onclick="startUrl('reportFirefighting.jsp')">三级消防质检</div>
            </div>
        </div>
    </section>
    <section class="aui-content">
        <ul class="aui-list aui-list-in aui-margin-b-15">
        	<li class="aui-list-item" onclick="startReportHistory('historyReports.jsp')">
                <div class="aui-list-item-label-icon">
                    <!-- <i class="aui-iconfont aui-icon-location aui-text-info"></i> -->
                    <img alt="" src="img/历史.png" style="width: 20px;">
                </div>
                <div class="aui-list-item-inner aui-list-item-arrow">
                    <span class="aui-list-item-title">历史质检表单</span>
                    <div id='reportCount' class="aui-badge" style="position: static;">99+</div>
                </div>
            </li>
        	<li class="aui-list-item" onclick="startUrl('noticePage.jsp');">
                <div class="aui-list-item-label-icon">
                    <img alt="" src="img/消息.png" style="width: 20px;">
                </div>
                <div class="aui-list-item-inner aui-list-item-arrow">
                    <div class="aui-list-item-title">我的消息</div>
                    <div id='noticeCount' class="aui-badge" style="position: static;">99+</div>
                </div>
            </li>
           <!--  <li class="aui-list-item">
                <div class="aui-list-item-label-icon">
                    <i class="aui-iconfont aui-icon-image aui-text-info"></i>
                </div>
                <div class="aui-list-item-inner aui-list-item-arrow">
                    <div class="aui-list-item-title"></div>
                </div>
            </li> -->
        </ul>
        
        
        <div class="aui-card-list" >
            <div class="userinfo-header">
                <div class="aui-info">
                    <div class="aui-info-item aui-padded-10">
                        <img src="../image/demo2.png" style="width:2.2rem"/>
                        <span class="aui-margin-l-10 aui-margin-r-10">某某某 发布任务</span>
                        <!-- <i class="aui-iconfont aui-icon-laud aui-text-info "></i> -->
                    </div>
                    <div class="aui-info-item aui-padded-5">2018-03-24</div>
                </div>
            </div>
            <div class="aui-margin-l-10" style="margin-top: -10px">
                	只工作不玩耍，聪明的孩子要变傻
            </div>
            <div class="aui-card-list-footer aui-border-t">
                <div><!-- <i class="aui-iconfont aui-icon-note"></i>  --></div>
                <div><!-- <i class="aui-iconfont aui-icon-laud"></i> 888 --></div>
                <div class="aui-btn aui-btn-outlined" style="padding: 2px"  onclick="startUrl('historyTasks.jsp')">
               		<i class="aui-iconfont aui-icon-menu" style="font-size: 14px;margin-left: 2px"> 任务列表</i>
               	</div>
                <!-- <i class="aui-iconfont aui-icon-menu" style="font-size: 14px"> 打开任务列表</i> --></div>
            </div>
        </div>
    </section>
    <!-- <footer class="aui-bar aui-bar-tab">
        <div class="aui-bar-tab-item">
            <i class="aui-iconfont aui-icon-paper"></i>
            <div class="aui-bar-tab-label">外卖</div>
        </div>
        <div class="aui-bar-tab-item">
            <i class="aui-iconfont aui-icon-menu"></i>
            <div class="aui-bar-tab-label">订单</div>
        </div>
        <div class="aui-bar-tab-item">
            <i class="aui-iconfont aui-icon-location"></i>
            <div class="aui-bar-tab-label">发现</div>
        </div>
        <div class="aui-bar-tab-item aui-active">
            <i class="aui-iconfont aui-icon-my"></i>
            <div class="aui-bar-tab-label">我的</div>
        </div>
    </footer> -->
</body>
<script type="text/javascript" src="js/ext.js"></script>
<script type="text/javascript">
function onActivityResult(result) {
	if('logoff'==result) {
		location.href = "UserAction!logoff";
		android.show('已注销登录');
	}
}
function onResume() {
	updateBadgeNumber();
}
updateBadgeNumber();
function updateBadgeNumber() {
	ajaxPost('AjaxAction!loadIndexDatas',
	function(r) {
		var data = eval("("+r+")");
		result = eval("(" + data['result'] + ")");
		if(result['reportCount']=='0' || result['reportCount']=='') {
			reportCount.style.display = "none";
		} else {
			reportCount.innerText = result['reportCount'];
			reportCount.style.display = "inline-block";
		}
		if(result['noticeCount']=='0' || result['noticeCount']=='') {
			noticeCount.style.display = "none";
		} else {
			noticeCount.innerText = result['noticeCount'];
			noticeCount.style.display = "inline-block";
		}
		
	}, null);
}
</script>

</html>