<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	href="${applicationScope.css}/task/teaTaskBiz.css" />
<script type="text/javascript"
	src="${applicationScope.js}/task/teaTaskBiz.js"></script>
</head>
<body class="m_format_body" onresize="reset_hint_line()">
	<jsp:include page="/WEB-INF/pages/message/message.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/pages/head/teaHead.jsp"></jsp:include>
	<div class="mid_main">

		<jsp:include page="/WEB-INF/pages/menu/teaMenu.jsp"></jsp:include>
		<div class="m_area_partition">
			<div class="grayTit">作业管理菜单</div>
			<ul class="m_area_partition m_format_ul m_overHien">
				<li class="taskBiz_menu_item"><img class="taskBiz_menuImg"
					src="${applicationScope.proName}/img/task_logo.png" /> <label>创建新的作业</label>
				</li>
			</ul>
		</div>
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
				<li id="taskItemMenu_publishJob" class="rightClickMenu_item">发布此作业</li>
				<li class="rightClickMenu_separateItem"></li>
				<li id="" class="rightClickMenu_item">重命名</li>
				<li class="rightClickMenu_separateItem"></li>
				<li id="" class="rightClickMenu_item">删除</li>
				<li class="rightClickMenu_separateItem"></li>
				<li id="taskItemMenu__cancel" class="rightClickMenu_item">取消</li>
			</ul>
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
			<div class="grayTit">发布班级作业</div>
			<div>
				<div class="publish_job_line">
					<label>作业名称&nbsp;:&nbsp;</label> <label id="publish_taskName"
						class="publish_taskName">完成图书管理系统</label>
				</div>
				<div class="publish_job_line">
					<label>发布方式&nbsp;:&nbsp;</label> <span
						id="updateType_team m_cursor_pointer"> <input
						id="radio_updateType_team"
						class="tag_publish_type m_cursor_pointer" name="publish_type"
						type="radio" value="1" checked="checked" /> <label
						class="m_cursor_pointer" for="radio_updateType_team">班级</label>
					</span> <span id="updateType_stu" class="m_cursor_pointer"> <input
						id="radio_updateType_stu"
						class="tag_publish_type m_cursor_pointer" name="publish_type"
						type="radio" value="2" /> <label class="m_cursor_pointer"
						for="radio_updateType_stu">学生</label>
					</span>
				</div>
				<div id="publish_job_team" class="publish_job_line">
					<label>发布到的班级&nbsp;:&nbsp;</label> <span id="publish_teamList">
						<label class="publish_teamItem">S1E373</label>
					</span> <label class="selectOperation">(选择班级)</label>
				</div>
				<div id="publish_job_stu" class="publish_job_line m_disnone">
					<label>发布到的学生&nbsp;:&nbsp;</label> <span id="publish_stuList">
						<label class="publish_teamItem">王小明</label>
					</span> <label class="selectOperation">(选择学生)</label>
				</div>
				<div class="publish_job_line">
					<label>要求完成时间&nbsp;:&nbsp;</label> <span><input type="text"
						value="2" class="input_completionDay" />&nbsp;天&nbsp;</span> <input
						class="input_completionTime" type="time" value="14:00" />
					<div class="publish_job_operation">
						<input id="btn_confirm" class="btn_confirm" type="button"
							value="发布作业" /> <input id="btn_exit" class="btn_exit"
							type="button" value="取消" />
					</div>
				</div>
			</div>
		</div>
		<div id="taskDetailedInfo" class="taskDetailedInfo m_area_partition">
			<div id="selTaskName" class="selTaskName"></div>
			<pre id="pre_tasInfo" class="pre_tasInfo"><c:choose><c:when test="${requestScope.selTaskInfo != ''}">${requestScope.selTaskInfo}</c:when><c:otherwise><span class="alertNotTaskInfo">没有内容</span></c:otherwise></c:choose></pre>
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
		var selId = '${requestScope.selTaskId}';
		addTaskNameStyle($(".li_taskName[data-taskid=" + selId + "]"));

		var item = $(".sel_li_taskName");
		$("#selTaskName").html(item.text());
	})();

	$(".tag_publish_type").change(function() {
		var mode = $('input:radio[name="publish_type"]:checked').val();
		if (mode == "2") {
			$("#publish_job_team").hide();
			$("#publish_job_stu").show();
		} else {
			$("#publish_job_team").show();
			$("#publish_job_stu").hide();
		}
	});
</script>



















