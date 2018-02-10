<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/must.css" />
<script type="text/javascript" src="${applicationScope.js}/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>管理中心</title>
<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/index/teaIndex.css" />
<script type="text/javascript"
	src="${applicationScope.js}/index/teaIndex.js"></script>
</head>
<body class="m_format_body" onresize="reset_hint_line()">
	<jsp:include page="/WEB-INF/pages/message/message.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/pages/head/teaHead.jsp"></jsp:include>
	<div class="mid_main">
		<div class="m_area_partition_notTop">
			<div class="main_topArea"></div>
			<ul id="main_nav" class="main_nav">
				<li id="nav_index" class="nav_item">综合</li>
				<li id="nav_teamInfo" class="nav_item">我的班级</li>
				<li id="nav_task" class="nav_item">作业管理</li>
				<li id="nav_examination" class="nav_item">试题库</li>
				<li id="nav_dataAnalyze" class="nav_item">数据分析</li>
				<li id="nav_userInfo" class="nav_item">个人中心</li>
			</ul>
			<div id="hint_line" class="hint_line"></div>
		</div>
		<div id="load_area" class="m_overHien"></div>
	</div>
</body>
</html>
<style type="text/css">
</style>
<script type="text/javascript">
	function reset_hint_line() {
		var sel_item = $(".nav_item_sel");// 获得标题
		var line_left = parseInt(sel_item.offset().left)
				+ parseInt(sel_item.css("paddingLeft"));
		$("#hint_line").css("left", line_left);
		$("#hint_line").css("width", sel_item.css("width"));
	}

	function ajaxLoad(url, params) {
		$.post(url, params, function(ajaxData) {
			$("#load_area").children().remove();
			$("#load_area").append(ajaxData);

			//等待加载完成再绑定left,不然可能会出现因为出现滚动条导致left位置误差
			setTimeout(function() {	
				reset_hint_line();
			}, 150);
		});
	}

	(function() {
		var selTeaNavId = '${requestScope.sel_navId}';
		if (selTeaNavId != "") {
			$(".nav_item_sel").removeClass("nav_item_sel");
			$("#" + selTeaNavId).addClass("nav_item_sel");
		}else{
			$(".nav_item").eq(0).addClass("nav_item_sel");
		}

		var sel_item = $(".nav_item_sel");// 获得标题

		var selId = sel_item.attr("id");

		if (selId == "nav_index") {
			
			ajaxLoadTeaSynthesize();
			
		} else if (selId == "nav_teamInfo") {
			
			ajaxLoadTeaTeamInfo();
			
		} else if (selId == "nav_userInfo") {

		}
	})();

	function ajaxLoadTeaSynthesize() {
		var url = "${applicationScope.proName}/teacher/getTeaSynthesize.go";
		var params = "";
		ajaxLoad(url, params);
	}
	
	function ajaxLoadTeaTeamInfo() {
		var sel_teamName_id = '${requestScope.selTeamId}';
		var url = "${applicationScope.proName}/teacher/getTeaTeam.go";
		var params = "selTeamId=" + sel_teamName_id;
		ajaxLoad(url, params);
	}
</script>















