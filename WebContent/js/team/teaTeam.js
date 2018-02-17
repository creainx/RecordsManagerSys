$(document).ready(function() {
	
	$("#teamGroup_listAll").bind("contextmenu", function() {
		return false;
	});
	
	(function() {
		$(".nav_item_sel").removeClass("nav_item_sel");
		$("#nav_teamInfo").addClass("nav_item_sel");
	})();
	
	$(".tag_teamName").click(function() {
		var item = $(event.currentTarget);
		removeTeamNameStyle();
		addTeamNameStyle(item);
		loadTeamInfoByteamId(item.data("team_id"));
		hideAllRightMenu();
	});
	
	
	$("#teamDetailedInfo").bind("contextmenu", function() {
		return false;
	})
	
	$(".groupUnfoldShrink").click(function() {
		
		var item = $(event.currentTarget);
		
		var teamList = item.parent(".groupName").nextAll(".teamGroup_list");
		
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
	
	$("#add_student").click(function() {
		if ($("#add_studentForm").css("display") == 'none') {
			$("#add_student").hide();
			$("#add_studentForm").show();
		} else {
			$("#add_studentForm").hide();
		}
	});

	$("#btn_goon_add").click(function() {
		$("#add_studentForm input[type=text]").val("");
	});

	$("#btn_exit_add").click(function() {
		$("#add_student").show();

		$("#add_studentForm input[type=text]").val("");
		$("#add_studentForm").hide();
	});
	
	//分组菜单的右键菜单----------------------------------
	

	
	function hideAllRightMenu() {
		hideGroupItemMenu();
		hideTeamItemMenu();
	}
	function hideTeamItemMenu() {
		$("#teamItem_menu").hide();
		$(".rightClickSel_li_teamName").removeClass("rightClickSel_li_teamName");
	}
	
	function hideGroupItemMenu() {
		$("#teamGroup_menu").hide();
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
	
	$(".tag_teamName").mousedown(function(e) {
		if (3 == e.which) {
			var item = $(event.currentTarget);
			showRightClickMenu(e,$("#teamItem_menu"),item);
			item.addClass("rightClickSel_li_teamName");
		}
	});

	$(".tag_groupName").mousedown(function(e) {
		if (3 == e.which) {
			var item = $(event.currentTarget);
			showRightClickMenu(e,$("#teamGroup_menu"),item);
			item.addClass("rightClickSel_li_groupName");
		}
	});
	//分组菜单的右键菜单----------------------------------
});