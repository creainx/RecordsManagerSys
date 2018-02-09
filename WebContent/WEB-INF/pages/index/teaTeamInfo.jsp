<%@ page language="java" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/index/teaTeamInfo.css" />
<script type="text/javascript"
	src="${applicationScope.js}/index/teaTeamInfo.js"></script>
<div class="m_overHien">
	<div class="teamGroup_listAll m_area_partition">
		<div class="team_group">
			<div class="team_title">默认分组</div>
			<div class="default_shrink_group_teamList">
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
			</div>
		</div>

		<div class="team_group">
			<div class="team_grouptitle">
				<div class="groupName">S1班级</div>
				<div class="groupUnfoldShrink"></div>
			</div>
			<div class="shrink_group_teamList">
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
			</div>
		</div>

		<div class="team_group">
			<div class="team_grouptitle">
				<div class="groupName">S2班级</div>
				<div class="groupUnfoldShrink"></div>
			</div>
			<div class="shrink_group_teamList">
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
			</div>
		</div>

		<div class="team_group">
			<div class="team_grouptitle">
				<div class="groupName">Y2班级</div>
				<div class="groupUnfoldShrink"></div>
			</div>
			<div class="shrink_group_teamList">
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
				<div class="teamInfo_item newTeamInfo">Y2E404</div>
			</div>
		</div>

	</div>
	<div class="team_rigth_area">
	
		<div class="tea_team_tool m_area_partition">

			<div class="tool_item_line">
				<div class="tool_area_separate tool_area_separateBorder">
					<img class="toolImg" /> <label class="toolName">新增班级</label>
				</div>

				<div class="tool_area_separate">
					<img class="toolImg" /> <label class="toolName">新增分组</label>
				</div>
			</div>

			<div class="tool_item_line">
				<div class="tool_area">
					<img class="toolImg" /> <label class="toolName">发布作业</label>
				</div>
			</div>

			<div class="tool_item_line">
				<div class="tool_area">
					<img class="toolImg" /> <label class="toolName">发布考试</label>
				</div>
			</div>

		</div>
		
		<div class="tea_team_report m_area_partition">
			<div class="task_alert">
				<div class="report_title">开放提交中的作业</div>
				<div class="task_list">
					<div class="task_item">
						[作业]<label class="taskTitle">上机练习3</label>
					</div>
					<div class="task_item">
						[考试]<label class="taskTitle">2017年S2结业试卷</label>
					</div>
				</div>
			</div>
		</div>
		
		<div class="tea_team_report m_area_partition">
			<div class="task_alert">
				<div class="report_title">未批改的作业</div>
				<div class="task_list">
					<div class="task_item">
						[作业]<label class="taskTitle">完成图书管理系统</label>
					</div>
					<div class="task_item">
						[作业]<label class="taskTitle">完成班级管理系统</label>
					</div>
					<div class="task_item">
						[作业]<label class="taskTitle">制作一个网页</label>
					</div>
					<div class="task_item">
						[考试]<label class="taskTitle">2016年S2结业试卷</label>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</div>
<style>
.task_alert {
	padding: 12px 12px 0px;
}

.tea_team_report {
	
}

.report_title {
	font-size: 18px;
	height: 23px;
	line-height: 23px;
	font-family: "微软雅黑";
	font-weight: bold;
	color: #333333;
	overflow: hidden;
	user-select: none;
	font-family: "微软雅黑";
}

.task_list {
	padding: 0px;
}

.task_item {
	padding: 10px 0px;
	cursor: pointer;
	font-size: 13px;
	color: #FF0033;
}

.taskTitle {
	color: #0066CC;
	margin-left: 5px;
	cursor: pointer;
}

.task_item:not(:last-child){
	border-bottom: 1px rgba(200,200, 200, 0.5) solid;
}

.taskTitle:hover{
	color: #FF0033;
}
</style>
<script type="text/javascript">
	
</script>