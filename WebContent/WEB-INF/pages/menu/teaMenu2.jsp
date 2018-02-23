<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/menu/teaMenu.css" />
<script type="text/javascript"
	src="${applicationScope.js}/menu/teaMenu.js"></script>

<div class="m_area_partition_notTop">
	<div class="main_topArea"></div>
	<ul id="main_nav" class="main_nav">
		<li id="nav_synthesize" class="nav_item">综合</li>
		<li id="nav_teamInfo" class="nav_item">我的班级</li>
		<li id="nav_task" class="nav_item">作业库</li>
		<li id="nav_examination" class="nav_item">试题库</li>
		<li id="nav_dataAnalyze" class="nav_item">数据分析</li>
		<li id="nav_userInfo" class="nav_item">个人中心</li>
	</ul>
	<div id="hint_line" class="hint_line"></div>
</div>

<script type="text/javascript">
	function reset_hint_line() {
		var sel_item = $(".nav_item_sel");// 获得标题
		var line_left = parseInt(sel_item.offset().left)
				+ parseInt(sel_item.css("paddingLeft"));
		$("#hint_line").css("left", line_left);
		$("#hint_line").css("width", sel_item.css("width"));
	}
</script>