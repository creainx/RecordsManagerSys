$(document).ready(function() {
		// 绑定进入事件
		$(".nav_item").mouseenter(function() {

			var item = $(event.currentTarget);// 获得标题

			$("#hint_line").stop(true);

			var line_left = parseInt(item.offset().left)
					+ parseInt(item.css("paddingLeft"));

			$("#hint_line").animate({
				width : item.css("width"),
				left : line_left
			}, 100);

		});

		// 绑定当前的分类的离开事件
		$("#main_nav").mouseleave(function() {

			var item = $(".nav_item_sel");

			var line_width = item.css("width");

			var line_left = parseInt(item.offset().left)
					+ parseInt(item.css("padding-left"));

			$("#hint_line").stop(true);

			$("#hint_line").animate({
				width : line_width,
				left : line_left
			}, 100);

		});
		
		
		

});