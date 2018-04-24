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
    <title>新建：民爆库房三查表单</title>
    <link rel="stylesheet" href="../css/mui.min.css">
    <link rel="stylesheet" type="text/css" href="../css/aui.css" />
    <link rel="stylesheet" href="css/ext.css" />
    
    <script type="text/javascript" src="js/ext.js" ></script>
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
    window.onload = function() {
    	datetime.innerText = getNowFormatDate();
    	
    	var dateBtn = document.getElementsByClassName("aui-btn-blue")[0];
    	dateBtn.addEventListener("keyup", function (){
    		alert(this);
    	}, false);
    }
    </script>
    <style>
		.file_input_div img{float: left;margin: 5px;}
		.file_input_div {margin-top: 10px}
	</style>
</head>
<body>
     <div class="aui-content aui-margin-b-15">
       <ul class="aui-list aui-select-list">
       <li class="aui-list-header">民爆库房三查表单 
       	<div id='datetime' data-options='{"type":"date"}'
        	style="background-color: #03a9f4;padding:1px;color: white;border-radius:1px"
       		onclick="loadDateTimePickerLib();"></div>
       </li>
       <!--<font color="gray"><b>检查项目</b></font>-->
       <s:if test="#session.user.rank>=2">
	       <li class="aui-list-item">
	            <div class="aui-list-item-inner" style="text-align: center;">
	             	<select class="aui-btn" style="background-color:#f1f1f1" id="checkedUnit">
	             		<option value="">选择检查单位</option>
	             		<s:iterator id="item" value="#request.list">
	             			<option value="${item}">${item}</option> 
	             		</s:iterator>
	             	</select>
	            </div>
	        </li>
        </s:if>
        
       	<s:iterator id="item" value="#request.report.reportItems" status="st">
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	  <div style="color: blue">${item}</div>
                   </div>
                <div class="aui-text-right">
                	<label id="info${st.index+1}" class="aui-text-info">
                	<!-- rem -->
                	</label>
                	<label><input class="aui-radio" type="radio"> 是</label>
               		<label><input class="aui-radio" type="radio"onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
         </s:iterator>
         	
         	<li class="aui-list-item">
          		<div class="aui-list-item-inner">
					<div style="width: 100%;">
						<input id="file_input" accept="image/gif,image/jpeg,image/png,image/*" 
							style="width: 100%;height:2.2rem;position: absolute;opacity:0;z-index: 1" type="file"/>
						<div class="aui-btn aui-btn-block" style="z-index: 0">添加图片</div>
					</div>
                  	<div id="file_input_div" class="file_input_div"></div>
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
            <%-- <div id="showAfterSaved" style="display: none;">
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
            </div> --%>
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
        },function(ret) {
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
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
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
	var the_choices = getChoices();
	var notChoosed = the_choices.indexOf("0");
	if(notChoosed>=0) {
		android.show("第" + (notChoosed+1) + "项未选择");
		return;
	}
	
	var save_mode = true;
	var url0 = "AjaxAction!saveReport";
	if(thisReport.value != '0' && thisReport.value != '') {
		url0 = "AjaxAction!updateReport";
		save_mode = false;
	}
	var datas = {
			"report.sid": thisReport.value,
			"report.choices": the_choices,
			"items": getItemRems()+"",
			"report.type": "ExplosiveReport",
			"report.rem": escape(rem.value),
			"report.targets": escape(userChoosed),
			"report.time": datetime.innerText
	};
	
	/* datas['report.sid'] = thisReport.value;
	datas['report.choices'] = the_choices;
	datas['items'] = datetime.innerText;
	datas['report.type'] = getItemRems();
	datas['report.rem'] = "ExplosiveReport";
	datas['report.targets'] = escape(rem.value);
	datas['report.time'] = escape(userChoosed); */
	
	//拿到上传的图片
	var imgsDiv = document.getElementById("file_input_div");
	var imgs = imgsDiv.getElementsByTagName("img");
	for(var i=0;i<imgs.length;i++) {
		datas['report.file'+i] = imgs[i].src;
	}
	if(imgs.length==0) {
		//解决再次提交出现之前的图片
		datas['noPic'] = true;
	}
	
	if('${session.user.rank>=2}'=='true') {
		if(checkedUnit.value == "") {
			android.show("请选择单位");
			location.href = "#checkedUnit";
			return;
		} else {
			datas['report.checkedUnit'] = escape(checkedUnit.value);
		}
	} else {
		datas['report.checkedUnit'] = "";
	}
	
	//防止一直点
	if(saving){android.show("正在努力创建中，请君稍候...");return;}
	saving = true;
	saveButton.innerText = "创建表单中...";
	
	$.ajax({
		type: "post",
		url: url0,
		dataType: "json",
		cache:false,
		data: datas,
		success:function(r) {
			saving = false;
			saveButton.innerText = "创建表单";
			
			if(r['result'] == 'success' || !isNaN(r['result']) || Number(r['result']>0)) {
				if(save_mode) {
					thisReport.value = r['result'];
				}
				//saveButton.innerText = "已保存,表单ID:" + thisReport.value;
				//saveButton.innerText = "保存更改";
				//alert('保存成功，可以选择推送对象了');
				//saveButton.parentNode.parentNode.style.display = "none";
				saveButton.innerText = "流程管控";
				saveButton.onclick = function() {
					beginProcessControl(thisReport.value, the_choices);
				};
				saveButton.className = saveButton.className.replace("aui-btn-primary","aui-btn-info");
				android.show("创建成功\n已将表单推送给相关人员");
				//showAfterSaved.style.display = "block";
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
	
	if(!noticing) {
		noticing = true;noticeButton.innerText="通知中...";
	} else {
		android.show("通知中");
		return;
	}
	
	ajax({
		type: "post",
		url: "AjaxAction!noticeOthers",
		dataType: "json",
		data: {
			"notice.sid": noticeId,
			"notice.ref": thisReport.value,
			"notice.type": "ExplosiveReport",
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
<!-- 流程管控 -->
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
			+ "&problem.ref=" + thisReport.value);
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

<%-- <div id='jsload'></div>
<script type="text/javascript">
var jsLoaded = false;
function loadJs() {
	if(jsLoaded) {
		return;
	}
	var js1 = document.createElement("script");
	var js2 = document.createElement("script");
	var js3 = document.createElement("script");
	js2.src = "../js/mui.zoom.js";
	js3.src = "../js/mui.previewimage.js";
	jsload.appendChild(js1);
	jsload.appendChild(js2);
	jsload.appendChild(js3);
	setTimeout(function() {
		mui.previewImage();
		jsLoaded = true;
	}, 500);
}
</script> --%>
<script src="js/dist/lrz.bundle.js"></script>
<script type="text/javascript">
var ans = 0;
document.getElementById('file_input').addEventListener('change', function () {
	if(file_input_div.getElementsByTagName("img").length>=9) {
		alert('上传最多9张图片');
		return;
	}
	android.showProgressDialog("处理图片中...");
	var that = this;
 	lrz(that.files[0], {
	    width: 600
	}).then(function (rst) {
	    var img = new Image();
	    img.height = 50;
	    img.width = 50;
	    var div = document.getElementById('file_input_div');
	    div.appendChild(img);
	    img.src = rst.base64;
	    
	    addImg(rst.base64);
	    var nn = ans;
	    img.onclick = function(){reviewImg(nn);};
	    ans++;
	    android.cancelProgressDialog();
	    return rst;
	});
});
var imgList = "";
var imgListArr = [];
function addImg(imgbase64) {
	if(ans<3)
		imgList += imgbase64 + "##";
	else
		imgList = "";
	imgListArr.push(imgbase64);
}
function reviewImg(currentPos) {
	if(ans>=3) {
		android.reviewImages(imgListArr[currentPos], 0);
		return;
	}
	android.reviewImages(imgList, currentPos);
}
</script>

<script type="text/javascript">

</script>
</html>