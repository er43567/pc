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
	<li class="aui-list-header">旅馆行业质检表单</li>
	<li class="aui-list-item">
          <div class="aui-list-item-inner">
              <div class="aui-list-item-text">
              	是否实名登记旅客信息：
           </div>
           <div class="aui-text-right">
           	<label class="aui-text-info"></label>
           	<input class="aui-radio" type="radio"  name="radio2"> 是</label>
          		<input class="aui-radio" type="radio"  name="radio2" onclick="openDialog(this)"> 否</label>
           </div>
          </div>
      </li>
      <li class="aui-list-item">
          <div class="aui-list-item-inner">
              <div class="aui-list-item-text">
              	登记的旅客数与入住的旅客数是否相同：
           </div>
           <div class="aui-text-right">
           	<label class="aui-text-info"></label>
           	<input class="aui-radio" type="radio"  name="radio2"> 是</label>
          		<input class="aui-radio" type="radio"  name="radio2" onclick="openDialog(this)"> 否</label>
           </div>
          </div>
      </li>
      <li class="aui-list-item">
          <div class="aui-list-item-inner">
              <div class="aui-list-item-text">
              	是否在规定时间内上传旅客信息：
           </div>
           <div class="aui-text-right">
           	<label class="aui-text-info"></label>
           	<input class="aui-radio" type="radio"  name="radio2"> 是</label>
          		<input class="aui-radio" type="radio"  name="radio2" onclick="openDialog(this)"> 否</label>
           </div>
          </div>
      </li>
      <li class="aui-list-item">
          <div class="aui-list-item-inner">
              <div class="aui-list-item-text">
              	入住旅客信息是否登记完善：
           </div>
           <div class="aui-text-right">
           	<label class="aui-text-info"></label>
           	<input class="aui-radio" type="radio"  name="radio2"> 是</label>
          		<input class="aui-radio" type="radio"  name="radio2" onclick="openDialog(this)"> 否</label>
           </div>
          </div>
      </li>
      <li class="aui-list-item">
          <div class="aui-list-item-inner">
              <div class="aui-list-item-text">
              	当天的开房数是（），与实际上传数是否相符：
           </div>
           <div class="aui-text-right">
           	<label class="aui-text-info"></label>
           	<input class="aui-text-center" type="text" name="text1" style="border:1px solid gray; width: 40px; height: 25px; float:left; margin-left:190px ;" /></label>
            	<input class="aui-radio" type="radio"  name="radio2"> 是</label>
           		<input class="aui-radio" type="radio"  name="radio2" onclick="openDialog(this)"> 否</label>
            </div>
           </div>
       </li>
       
       <li class="aui-list-item">
           <div class="aui-list-item-inner">
               <div class="aui-list-item-text">
               	有无“黄赌毒”等违法犯罪现象：
            </div>
            <div class="aui-text-right">
            	<label class="aui-text-info"></label>
            	<input class="aui-radio" type="radio"  name="radio2"> 是</label>
           		<input class="aui-radio" type="radio"  name="radio2" onclick="openDialog(this)"> 否</label>
            </div>
           </div>
       </li>
       
       <li class="aui-list-item">
           <div class="aui-list-item-inner">
               <div class="aui-list-item-text">
《特种行业许可证》在上年度是否通过年检：
               </div>
            <div class="aui-text-right">
            	<label class="aui-text-info"></label>
            	<input class="aui-radio" type="radio"  name="radio2"> 是</label>
           		<input class="aui-radio" type="radio"  name="radio2" onclick="openDialog(this)"> 否</label>
            </div>
           </div>
       </li>
       
       <li class="aui-list-item">
           <div class="aui-list-item-inner">
               <div class="aui-list-item-text">
客房门是否结实牢固、安全有效：
               </div>
            <div class="aui-text-right">
            	<label class="aui-text-info"></label>
            	<input class="aui-radio" type="radio"  name="radio2"> 是</label>
           		<input class="aui-radio" type="radio"  name="radio2" onclick="openDialog(this)"> 否</label>
            </div>
           </div>
       </li>
       
       <li class="aui-list-item">
           <div class="aui-list-item-inner">
               <div class="aui-list-item-text">
               	疏散通道和出口是否设置明显指示标示，易于寻找方便疏散：
            </div>
            <div class="aui-text-right">
            	<label class="aui-text-info"></label>
            	<input class="aui-radio" type="radio"  name="radio2"> 是</label>
           		<input class="aui-radio" type="radio"  name="radio2" onclick="openDialog(this)"> 否</label>
            </div>
           </div>
       </li>
       
       <li class="aui-list-item">
           <div class="aui-list-item-inner">
               <div class="aui-list-item-text">
               	疏散通道是否上锁、堵塞，封死等隐患：
            </div>
            <div class="aui-text-right">
            	<label class="aui-text-info"></label>
            	<input class="aui-radio" type="radio"  name="radio2"> 是</label>
           		<input class="aui-radio" type="radio"  name="radio2" onclick="openDialog(this)"> 否</label>
            </div>
           </div>
       </li>
       
       <li class="aui-list-item">
           <div class="aui-list-item-inner">
               <div class="aui-list-item-text">
               	灭火器材，消防设施是否齐全有效：
            </div>
            <div class="aui-text-right">
            	<label class="aui-text-info"></label>
            	<input class="aui-radio" type="radio"  name="radio2"> 是</label>
           		<input class="aui-radio" type="radio"  name="radio2" onclick="openDialog(this)"> 否</label>
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