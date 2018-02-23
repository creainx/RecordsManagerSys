$(document).ready(function() {

	(function() {
		$(".nav_item_sel").removeClass("nav_item_sel");
		$("#nav_task").addClass("nav_item_sel");
	})();
	
	//左边作业列表的方法们
	function ini_publish_job() {
		$("#publish_taskName").html();
		$("#publish_teamList").html();
		$("#publish_stuList").html();
	}
	function showRightClickMenu(e,menuList,item) {
		hideAllRightMenu();
		var xx = e.originalEvent.x || e.originalEvent.layerX || 0;
		var yy = e.originalEvent.y || e.originalEvent.layerY || 0;
		var x = item.offset();
		menuList.css("left", xx);
		menuList.css("top", x.top + 20);
		menuList.show();
	}
	function hideAllRightMenu() {
		hideGroupItemMenu();
		hideTaskItemMenu();
	}
	function hideTaskItemMenu() {
		$("#taskItem_menu").hide();
		$(".rightClickSel_li_taskName").removeClass("rightClickSel_li_taskName");
	}
	function hideGroupItemMenu() {
		$("#taskGroup_menu").hide();
		$(".rightClickSel_li_groupName").removeClass("rightClickSel_li_groupName");
	}
	$("#taskGroup_listAll").bind("contextmenu", function() {
		return false;
	});
	//点击作业
	$(".tag_taskName").mousedown(function(e) {
		var item = $(event.currentTarget);
		if (1 == e.which) {
			window.location = "http://localhost:8080/RecordsManagerSys/teacherTask/pushTask.go?pushTaskId=" + item.data("taskid");
		}else if (3 == e.which) {
			showRightClickMenu(e,$("#taskItem_menu"),item);
			item.addClass("rightClickSel_li_taskName");
		}
	});
	//点击分组
	$(".tag_groupName").mousedown(function(e) {
		if (3 == e.which) {
			var item = $(event.currentTarget);
			showRightClickMenu(e,$("#taskGroup_menu"),item);
			item.addClass("rightClickSel_li_groupName");
		}
	});
	//收缩分组
	$(".groupUnfoldShrink").click(function() {
		
		var item = $(event.currentTarget);
		
		var teamList = item.parent(".groupName").nextAll(".taskGroup_list");
		
		if (teamList.css("display") == "block") {
			teamList.css("display", "none");
			item.css(
					"backgroundPositionX", "4px");
		} else {
			teamList.css("display", "block");
			item.css(
					"backgroundPositionX", "-22px");
		}
		
		hideAllRightMenu();
	});
	//查看作业详情: 返回作业库查询此作业
	$("#taskItemMenu_checkTaskInfo").click(function() {
		var selTaskItem = $(".rightClickSel_li_taskName");
		var url = "http://localhost:8080/RecordsManagerSys/teacherTask/taskBiz.go?" +
				"selCheckTaskId=" + selTaskItem.data("taskid");
		window.location = url;
	});
	//取消按钮
	$("#taskItemMenu__cancel").click(function() {
		hideTaskItemMenu();
	});
	
	//点击选择发布的班级/学生
	$("#selectTeamMember").click(function() {
		$("#selTeamArea").show();
	});
	
	$(".tag_teamGroup_line").click(function() {
		var item = $(event.currentTarget);
		var teamList = item.next(".tag_team_list");
		
		if (teamList.css("display") == "block") {
			teamList.css("display", "none");
		} else {
			teamList.css("display", "block");
		}
	});
});