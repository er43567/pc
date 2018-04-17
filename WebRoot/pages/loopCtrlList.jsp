<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>物品领用闭环管理列表</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script type="text/javascript" src="js/ext.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/aui.css" />
    <style type="text/css">
    .aui-list-item-text {height: 2rem !important;}
    </style>
    <style type="text/css">
      .float-img {background-color:white;position: fixed;top: 78%;left: 78%;z-index: 999;border-radius: 25px;box-shadow:5px 2px 6px #000;}
	  .float-img:ACTIVE {box-shadow:2px 1px 3px #000;top: 78.1%;left: 78.1%;}
	  
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
						<div class='aui-list-item-right'>2018-01-01</div>
						<div class="aui-label aui-label-success">AUI</div>
					</div>
				</div>
			</div>
		</li> -->
	  </ul>
	  <div id="ifNoData" style="display: none;">
	  	<iframe id="ifNoDataFrame" src="" style="width: 100%;height: 100%;position: absolute;left: 0px;top: 0px;border: none;">
	  	</iframe>
	  </div>
	  <s:if test="#session.user.rank==1">
	  	  <img id="float-btn" class="float-img" src="images/加号.png" style="" width="50" height="50" onclick="startUrl('loopCtrl.jsp')"/>
	  </s:if>
	  <div id="loadMoreBtn" class="loadMoreBtn" onclick="loadMore()">加载更多</div>
  </body>
  <script type="text/javascript">
  var choosedUnit = getParam("goods.unit");
  </script>
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
				  ulList.innerHTML += getItem(item.sid, item.type, item.time, item.confirms1, item.confirms2, item.confirms3);
				  hasNext = true;
			  }
			  if(hasNext) {
				  page++;
				  loadMoreBtn.innerText = "加载更多";
			  } else {
				  loadMoreBtn.innerText = "没有更多数据了";
				  if(page == 1) {
					  //如果一个数据也没有
					  ifNoDataFrame.setAttribute("src", "empty.html");
					  ifNoData.style.display = "block";
					  loadMoreBtn.style.display = "none";
					  ulList.style.height = "100%";
				  }
			  }
		  }
	  }, {
		  "page":page,
	  	  "goods.unit":escape(choosedUnit)
	  });
  }
  
  function itemClicked(n) {
	  startUrl("PageAction!loadGoodsPage?goods.sid=" + n);
  }
  
  </script>
  <script type="text/javascript">
  function onActivityResult(result) {
	  location.reload();
  }
  </script>
  <script type="text/javascript">
  function getItem(sid, title, time, confirms1, confirms2, confirms3) {
	  var state = "处理中";
	  var labelStyle = "aui-label-warning";
	  if("爆破员 安全员 库管员".indexOf(confirms1)>=0
			  && "爆破员 安全员 安全负责人".indexOf(confirms2)>=0
			  && "爆破员 安全员 库管员".indexOf(confirms3)>=0) {
		  state = "完成";
		  labelStyle = "aui-label-success";
	  }
	  var stateDiv = "<div class='aui-label "+labelStyle+"'>"+state+"</div>";
	  var itemHtml = 
		  "<li class='aui-list-item aui-list-item-middle' onclick='itemClicked("+sid+")'>"
		  +"	<div class='aui-media-list-item-inner'>"
		  +"		<div class='aui-list-item-inner aui-list-item-arrow'>"
		  +"			<div class='aui-list-item-text'>"
		  +"				<div class='aui-list-item-title aui-font-size-14'>"+title+"</div>"
		  +"				<div class='aui-list-item-right'>"+time+"</div>"
		  + stateDiv
		  +"			</div>"
		  +"		</div>"
		  +"	</div>"
		  +"</li>";
	  return itemHtml;
  }
  </script>
</html>
