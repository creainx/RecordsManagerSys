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
		<%-- 
		<div class="m_area_partition">
			<div class="grayTit">作业管理菜单</div>
			<ul class="m_area_partition m_format_ul m_overHien">
				<li class="taskBiz_menu_item"><img class="taskBiz_menuImg"
					src="${applicationScope.proName}/img/task_logo.png" /> <label>创建新的作业</label>
				</li>
			</ul>
		</div> 
		--%>
		<div id="taskGroup_listAll" class="taskGroup_listAll m_area_partition">
			<ul id="taskGroup_menu" class="rightClickMenu">
				<li id="" class="rightClickMenu_item">添加新作业</li>
				<li class="rightClickMenu_separateItem"></li>
				<li id="" class="rightClickMenu_item">重命名</li>
				<li class="rightClickMenu_separateItem"></li>
				<li id="" class="rightClickMenu_item">清空列表</li>
				<li id="" class="rightClickMenu_item">删除分组</li>
				<li class="rightClickMenu_separateItem"></li>
				<li id="" class="rightClickMenu_item">取消</li>
			</ul>
			<ul id="taskItem_menu" class="rightClickMenu">
				<li id="taskItemMenu_publishJob" class="rightClickMenu_item">发布此作业</li>
				<li class="rightClickMenu_separateItem"></li>
				<li id="" class="rightClickMenu_item">编辑作业</li>
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
		<div id="taskDetailedInfo" class="taskDetailedInfo m_area_partition">
			<div id="selTaskName" class="selTaskName">${sessionScope.selCheckTaskInfo.tl_title}</div>
			<pre id="tasInfo_show" class="tasInfo_show"><c:choose><c:when test="${sessionScope.selCheckTaskInfo.tl_info != ''}">${sessionScope.selCheckTaskInfo.tl_info}</c:when><c:otherwise><span class="alertNotTaskInfo">没有内容</span></c:otherwise></c:choose></pre>
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
		var selId = '${sessionScope.selCheckTaskInfo.tl_id}';
		var selItem = $(".li_taskName[data-taskid=" + selId + "]");
		addTaskNameStyle(selItem);
	})();

	
</script>



















