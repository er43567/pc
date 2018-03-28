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
   <%--  <script type="text/javascript">
	var interceptStete = true;
	setInterval(function(){
		var b = document.documentElement.scrollTop == 0 ? document.body.scrollTop : document.documentElement.scrollTop;
	    if (b == 0) {
	    	android.interceptScroll(false);
	    	interceptStete = false;
	    } /* else {
	    	if(interceptStete == false) {
	    		android.interceptScroll(true);
	    		interceptStete = true;
	    	}
	    } */
	}, 100);
	</script> --%>
</head>
<body>
<div style="text-align: center;margin-top: 15%;font-size: 24px">
<img alt="" src="img/无信息.png" style="margin: auto">
</div>
</body>