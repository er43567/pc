<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<style type="text/css">
			.file_input_div img{float: left;margin: 5px;}
			.file_input_div {margin-top: 10px}
		</style>
	</head>

	<body>
		<div class="file_input_div">
			<%String imgs = (String) request.getAttribute("report.imgs");
			String images = "";
			if(imgs!=null) {
				String img[] = imgs.split(";");
				for(int i=0;i<img.length;i++) {
					if(img[i]!=null && !"".equals(img[i])) {
						img[i] = basePath+"pages/upload/" + img[i];
						images += img[i]+";";
					}%>
				<img 
					src="<%=img[i]%>"
					onclick="reviewImages(<%=i%>);"
					style="width: 50px;height: 50px;" />
				<%}
			}%>
		</div>
	</body>
	<script type="text/javascript">
	function reviewImages(pos) {
		android.reviewImages('<%=images%>', pos);
	};
	</script>
	<%-- <script src="../js/mui.min.js"></script>
	<script src="../js/mui.zoom.js"></script>
	<script src="../js/mui.previewimage.js"></script>
	<script>
		mui.previewImage();
	</script> --%>
</html>