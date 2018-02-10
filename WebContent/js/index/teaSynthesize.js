$(document).ready(function() {
	$(".shrink_group_teamList").prevAll(".team_grouptitle").click(function() {
		var teamList = $(event.currentTarget).nextAll(
				".shrink_group_teamList");
		if (teamList.css("display") == "block") {
			teamList.css("display", "none");
			$(event.currentTarget).children(".groupUnfoldShrink").css(
					"backgroundPositionX", "6px");
		} else {
			teamList.css("display", "block");
			$(event.currentTarget).children(".groupUnfoldShrink").css(
					"backgroundPositionX", "-39px");
		}
	});
});