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
    <title>民爆行业质检表单</title>
    
    <link rel="stylesheet" type="text/css" href="../css/aui.css" />
    <link rel="stylesheet" href="css/ext.css" />
    
    <script type="text/javascript" src="js/ext.js" ></script>
    <%-- <style type="text/css">
    .aui-list-item-text {
    	font-size: 16px !important;
    	color: black !important;
    }
    label {font-size: 18px !important;
    	color: gray !important;}
    </style> --%>
</head>
<body>
     <div class="aui-content aui-margin-b-15">
       <ul class="aui-list aui-select-list">
       <li class="aui-list-header">
       	<div>民爆行业质检表单 - ${request.report.time}</div>
       	<s:if test="#session.user.userId==#request.report.userId">
	       	<div style="background-color: #03a9f4;padding:2px;color: white;"
	       		onclick="startUrlWithoutResult('PageAction!loadReportEditPage?report.sid=${request.report.sid}')">修改表单</div>
       	</s:if>
       	<s:else>
       		<a href="javascript:android.callUp('${request.report.phone}')"
       			 style="background-color: #03a9f4;padding:2px;color: white;"
       			 >联系${request.report.userName}</a>
       	</s:else>
       </li>
       	<!--<font color="gray"><b>检查项目</b></font>-->
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	守库人员是否到岗：
                </div>
                <div class="aui-text-right">
                	<label id="info1" class="aui-text-info">
                	${request.report.item1}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(0,1)}"> 是</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(0,1)}" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	安全员、库管员是否持证上岗：
                </div>
                <div class="aui-text-right">
                	<label id="info2" class="aui-text-info">
                	${request.report.item2}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(1,2)}"> 是</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(1,2)}" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	入侵报警装置、周界报警装置是否正常运作：
                </div>
                <div class="aui-text-right">
                	<label id="info3" class="aui-text-info">
                	${request.report.item3}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio"  value="${request.report.choices.substring(2,3)}"> 是</label>
               		<label><input class="aui-radio" type="radio"  value="${request.report.choices.substring(2,3)}" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	是否配置两只以上大型犬（注：是否需要照相上传功能）：
                </div>
                <div class="aui-text-right">
                	<label id="info4" class="aui-text-info">
                	${request.report.item4}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio"  value="${request.report.choices.substring(3,4)}"> 是</label>
               		<label><input class="aui-radio" type="radio"  value="${request.report.choices.substring(3,4)}" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	大型犬是否正常、健康：
                </div>
                <div class="aui-text-right">
                	<label id="info5" class="aui-text-info">
                	${request.report.item5}<!-- rem -->
                	</label>
                <!--	<input class="aui-text-center" type="text" name="text1" style="border:1px solid gray; width: 40px; height: 25px; float:left; margin-left:190px ;" /></label>-->
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(4,5)}"> 是</label>
                	<!-- ${"asdfasd".substring(5,6)=="s"?"checked":""} value="1" -->
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(4,5)}" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
           
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	库房值班记录本是否如实记录本班发生的事项：
                </div>
                <div class="aui-text-right">
                	<label id="info6" class="aui-text-info">
                	${request.report.item6}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(5,6)}"> 是</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(5,6)}" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
           
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
					消防水池储水量是否大于15立方米或设高位水池：
                   </div>
                <div class="aui-text-right">
                	<label id="info7" class="aui-text-info">
                	${request.report.item7}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(6,7)}"> 是</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(6,7)}" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
           
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
				库房内杂物是否清理干净：
                   </div>
                <div class="aui-text-right">
                	<label id="info8" class="aui-text-info">
                	${request.report.item8}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(7,8)}"> 是</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(7,8)}" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
           
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	领用、发放、清退等级台账是否如实、齐全：
                </div>
                <div class="aui-text-right">
                	<label id="info9" class="aui-text-info">
                	${request.report.item9}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(8,9)}"> 是</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(8,9)}" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
           
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	变质和过期失效的民爆物品，是否及时上报并清退出库，予以销毁：
                </div>
                <div class="aui-text-right">
                	<label id="info10" class="aui-text-info">
                	${request.report.item10}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(9,10)}"> 是</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(9,10)}" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
	    	<li class="aui-list-item">
          		<div class="aui-list-item-inner">
                  	<div class="aui-list-item-input">
                      	<div class="aui-list-item-text" style="font-size: 16px">
                      	备注：${request.report.rem}
                		</div>
               		</div>
             	</div>
          	</li>
          	<!-- <li class="aui-list-item">
                <div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
                    <div id="saveButton" class="aui-btn aui-btn-info aui-btn-block aui-btn-height-50px"
                    	onclick="saveReport()">保存表单</div>
                </div>
            </li> -->
            <%-- <li class="aui-list-item">
                <div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
                    <div id="chooseUserBtn" class="aui-btn" style="overflow: scroll;text-align: center;width: 100%;">
                    	目标人员 ${request.report.targets.split("##")[0]}
				    </div>
				    <select id="sel" multiple="multiple" class="hiddenSel" onchange="onActivityResult(this)">
					   	<s:iterator value="#request.users" id='item' status="st">
					   		<option value="${item.userId}">${item.name}</option>
					   	</s:iterator>
				    </select>
				    <style type="text/css">
				    .hiddenSel{width:100%;height:100%;position:absolute;
				    border:1px solid;left:-8px;top:-1px;opacity:0;}
				    </style>
                </div>
            </li> --%>
            <!-- <li class="aui-list-item">
                <div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
                    <div id="pushButton" class="aui-btn aui-btn-info aui-btn-block aui-btn-height-50px"
                    	onclick="noticeView()">通知目标人员查看</div>
                </div>
            </li> -->
             <%-- <li class="aui-list-item">
                <div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
                    <div id="pushButton" class="aui-btn aui-btn-info aui-btn-block aui-btn-height-50px"
                    	onclick="reply('${request.report.sid}','${request.report.userId}')">展开回复</div>
                </div>
             </li> --%>
		</ul>
		<%@include file="reply.jsp"%>
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
    	startUrl('PageAction!loadUserChoosePage', ['notitle','gesture','norefresh'], userChoosed);
    };
    
    initUserChoosed();
    function initUserChoosed() {
    	var users = userChoosed.split(",");
    	for(var i = 0 ;i<sel.options.length;i++) {
    		if(users.contains(sel.options[i].value)) {
    			sel.options[i].selected = "selected";
    		}
    	}
    }
    var times = 0;
    function onActivityResult(sel_obj) {
    	if(++times%2==1) {initUserChoosed();}
    	var result_ids = '';
    	var result_names = '';
    	for(var i = 0 ;i<sel_obj.options.length;i++) {
    	    if(sel_obj.options[i].selected) {
	    	    result_ids += "," + sel_obj.options[i].value;
	    	    result_names += "," + sel_obj.options[i].text;
    	    }
    	}
    	var result = result_names + "##" + result_ids;
    	userChoosed = result;
    	chooseUserBtn.innerText = "已选择：" + result_names.substring(1).replaceAll(",","，");
    }
    
    String.prototype.replaceAll = function(s1,s2){
   		return this.replace(new RegExp(s1,"gm"),s2);
   	};
    
    /* function submitReport1() {
    	ajax({
    		type:"post",
    		url:"AjaxAction!submitReport",
    		dataType:"json",
    		data:{
    			items: itemArray,
    			type:"",
    			rem:escape(rem.value),
    			targets:escape(userChoosed.split("##")[1])
    		},
    		success:function(r) {
    			if(r['result'] == 'success') {
    				submited();
    			}
    		}
    	});
    } */
    
    function submited() {//at=create,at=history,at=view
    	//pushButton.innerText = "已通知";
		//pushButton.setAttribute("onclick", "alert('今日表单已推送过，请勿重复推送')");
    }
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

function reply(ref, userId) {
	ajaxPost("AjaxAction!reply", function(r) {
		alert(r);
	}, {
		"reply.ref": ref,
		"reply.targetId": userId,
		"reply.content": escape("回复的内容")
	});
}
</script>
</html>