<%@ page language="java" pageEncoding="UTF-8"%>
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
			<li class="teamBiz_menu_item">
				<img class="teamBiz_menuImg"  src="${applicationScope.proName}/img/task_logo.png"/>
				<label>发布班级作业</label>
			</li>
			<li class="teamBiz_menu_item">
				<img class="teamBiz_menuImg" src="${applicationScope.proName}/img/examLogo.png"/>
				<label>发布班级考试</label>
			</li>
		</ul>
	</div>
	<div class="teamGroup_listAll m_area_partition">
	
		<div class="teamGroup_item">
			<div class="groupName">
				<label class="m_float_left">S1E</label>
				<div class="groupUnfoldShrink"></div>
			</div>
			<ul class="teamGroup_list m_format_ul">
				<li data-team_id="1" class="li_teamName">Y2E404</li>
				<li data-team_id="2" class="li_teamName">Y2E404</li>
				<li data-team_id="3" class="li_teamName">Y2E404</li>
				<li data-team_id="4" class="li_teamName">Y2E404</li>
			</ul>
		</div>
		
		<div class="teamGroup_item">
			<div class="groupName">
				<label class="m_float_left">S2E</label>
				<div class="groupUnfoldShrink"></div>
			</div>
			<ul class="teamGroup_list m_format_ul">
				<li data-team_id="5" class="li_teamName">Y2E404</li>
				<li data-team_id="6" class="li_teamName">Y2E404</li>
				<li data-team_id="7" class="li_teamName">Y2E404</li>
				<li data-team_id="8" class="li_teamName">Y2E404</li>
				<li data-team_id="9" class="li_teamName">Y2E404</li>
				<li data-team_id="10" class="li_teamName">Y2E404</li>
				<li data-team_id="somevalue" class="li_teamName">Y2E404</li>
			</ul>
		</div>
		
		<div class="teamGroup_item">
			<div class="groupName">
				<label class="m_float_left">Y2E</label>
				<div class="groupUnfoldShrink"></div>
			</div>
			<ul class="teamGroup_list m_format_ul">
				<li data-team_id="somevalue" class="li_teamName">Y2E404</li>
				<li data-team_id="somevalue" class="li_teamName">Y2E404</li>
			</ul>
		</div>
		
		<div class="teamGroup_item">
			<div class="groupName">
				<label class="m_float_left">学士后</label>
				<div class="groupUnfoldShrink"></div>
			</div>
			<ul class="teamGroup_list m_format_ul">
				<li data-team_id="1" class="li_teamName">Y2E404</li>
			</ul>
		</div>

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
</body>
</html>

<style type="text/css">

</style>
<script type="text/javascript">
	(function () {
		var sel_teamName_id = '${requestScope.selTeamId}';
		var item = null;
		if(sel_teamName_id == ""){
			item = $(".li_teamName").eq(0);
		}else{
			item = $(".li_teamName[data-team_id="+ sel_teamName_id +"]");
		}
		item.addClass("sel_li_teamName");
		item.removeClass("li_teamName");
	})();
	
	$(".li_teamName").click(function () {
		var item = $(event.currentTarget);
		var selTeamId = item.data("team_id");
		window.location = "http://localhost:8080/RecordsManagerSys/teacher/teamInfoPage.go?selTeamId=" +selTeamId;
	});
</script>



















