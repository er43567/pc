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
		<ul id="openBtn" class="aui-list aui-select-list" style="margin-top: 8px;">
           	<li class="aui-list-item" style="color: gray;" onclick="toggleRplyDiv();">
                <div style="margin: auto;">展开回复列表
                	<i id="up_down_ico" class="aui-iconfont aui-icon-top aui-collapse-arrow aui-content-padded"></i>
                </div>
            </li>
            <div id="replyDiv">
	            <li class="aui-list-item">
	               	<div id="replyList" class="aui-chat" style="padding: 0.2rem">
		               			<div class='aui-chat-header' style='margin-bottom: 0.2rem;'>2016-07-13</div>
						        <div class='aui-chat-item aui-chat-left'>
						            <div class='aui-chat-media'>
						                <img src='../image/demo2.png' />
						            </div>
						            <div class='aui-chat-inner'>
						                <div class='aui-chat-name'>admin
						                	<span class='aui-label aui-label-warning'>XX公安局XX部门</span>
						                </div>
						                <div class='aui-chat-content'>
						                    <div class='aui-chat-arrow'></div>
						                    Hello xfsdfasdf 
						                </div>
						                <div class='aui-chat-status aui-chat-status-refresh'>
						                    <i class='aui-iconfont aui-icon-correct aui-text-success'></i>
						                </div>
						            </div>
						        </div>
						        <div class='aui-chat-item aui-chat-right'>
						            <div class='aui-chat-media'>
						                <img src='${session.user.headImg}' />
						            </div>
						            <div class='aui-chat-inner'>
						                <div class='aui-chat-name'>asd</div>
						                <div class='aui-chat-content' style='background-color: #f1f1f1;'>
						                    <div class='aui-chat-arrow' style='background-image: linear-gradient(45deg, #f3f3f3, #f3f3f3 50%, transparent 50%);'></div>
						                    	撒旦发射点
						                </div>
						                <div class='aui-chat-status'>
						                    <i class='aui-iconfont aui-icon-info aui-text-danger'></i>
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
		                   	<textarea placeholder="这里输入回复内容" id="content" name="rem"
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
  toggleRplyDiv();
  function toggleRplyDiv() {
  	if(replyDiv.style.display.indexOf("none")>=0) {
  		replyDiv.style.display = "block";
  		up_down_ico.className = up_down_ico.className.replace("aui-icon-down","aui-icon-top");
  		//document.body.scrollTop += document.body.scrollHeight;
  		location.href='#openBtn';
  		document.body.scrollTop -= 48;
  	} else {
  		replyDiv.style.display = "none";
  		up_down_ico.className = up_down_ico.className.replace("aui-icon-top","aui-icon-down");
  	}
  }
  
  content.onfocus = function() {
	  bottomSpace.style.marginTop = "13.14rem";
	  document.body.scrollTop = document.body.scrollHeight;
  };
  
  var focus = false;
  content.onblur = function() {
	  setTimeout(function() {
		  bottomSpace.style.marginTop = "0rem";
	  }, 10);
  };
  
  function submitReply(ref, targetUserId) {
	  if(content.value == "") {
		  alert("请输入内容");
		  return;
	  }
	  /* ajaxPost("AjaxAction!submitReply", function(r) {
		  
	  }, {
		  
	  }); */
	  replyList.innerHTML += getItemHtml("${session.user.headImg}", "asd", "as", "afd", content.value, "2018-03-28");
	  content.value = "";
	  bottomSpace.style.marginTop = "0rem";
	  document.body.scrollTop = document.body.scrollHeight;
  };
  
  </script>
  
  <script type="text/javascript">
  //alert(getItemHtml());
  function getItemHtml(headImg, userId, scope, position, content, time) {
	  var bo = Math.random()>0.5;
	  var isMineClass = bo?"aui-chat-right":"aui-chat-left";//'${session.user.userId==reply.userId}'=='true'?"aui-chat-right":"aui-chat-left";
	  var isMineBGColor = bo?'style=\"background-color: #f1f1f1;\"':'';
	  var isMineStyle = bo?'style=\"background-image: linear-gradient(45deg, #f3f3f3, #f3f3f3 50%, transparent 50%);\"':'';
	  var itemHtml = 
		  "<div class='aui-chat-header' style='margin-bottom: 0.2rem;'>"+time+"</div>"
	      +"  <div class='aui-chat-item "+isMineClass+"'>"
	      +"      <div class='aui-chat-media'>"
	      +"          <img src='"+headImg+"' />"
	      +"      </div>"
	      +"      <div class='aui-chat-inner'>"
	      +"          <div class='aui-chat-name'>"+userId
	      +"          	<span class='aui-label aui-label-warning'>"+scope+"公安局"+position+"职位</span>"
	      +"          </div>"
	      +"          <div class='aui-chat-content' "+isMineBGColor+">"
	      +"              <div class='aui-chat-arrow' "+isMineStyle+"></div>"
	      +"              "+content
	      +"          </div>"
	      +"          <div class='aui-chat-status aui-chat-status-refresh'>"
	      +"              <i class='aui-iconfont aui-icon-correct aui-text-success'></i>"
	      +"          </div>"
	      +"      </div>"
	      +"  </div>";
	  return itemHtml;
  }
  </script>
</html>
