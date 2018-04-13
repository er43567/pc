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
            <b><li class="aui-list-header" id="type">
            <label><input class="aui-radio" type="radio" name="demo" checked="checked" value="0"> &nbsp;&nbsp;&nbsp;&nbsp;炸药</label>
        	<label><input class="aui-radio" type="radio" name="demo" value="1"> &nbsp;&nbsp;&nbsp;&nbsp;雷管</label>
            </li>
            </b>
            <!-- 
            //id,unitDefined 核定药量，yesterdayGained昨日领取，todayGained今日领取，todayUse 今日使用，todayStock今日回库，todayStock进入实际存库量
	int sid, unitDefined, yesterdayGained, todayGained, todayUse, todayReturn, todayStock;
	//type 类型：炸药，雷管
	String type, unit, userId, targetIds, acceptedIds;
             -->
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
	ajaxPost("AjaxAction!saveGoods", function(r) {
		var res = eval("("+r+")");
    	var result = res['result'];
		if("success"==result) {
			//submitLi.style.display = "none";
			location.replace("PageAction!loadGoodsList");
		}
	}, {
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