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
    <title>新建：旅馆行业质检表单</title>
    
    <link rel="stylesheet" type="text/css" href="../css/aui.css" />
    <link rel="stylesheet" href="css/ext.css" />
    
    <script type="text/javascript" src="js/ext.js" ></script>
    <script type="text/javascript">
    window.onload = function(){
    	datetime.innerText = getNowFormatDate();
    }
    </script>
</head>
<body >
     <div class="aui-content aui-margin-b-15">
       <ul class="aui-list aui-select-list">
       <li class="aui-list-header">旅馆行业质检表单 
       	<div id='datetime' data-options='{"type":"date"}'
        	style="background-color: #03a9f4;padding:2px;color: white;"
       		 onclick="loadDateTimePickerLib();"></div>
       </li>
       	<!--<font color="gray"><b>检查项目</b></font>-->
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	是否实名登记旅客信息：
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
                   	登记的旅客数与入住的旅客数是否相同：
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
                   	是否在规定时间内上传旅客信息：
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
                   	入住旅客信息是否登记完善：
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
                   	当天的开房数是（），与实际上传数是否相符：
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
                   	有无“黄赌毒”等违法犯罪现象：
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
				《特种行业许可证》在上年度是否通过年检：
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
				客房门是否结实牢固、安全有效：
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
                   	疏散通道和出口是否设置明显指示标示，易于寻找方便疏散：
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
                   	疏散通道是否上锁、堵塞，封死等隐患：
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
                   <div class="aui-list-item-text">
                   	灭火器材，消防设施是否齐全有效：
                </div>
                <div class="aui-text-right">
                	<label id="info11" class="aui-text-info">
                	${request.report.item11}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(10,11)}"> 是</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(10,11)}" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
           
	    	<li class="aui-list-item">
          		<div class="aui-list-item-inner">
                  	<div class="aui-list-item-input">
                      	<div class="aui-list-item-text">
                      	备注
                		</div>
                    	<textarea placeholder="这里输入备注信息" id="rem" name="rem"
                    		 class="aui-border-gray padding-5px" >${request.report.rem}</textarea>
               		</div>
             	</div>
          	</li>
          	<li class="aui-list-item">
                <div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
                    <div id="saveButton" class="aui-btn aui-btn-primary aui-btn-block aui-btn-height-50px"
                    	onclick="saveReport()">创建表单</div>
                </div>
            </li>
            <div id="showAfterSaved" style="display: none;">
	            <li class="aui-list-item">
	                <div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
	                    <div id="chooseUserBtn" style="overflow: scroll;text-align: center;"
	                    	 onclick="chooseUser()">
	                    	选择目标人员<s:property value="#request.report.targets.split('##')[0].substring(1)"/>
	                    </div>
	                </div>
	            </li>
	            <li class="aui-list-item">
	                <div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
	                    <div id="pushButton" class="aui-btn aui-btn-info aui-btn-block aui-btn-height-50px"
	                    	onclick="noticeView()">通知目标人员查看</div>
	                </div>
	            </li>
            </div>
		</ul>
	</div>
	<input type="hidden" id="thisReport" value="${request.report.sid}"/>
</body>
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
		if(j+1==tmp[j].value) {
			tmp[j].setAttribute("checked", "checked");
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
	var saves = true;
	var url0 = "AjaxAction!saveReport";
	if(thisReport.value!=null && thisReport.value != '') {
		url0 = "AjaxAction!updateReport";
		saves = false;
	}
	ajax({
		type: "post",
		url: url0,
		dataType: "json",
		data:{
			"report.sid": thisReport.value,
			"report.choices": the_choices,
			"items": getItemRems(),
			"report.type": "HotalReport",
			"report.rem": escape(rem.value),
			"report.targets": escape(userChoosed),
			"report.time": datetime.innerText
		}, success:function(r) {
			if(r['result'] == 'success' || !isNaN(r['result'])) {
				if(saves) {
					thisReport.value = r['result'];
				}
				//saveButton.innerText = "已保存,表单ID:" + thisReport.value;
				saveButton.innerText = "保存更改";
				alert('保存成功，可以选择推送对象了');
				saveButton.parentNode.parentNode.style.display = "none";
				showAfterSaved.style.display = "block";
			} else if('reported'==r['result']) {
				alert(datetime.innerText + '日已发布此类型表单，请更换日期');
			} else {
				android.show(r['result']);
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

var noticeId = null;
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
			"notice.sid": noticeId,
			"notice.ref": thisReport.value,
			"notice.type": "HotalReport",
			"notice.targetIds": escape(userChoosed),
			"notice.title": escape(""),
			"notice.content": escape(""),
			"notice.impts": "",
		}, success:function(r) {
			if(r['result'] == "fail") {
				alert("通知失败！");
			} else {
				noticeId = r['result'];
				alert('已通知给' + userChoosed.split("##")[0]);
			}
		}
	});
}
</script>


<!-- DatePicker -->
<link rel="stylesheet" type="text/css" href="../css/mui.picker.min.css" />
<script id="dtjs1" src="../js/mui.min.js"></script>
<script id="dtjs2" src="../js/mui.picker.min.js"></script>
<script id="dtjs3" src="js/loadDateTimePicker.js"></script>
<%-- <script type="text/javascript">
function loadDateTimePickerLib() {
	var js1 = "../js/mui.min.js";
	var js2 = "../js/mui.picker.min.js";
	var js3 = "js/loadDateTimePicker.js";
	var t = dtjs1.src=="";
	if(t) {
		dtjs1.setAttribute("src", js1);
		dtjs2.setAttribute("src", js2);
		dtjs3.setAttribute("src", js3);
		alert("加载完成，请再点一下");
	}
}
</script> --%>
</html>