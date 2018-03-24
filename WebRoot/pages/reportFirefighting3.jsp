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
    <title>旅馆行业质检表单</title>
    <link rel="stylesheet" type="text/css" href="../css/aui.css" />
    <link rel="stylesheet" href="css/ext.css" />
    <script type="text/javascript" src="js/ext.js" ></script>
</head>
<body>
<ul class="aui-list aui-select-list">
	<li class="aui-list-header">三级消防质检表单</li>
	<!--<font color="gray"><b>检查项目</b></font>-->
	<li class="aui-list-item">
	    <div class="aui-list-item-inner">
	        <div class="aui-list-item-text">
	        	消防安全制度：
	     </div>
	     <div class="aui-text-right">
	     	<label class="aui-text-info"></label>
	     	<input class="aui-radio" type="radio" name="radio2"> 有</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 无</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 不全</label>
	     </div>
	    </div>
	</li>
	<li class="aui-list-item">
	    <div class="aui-list-item-inner">
	        <div class="aui-list-item-text">
	        	员工安全教育培训：
	     </div>
	     <div class="aui-text-right">
	     	<label class="aui-text-info"></label>
	     	<input class="aui-radio" type="radio" name="radio2"> 组织开展</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 未组织开展</label>
	     </div>
	    </div>
	</li>
	<li class="aui-list-item">
	    <div class="aui-list-item-inner">
	        <div class="aui-list-item-text">
	        	防火检查：
	     </div>
	     <div class="aui-text-right">
	     	<label class="aui-text-info"></label>
	     	<input class="aui-radio" type="radio" name="radio2"> 组织开展</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 未组织开展</label>
	     </div>
	    </div>
	</li>
	<li class="aui-list-item">
	    <div class="aui-list-item-inner">
	        <div class="aui-list-item-text">
	        	灭火和应急疏散预案：
	     </div>
	     <div class="aui-text-right">
	     	<label class="aui-text-info"></label>
	     	<input class="aui-radio" type="radio" name="radio2"> 有，且组织演练</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 有，未演练</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 无，组织演练</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 无且未演练</label>
	     </div>
	    </div>
	</li>
	<li class="aui-list-item">
	    <div class="aui-list-item-inner">
	        <div class="aui-list-item-text">
	        	生产、存储、经营易燃易爆危险品的场所与居住场所设置在同一建筑内：
	     </div>
	     <div class="aui-text-right">
	     	<label class="aui-text-info"></label>
	     	<input class="aui-radio" type="radio" name="radio2"> 是</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 否</label>
	     </div>
	    </div>
	</li>
	
	 <li class="aui-list-item">
	    <div class="aui-list-item-inner">
	        <div class="aui-list-item-text">
	        	疏散通道、安全出口：
	     </div>
	     <div class="aui-text-right">
	     	<label class="aui-text-info"></label>
	     	<input class="aui-radio" type="radio" name="radio2"> 畅通</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 堵塞</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 锁闭</label>
	     </div>
	    </div>
	</li>
	
	<li class="aui-list-item">
	    <div class="aui-list-item-inner">
	        <div class="aui-list-item-text">
	        	防火门：
	     </div>
	     <div class="aui-text-right">
	     	<label class="aui-text-info"></label>
	     	<input class="aui-radio" type="radio" name="radio2"> 完好有效</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 常闭式防火门</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 损坏</label>
	     </div>
	    </div>
	</li>
	
	<li class="aui-list-item">
	    <div class="aui-list-item-inner">
	        <div class="aui-list-item-text">
	        	疏指示标志：
	     </div>
	     <div class="aui-text-right">
	     	<label class="aui-text-info"></label>
	     	<input class="aui-radio" type="radio" name="radio2"> 完好有效</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 损坏</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 缺少</label>
	     </div>
	    </div>
	</li>
	
	<li class="aui-list-item">
	    <div class="aui-list-item-inner">
	        <div class="aui-list-item-text">
	        	应急照明：
	     </div>
	     <div class="aui-text-right">
	     	<label class="aui-text-info"></label>
	     	<input class="aui-radio" type="radio" name="radio2"> 完好有效</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 损坏</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 缺少</label>
	     </div>
	    </div>
	</li>
	
	<li class="aui-list-item">
	    <div class="aui-list-item-inner">
	        <div class="aui-list-item-text">
	        	室内消防栓：
	     </div>
	     <div class="aui-text-right">
	     	<label class="aui-text-info"></label>
	     	<input class="aui-radio" type="radio" name="radio2"> 未设置</label>
	     	<input class="aui-radio" type="radio" name="radio2"> 完好有效</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 损坏</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 无水</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 配件不齐</label>
	    		
	     </div>
	    </div>
	</li>
	
	<li class="aui-list-item">
	    <div class="aui-list-item-inner">
	        <div class="aui-list-item-text">
	        	灭火器：
	     </div>
	     <div class="aui-text-right">
	     	<label class="aui-text-info"></label>
	     	<input class="aui-radio" type="radio" name="radio2"> 未配置</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 完好</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 有但失效</label>
	     </div>
	    </div>
	</li>
	
	<li class="aui-list-item">
	    <div class="aui-list-item-inner">
	        <div class="aui-list-item-text">
	        	消防安全管理人：
	     </div>
	     <div class="aui-text-right">
	     	<label class="aui-text-info"></label>
	     	<input class="aui-radio" type="radio" name="radio2"> 确定</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 未确定</label>
	     </div>
	    </div>
	</li>
	
	<li class="aui-list-item">
	    <div class="aui-list-item-inner">
	        <div class="aui-list-item-text">
	        	消防安全工作制度：
	     </div>
	     <div class="aui-text-right">
	     	<label class="aui-text-info"></label>
	     	<input class="aui-radio" type="radio" name="radio2"> 有</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 无</label>
	    		<input class="aui-radio" type="radio" name="radio2"> 不全</label>
	     </div>
	    </div>
	</li>
	
	<li class="aui-list-item">
	    <div class="aui-list-item-inner">
	        <div class="aui-list-item-text">
	        	防火安全检查：
	     </div>
	     <div class="aui-text-right">
	     	<label class="aui-text-info"></label>
	     	<input class="aui-radio" type="radio" name="radio2"> 开展</label>
	    	<input class="aui-radio" type="radio" name="radio2"> 未开展</label>
	     </div>
	    </div>
	</li>
	<!--<li class="aui-list-item">
		<div class="aui-list-item-inner">
	        <div class="aui-list-item-input">
	            <textarea placeholder="请输入备注信息" class="aui-border-gray padding-5px" ></textarea>
	        </div>
	    </div>
	</li>-->
	
	<!--<font color="gray"><b>回复列表</b></font>-->
	    <li class="aui-list-item">
	    	<div class="aui-list-item-inner">
	            <div class="aui-list-item-input">
	                <textarea placeholder="请输入备注信息" class="aui-border-gray padding-5px"></textarea>
	            </div>
	        </div>
	    </li>
	    
	    <li class="aui-list-item">
           <div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
               <div class="aui-btn aui-btn-info aui-btn-block aui-btn-height-50px">上报</div>
           </div>
       </li>
	</ul>
</body>
<script type="text/javascript" src="../script/api.js"></script>
<script type="text/javascript" src="../script/aui-dialog.js"></script>
<script type="text/javascript">
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
            	obj.parentNode.getElementsByClassName("aui-text-info")[0].innerText = ret.text==''?"":"此项注释：" + ret.text;
            }
        });
    }
</script>

</html>