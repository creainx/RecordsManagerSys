<%@ page language="java" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/head/teaHead.css" />
<script type="text/javascript"
	src="${applicationScope.js}/head/teaHead.js"></script>
<div class="teaHead">
	<div class="mid_head">
		<ul class="left_headMenu">
			<li id="goIndex" class="menu_item">首页</li>
			<li id="nav_teamInfo" class="menu_item">我的班级</li>
			<li id="nav_task" class="menu_item">作业库</li>
			<li id="nav_examination" class="menu_item">试题库</li>
			<li id="nav_dataAnalyze" class="menu_item">数据分析</li>
		</ul>
		<ul class="right_headMenu">
			<li class="menu_item">欢迎您,${teaInfo.tea_name}</li>
		</ul>
	</div>
</div>








