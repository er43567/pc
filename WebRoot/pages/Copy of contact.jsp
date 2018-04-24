<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>通讯录</title>
    <link rel="stylesheet" type="text/css" href="../css/aui.css" />
</head>
<body>
	<div class="aui-content">
        <div class="aui-row">
            <div class="aui-col-xs-3 aui-border-r" id="left">
                <ul class="aui-list aui-list-noborder aui-margin-b-0" id="leftTab">
                	
                    <li data-id="1" class="aui-list-item aui-active">
                        <div class="aui-list-item-inner">
                            Item
                        </div>
                    </li>
                    
                </ul>
            </div>
            <div class="aui-col-xs-9" id="right">
            	
            </div>
        </div>
    </div>
        <ul class="aui-list aui-media-list">
            <li class="aui-list-header">
                	通讯录列表
            </li>
            <s:iterator id="item" value="#request.users" status="st">
	            <li class="aui-list-item aui-list-item-middle" onclick="android.callUp('${item.phone}')">
	                <div class="aui-media-list-item-inner">
	                    <div class="aui-list-item-media" style="width: 2.2rem;">
	                        <img src="${item.headImg}" class="aui-img-round aui-list-img-sm">
	                    </div>
	                    <div class="aui-list-item-inner "><!-- aui-list-item-arrow -->
	                        <div class="aui-list-item-text">
	                            <div class="aui-list-item-title aui-font-size-14">${item.name}</div>
	                            <!-- <div class="aui-list-item-right">08:00</div> -->
	                        </div>
	                        <div class="aui-list-item-text">
	                        	${item.position} tel:${item.phone}
	                        </div>
	                    </div>
	                </div>
	            </li>
            </s:iterator>
        </ul>
</body>
<script type="text/javascript">

</script>
<script type="text/javascript" src="../script/aui-collapse.js" ></script>
<script type="text/javascript">
    apiready = function () {
        api.parseTapmode();
    }
    var collapse = new auiCollapse({
        autoHide:true //是否自动隐藏已经展开的容器
    });
</script>
</html>