<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <title>流程管控</title>
    <link rel="stylesheet" type="text/css" href="../css/aui.css" />
    <script type="text/javascript" src="js/ext.js"></script>
    <style type="text/css">
    label{margin-left: 0.4rem}
    input[type=text],textarea{border: 1px solid #d2d2d2;margin: 2px;}
    </style>
    <script type="text/javascript">
    function showDetails() {
        android.showListDialog(["D：由民爆单位安全负责人、法人代表确认整改到位后验收。"
                                ,"C：由辖区派出所监管民警、分管副大队长、所长确认整改到位后验收。"
                                ,"B：由分局监管民警、分管副大队长、大队长、局领导确认整改到位后验收。"
                                ,"A：预留"]
        , "onChoose");
    }
    function onChoose(n) {
    	document.getElementById("risk"+(Number(n)+1)).click();
    };
    </script>
</head>
<body>
    <div class="aui-content aui-margin-b-15">
        <ul class="aui-list aui-form-list">
            <li class="aui-list-header" style="color: gray;">
            ${request.problem.rem}
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                        	风险等级
                    </div>
                    <div class="aui-list-item-input" style="">
                        <label><input id="risk1" class="aui-radio" type="radio" name="risk" checked onclick="riskChecked(1)"> D</label>
                        <label><input id="risk2" class="aui-radio" type="radio" name="risk" onclick="riskChecked(2)"> C</label>
                        <label><input id="risk3" class="aui-radio" type="radio" name="risk" onclick="riskChecked(3)"> B</label>
                        <label><input id="risk4" class="aui-radio" type="radio" name="risk" disabled="disabled" onclick="riskChecked(4)"> A</label>
                    </div>
                    <!-- <div onclick="showDetails()" class="aui-btn-info" 
                    	style="padding-left:3px;margin: 3px;width: 3rem">详细</div> -->
                    	<div class="aui-btn aui-btn-sm" onclick="showDetails()" 
                    		style="margin: 3px">详细</div>
                </div>
            </li>
            
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                        	整改措施
                    </div>
                    <div class="aui-list-item-input">
                        <textarea id="measure" style="margin: 2px">${request.problem.measure}</textarea>
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                       	 整改期限
                    </div>
                    <div class="aui-list-item-input">
                        <input id="expire" type="text" value="${request.problem.expire}"/>
                    </div>
                </div>
            </li>
            
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                        	整改负责人
                    </div>
                    <div class="aui-list-item-input">
                        <select id="functionary" class="aui-btn aui-btn-outlined"
                        	 style="text-align:center;">
                        	 <s:iterator value="#request.users" id='item' status="st">
                        	 	<option value="${item.userId}">${item.name}</option>
                        	 </s:iterator>
                        </select>
                    </div>
                </div>
            </li>
            <s:if test="#session.user.userId==#request.problem.userId">
	            <li class="aui-list-item" id="itemCreate">
	                <div class="aui-list-item-inner" style="height: 3rem">
	                    <div class="aui-list-item-input">
	                        <div class="aui-btn aui-btn-block aui-btn-sm"
	                        	onclick="updateAndNoticeProblem()">创建表单并推送</div>
	                    </div>
	                </div>
	            </li>
            </s:if>
        </ul>
    </div>
</body>
<script type="text/javascript">
var risk = 1;
function riskChecked(n) {
	if(n!=4)
		risk = n;
}

function updateAndNoticeProblem() {
	android.showProgressDialog("请稍候...");
	ajaxPostWithEval("AjaxAction!firstUpdateAndNoticeProblem", function(res, result) {
		if(result!='fail') {
			itemCreate.style.display = 'none';
			android.show("成功");
			location.reload();
		}
		android.cancelProgressDialog();
	}, {
		"problem.sid":'${request.problem.sid}',
		"problem.ref":'${request.problem.ref}',
		"problem.risk":risk,
		"problem.measure":escape(measure.value),
		"problem.expire":escape(expire.value),
		"problem.functionary":functionary.value
	});
}
</script>
</html>