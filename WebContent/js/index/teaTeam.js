$(document).ready(function() {
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
	
	
	$(".groupName").click(function() {
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