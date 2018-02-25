<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/must.css" />
<script type="text/javascript" src="${applicationScope.js}/jquery.js"></script>
<script type="text/javascript" src="${applicationScope.js}/must.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>作业管理</title>
<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/menu/rightClickMenu.css" />
<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/task/teaPushTask.css" />
<script type="text/javascript"
	src="${applicationScope.js}/task/teaPushTask.js"></script>
</head>
<body class="m_format_body">
	<jsp:include page="/WEB-INF/pages/message/message.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/pages/head/teaHead.jsp"></jsp:include>
	<div class="mid_main">
		<div id="taskGroup_listAll" class="taskGroup_listAll m_area_partition">
			<ul id="taskGroup_menu" class="rightClickMenu">
				<li id="" class="rightClickMenu_item">重命名</li>
				<li class="rightClickMenu_separateItem"></li>
				<li id="" class="rightClickMenu_item">添加班级</li>
				<li class="rightClickMenu_separateItem"></li>
				<li id="" class="rightClickMenu_item">清空列表</li>
				<li id="" class="rightClickMenu_item">删除分组</li>
				<li class="rightClickMenu_separateItem"></li>
				<li id="" class="rightClickMenu_item">取消</li>
			</ul>
			<ul id="taskItem_menu" class="rightClickMenu">
				<li id="taskItemMenu_checkTaskInfo" class="rightClickMenu_item">查看作业详情</li>
				<li class="rightClickMenu_separateItem"></li>
				<li id="" class="rightClickMenu_item">编辑作业</li>
				<li class="rightClickMenu_separateItem"></li>
				<li id="" class="rightClickMenu_item">删除</li>
				<li class="rightClickMenu_separateItem"></li>
				<li id="taskItemMenu__cancel" class="rightClickMenu_item">取消</li>
			</ul>
			<!-- <div class="myTaskList_font">作业列表</div> -->
			<c:forEach items="${taskGroupList }" var="i">
				<div class="taskGroup_item">
					<div class="groupName tag_groupName">
						<label class="m_float_left">${i.tg_name}</label>
						<div class="groupUnfoldShrink"></div>
					</div>
					<ul class="taskGroup_list m_format_ul">
						<c:forEach items="${i.teaTaskTemplateLibraryList }" var="i">
							<li class="li_taskName tag_taskName" data-taskid="${i.tl_id }">${i.tl_title}</li>
						</c:forEach>
					</ul>
				</div>
			</c:forEach>
		</div>
		<div id="publish_job" class="publish_job m_area_partition">
			<div id="selTeamArea" class="m_transparencyDarkBody">
				<div class="selTeamArea">
					<div class="selTeam_titleMenu">
						<label class="font_selTeam">选择班级</label> <label
							class="font_setEnter">完成</label>
					</div>
					<c:forEach items="${requestScope.teamGroupList}" var="i">
						<div>
							<div class="teamGroup_line tag_teamGroup_line">
								<span>${i.tg_name}</span>
							</div>
							<div class="teamInfoAll tag_team_list">
								<c:choose>
									<c:when test="${fn:length(i.teamInfoList) == 0}">
												没有班级
											</c:when>
									<c:otherwise>
										<c:forEach items="${i.teamInfoList }" var="i">
											<div class="teamInfo_line" data-team_id="${i.team_id }">
												<input class="tag_team_checkbox" type="checkbox" /> <label
													class="m_cursor_pointer tag_team_name">${i.team_name }(${fn:length(i.teamMemberList)})</label>
												<span class="teamMemberUnfoldShrink">∨</span>
												<div class="teamInfo_memberList">
													<c:forEach items="${i.teamMemberList}" var="stu">
														<div class="memberItem_line">
															<input class="tag_member_checkbox" type="checkbox" /> <label class="m_cursor_pointer">${stu.stu_name}</label>
														</div>
													</c:forEach>
												</div>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="selTaskName">发布作业</div>
			<div>
				<div class="publish_job_line">
					<label>作业名称&nbsp;:&nbsp;</label> <input id="publish_taskName"
						class="publish_taskName"
						value="${requestScope.selPushTaskInfo.tl_title}" />
				</div>
				<div id="publish_job_team" class="publish_job_line">
					<label>发布到&nbsp;:&nbsp;</label>
					<div class="m_display_inline">
						<div class="m_display_inline" id="publish_teamList">
							<label class="publish_teamItem">S1E373(34/34)</label>
						</div>
					</div>
					<label id="selectTeamMember" class="selectOperation">(选择)</label>
				</div>
				<div class="publish_job_line">
					<label>要求时间&nbsp;:&nbsp;</label> <span><input type="text"
						value="2" class="input_completionDay" />&nbsp;天&nbsp;</span> <input
						class="input_completionTime" type="time" value="14:00" />
					<div class="publish_job_operation">
						<input id="btn_confirm" class="btn_confirm" type="button"
							value="发布作业" />
					</div>
				</div>
				<div class="publish_job_line">
					<textarea id="" class="redact_tasInfo"><c:choose>
							<c:when test="${requestScope.selPushTaskInfo.tl_info != ''}">${requestScope.selPushTaskInfo.tl_info}</c:when>
							<c:otherwise>
								<span class="alertNotTaskInfo">没有内容</span>
							</c:otherwise>
						</c:choose></textarea>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

<style type="text/css">
</style>
<script type="text/javascript">
	function addTaskNameStyle(item) {
		item.addClass("sel_li_taskName");
		item.removeClass("li_taskName");
	}

	function removeTaskNameStyle() {
		var item = $(".sel_li_taskName");
		item.addClass("li_taskName");
		item.removeClass("sel_li_taskName");
	}

	//初始化
	(function() {
		var selId = '${requestScope.selPushTaskInfo.tl_id}';
		var selItem = $(".li_taskName[data-taskid=" + selId + "]");
		addTaskNameStyle(selItem);
	})();
</script>



















