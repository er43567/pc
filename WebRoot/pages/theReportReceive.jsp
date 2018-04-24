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
    <title>三查表单</title>
    
    <link rel="stylesheet" type="text/css" href="../css/aui.css" />
    <link rel="stylesheet" href="css/ext.css" />
    
    <script type="text/javascript" src="js/ext.js" ></script>
    
</head>
<body>
	
     <div class="aui-content aui-margin-b-15">
       <ul class="aui-list aui-select-list">
       <li class="aui-list-header">
       	<div>三查表单 [创建于:${request.report.time.substring(0,10)}]</div>
       	<s:if test="#session.user.userId==#request.report.userId">
	       	<%-- <div style="background-color: #03a9f4;padding:2px;color: white;"
	       		onclick="startUrlWithoutResult('PageAction!loadReportEditPage?report.sid=${request.report.sid}')">修改表单</div> --%>
       	</s:if>
       	<s:else>
       		<%-- <a href="javascript:android.callUp('${request.report.phone}')"
       			 style="background-color: #03a9f4;padding:2px;color: white;"
       			 >联系${request.report.userName}</a> --%>
       			<div class="aui-label aui-label-info" onclick="android.callUp('${request.report.phone}')">
       			联系${request.report.userName}
       			</div>
       	</s:else>
       </li>
       	<!--<font color="gray"><b>检查项目</b></font>-->
        <s:iterator id="item" value="#request.report.reportItems" status="st">
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	  <div style="color: blue">${item}</div>
                </div>
                <div class="aui-text-right">
                	<label id="info${st.index+1}" class="aui-text-info">
                	${request.report.items[st.index]}
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(st.index, st.index+1)}"> 是</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(st.index, st.index+1)}" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
         </s:iterator>
        
         	 <s:if test="#request.report.imgs!=''">
	            <li class="aui-list-item">
	          		<div class="aui-list-item-inner">
	          		<%@include file="imageviewer.jsp" %>
	             	</div>
	          	</li>
	         </s:if>
         
         	<li class="aui-list-item">
          		<div class="aui-list-item-inner">
                  	<div class="aui-list-item-input">
                      	<div class="aui-list-item-text" style="font-size: 16px">
                      	备注：${request.report.rem}
                		</div>
               		</div>
             	</div>
          	</li>
          	
          	<s:if test="#session.user.position=='安全员' && #request.report.choices.replaceAll('1','')==''">
          		<s:if test="#request.report.softerConfirm==0">
          			<li class="aui-list-item" id="softerConfirmLi">
		                <div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
		                    <div id="softerConfirmBtn" class="aui-btn aui-btn-info aui-btn-block aui-btn-height-50px"
		                    	onclick="softerConfirm();">安全员确认</div>
		                </div>
		            </li>
          		</s:if>
          		<s:else>
          			<li class="aui-list-item" id="softerConfirmLi" style="padding: 0px">
	          			<div style="width: auto;margin: auto;color: gray;">值班安全人员已确认</div>
		            </li>
          		</s:else>
          	</s:if>
          	
          	<s:if test="#request.report.choices.replaceAll('1','')!=''">
          	<li class="aui-list-item">
                <div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
                    <div id="processCtrlBtn" class="aui-btn aui-btn-info aui-btn-block aui-btn-height-50px"
                    	onclick="beginProcessControl()">流程管控</div>
                </div>
            </li>
            </s:if>
          	<!-- <li class="aui-list-item">
                <div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
                    <div id="saveButton" class="aui-btn aui-btn-info aui-btn-block aui-btn-height-50px"
                    	onclick="saveReport()">保存表单</div>
                </div>
            </li> -->
            <%-- <li class="aui-list-item">
                <div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
                    <div id="chooseUserBtn" style="overflow: scroll;text-align: center;"
                    	 onclick="chooseUser()">
                    	选择目标人员 <s:property value="#request.report.targets.split('##')[0].substring(1)"/>
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
                    <div id="pushButton" class="aui-btn aui-btn-info aui-btn-block aui-btn-height-50px"
                    	onclick="noticeView()">通知目标人员查看</div>
                </div>
            </li> --%>
		</ul>
		<%@include file="reply.jsp"%>
	</div>
	<input type="hidden" id="thisReport" value="${request.report.sid}"/>
</body>
<%-- <script type="text/javascript">
var interceptStete = true;
setInterval(function(){
	var b = document.documentElement.scrollTop == 0 ? document.body.scrollTop : document.documentElement.scrollTop;
    if (b == 0) {
    	android.interceptScroll(false);
    	interceptStete = false;
    } else {
    	if(interceptStete == false) {
    		android.interceptScroll(true);
    		interceptStete = true;
    	}
    }
}, 100);
</script> --%>
<script type="text/javascript" src="../script/api.js" ></script>
<script type="text/javascript" src="../script/aui-dialog.js" ></script>
<script type="text/javascript">
function softerConfirm() {
	ajaxPostWithEval("AjaxAction!softerConfirmReport", function(res, result) {
		if("success"==result) {
			softerConfirmLi.innerHTML = "<div style=\"width: auto;margin: auto;color: gray;\">值班安全人员已确认</div>";
		}
	}, {
		"report.sid" : ${request.report.sid}
	});
}
</script>
<script type="text/javascript">
var itemArray = [];
var tmpId = 0;
apiready = function () {
    api.parseTapmode();
};
var dialog = new auiDialog();
function openDialog(obj) {
    dialog.prompt({
        title:"输入问题所在",
        text:'',
        type:'number',
        buttons:['取消','确定']
    },function(ret){
        if(ret.buttonIndex == 2) {
        	/* document.getElementById("info"+tmpId).innerText = ret.text;
        	itemArray[tmpId] += "#rem#" + escape(ret.text); */
        	document.getElementById("info"+tmpId).innerText = ret.text;
        }
    });
}

