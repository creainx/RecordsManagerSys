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
	<div class="publish_job m_area_partition">
		<div id="openSelectTeam" class="m_transparencyDarkBody">
			<div class="midSelectArea">
				<div class="selTeam_titleMenu">
					<label class="hoverFont">选择班级</label> <label id="team_finishEnd"
						class="font_setEnter">完成</label>
				</div>
				<c:forEach items="${requestScope.teamGroupList}" var="i">
					<div>
						<div class="groupName_line tag_groupName_line">
							<span>${i.tg_name}</span>
						</div>
						<div class="listAll_area tag_listAll_area">
							<c:choose>
								<c:when test="${fn:length(i.teamInfoList) == 0}">
												没有班级
											</c:when>
								<c:otherwise>
									<c:forEach items="${i.teamInfoList }" var="i">
										<div class="area_line" data-team_id="${i.team_id }">
											<input class="tag_team_checkBox" type="checkbox" /> <label
												class="m_cursor_pointer nameFont tag_team_nameFont">${i.team_name }(<span
												class="selStuCount">0</span>/${fn:length(i.teamMemberList)})
											</label> <span class="icon_unfoldShrink">∨</span>
											<div class="list_lineInfo">
												<c:forEach items="${i.teamMemberList}" var="stu">
													<div class="item_line">
														<input class="tag_stu_checkBox" type="checkbox" /> <label
															class="nameFont m_cursor_pointer">${stu.stu_name}</label>
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
					value="${requestScope.selPushTaskInfo.tl_title}" /> <label
					id="show_selPushTask" class="selectOperation">(选择作业)</label>
			</div>
			<div id="publish_job_team" class="publish_job_line">
				<label>发布到&nbsp;:&nbsp;</label>
				<div class="m_display_inline">
					<div class="m_display_inline" id="publish_teamList">
						<label id="publish_teamItemList" class="publish_teamItemList"></label>
					</div>
				</div>
				<label id="show_openSelectTeam" class="selectOperation">(选择班级)</label>
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
	
</script>



















