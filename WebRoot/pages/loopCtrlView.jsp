<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>民爆物品领用闭环管理</title>
    <link rel="stylesheet" type="text/css" href="../css/aui.css" />
    <script type="text/javascript" src="js/ext.js"></script>
    <style type="text/css">
    .float-img {background-color:white;position: fixed;top: 78%;left: 78%;z-index: 999;border-radius: 25px;box-shadow:5px 2px 6px #000;}
	.float-img:ACTIVE {box-shadow:2px 1px 3px #000;top: 78.1%;left: 78.1%;}
	
    .aui-list-item-label{font-size: 15px}
    .aui-list-item-input{padding:2px;margin: 3px;}
    .aui-list-header span{color: gray;}
    </style>
</head>
<body>
    <div class="aui-content aui-margin-b-15">
        <ul class="aui-list aui-form-list">
            <li class="aui-list-header">
            	<span class="">${goods.type}</span>
               	<span class="">${goods.userId}</span>
               	<span class="">${goods.unit}</span>
               	<span class="">${goods.time}</span>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-input">
                	单位核定药量 ${goods.unitDefined}<font style='color: gray;' size='-1'>${goods.type=='雷管'?"发":"公斤"}</font>
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-input">
                                        昨日实际库存量 ${goods.yesterdayGained}<font style='color: gray;' size='-1'>${goods.type=='雷管'?"发":"公斤"}</font>
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-input">
                       	今日领取 ${goods.todayGained}<font style='color: gray;' size='-1'>${goods.type=='雷管'?"发":"公斤"}</font>
                    	<div id='confirmed1' style="color: gray;font-size: 11px">已确认：${goods.confirmNames1}</div>
                    </div>
                    <s:if test="#request.goods.confirms1.contains(#session.user.userId)==false && '爆破员 安全员 库管员'.contains(#session.user.position)">
	                    <div style="margin-right: 0.5rem;font-size: 10px;">
	                    	<div class="aui-btn aui-btn-primary" onclick="confirmGoods(this, 1)">确认</div>
	                    </div>
                    </s:if>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-input">
                	今日使用 ${goods.todayUse}<font style='color: gray;' size='-1'>${goods.type=='雷管'?"发":"公斤"}</font>
                    <div id='confirmed2' style="color: gray;font-size: 11px">已确认：${goods.confirmNames2}</div>
                    </div>
                    <s:if test="#request.goods.confirms2.contains(#session.user.userId)==false && '爆破员 安全员 安全负责人'.contains(#session.user.position)">
	                    <div style="margin-right: 0.5rem">
	                    	<div class="aui-btn aui-btn-primary" onclick="confirmGoods(this, 2)">确认</div>
	                    </div>
                    </s:if>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-input">
                                                         今日回库 ${goods.todayReturn}<font style='color: gray;' size='-1'>${goods.type=='雷管'?"发":"公斤"}</font>
                      <div id='confirmed3' style="color: gray;font-size: 11px">已确认：${goods.confirmNames3}</div>
                    </div>
                    <s:if test="#request.goods.confirms3.contains(#session.user.userId)==false && '爆破员 安全员 库管员'.contains(#session.user.position)">
	                    <div style="margin-right: 0.5rem">
	                    	<div class="aui-btn aui-btn-primary" onclick="confirmGoods(this, 3)">确认</div>
	                    </div>
                    </s:if>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-input">
                	今日库存量 ${goods.todayStock}<font style='color: gray;' size='-1'>${goods.type=='雷管'?"发":"公斤"}</font>
                    </div>
                </div>
            </li>
        </ul>
        
        <img id="float-btn" class="float-img" src="images/edit.png" width="50" height="50" onclick="startUrl('PageAction!loadGoodsEditPage?goods.sid=${goods.sid}')"/>
    </div>
</body>
<script type="text/javascript">
function onActivityResult(result) {
	if(result=='refresh') {
		location.reload();
	}
}
</script>
<script type="text/javascript">
function confirmGoods(o, confirmType) {
	ajaxPostWithEval("AjaxAction!confirmGoods", function(res, result) {
		if(result == "success") {
			responsConfirm(o, confirmType);
		}
	}, {
		'goods.sid': ${goods.sid},
		'confirmType':confirmType
	});
}

function responsConfirm(o, confirmType) {
	switch(confirmType) {
	case 1:
		confirmed1.innerText = '已确认：' + ('${goods.confirmNames1}'==''?'${session.user.name}':'${goods.confirmNames1} ' 
				+ '${session.user.name}');
		break;
	case 2:
		confirmed2.innerText = '已确认：' + ('${goods.confirmNames2}'==''?'${session.user.name}':'${goods.confirmNames2} ' 
				+ '${session.user.name}');
		break;
	case 3:
		confirmed3.innerText = '已确认：' + ('${goods.confirmNames3}'==''?'${session.user.name}':'${goods.confirmNames3} ' 
				+ '${session.user.name}');
		break;
	}
	o.parentNode.removeChild(o);
}
</script>
</html>