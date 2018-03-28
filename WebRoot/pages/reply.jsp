<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  </head>
  
  <body>
		<ul class="aui-list aui-select-list" style="margin-top: 8px;">
           	<li class="aui-list-item" style="color: gray;" onclick="toggleRplyList();">
                <div style="margin: auto;">展开回复列表
                	<i id="up_down_ico" class="aui-iconfont aui-icon-top aui-collapse-arrow aui-content-padded"></i>
                </div>
            </li>
            <div id="replyList">
	            <li class="aui-list-item">
	               <div class="aui-chat" style="padding: 0.2rem">
	               
		               	<div class="aui-chat-header" style="margin-bottom: 0.2rem;">2016-07-13</div>
					        	<div class="aui-chat-item aui-chat-left">
					            <div class="aui-chat-media">
					                <img src="../image/demo2.png" />
					            </div>
					            <div class="aui-chat-inner">
					                <div class="aui-chat-name">admin
					                	<span class="aui-label aui-label-warning">XX公安局XX部门</span>
					                </div>
					                <div class="aui-chat-content">
					                    <div class="aui-chat-arrow"></div>
					                    Hello xfsdfasdf 
					                </div>
					                <div class="aui-chat-status aui-chat-status-refresh">
					                    <i class="aui-iconfont aui-icon-correct aui-text-success"></i>
					                </div>
					            </div>
					        </div>
					        <div class="aui-chat-item aui-chat-right">
					            <div class="aui-chat-media">
					                <img src="${session.user.headImg}" />
					            </div>
					            <div class="aui-chat-inner">
					                <div class="aui-chat-name">asd</div>
					                <div class="aui-chat-content" style="background-color: #f1f1f1;">
					                    <div class="aui-chat-arrow" style="background-image: linear-gradient(45deg, #f3f3f3, #f3f3f3 50%, transparent 50%);"></div>
					                    	撒旦发射点
					                </div>
					                <div class="aui-chat-status">
					                    <i class="aui-iconfont aui-icon-info aui-text-danger"></i>
					                </div>
					            </div>
					        </div>
		            </div>
		           </li>
		           <li class="aui-list-item">
		         		<div class="aui-list-item-inner">
		                 	<div class="aui-list-item-input">
		                     	<div class="aui-list-item-text">
		               		</div>
		                   	<textarea placeholder="这里输入备注信息" id="rem" name="rem"
		                   		 class="aui-border-gray padding-5px" >${request.report.rem}</textarea>
		              		</div>
		              		<div style="text-align: right;margin-right: 1rem;">
		              			<div onclick="submitReply()" class="aui-btn aui-btn-info">提交回复</div>
		              		</div>
		            	</div>
		           </li>
		        </div>
      </ul>
      <div id="bottomSpace"></div>
  </body>
  
  <script type="text/javascript">
  function toggleRplyList() {
  	if(replyList.style.display.indexOf("none")>=0) {
  		replyList.style.display = "block";
  		up_down_ico.className = up_down_ico.className.replace("aui-icon-down","aui-icon-top");
  		document.body.scrollTop = document.body.scrollHeight;
  	} else {
  		replyList.style.display = "none";
  		up_down_ico.className = up_down_ico.className.replace("aui-icon-top","aui-icon-down");
  	}
  }
  rem.onfocus = function() {
	  bottomSpace.style.marginTop = "13.14rem";
	  document.body.scrollTop = document.body.scrollHeight;
  };
  rem.onblur = function() {
	  setTimeout(function(){
		  bottomSpace.style.marginTop = "0rem";
	  }, 10);
  };
  function submitReply() {
	  bottomSpace.style.marginTop = "0rem";
	  document.body.scrollTop = document.body.scrollHeight;
  };
  </script>
</html>
