$(document).ready(function() {

	/*(function() {
		$(".nav_item_sel").removeClass("nav_item_sel");
		$("#nav_task").addClass("nav_item_sel");
	})();*/
	
	//左边作业列表的方法们
	/*function ini_publish_job() {
		$("#publish_taskName").html();
		$("#publish_teamList").html();
		$("#publish_stuList").html();
	}*/
	
	/*function showRightClickMenu(e,menuList,item) {
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

	*/

	
	//点击选择发布的班级/学生
	$("#show_openSelectTeam").click(function() {
		$("#openSelectTeam").show();
	});
	
	//点击分组的行进行展开和收缩
	$(".tag_groupName_line").click(function() {
		var item = $(event.currentTarget);
		if(item.hasClass("tag_groupName_line")){
			var teamList = item.next(".tag_listAll_area");

			if (teamList.css("display") == "block") {
				teamList.css("display", "none");
			} else {
				teamList.css("display", "block");
			}
		}
	
	});
	
	//展开与收缩班级学生列表
	$(".area_line").click(function() {
		var item = $(event.target);
		if(item.hasClass("area_line")){
			var memberList = item.children(".list_lineInfo");
			if(memberList.css("display") == "none"){
				item.children(".icon_unfoldShrink").text("∧");
				memberList.show();
			}else{
				item.children(".icon_unfoldShrink").text("∨");
				memberList.hide();
			}
		}
	});
	
	//选中班级checked
	function teamChange(teamCheckBox){
		
		var checkedBool = teamCheckBox.prop("checked");
		
		var memberList = teamCheckBox.nextAll(".list_lineInfo");
		
		memberList.find("input.tag_stu_checkBox").prop({"checked": checkedBool});
		
		var selMemberCountItem = teamCheckBox.nextAll(".tag_team_nameFont").children(".selStuCount");
		
		if(checkedBool){
			selMemberCountItem.text(memberList.find("input.tag_stu_checkBox:checked").length);
		}else{
			selMemberCountItem.text(0);
		}
	}
	$(".tag_team_checkBox").change(function() {
		teamChange($(event.currentTarget));
	});
	$(".tag_team_nameFont").click(function() {
		var item = $(event.currentTarget);
		var checkBox = item.prevAll(".tag_team_checkBox");
		checkBox.prop({"checked": !(checkBox.prop("checked"))});
		teamChange(checkBox);
	});
	
	//选中学生checked
	function memberChange(memberCheckBox){
		
		 var memberList = memberCheckBox.parents(".list_lineInfo");
		 
		 var selCount = memberList
			.find("input.tag_stu_checkBox:checked").length;
		 
		 var teamCheckBox = memberList.prevAll(".tag_team_checkBox");
		 if(selCount == 0){
			 teamCheckBox.prop({"checked": false});
		 }else{
			 teamCheckBox.prop({"checked": true});
		 }
		 
		 memberList.prevAll(".tag_team_nameFont").children("span.selStuCount").text(selCount);
	}
	$(".tag_checkBox").change(function() {
		memberChange($(event.currentTarget));
	});
	$(".item_line").click(function() {
		var item = $(event.target);
		if(item.hasClass("item_line")){
			 var checkBox = item.children(".tag_stu_checkBox");
			 checkBox.prop({"checked": !(checkBox.prop("checked"))});
			 memberChange(checkBox);
		}
	});
	
	$("#team_finishEnd").click(function() {
		var html_selTeamInfo = "";
		var selTeamList = $("input.tag_team_checkBox:checked");
		for (var i = 0; i < selTeamList.length; i++) {
			html_selTeamInfo += selTeamList.eq(i).nextAll(".tag_team_nameFont").text();
			if(i != (selTeamList.length - 1)){
				html_selTeamInfo += "、";
			}
		}
		$("#publish_teamItemList").text(html_selTeamInfo);
		$("#openSelectTeam").hide();
	});

});