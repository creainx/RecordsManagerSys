$(document).ready(function() {
	/*禁用浏览器右键菜单*/
	$("#teamGroup_listAll").bind("contextmenu", function() {
		return false;
	});
	/*自动绑定菜单栏*/
	(function() {
		$(".nav_item_sel").removeClass("nav_item_sel");
		$("#nav_teamInfo").addClass("nav_item_sel");
	})();
	
	/*点击班级名称的事件*/
	$(".tag_teamName").click(function() {
		var item = $(event.currentTarget);
		removeTeamNameStyle();
		addTeamNameStyle(item);
		loadTeamInfoByteamId(item.data("team_id"));
		hideAllRightMenu();
	});
	
	/*点击伸缩按钮*/
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
	
	
	//点击添加学生
	$("#btn_confirm").click(function() {
		$("#add_studentForm input[type=text]").val("");
	});
	//点击取消添加
	$("#btn_exit").click(function() {
		$("#add_student").show();

		$("#add_studentForm input[type=text]").val("");
		$("#add_studentForm").hide();
	});
	
	//分组菜单的右键菜单----------------------------------
	function hideAllRightMenu() {
		hideGroupItemMenu();
		hideTeamItemMenu();
		//hideMemberMenu();
	}
	function hideTeamItemMenu() {
		$("#teamItem_menu").hide();
		$(".rightClickSel_li_teamName").removeClass("rightClickSel_li_teamName");
	}
	
	function hideGroupItemMenu() {
		$("#teamGroup_menu").hide();
		$(".rightClickSel_li_groupName").removeClass("rightClickSel_li_groupName");
	}

/*	function hideMemberMenu() {
		$("#member_menu").hide();
		$(".rightClickSel_li_groupName").removeClass("rightClickSel_li_groupName");
	}*/
	
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
	
	//teamGroupMenu_的点击事件集合	
	$("#teamGroupMenu_cancel").click(function() {
		hideGroupItemMenu();
	});
	
	//teamItemMenu的点击事件集合
	$("#teamItemMenu_cancel").click(function() {
		hideTeamItemMenu();
	});
	
	$("#teamItemMenu_remove").click(function() {
		var selList = $(".rightClickSel_li_teamName");
		var url = "/RecordsManagerSys/teacherTeam/removeTeamInfo.go";
		var params = null;
		for (var i = 0; i < selList.length; i++) {
			params = "removeTeamId=" + selList.eq(i).data("team_id");
			$.post(url, params, function(ajaxData) {});
			showMessage(true, "删除成功", 300, false);
			var teamGroupItem = selList.eq(i).parents(".teamGroup_item");
			var tag_teamCountItem = teamGroupItem.find(".tag_teamCount");
			tag_teamCountItem.text(parseInt(tag_teamCountItem.text()) - 1);
			selList.eq(i).remove();
		}
		hideTeamItemMenu();
	});
	
	
	/*//memberMenu的点击事件
	$("#memberMenu_cancel").click(function() {
		hideMemberMenu();
	});*/
});