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
    .aui-list-item-label{font-size: 15px}
    input[type=number]{padding:2px;border: 1px solid #f3f3f3;margin: 3px;}
    </style>
</head>
<body>
    <div class="aui-content aui-margin-b-15">
        <ul class="aui-list aui-form-list">
            <li class="aui-list-header" id="type">
	            <label><input class="aui-radio" type="radio" name="demo" onclick="radioChecked(this.value)" checked="checked" value="炸药"> 炸药（单位：公斤）</label>
	        	<label><input class="aui-radio" type="radio" name="demo" onclick="radioChecked(this.value)" value="雷管"> 雷管（单位：发）</label>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                	单位核定药量
                    </div>
                    <div class="aui-list-item-input">
                        <input type="number" id="unitDefined">
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                                        昨日实际库存量
                    </div>
                    <div class="aui-list-item-input">
                        <input type="number" id="yesterdayGained">
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                                        今日领取
                    </div>
                    <div class="aui-list-item-input">
                        <input type="number" id="todayGained" >
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                	今日使用
                    </div>
                    <div class="aui-list-item-input">
                        <input type="number" id="todayUse" >
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                                        今日回库
                    </div>
                    <div class="aui-list-item-input">
                        <input type="number" id="todayReturn">
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                	今日库存量
                    </div>
                    <div class="aui-list-item-input">
                        <input type="number" id="todayStock">
                    </div>
                </div>
            </li>
            
            <li class="aui-list-item" id="submitLi">
                <div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
                    <div id='submitBtn' class="aui-btn aui-btn-info aui-btn-block"
                    	onclick="submit();">提交</div>
                </div>
            </li>
        </ul>
    </div>
</body>
<script type="text/javascript">
var type = "炸药";
function radioChecked(s) {
	type = s;
}
var submited = false;
function submit() {
	if(submited) {
		android.show("正在保存中，请稍候");
		return;
	}
	submitBtn.innerText = "提交中...";
	ajaxPost("AjaxAction!saveGoods", function(r) {
		var res = eval("("+r+")");
    	var result = res['result'];
		if("success"==result) {
			setTimeout(function() {
				android.closeActivity('refresh');
			}, 500);
			submited = true;
		}
	}, {
		"goods.type":escape(type),
		"goods.unitDefined":unitDefined.value,
		"goods.yesterdayGained":yesterdayGained.value,
		"goods.todayGained":todayGained.value,
		"goods.todayUse":todayUse.value,
		"goods.todayReturn":todayReturn.value,
		"goods.todayStock":todayStock.value,
	});
}
</script>
</html>