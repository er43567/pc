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
</head>
<body>
    <div class="aui-content aui-margin-b-15">
        <ul class="aui-list aui-form-list">
            <li class="aui-list-header" id="type">
	            <label><input class="aui-radio" type="radio" name="types" id='zy' checked="checked" value="炸药"> &nbsp;&nbsp;&nbsp;炸药</label>
	        	<label><input class="aui-radio" type="radio" name="types" id='lg' value="雷管"> &nbsp;&nbsp;&nbsp;雷管</label>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                	单位核定药量
                    </div>
                    <div class="aui-list-item-input">
                    	${goods.unitDefined}
                        <input type="number" id="unitDefined" disabled="disabled">
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                                        昨日实际库存量
                    </div>
                    <div class="aui-list-item-input">
                    	${goods.yesterdayGained}
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                                        今日领取
                    </div>
                    <div class="aui-list-item-input">
                    	${goods.todayGained}
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                	今日使用
                    </div>
                    <div class="aui-list-item-input">
                    	${goods.todayUse}
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                                        今日回库
                    </div>
                    <div class="aui-list-item-input">
                    	${goods.todayReturn}
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                	今日库存量
                    </div>
                    <div class="aui-list-item-input">
                    	${goods.todayStock}
                    </div>
                </div>
            </li>
            
            <li class="aui-list-item" id="submitLi">
                <div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
                    <div
                     	class="aui-btn aui-btn-info aui-margin-r-5"
                    	onclick="submit();">提交</div>
                   <!--  <div class="aui-btn aui-btn-danger aui-margin-l-5">取消</div> -->
                </div>
            </li>
        </ul>
    </div>
</body>
<script type="text/javascript">
function submit() {
	var type = "炸药";
	if(lg.checked) {
		type = "雷管";
	}
	ajaxPost("AjaxAction!saveGoods", function(r) {
		var res = eval("("+r+")");
    	var result = res['result'];
		if("success"==result) {
			//submitLi.style.display = "none";
			location.replace("PageAction!loadGoodsList");
		}
	}, {
		"goods.type":type,
		"goods.unitDefined":unitDefined.value,
		"goods.yesterdayGained":yesterdayGained.value,
		"goods.todayGained":todayGained.value,
		"goods.todayUse":todayUse.value,
		"goods.todayReturn":todayReturn.value,
		"goods.todayStock":todayStock.value
	});
}
</script>
</html>