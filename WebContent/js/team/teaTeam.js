$(document).ready(function() {
	
	$(".tag_teamName").click(function() {
		var item = $(event.currentTarget);
		var selTeamId = item.data("team_id");
		removeTeamNameStyle();
		var selItem = $(".li_teamName[data-team_id='" + selTeamId + "']");
		addTeamNameStyle(selItem);
		loadTeamInfoByteamId(selTeamId);
	});
	
	
	$("#teamDetailedInfo").bind("contextmenu", function() {
		return false;
	})

	$(".team_memberItem").mousedown(function(e) {
		if (3 == e.which) {

			var item = $(event.currentTarget);

			var xx = e.originalEvent.x
					|| e.originalEvent.layerX || 0;
			var yy = e.originalEvent.y
					|| e.originalEvent.layerY || 0;

			var x = item.offset();

			$("#ul_member_menu").css("left", xx);
			$("#ul_member_menu").css("top", x.top);
			$("#ul_member_menu").show();

			$(".sle_team_memberItem").removeClass("sle_team_memberItem");
			item.addClass("sle_team_memberItem");
		}
	});
	
	
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
});