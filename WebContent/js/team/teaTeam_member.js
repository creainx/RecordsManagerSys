$(document).ready(function() {
	
	$("#teamDetailedInfo").bind("contextmenu", function() {
		return false;
	});

	function hideMemberItemMenu() {
		$("#ul_member_menu").hide();
		$(".sle_team_memberItem").removeClass("sle_team_memberItem");
	}
	
	function showRightClickMenu(e,menuList,item) {
		hideMemberItemMenu();
		var xx = e.originalEvent.x || e.originalEvent.layerX || 0;
		var yy = e.originalEvent.y || e.originalEvent.layerY || 0;
		var x = item.offset();
		menuList.css("left", xx);
		menuList.css("top", x.top + 20);
		menuList.show();
	}
	
	$(".team_memberItem").mousedown(function(e) {
		if (3 == e.which) {
			var item = $(event.currentTarget);
			showRightClickMenu(e,$("#ul_member_menu"),item);
			item.addClass("sle_team_memberItem");
		}
	});
	
});