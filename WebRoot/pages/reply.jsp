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
                <div style="margin: auto;"><span id="toggleLable">展开回复列表</span>
                	<i id="up_down_ico" class="aui-iconfont aui-icon-top aui-collapse-arrow aui-content-padded"></i>
                </div>
            </li>
            <div id="replyDiv" style="display: none;">
	            <li class="aui-list-item">
	               	<div id="replyList" class="aui-chat" style="padding: 0.2rem">
		               			<%-- <div class='aui-chat-header' style='margin-bottom: 0.2rem;'>2016-07-13</div>
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
						        </div> --%>
		               </div>
		           </li>
		           
		           <li class="aui-list-item">
		         		<div class="aui-list-item-inner">
		                 	<div class="aui-list-item-input">
		                     	<div class="aui-list-item-text">
		               		</div>
		                   	<textarea placeholder="这里输入回复内容" id="content" name="rem"
		                   		 class="aui-border-gray padding-5px" ></textarea>
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
  var loaded = false;
  function toggleRplyDiv(callback) {
  	if(replyDiv.style.display.indexOf("none")>=0) {
  		
  		
  		//document.body.scrollTop = document.body.scrollHeight;
  		
  		//加载回复列表
  		if(!loaded) {
	  		loadReplies(function() {
	  			loaded = true;
	  			callback();
	  		});
  		}
  		
  		replyDiv.style.display = "block";
  		up_down_ico.className = up_down_ico.className.replace("aui-icon-down","aui-icon-top");
  		toggleLable.innerText = "折叠回复列表";
  		location.href='#openBtn';
  		
  		document.body.scrollTop -= 48;
  	} else {
  		
  		toggleLable.innerText = "展开回复列表";
  		replyDiv.style.display = "none";
  		up_down_ico.className = up_down_ico.className.replace("aui-icon-top","aui-icon-down");
  	}
  }
  
  if(location.href.indexOf('#nowReviewReply')>=0) {
	  toggleRplyDiv(function() {
		  document.body.scrollTop = document.body.scrollHeight;
	  });
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
	  ajaxPost("AjaxAction!submitReply", function(r) {
		  var res = eval("("+r+")");
		  if(res['result'] == 'fail') {
			  android.show('出错了');
		  } else if(res['result']=='success') {
			  /* alert("${session.user.headImg},${session.user.name},${session.user.scope},${session.user.position}");
			  alert(content.value);
			  alert(getNowFormatDate()); */
			  replyList.innerHTML += getItemHtml(true, "${session.user.headImg}"
					  , "${session.user.name}"
					  , "${session.user.scope}"
					  , "${session.user.position}"
					  , content.value
					  , getNowFormatDate());
			  
			  content.value = "";
			  bottomSpace.style.marginTop = "0rem";
			  document.body.scrollTop = document.body.scrollHeight;
		  }
	  }, {
		  "reply.ref" : '${request.report.sid}',
		  "reply.targetId" : '${request.report.userId}',
		  "reply.content" : content.value,
		  "reply.scope" : '${request.report.scope}'
	  });
  };
  function getNowFormatDate() {
	    var date = new Date();
	    var seperator1 = "-";
	    var year = date.getFullYear();
	    var month = date.getMonth() + 1;
	    var strDate = date.getDate();
	    if (month >= 1 && month <= 9) {
	        month = "0" + month;
	    }
	    if (strDate >= 0 && strDate <= 9) {
	        strDate = "0" + strDate;
	    }
	    var currentdate = year + seperator1 + month + seperator1 + strDate;
	    return currentdate;
  }
  
  function loadReplies(callback) {
	  ajaxPost("AjaxAction!loadReplyList", function(r) {
		  var res = eval("("+r+")");
		  var replies = res['replies'];
		  for(var i=0;i<replies.length;i++) {
			  var item = replies[i];
			  replyList.innerHTML += getItemHtml(item.userId=='${session.user.userId}'
					  , item.headImg
					  , item.userId, item.scope, item.scope, item.content, item.time);
		  }
		  callback();
	  }, {
		  "reply.ref" : '${request.report.sid}',
	  });
  }
  
  </script>
  
  <script type="text/javascript">
  //alert(getItemHtml());
  var oldTime = null;
  function getItemHtml(isMine, headImg, userName, scope, position, content, time) {
	  var bo = (isMine+'')=='true';
	  var isMineClass = bo?"aui-chat-right":"aui-chat-left";//'${session.user.userId==reply.userId}'=='true'?"aui-chat-right":"aui-chat-left";
	  var isMineBGColor = bo?'style=\"background-color: #f1f1f1;\"':'';
	  var isMineStyle = bo?'style=\"background-image: linear-gradient(45deg, #f3f3f3, #f3f3f3 50%, transparent 50%);\"':'';
	  var label = bo?"":"<span class='aui-label aui-label-warning'>"+scope+"公安局"+position+"职位</span>";
	  var itemHtml = 
		  "<div class='aui-chat-header' style='margin-bottom: 0.2rem;'>"+time+"</div>"
	      +"  <div class='aui-chat-item "+isMineClass+"'>"
	      +"      <div class='aui-chat-media'>"
	      +"          <img src='"+headImg+"' />"
	      +"      </div>"
	      +"      <div class='aui-chat-inner'>"
	      +"          <div class='aui-chat-name'>"+userName
	      +"          	"+label
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
