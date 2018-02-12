<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/index/teaTeam.css" />
<script type="text/javascript"
	src="${applicationScope.js}/index/teaTeam.js"></script>
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
						<li data-team_id="${i.team_id }" class="li_teamName">${i.team_name }</li>
					</c:forEach>
				</ul>
			</div>
		</c:forEach>
	</div>
	<div id="teamDetailedInfo" class="teamDetailedInfo m_area_partition">
		<div class="selTeamName">Y2E404</div>
		<div class="team_member_tit">
			<div class="team_member_titFont">班级学生</div>
			<div class="tea_team_tool">
				<input class="add_student" type="button" value="添加学生" />
			</div>
		</div>
		<div class="team_memberList">
			<div class="team_memberItem">
				<label class="item_font_interval">张三</label> <label
					class="item_font_interval">学生</label> <label
					class="item_font_interval">2000-02-05</label> <label
					class="item_font_interval m_c_green">正常状态</label>
			</div>
			<div class="team_memberItem">
				<label class="item_font_interval">张三</label> <label
					class="item_font_interval">学生</label> <label
					class="item_font_interval">2000-02-05</label> <label
					class="item_font_interval m_c_green">正常状态</label>
			</div>
			<div class="team_memberItem">
				<label class="item_font_interval">张三</label> <label
					class="item_font_interval">学生</label> <label
					class="item_font_interval">2000-02-05</label> <label
					class="item_font_interval m_c_green">正常状态</label>
			</div>
			<div class="team_memberItem">
				<label class="item_font_interval">张三</label> <label
					class="item_font_interval">学生</label> <label
					class="item_font_interval">2000-02-05</label> <label
					class="item_font_interval m_c_green">正常状态</label>
			</div>
		</div>
	</div>
</div>
<div class="m_transparencyDarkBody">
	<div class="add_student_div m_area_partition">
		<div class="grayTit">批量学生添加</div>
		<div class="m_overHien">
			<div class="stu_list">
				<div class="prepareAddStuList">
					<div class="prepareStudentInfo">ZHANGSAN</div>
					<div class="prepareStudentInfo">ZHANGSAN</div>
					<div class="prepareStudentInfo">ZHANGSAN</div>
					<div class="prepareStudentInfo">ZHANGSAN</div>
					<div class="prepareStudentInfo">ZHANGSAN</div>
					<div class="prepareStudentInfo">ZHANGSAN</div>
					<div class="prepareStudentInfo">ZHANGSAN</div>
					<div class="prepareStudentInfo">ZHANGSAN</div>
					<div class="prepareStudentInfo">ZHANGSAN</div>
					<div class="prepareStudentInfo">ZHANGSAN</div>
					<div class="prepareStudentInfo">ZHANGSAN</div>
					<div class="prepareStudentInfo">ZHANGSAN</div>
					<div class="prepareStudentInfo">ZHANGSAN</div>
					<div class="prepareStudentInfo">ZHANGSAN</div>
					<div class="prepareStudentInfo">ZHANGSAN</div>
					<div class="prepareStudentInfo">ZHANGSAN</div>
					<div class="prepareStudentInfo">ZHANGSAN</div>
					<div class="prepareStudentInfo">ZHANGSAN</div>
					<div class="prepareStudentInfo">ZHANGSAN</div>
					<div class="prepareStudentInfo">ZHANGSAN</div>
				</div>
				<div class="div_addAllArea">
					<input class="add_student" type="button" value="全部添加"/>
				</div>
			</div>
			<div class="addStuWin"></div>
		</div>
	</div>
</div>
</body>
</html>

<style type="text/css">
.add_student_div{
	width: 550px;
	position: relative;
	left: 50%;
	margin-left: -275px;
	margin-top: 80px;
	background-color: rgb(230, 230, 230);
}

.stu_list{
	width: 149px;
	height: 600px;
	float: left;
	border-right: 1px #CCCCFF solid;
}

.addStuWin{
	width: 400px;
	height: 600px;
	height: 100%;
	float: right;
}

.prepareAddStuList{
	width: 100%;
	height: 560px;
	overflow: auto;
}

.prepareStudentInfo{
	width: 100%;
	height: 30px;
	margin: 5px 0px;
	border-bottom: 1px gray solid;
}
.div_addAllArea{
	width: 100%;
	height: 40px;
	background-color: green;
}
</style>
<script type="text/javascript">
	
	(function() {
		
	})();

	
</script>



















