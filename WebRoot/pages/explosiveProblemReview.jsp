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
    label{margin-left: 0.4rem;}
    input[type=text],textarea{border: 1px solid #d2d2d2;margin: 2px;}
    .aui-list-item-input{color: gray;}
    </style>
    <script type="text/javascript">
    function showDetails() {
        android.showListDialog([
                                "A：由民爆单位安全负责人、法人代表确认整改到位后验收。"
                                ,"B：由辖区派出所监管民警、分管副大队长、所长确认整改到位后验收。"
                                ,"C：由分局监管民警、分管副大队长、大队长、局领导确认整改到位后验收。"]
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
				<div>
					${request.problem.time}
					<span onclick="startList()" class="aui-label-info" style="padding:2px">查看原表单</span>
					<script type="text/javascript">
					function startList() {
						startUrl("PageAction!loadReportReceivePage?report.sid=${request.problem.ref}");
					}
					</script>
				 </div>
            </li>
            
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                        	等级风险
                    </div>
                    <div id="riskLevel" class="aui-list-item-input" style="padding-left: 1rem;" >
                    ${request.problem.risk}
                    </div>
                    <script type="text/javascript">
                    var colors = ["gray","gray","orange","red"];
                    riskLevel.style.color = colors[parseInt(riskLevel.innerText)];
                    riskLevel.innerText = String.fromCharCode((Number(riskLevel.innerText)+64));
                    </script>
                    <div class="aui-btn aui-btn-sm" onclick="showDetails()" 
                    		style="margin: 3px">详细</div>
                    <!-- <div onclick="showDetails()" class="aui-btn-info"
                    	 style="padding-left:3px;margin: 3px;width: 3rem">详细</div> -->
                </div>
            </li>
            
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                        	整改措施
                    </div>
                    <div class="aui-list-item-input">
                    ${request.problem.measure}
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                       	 整改期限
                    </div>
                    <div class="aui-list-item-input">
                    ${request.problem.expire}
                    </div>
                </div>
            </li>
            
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                        	整改负责人
                    </div>
                    <div class="aui-list-item-input">
                    ${request.problem.functionaryName==null?"":request.problem.functionaryName.substring(1)}
                    </div>
                </div>
            </li>
            
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                        	待验收
                    </div>
                    <div id="accepting-div" class="aui-list-item-input">
                    ${request.problem.acceptingUserName}
                    </div>
                </div>
            </li>
            
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                        	已验收
                    </div>
                    <div id="accepted-div" class="aui-list-item-input">
                    ${request.problem.acceptedUserName}
                    </div>
                </div>
            </li>
            
            <li id="resultItem" class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                        	批示
                    </div>
                    <div id="resultContent" class="aui-list-item-input">
                    ${request.problem.results}
                    </div>
                    <s:if test="#request.problem.targetIds.contains(#session.user.userId)">
                    <s:if test="#request.problem.state=='dealing'">
                    	<%-- <s:if test="#request.problem.acceptedIds==null || #request.problem.acceptedIds.contains(#session.user.userId) == false"> --%>
                    	<div class="aui-btn aui-btn-sm" onclick="addResult()" style="margin: 3px">添加</div>
                    	<%-- </s:if> --%>
                    </s:if>
                    </s:if>
                </div>
            </li>
            <s:if test="#request.problem.targetIds.contains(#session.user.userId)">
            	<s:if test="#request.problem.acceptedIds==null || #request.problem.acceptedIds.contains(#session.user.userId) == false">
		            <li class="aui-list-item">
		                <div class="aui-list-item-inner">
		                    <div class="aui-list-item-label">
		                        	验收
		                    </div>
		                    <div class="aui-list-item-input">
		                        <div class="aui-btn aui-btn-block aui-btn-sm"
		                        	onclick="confirmProblem()">确认整改到位</div>
		                    </div>
		                </div>
		            </li>
	            </s:if>
            </s:if>
        </ul>
    </div>
</body>
<script type="text/javascript" src="../script/api.js" ></script>
<script type="text/javascript" src="../script/aui-dialog.js" ></script>

<script type="text/javascript">
var results = "";
function addResult() {
	var dialog = new auiDialog();
	dialog.prompt({
		title : "添加批示",
		text : '',
		type : 'number',
		buttons : [ '取消', '确定' ]
	}, function(ret) {
		if (ret.buttonIndex == 2) {
			if(ret.text == "") {
				android.show("不能为空");
				addResult();
				return;
			}
			addProblemResult(ret);
		}
	});
}

function addProblemResult(ret) {
	var tmpResult = resultContent.innerText;
	if(tmpResult=="") {
		tmpResult += "(1) ${session.user.name}:" + ret.text +"\n--- "+ new Date().toLocaleDateString() + " ---";
	} else {
		var count = 2;
		for(var i=0;i<tmpResult.length;i++){
			if(tmpResult[i]=="\n") {
				count++;
			}
		}
		tmpResult += "\n(" + (count+1)/2 + ") ${session.user.name}:" 
			+ ret.text +"\n--- "+new Date().toLocaleDateString() + " ---";
	}
	
	ajaxPostWithEval("AjaxAction!addProblemResult", function(res, result) {
		if("success"==result) {
			resultContent.innerText = tmpResult;
		} else {
			android.show("失败了");
		}
	}, {
		"problem.results": escape(tmpResult)
		,"problem.sid":'${request.problem.sid}'
	});
}
function confirmProblem() {
	var sid = '${request.problem.sid}';
	ajaxPostWithEval("AjaxAction!confirmProblem"
	, function(rst, result) {
		if("success"==result) {
			addProblemResult({text:"[已验收]"});
			location.reload();
		}
	}, {
		"problem.sid":sid
	});
}
</script>
</html>