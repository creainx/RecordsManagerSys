$(document).ready(function() {
	
	function addTeamNameStyle(item) {
		item.addClass("sel_li_teamName");
		item.removeClass("li_teamName");
	}
	
	function removeTeamNameStyle() {
		var item = $(".sel_li_teamName");
		item.addClass("li_teamName");
		item.removeClass("sel_li_teamName");
	}
	
	$(".li_teamName").click(function() {
		var item = $(event.currentTarget);
		var selTeamId = item.data("team_id");
		removeTeamNameStyle();
		
		var selItem = $(".li_teamName[data-team_id='" + selTeamId + "']");
		addTeamNameStyle(selItem);
	});
	
	addTeamNameStyle($(".li_teamName").eq(0));
	
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
	
	
	$(".groupName").dblclick(function() {
		var teamList = $(event.currentTarget).nextAll(
				".teamGroup_list");
		if (teamList.css("display") == "block") {
			teamList.css("display", "none");
			$(event.currentTarget).children(".groupUnfoldShrink").css(
					"backgroundPositionX", "4px");
		} else {
			teamList.css("display", "block");
			$(event.currentTarget).children(".groupUnfoldShrink").css(
					"backgroundPositionX", "-22px");
		}
	});
});