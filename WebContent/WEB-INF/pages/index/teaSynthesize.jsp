<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/index/teaSynthesize.css" />
<script type="text/javascript"
	src="${applicationScope.js}/index/teaSynthesize.js"></script>
<div class="m_overHien">
	<div class="teamGroup_listAll m_area_partition">
		<div class="team_group">
			<div class="team_title">置顶</div>
			<div class="default_shrink_group_teamList">
				<c:forEach items="${topTeamList }" var="i">
					<div class="teamInfo_item newTeamInfo">${i.team_name }</div>
				</c:forEach>
			</div>
		</div>
		<c:forEach items="${groupList }" var="i">
			<div class="team_group">
				<div class="team_grouptitle">
					<div class="groupName">${i.tg_name }</div>
					<div class="groupUnfoldShrink"></div>
				</div>
				<div class="shrink_group_teamList">
					<c:forEach items="${i.teamInfoList }" var="t">
						<div class="teamInfo_item newTeamInfo">${t.team_name }</div>
					</c:forEach>
				</div>
			</div>
		</c:forEach>
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

</style>
<script type="text/javascript">
	
</script>