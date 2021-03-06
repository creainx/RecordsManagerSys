$(document).ready(function() {

	$("#taskGroup_listAll").bind("contextmenu", function() {
		return false;
	});

	$(".tag_taskName").click(function() {
		var selItem = $(event.currentTarget);
		window.location = "http://localhost:8080/RecordsManagerSys/teacherTask/taskBiz.go?selCheckTaskId=" + selItem.data("taskid");
		
	});
	
	
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
	
	function showRightClickMenu(e,menuList,item) {
		hideAllRightMenu();
		var xx = e.originalEvent.x || e.originalEvent.layerX || 0;
		var yy = e.originalEvent.y || e.originalEvent.layerY || 0;
		var x = item.offset();
		menuList.css("left", xx);
		menuList.css("top", x.top + 20);
		menuList.show();
	}
	
	$(".tag_taskName").mousedown(function(e) {
		if (3 == e.which) {
			var item = $(event.currentTarget);
			showRightClickMenu(e,$("#taskItem_menu"),item);
			item.addClass("rightClickSel_li_taskName");
		}
	});

	$(".tag_groupName").mousedown(function(e) {
		if (3 == e.which) {
			var item = $(event.currentTarget);
			showRightClickMenu(e,$("#taskGroup_menu"),item);
			item.addClass("rightClickSel_li_groupName");
		}
	});
	
	
	(function() {
		$(".nav_item_sel").removeClass("nav_item_sel");
		$("#nav_task").addClass("nav_item_sel");
	})();
	
	function ini_publish_job() {
		$("#publish_taskName").html();
		$("#publish_teamList").html();
		$("#publish_stuList").html();
	}

	
	$("#taskItemMenu_publishJob").click(function() {
		var selTaskItem = $(".rightClickSel_li_taskName");
		var url = "http://localhost:8080/RecordsManagerSys/teacherTask/pushTask.go?" +
				"pushTaskId=" + selTaskItem.data("taskid");
		window.location = url;
	});
	
	$("#taskItemMenu__cancel").click(function() {
		hideTaskItemMenu();
	});

});