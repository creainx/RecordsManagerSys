<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="message" class="message">
	<img id="message_img" class="stateImg"/>
	<div id="message_info" class="message_info"></div>
</div>

<script type="text/javascript">
	function showMessage(result, info, speed, isReLoad) {
		
		if(speed == null || speed == ""){
			if(result){
				speed = 400;
			}else{
				speed = 800;
			}
		}
		
		if(isReLoad == null || isReLoad == ""){
			isReLoad = false;
		}
		
		$("#message_info").html(info);

		if (result != "" && result != null && (result == true || result == "true")) {
			$("#message_img").prop("src", "${applicationScope.img}/succee.png");
			$("#message").addClass("message_succee");
		} else {
			$("#message_img").prop("src", "${applicationScope.img}/error.png");
			$("#message").addClass("message_error");
		}

		$("#message").fadeIn(speed, function() {
			setTimeout(function() {
				$("#message").animate({
					top : "70px",
					opacity : "0"
				}, speed, function() {
					$("#message").hide();
					$("#message").css("opacity", "1");
					$("#message").css("top", "120px");
					if (isReLoad) {
						window.location.reload();
					}
				});

			}, speed);
		});

	}
</script>


<style type="text/css">
.message {
	width: 240px;
	height: 60px;
	position: fixed;
	left: 50%;
	top: 120px;
	margin-left: -120px;
	background-color: rgb(245, 245, 245);
	border-radius: 5px;
	display: none;
	margin-left: -110px;
	z-index: 999;
}

.message_error {
	box-shadow: 0px 0px 10px red;
	color: #CC0033;
}

.message_succee {
	box-shadow: 0px 0px 10px #2BD54D;
	color: #00d41d;
}

.stateImg {
	width: 60px;
	height: 60px;
	float: left;
	margin-left: 5px;
}

.message_info {
	height: 60px;
	line-height: 60px;
	float: left;
	margin-left: 10px;
	font-size: 18px;
	font-family: "微软雅黑";
	font-weight: bold;;
	letter-spacing: 0.8px;
}
</style>