<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/must.css" />
<script type="text/javascript" src="${applicationScope.js}/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>管理中心</title>
<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/team/teaTeam.css" />
<script type="text/javascript"
	src="${applicationScope.js}/team/teaTeam.js"></script>
</head>
<body class="m_format_body" onresize="reset_hint_line()">
	<jsp:include page="/WEB-INF/pages/message/message.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/pages/head/teaHead.jsp"></jsp:include>
	<div class="mid_main">
		<jsp:include page="/WEB-INF/pages/menu/teaMenu.jsp"></jsp:include>
		<div class="m_overHien">
			<ul id="ul_member_menu" class="ul_member_menu m_format_ul">
				<li id="ul_menu_cancel" class="li_item">查看学生作业记录</li>
				<li id="ul_menu_download" class="li_item">发布作业</li>
				<li id="ul_menu_setBranch" class="li_item">发布考试</li>
				<li id="ul_menu_delFile" class="li_item">设置职位</li>
				<li id="ul_menu_cancel23" class="li_item">禁用学生</li>
				<li id="ul_menu_cancel2" class="li_item">删除学生</li>
				<li id="ul_menu_cancel" class="li_item">取消</li>
			</ul>
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
			<div class="teamGroup_listAll m_area_partition">
				<c:forEach items="${groupList }" var="i">
					<div class="teamGroup_item">
						<div class="groupName">
							<label class="m_float_left">${i.tg_name}</label>
							<div class="groupUnfoldShrink"></div>
						</div>
						<ul class="teamGroup_list m_format_ul">
							<c:forEach items="${i.teamInfoList }" var="i">
								<li class="li_teamName" data-team_id="${i.team_id }">${i.team_name }</li>
							</c:forEach>
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
							<input id="btn_goon_add" class="btn_goon_add" type="button"
								value="添加" /> <input id="btn_exit_add" class="btn_exit_add"
								type="button" value="关闭" />
						</div>
					</div>
				</div>
			</div>
			<div id="teamDetailedInfo" class="teamDetailedInfo m_area_partition">
				<div class="selTeamName">Y2E404</div>
				<div class="team_member_tit">
					<div class="team_member_titFont">
						<input type="checkbox" />班级学生
					</div>
					<div class="tea_team_tool">
						<input id="add_student" class="add_student" type="button"
							value=添加学生 />
					</div>
				</div>
				<div class="team_memberList">
					<div class="header_team_memberItem">
						<label class="header_item_font_interval">账号</label> <label
							class="header_item_font_interval">姓名</label> <label
							class="header_item_font_interval m_c_green">账号状态</label> <label
							class="header_item_font_interval">操作</label>
					</div>
					<div id="loadarea_member"></div>
				</div>
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
	
	//初始化
	//1.绑定选中的班级
	//2.加载选中班级的学生列表
	(function () {
		var selTeamId = '${requestScope.selTeamId}';
		if(selTeamId == ""){
			addTeamNameStyle($(".li_teamName").eq(0));
		}else{
			alert($(".li_teamName[data-team_id="+ selTeamId+"]").html());
			addTeamNameStyle($(".li_teamName[data-team_id="+ selTeamId+"]"));
		}
		var loadTeamId = $(".sel_li_teamName").data("team_id");
		
		var url = "${applicationScope.proName}/teacher/getTeamMember.go";
		var params = "teamId=" + loadTeamId;
		$.post(url, params, function(ajaxData) {
			$("#loadarea_member").append(ajaxData);
		});
		
	})();
</script>



















