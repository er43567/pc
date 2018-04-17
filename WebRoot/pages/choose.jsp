<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../css/aui.css" />
    
    <script type="text/javascript" src="js/ext.js" ></script>
    
</head>
<body>
	
    <div class="aui-content aui-margin-b-1-5">
        <ul id="items" class="aui-list aui-list-in">
            <li class="aui-list-header" style="position:fixed;left: 0px;top: 0px;width: 100%;z-index: 99">
            	<h4 class="aui-text-white">
            		<label><input type="checkbox" class="aui-checkbox" onclick="chooseAll(this)"> 全选</label>
            		<label><input type="checkbox" class="aui-checkbox" onclick="reverseAll(this)"> 反选</label>
            	</h4>
            	<div class="aui-btn aui-btn-info aui-text-white" onclick="finished()">确定</div>
            </li>
            <div style="height:50px"></div>
            <s:iterator value="#request.users" id='item' status="st">
            <li id="${st.index}" class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div id="${item.userId}" class="aui-list-item-title">${item.unit} ${item.name}</div>
                    <div class="aui-list-item-right">
                        <input id="ckbox${st.index}" type="checkbox" class="aui-checkbox ckbox" onclick="clicked('${st.index}')">
                    </div>
                </div>
            </li>
            </s:iterator>
            <!---->
        </ul>
    </div>
    
</body>

<script>
	var titles = [];
	var userIds = [];
	init();
	function init() {
		var namesDiv = document.getElementsByClassName("aui-list-item-title");
		for(var i=0;i<namesDiv.length;i++) {
			titles.push(namesDiv[i].innerText);
			userIds.push(namesDiv[i].id);
		}
	}
	
	//var choices = ['a3','a1'];
	//loadItems();
	
	/* function loadItems() {
		for(var i=0;i<titles.length;i++) {
			var checked = choices.contains(titles[i])?'checked':'';
			var htm = 
				 '<li id="item'+i+'" class="aui-list-item" onclick="ckbox'+i+'.click()">'
                +'<div class="aui-list-item-inner">'
                +    '<div class="aui-list-item-title">'+titles[i]+'</div>'
                +    '<div class="aui-list-item-right">'
                +        '<input id="ckbox'+i+'" type="checkbox" class="aui-checkbox ckbox" onclick="clicked('+i+')" '+checked+' >'
                +    '</div>'
                +'</div>'
            	+'</li>';
            items.innerHTML += htm; 
		}
	} */
	var choices_ids = [];
	var choices_titles = [];
	function clicked(n) {
		if(!choices_ids.contains(userIds[n])) {
			choices_ids.push(userIds[n]);
			choices_titles.push(titles[n]);
		} else {
			choices_ids.remove(userIds[n]);
			choices_titles.remove(titles[n]);
		}
	}
	
	function finished() {
		android.closeActivity(choices_titles + "##" + choices_ids);
	}
	
	function onLoadData(param) {
		choices_titles = param.split("##")[0].split(",");
		choices_ids = param.split("##")[1].split(",");
		for(var i=0;i<userIds.length;i++) {
			if(choices_ids.contains(userIds[i])) {
				document.getElementById("ckbox" + i).setAttribute("checked","checked");
				
				if(location.href.indexOf('#withDisabled')>=0) {
					document.getElementById("ckbox" + i).setAttribute("disabled", "disabled");
				}
			}
		}
	}
	
	function reverseAll(obj) {
		var ckboxes = document.getElementsByClassName("ckbox");
		for (var i=0;i<ckboxes.length;i++) {
			ckboxes[i].checked = !ckboxes[i].checked;
			clicked(i);
		}
	}
	
	function chooseAll(obj) {
		var ckboxes = document.getElementsByClassName("ckbox");
		for (var i=0;i<ckboxes.length;i++) {
			ckboxes[i].checked = obj.checked;
			clicked(i);
		}
	}
	
</script>

</html>