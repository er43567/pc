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
    <title>æ°çç©åé¢ç¨é­ç¯ç®¡ç</title>
    <link rel="stylesheet" type="text/css" href="../css/aui.css" />
    <script type="text/javascript" src="js/ext.js"></script>
</head> 
<body>
    <div class="aui-content aui-margin-b-15">
        <ul class="aui-list aui-form-list">
            <b><li class="aui-list-header" id="type">
            <label><input class="aui-radio"  id='type' type="radio" name="demo" checked="checked" value="0"> &nbsp;&nbsp;&nbsp;&nbsp;ç¸è¯</label>
        	<label><input class="aui-radio" type="radio" name="demo" value="1"> &nbsp;&nbsp;&nbsp;&nbsp;é·ç®¡</label>
            </li></b>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label" id="unitDefined">
                	åä½æ ¸å®è¯é
                    </div>
                    <div class="aui-list-item-input">
                        <input type="number" id="">
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label" id="yesterdayGained">
                                        æ¨æ¥å®éåºå­é
                    </div>
                    <div class="aui-list-item-input">
                        <input type="number" >
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label" id="todayGained">
                                        ä»æ¥é¢å
                    </div>
                    <div class="aui-list-item-input">
                        <input type="number" >
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label" id="todayUse">
                	ä»æ¥ä½¿ç¨
                    </div>
                    <div class="aui-list-item-input">
                        <input type="number" >
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                                        ä»æ¥ååº
                    </div>
                    <div class="aui-list-item-input">
                        <input type="number" id="todayReturn">
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label" >
                	ä»æ¥åºå­é
                    </div>
                    <div class="aui-list-item-input">
                        <input type="number" id="todayStock">
                    </div>
                </div>
            </li>
            
            <li class="aui-list-item">
                <div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
                    <div class="aui-btn aui-btn-info aui-margin-r-5">æäº¤</div>
                    <div class="aui-btn aui-btn-danger aui-margin-l-5">åæ¶</div>
                </div>
            </li>
        </ul>
    </div>
    
</body>

<script type="text/javascript">
ajaxPost("AjaxAction!saveGoods", function(res,result) {
	alert(result=='success');
}, {
	"goods.todayReturn":todayReturn.value
	,"goods.todayReturen":todayReturn.value
	,"goods.todayReturen":todayReturn.value
	,"goods.todayReturen":todayReturn.value
})
</script>
</html>