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
    <title>新建：三级消防质检表单</title>
    
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
       <li class="aui-list-header">民爆行业质检表单 
       	<div id='datetime' data-options='{"type":"date"}'
        	style="background-color: #03a9f4;padding:2px;color: white;"
       		 onclick="loadDateTimePickerLib();"></div>
       </li>
       	<!--<font color="gray"><b>检查项目</b></font>-->
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	消防安全制度：
                </div>
                <div class="aui-text-right">
                	<label id="info1" class="aui-text-info">
                	${request.report.item1}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(0,1)}"> 有</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(0,1)}" > 无</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(0,1)}" > 不全</label>
                </div>
               </div>
           </li>
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	员工安全教育培训：
                </div>
                <div class="aui-text-right">
                	<label id="info2" class="aui-text-info">
                	${request.report.item2}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(1,2)}"> 组织开展</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(1,2)}" > 未组织开展</label>
                </div>
               </div>
           </li>
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	防火检查：
                </div>
                <div class="aui-text-right">
                	<label id="info3" class="aui-text-info">
                	${request.report.item3}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio"  value="${request.report.choices.substring(2,3)}"> 组织开展</label>
               		<label><input class="aui-radio" type="radio"  value="${request.report.choices.substring(2,3)}" > 未组织开展</label>
                </div>
               </div>
           </li>
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	灭火和应急疏散预案：
                </div>
                <div class="aui-text-right">
                	<label id="info4" class="aui-text-info">
                	${request.report.item4}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio"  value="${request.report.choices.substring(3,4)}"> 有，且组织演练</label>
               		<label><input class="aui-radio" type="radio"  value="${request.report.choices.substring(3,4)}" > 有，未演练</label>
                	<label><input class="aui-radio" type="radio"  value="${request.report.choices.substring(3,4)}" > 无，组织演练</label>
                	<label><input class="aui-radio" type="radio"  value="${request.report.choices.substring(3,4)}" > 无且未演练</label>
                </div>
               </div>
           </li>
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	生产、存储、经营易燃易爆危险品的场所与居住场所设置在同一建筑内：
                </div>
                <div class="aui-text-right">
                	<label id="info5" class="aui-text-info">
                	${request.report.item5}<!-- rem -->
                	</label>
                <!--	<input class="aui-text-center" type="text" name="text1" style="border:1px solid gray; width: 40px; height: 25px; float:left; margin-left:190px ;" /></label>-->
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(4,5)}"> 是</label>
                	<!-- ${"asdfasd".substring(5,6)=="s"?"checked":""} value="1" -->
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(4,5)}" > 否</label>
                </div>
               </div>
           </li>
           
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	疏散通道、安全出口：
                </div>
                <div class="aui-text-right">
                	<label id="info6" class="aui-text-info">
                	${request.report.item6}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(5,6)}"> 畅通</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(5,6)}" > 堵塞</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(5,6)}" > 锁闭</label>
                </div>
               </div>
           </li>
           
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
				防火门：
                   </div>
                <div class="aui-text-right">
                	<label id="info7" class="aui-text-info">
                	${request.report.item7}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(6,7)}"> 完好有效</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(6,7)}" > 常闭式防火门</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(6,7)}" > 损坏</label>
                </div>
               </div>
           </li>
           
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
				疏指示标志：
                   </div>
                <div class="aui-text-right">
                	<label id="info8" class="aui-text-info">
                	${request.report.item8}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(7,8)}"> 完好有效</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(7,8)}" > 损坏</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(7,8)}" > 缺少</label>
                </div>
               </div>
           </li>
           
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	应急照明：
                </div>
                <div class="aui-text-right">
                	<label id="info9" class="aui-text-info">
                	${request.report.item9}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(8,9)}"> 完好有效</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(8,9)}" > 损坏</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(8,9)}" > 缺少</label>
                </div>
               </div>
           </li>
           
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	室内消防栓：
                </div>
                <div class="aui-text-right">
                	<label id="info10" class="aui-text-info">
                	${request.report.item10}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(9,10)}" > 完好有效</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(9,10)}"> 未设置</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(9,10)}" > 损坏</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(9,10)}" > 无水</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(9,10)}" > 配件不齐</label>
                </div>
               </div>
           </li>
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	灭火器：
                </div>
                <div class="aui-text-right">
                	<label id="info11" class="aui-text-info">
                	${request.report.item11}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(10,11)}" > 完好</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(10,11)}"> 未配置</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(10,11)}" > 有，但失效</label>
                </div>
               </div>
           </li>
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	消防安全管理人：
                </div>
                <div class="aui-text-right">
                	<label id="info12" class="aui-text-info">
                	${request.report.item12}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(11,12)}"> 确定</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(11,12)}" > 未确定</label>
                </div>
               </div>
           </li>
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	消防安全管理人：
                </div>
                <div class="aui-text-right">
                	<label id="info13" class="aui-text-info">
                	${request.report.item13}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(12,13)}"> 确定</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(12,13)}" > 未确定</label>
                </div>
               </div>
           </li>
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	消防安全工作制度：
                </div>
                <div class="aui-text-right">
                	<label id="info14" class="aui-text-info">
                	${request.report.item14}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(13,14)}"> 有</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(13,14)}" > 无</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(13,14)}" > 不全</label>
                </div>
               </div>
           </li>
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	防火安全检查：
                </div>
                <div class="aui-text-right">
                	<label id="info15" class="aui-text-info">
                	${request.report.item15}<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(14,15)}"> 开展</label>
               		<label><input class="aui-radio" type="radio" value="${request.report.choices.substring(14,15)}" > 未开展</label>
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
	                    <div id="noticeButton" class="aui-btn aui-btn-info aui-btn-block aui-btn-height-50px"
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

var saving = false;
function saveReport() {
	//防止一直点
	if(saving){android.show("正在努力创建中，请君稍候...");return;}
	saving = true;
	saveButton.innerText = "创建表单中...";
	
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
			"report.type": "FirefightingReport",
			"report.rem": escape(rem.value),
			"report.targets": escape(userChoosed),
			"report.time": datetime.innerText
		}, success:function(r) {
			saving = false;
			saveButton.innerText = "创建表单";
			
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
var noticing = false;
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
	
	if(!noticing) {noticing = true;noticeButton.innerText="通知中...";
	 android.show("正在通知，请君稍候...");return;}
	
	ajax({
		type: "post",
		url: "AjaxAction!noticeOthers",
		dataType: "json",
		data:{
			"notice.sid": noticeId,
			"notice.ref": thisReport.value,
			"notice.type": "FirefightingReport",
			"notice.targetIds": escape(userChoosed),
			"notice.title": escape(""),
			"notice.content": escape(""),
			"notice.impts": "",
		}, success:function(r) {
			noticing = false;
			if(r['result'] == "fail") {
				alert("通知失败！");
				noticeButton.innerText = "通知目标人员查看";
			} else {
				noticeId = r['result'];
				alert('已通知给' + userChoosed.split("##")[0]);
				noticeButton.innerText = "已通知";
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