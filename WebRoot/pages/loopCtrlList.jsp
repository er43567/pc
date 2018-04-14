<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>物品领用闭环管理列表</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <script type="text/javascript" src="js/ext.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/aui.css" />
    <style type="text/css">
    .aui-list-item-text {height: 2rem !important;}
    </style>
    <style type="text/css">
	  .loadMoreBtn {
	  	width: 100%;
	  	height: 2.5rem;
	  	line-height: 2.5rem;
	  	text-align:center;
	  	border-top: 1px solid #d3d3d3;
	  	border-bottom: 1px solid #d3d3d3;
	  	color: gray;
	  }
	  #ulList{min-height: 26rem}
	</style>
	
	<script>
	window.onscroll = function () {
	    var a = document.documentElement.scrollTop == 0 ? document.body.clientHeight : document.documentElement.clientHeight;
	    var b = document.documentElement.scrollTop == 0 ? document.body.scrollTop : document.documentElement.scrollTop;
	    var c = document.documentElement.scrollTop == 0 ? document.body.scrollHeight : document.documentElement.scrollHeight;
	    if (b != 0) {
	        if (a + b == c) {
	        	loadMore();
	        }
	    }
	};
	</script>
	
  </head>
  
  <body>
	  <ul id="ulList" class="aui-list aui-media-list">
	    <!-- <li class='aui-list-item aui-list-item-middle'>
			<div class='aui-media-list-item-inner'>
				<div class='aui-list-item-inner aui-list-item-arrow'>
					<div class='aui-list-item-text'>
						<div class='aui-list-item-title aui-font-size-14'>AUI</div>
						<div class='aui-list-item-right'>08:00</div>
					</div>
				</div>
			</div>
		</li> -->
	  </ul>
	  <div id="loadMoreBtn" class="loadMoreBtn" onclick="loadMore()">加载更多</div>
  </body>
  <script type="text/javascript">
  var page = 1;
  var hasNext = false;
  loadMore();
  function loadMore() {
	  ajaxPostWithEval("AjaxAction!loadGoodsList", function(res, result) {
		  if(result == 'success') {
			  var li = res['goodsList'];
			  hasNext = false;
			  for(var i=0;i<li.length;i++) {
				  var item = li[i];
				  ulList.innerHTML += getItem(item.sid, item.type, item.time);
				  hasNext = true;
			  }
			  if(hasNext) {
				  page++;
				  loadMoreBtn.innerText = "加载更多";
			  } else {
				  loadMoreBtn.innerText = "没有更多数据了";
			  }
		  }
	  }, {
		  "page":page
	  });
  }
  
  function itemClicked(n) {
	  alert(n);
	  //startUrl("PageAction!loadGoodsPage?goods.sid=" + n);
  }
  
  </script>
  <script type="text/javascript">
  function getItem(sid, title, time) {
	  var itemHtml = 
		  "<li class='aui-list-item aui-list-item-middle' onclick='itemClicked("+sid+")'>"
		  +"	<div class='aui-media-list-item-inner'>"
		  +"		<div class='aui-list-item-inner aui-list-item-arrow'>"
		  +"			<div class='aui-list-item-text'>"
		  +"				<div class='aui-list-item-title aui-font-size-14'>"+title+"</div>"
		  +"				<div class='aui-list-item-right'>"+time+"</div>"
		  +"			</div>"
		  +"		</div>"
		  +"	</div>"
		  +"</li>";
	  return itemHtml;
  }
  </script>
</html>
