<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/must.css"/	>
<script type="text/javascript" src="${applicationScope.js}/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>管理中心</title>
<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/index/teaIndex.css" />
<script type="text/javascript"
	src="${applicationScope.js}/index/teaIndex.js"></script>
</head>
<body class="m_format_body">
	<jsp:include page="/WEB-INF/pages/message/message.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/pages/head/teaHead.jsp"></jsp:include>
	<div class="mid_main">
		<div class="area_partition">
			<div class="main_topArea"></div>
			<ul id="main_nav" class="main_nav">
				<li id="nav_teamInfo" class="nav_item nav_item_sel">班级</li>
				<li id="nav_dataAnalyze" class="nav_item">数据分析</li>
				<li id="nav_userInfo" class="nav_item">个人中心</li>
			</ul>
			<div id="hint_line" class="hint_line"></div>
		</div>
		<div class="m_overHien">
			<div id="load_area" class="main_info_area area_partition"></div>
			<div class="main_tool_area area_partition"></div>
		</div>
	</div>
</body>
</html>
<style type="text/css">

</style>
<script type="text/javascript">
	(function () {
		var selTeaNavId = '${requestScope.selTeaNavId}';
		if(selTeaNavId != ""){
			$(".nav_item_sel").removeClass("nav_item_sel");
			$("#" + selTeaNavId).addClass("nav_item_sel");
		}
		
		var sel_item = $(".nav_item_sel");// 获得标题
		
		var selId = sel_item.attr("id");

		var line_left = parseInt(sel_item.offset().left)
				+ parseInt(sel_item.css("padding-left"));
		
		$("#hint_line").css("left",line_left);
		
		$("#hint_line").css("width",sel_item.css("width"));
		
		if(selId == "nav_teamInfo"){
			ajaxLoadTeamInfo();
		}else if(selId == "nav_dataAnalyze"){
			
		}else if(selId == "nav_userInfo"){
			
		}
	})();
	
	function ajaxLoad(url, params) {
		$.post(url, params, function(ajaxData) {
			$("#load_area").children().remove();
			$("#load_area").append(ajaxData);
		});
	}
	
	function ajaxLoadTeamInfo() {
		var url = "${applicationScope.proName}/teacher/getTeamInfo.go";
		var params = "";
		ajaxLoad(url, params);
	}

	
</script>















