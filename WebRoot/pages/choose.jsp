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
            <li class="aui-list-header">
            	<h4 class="aui-text-white"><input type="checkbox" class="aui-checkbox" onclick="reverseAll(this)"> 反选</h4>
            	<div class="aui-btn aui-btn-info aui-text-white" onclick="finished()">确定</div>
            </li>
            <s:iterator value="#request.users" id='item' status="st">
            <li id="${st.index}" class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div id="${item.userId}" class="aui-list-item-title">${item.name}</div>
                    <div class="aui-list-item-right">
                        <input id="ckbox${st.index}" type="checkbox" class="aui-checkbox" onclick="clicked('${st.index}')">
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
	var choices = [];
	
	function loadItems() {
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
	}
	var choices_ids = [];
	
	function clicked(n) {
		if(!choices.contains(titles[n])) {
			choices.push(titles[n]);
			choices_ids.push(userIds[n]);
		} else {
			choices.remove(titles[n]);
			choices_ids.remove(userIds[n]);
		}
	}
	
	function finished() {
		//alert(choices);
		android.closeActivity(choices + "##" + choices_ids);
	}
	
	function reverseAll(obj) {
		var ckboxes = document.getElementsByClassName("ckbox");
		for (var i=0;i<ckboxes.length;i++) {
			ckboxes[i].checked = !ckboxes[i].checked;
			clicked(i);
		}
	}
	
</script>
</html>