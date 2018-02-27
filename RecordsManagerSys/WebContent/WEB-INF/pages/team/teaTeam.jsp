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
<title>管理中心</title>
<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/menu/rightClickMenu.css" />
<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/team/teaTeam.css" />
<script type="text/javascript"
	src="${applicationScope.js}/team/teaTeam.js"></script>
</head>
<body class="m_format_body" onresize="reset_hint_line()">
	<jsp:include page="/WEB-INF/pages/message/message.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/pages/head/teaHead.jsp"></jsp:include>
	<div class="mid_main">
		<div class="m_overHien">
			<div class="m_area_partition">
				<div class="grayTit">班级管理菜单</div>
				<ul class="m_area_partition m_format_ul m_overHien">
					<li class="teamBiz_menu_item"><img class="teamBiz_menuImg"
						src="${applicationScope.proName}/img/task_logo.png" /> <label>发布班级作业</label>
					</li>
					<li class="teamBiz_menu_item"><img class="teamBiz_menuImg"
						src="${applicationScope.proName}/img/examLogo.png" /> <label>发布班级考试</label>
					</li>
				</ul>
			</div>
			<div id="teamGroup_listAll" class="teamGroup_listAll m_area_partition">
				<ul id="teamGroup_menu" class="rightClickMenu">
					<li id="" class="rightClickMenu_item">重命名</li>
					<li class="rightClickMenu_separateItem"></li>
					<li id="" class="rightClickMenu_item">添加班级</li>
					<li class="rightClickMenu_separateItem"></li>
					<li id="" class="rightClickMenu_item">清空列表</li>
					<li id="" class="rightClickMenu_item">删除分组</li>
					<li class="rightClickMenu_separateItem"></li>
					<li id="teamGroupMenu_cancel" class="rightClickMenu_item">取消</li>
				</ul>
				<ul id="teamItem_menu" class="rightClickMenu">
					<li id="" class="rightClickMenu_item">重命名</li>
					<li class="rightClickMenu_separateItem"></li>
					<li id="teamItemMenu_remove" class="rightClickMenu_item">删除</li>
					<li class="rightClickMenu_separateItem"></li>
					<li id="teamItemMenu_cancel" class="rightClickMenu_item">取消</li>
				</ul>
				<c:forEach items="${teamGroupList }" var="i">
					<div class="teamGroup_item">
						<div class="groupName tag_groupName">
							<label class="m_float_left">${i.tg_name}(<span class="tag_teamCount">${fn:length(i.teamInfoList)}</span>)</label>
							<div class="groupUnfoldShrink"></div>
						</div>
						<ul class="teamGroup_list m_format_ul">
							<c:choose>
								<c:when test="${fn:length(i.teamInfoList) == 0}">
									<li class="alertNotTeam">没有班级</li>
								</c:when>
								<c:otherwise>
									<c:forEach items="${i.teamInfoList }" var="i">
										<li class="li_teamName tag_teamName"
											data-team_id="${i.team_id }">${i.nameFont }</li>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</c:forEach>
			</div>
			<div id="add_studentForm" class="add_studentForm m_area_partition">
				<div class="grayTit">添加学生</div>
				<div>
					<div class="addStu_formLine">
						<label>姓名&nbsp;:&nbsp;</label> <input
							class="add_formText txt_addname" type="text" />
					</div>
					<div class="addStu_formLine">
						<label>账号&nbsp;:&nbsp;</label> <input
							class="add_formText txt_id_prefix" type="text" />&nbsp;+&nbsp;<input
							class="add_formText" type="text" /> &nbsp;&nbsp;&nbsp;
					</div>
					<div class="addStu_formLine">
						<label>密码&nbsp;:&nbsp;</label> <input class="add_formText"
							type="text" value="0000" />

						<div class="addStu_operation">
							<input id="btn_confirm" class="btn_confirm" type="button"
								value="添加" /> <input id="btn_exit" class="btn_exit"
								type="button" value="关闭" />
						</div>
					</div>
				</div>
			</div>
			<div id="teamDetailedInfo" class="teamDetailedInfo m_area_partition">
				<div id="loading_teamInfo" class="loading_teamInfo">加载中...</div>
				<div id="loadArea_member_list"></div>
			</div>
		</div>
	</div>
</body>
</html>

<style type="text/css">
</style>
<script type="text/javascript">
	function addTeamNameStyle(item) {
		item.addClass("sel_li_teamName");
		item.removeClass("li_teamName");
	}

	function removeTeamNameStyle() {
		var item = $(".sel_li_teamName");
		item.addClass("li_teamName");
		item.removeClass("sel_li_teamName");
	}

	var loadingTime = null;

	function loadTeamInfoByteamId(loadTeamId) {
		
		loadingTime = setTimeout(function() {
			$("#loading_teamInfo").show();
		}, 300);

		var url = "${applicationScope.proName}/teacher/getTeamMember.go";
		var params = "teamId=" + loadTeamId;
		$.post(url, params, function(ajaxData) {
			clearTimeout(loadingTime);
			$("#loading_teamInfo").hide();
			$("#add_studentForm").hide();
			$("#loadArea_member_list").html(ajaxData);
		});
	}

	//初始化
	//1.绑定选中的班级
	//2.加载选中班级的学生列表
	(function() {
		var selTeamId = '${sessionScope.selTeamId}';
		if (selTeamId == "") {
			addTeamNameStyle($(".li_teamName").eq(0));
		} else {
			addTeamNameStyle($(".li_teamName[data-team_id=" + selTeamId + "]"));
		}
		var loadTeamId = $(".sel_li_teamName").data("team_id");
		loadTeamInfoByteamId(loadTeamId);
	})();
</script>



















