<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>通讯录</title>
    <script type="text/javascript" src="js/ext.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/aui.css" />
    <script type="text/javascript">
    var units = [];
    function putUnit(unit) {
    	if(units.contains(unit)) {
    		return;
    	}
    	units.push(unit);
    	var itemHtml = "<li class='aui-list-item aui-active' onclick='tabClicked(\""+unit+"\")'>"
    				+"    <div class='aui-list-item-inner'>"
    				+"        	" + unit
    				+"    </div>"
    				+"</li>";
    	leftTab.innerHTML += itemHtml;
    }
	</script>
	<script type="text/javascript">
	var userTags;
	window.onload = function() {
		userTags = document.getElementsByClassName("unit-class");
		tabClicked("安源公安分局");
	};
	function tabClicked(unit) {
		for(var i=0;i<userTags.length;i++) {
			if(userTags[i].className.indexOf(unit)>=0) {
				userTags[i].style.display = "block";
			} else {
				userTags[i].style.display = "none";
			}
		}
	}
	</script>
</head>
<body>
	<div style="float: right;color: #c3c3c3;position: fixed;left: 50%;top: 50%">
		排名顺序随机
	</div>
	<div class="aui-content">
        <div class="aui-row">
            <div class="aui-col-xs-3 aui-border-r" id="left" style="position: fixed;float: left;"> 
                <ul class="aui-list aui-list-noborder aui-margin-b-0" id="leftTab" style="font-size: 10px">
                    <!-- <li class="aui-list-item aui-active" onclick="tabClicked('安源公安分局')">
                        <div class="aui-list-item-inner">
                            	安源公安分局
                        </div>
                    </li> -->
                </ul>
            </div>
            <div class="aui-col-xs-9" id="right" style="float: right;">
            	<ul class="aui-list aui-media-list">
		            <s:iterator id="item" value="#request.users" status="st">
			            <li style="display: none;" class="unit-class aui-list-item aui-list-item-middle ${item.unit}" onclick="android.callUp('${item.phone}')">
			                <div class="aui-media-list-item-inner">
			                    <div class="aui-list-item-media" style="width: 2.2rem;">
			                        <img src="${item.headImg}" class="aui-img-round aui-list-img-sm">
			                    </div>
			                    <div class="aui-list-item-inner "><!-- aui-list-item-arrow -->
			                        <div class="aui-list-item-text">
			                            <div class="aui-list-item-title aui-font-size-14">${item.name}</div>
			                            <!-- <div class="aui-list-item-right">08:00</div> -->
			                        </div>
			                        <div class="aui-list-item-text">
			                        	${item.position} tel:${item.phone}
			                        </div>
			                    </div>
			                </div>
			            </li>
			            <script>
			            	putUnit('${item.unit}');
			            </script>
		            </s:iterator>
		        </ul>
            </div>
        </div>
    </div>
</body>

<script type="text/javascript" src="../script/aui-collapse.js" ></script>
<script type="text/javascript">
    apiready = function () {
        api.parseTapmode();
    }
    var collapse = new auiCollapse({
        autoHide:true //是否自动隐藏已经展开的容器
    });
</script>
</html>