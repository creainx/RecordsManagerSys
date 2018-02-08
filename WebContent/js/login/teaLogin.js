$(document).ready(function() {

	(function() {
		if ($("#user_id").val() == "") {
			$("#user_id").focus();
		} else {
			$("#user_pwd").focus();
		}
	})();

	$("#user_id").keydown(function() {
		if (event.which == 13) {
			$("#user_pwd").focus();
			event.preventDefault();
		}
	});

	$("#user_pwd").keydown(function() {
		if (event.which == 13) {
			$("#btn_login").click();
			event.preventDefault();
		}
	});
});