var radios = document.getElementsByClassName("aui-radio");
for(var i=0;i<radios.length;i++) {
	radios[i].addEventListener("click", function() {
		var nm = this.getAttribute("name");
		var id = nm.substring(4, nm.length);
		itemArray[id] = escape(this.parentNode.innerText);
		tmpId = id;
		document.getElementById("info"+id).innerText = "";
	});
}

var userChoosed = '${request.report.targets}';
function chooseUser() {
	startUrl('PageAction!loadUserChoosePage#withDisabled', ['notitle','gesture','norefresh'], userChoosed);
};

function onActivityResult(result) {
	userChoosed = result;
	var ss = userChoosed.split("##")[0].substring(1);
	chooseUserBtn.innerText = "已选择：" + ss.replaceAll(",", "，");
}

String.prototype.replaceAll = function(s1,s2){
	return this.replace(new RegExp(s1,"gm"),s2);
};
</script>
<script type="text/javascript">
//初始化每个input的id, name属性
var lists = document.getElementsByClassName("aui-text-right");
for(var i=0;i<lists.length;i++) {
	var tmp = lists[i].getElementsByTagName("input");
	for(var j=0;j<tmp.length;j++) {
		tmp[j].name = "item" + (i+1);
		/*tmp[j].id = j+1;
		if(tmp[j].id==tmp[j].value) {
			tmp[j].setAttribute("checked", "checked");
		}*/
		//edits
		tmp[j].disabled = "disabled";
		if(j+1==tmp[j].value) {
			tmp[j].setAttribute("checked", "checked");
			tmp[j].removeAttribute("disabled");
		}
	}
}

function saveReport() {
	var the_choices = "";
	for(var i=0;i<lists.length;i++) {
		var tmp = lists[i].getElementsByTagName("input");
		var k = "";
		for(var j=0;j<tmp.length;j++) {
			tmp[j].name = "item" + (i+1);
			if(tmp[j].checked) {
				k = (j+1) + "";
			}
		}
		the_choices += k==""?"0":k;
	}
	var url0 = "AjaxAction!saveReport";
	if(thisReport.value!=null && thisReport.value != '') {
		url0 = "AjaxAction!updateReport";
	}
	ajax({
		type: "post",
		url: url0,
		dataType: "json",
		data: {
			"report.sid": thisReport.value,
			"report.choices": the_choices,
			"items": getItemRems(),
			"report.type": "ExplosiveReport",
			"report.rem": escape(rem.value),
			"report.targets": escape(userChoosed)
		}, success:function(r) {
			if(r['result'] == 'success' || !isNaN(r['result'])) {
				thisReport.value = r['result'];
				saveButton.innerText = "已保存,表单ID:" + thisReport.value;
				alert('保存成功');
			} else {
				alert(r['result']);
			}
		}
	});
}

function getItemRems() {
	var textInfos = document.getElementsByClassName("aui-text-info");
	var rems = [''];
	for(var i=0;i<textInfos.length;i++) {
		rems.push(escape(textInfos[i].innerText));
	}
	return rems;
}

function noticeView() {
	if(thisReport.value=="") {
		alert("请先保存表单");
		return;
	}
	if(Number('${request.report.noticed}')>0) {
		if(!confirm("已经通知过，是否再次通知？")) {
			return;
		}
	}
	ajax({
		type: "post",
		url: "AjaxAction!noticeOthers",
		dataType: "json",
		data:{
			"notice.ref": thisReport.value,//report.sid
			"notice.type": "ExplosiveReport",
			"notice.targetIds": escape(userChoosed),
			"notice.title": escape(""),
			"notice.content": escape(""),
			"notice.impts": "",
		}, success:function(r) {
			if(r['result'] != 'fail') {
				alert('已通知给' + userChoosed.split("##")[0]);
			}
		}
	});
}
</script>

<script type="text/javascript">
function getChoices() {
	var the_choices = "";
	for(var i=0;i<lists.length;i++) {
		var tmp = lists[i].getElementsByTagName("input");
		var k = "";
		for(var j=0;j<tmp.length;j++) {
			tmp[j].name = "item" + (i+1);
			if(tmp[j].checked) {
				k = (j+1) + "";
			}
		}
		the_choices += k==""?"0":k;
	}
	return the_choices;
}
//触发流程管控
function beginProcessControl() {
	startUrlWithoutResult("PageAction!loadProblemList?problem.choices="+getChoices()
			+ "&problem.ref=" + ${request.report.sid});
}
</script>




<script src="../js/mui.min.js"></script>
	<script src="../js/mui.zoom.js"></script>
	<script src="../js/mui.previewimage.js"></script>
	<script>
		mui.previewImage();
		android.setFinishGesture(false);
	</script>

<script src="js/dist/lrz.bundle.js"></script>
<script type="text/javascript">
var pic_ant = 0;
document.getElementById('file_input').addEventListener('change', function () {
	if(file_input_div.getElementsByTagName("img").length>=8){
		alert('上传最多9张图片');
		return;
	}
	var that = this;
 	lrz(that.files[0], {
	    width: 800
	}).then(function (rst) {
	    var img = new Image();
	    img.height = 50;
	    img.width = 50;
	    img.setAttribute("data-preview-src", "");
	    img.setAttribute("data-preview-group", "1");
	    var div = document.getElementById('file_input_div');
	    div.appendChild(img);
	    img.src = rst.base64;
	    return rst;
	});
});
</script>
</html>