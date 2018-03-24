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
    <title>民爆行业质检表单</title>
    
    <link rel="stylesheet" type="text/css" href="../css/aui.css" />
    <link rel="stylesheet" href="css/ext.css" />
    
    <script type="text/javascript" src="js/ext.js" ></script>
    
</head>
<body>
     <div class="aui-content aui-margin-b-15">
       <ul class="aui-list aui-select-list">
       <li class="aui-list-header">民爆行业质检表单</li>
       	<!--<font color="gray"><b>检查项目</b></font>-->
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	守库人员是否到岗：
                </div>
                <div class="aui-text-right">
                	<label class="aui-text-info"></label>
                	<input class="aui-radio" type="radio"  name="item1"> 是</label>
               		<input class="aui-radio" type="radio"  name="item1" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	安全员、库管员是否持证上岗：
                </div>
                <div class="aui-text-right">
                	<label class="aui-text-info"></label>
                	<input class="aui-radio" type="radio"  name="item2"> 是</label>
               		<input class="aui-radio" type="radio"  name="item2" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	入侵报警装置、周界报警装置是否正常运作：
                </div>
                <div class="aui-text-right">
                	<label class="aui-text-info"></label>
                	<input class="aui-radio" type="radio"  name="item3"> 是</label>
               		<input class="aui-radio" type="radio"  name="item3" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	是否配置两只以上大型犬（注：是否需要照相上传功能）：
                </div>
                <div class="aui-text-right">
                	<label class="aui-text-info"></label>
                	<input class="aui-radio" type="radio"  name="item4"> 是</label>
               		<input class="aui-radio" type="radio"  name="item4" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	大型犬是否正常、健康：
                </div>
                <div class="aui-text-right">
                	<label class="aui-text-info"></label>
                <!--	<input class="aui-text-center" type="text" name="text1" style="border:1px solid gray; width: 40px; height: 25px; float:left; margin-left:190px ;" /></label>-->
                	<input class="aui-radio" type="radio"  name="item5"> 是</label>
               		<input class="aui-radio" type="radio"  name="item5" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
           
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	库房值班记录本是否如实记录本班发生的事项：
                </div>
                <div class="aui-text-right">
                	<label class="aui-text-info"></label>
                	<input class="aui-radio" type="radio" name="item6"> 是</label>
               		<input class="aui-radio" type="radio" name="item6" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
           
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
				消防水池储水量是否大于15立方米或设高位水池：
                   </div>
                <div class="aui-text-right">
                	<label class="aui-text-info"></label>
                	<input class="aui-radio" type="radio"  name="item7"> 是</label>
               		<input class="aui-radio" type="radio"  name="item7" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
           
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
				库房内杂物是否清理干净：
                   </div>
                <div class="aui-text-right">
                	<label class="aui-text-info"></label>
                	<input class="aui-radio" type="radio"  name="item8"> 是</label>
               		<input class="aui-radio" type="radio"  name="item8" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
           
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	领用、发放、清退等级台账是否如实、齐全：
                </div>
                <div class="aui-text-right">
                	<label class="aui-text-info"></label>
                	<input class="aui-radio" type="radio"  name="item9"> 是</label>
               		<input class="aui-radio" type="radio"  name="item9" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
           
           <li class="aui-list-item">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	变质和过期失效的民爆物品，是否及时上报并清退出库，予以销毁：
                </div>
                <div class="aui-text-right">
                	<label class="aui-text-info"></label>
                	<input class="aui-radio" type="radio"  name="item10"> 是</label>
               		<input class="aui-radio" type="radio"  name="item10" onclick="openDialog(this)"> 否</label>
                </div>
               </div>
           </li>
	    	<li class="aui-list-item">
          		<div class="aui-list-item-inner">
                  	<div class="aui-list-item-input">
                      	<div class="aui-list-item-text">
                      	备注
                		</div>
                    	<textarea placeholder="这里输入备注信息" name="rem" class="aui-border-gray padding-5px" ></textarea>
               		</div>
             	</div>
          	</li>
          	<li class="aui-list-item">
                <div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
                    <div class="aui-btn aui-btn-info aui-btn-block aui-btn-height-50px">上报</div>
                </div>
            </li>
		</ul>
	</div>

</body>
<script type="text/javascript" src="../script/api.js" ></script>
<script type="text/javascript" src="../script/aui-dialog.js" ></script>
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