<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="drak_back" class="drak_back">
	<div id="alert" class="alert">
		<div id="alert_title" class="alert_title"></div>
		<div id="alert_info" class="alert_info m_width_full"></div>
		<div id="ss" class="alert_btnDiv">
			<input id="btn_yes_alert" class="alert_btn btn_green" type="button"
				value="确定" /> <input id="btn_hide_alert" class="alert_btn btn_red"
				type="reset" value="关闭" />
		</div>
	</div>
</div>

<script type="text/javascript">
	function showAlert(title, info) {
		$("#alert_title").html(title);
		$("#alert_info").html(info);
		$("#drak_back").fadeIn(300, function() {

		});
	}

	$("#btn_hide_alert").click(function hideAlert() {
		$("#drak_back").fadeOut(300, function() {
			$("#alert_title").html("");
			$("#alert_info").html("");
		});
	});
</script>


<style type="text/css">
.drak_back {
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.2);
	position: fixed;
	display: none;
	z-index: 500;
}

.alert {
	width: 340px;
	height: 170px;
	position: fixed;
	left: 50%;
	top: 30%;
	margin-left: -170px;
	box-shadow: 0px 0px 10px #0066CC;
	background-color: rgb(240, 240, 240);
	border-radius: 5px;
	z-index: 99999;
}

.alert_title {
	border-bottom: 1px #99CCCC solid;
	height: 35px;
	padding: 0px 10px;
	line-height: 35px;
	font-weight: bold;
	color: #404040;
}

.alert_btn {
	outline: none;
	border: 0;
	color: white;
	width: 80px;
	height: 30px;
	padding: 0px;
	border-radius: 5px;
	cursor: pointer;
	margin: 0px 20px;
}

.btn_red {
	background-image: linear-gradient(-180deg, #CC3333 0%, #CC0033 90%);
}

.btn_green {
	background-image: linear-gradient(-180deg, #34d058 0%, #28a745 90%);
}

.alert_btnDiv {
	width: 100%;
	height: 30px;
	padding-left: 45px;
}

.alert_info {
	padding-top: 10px;
	line-height: 30px;
	margin-left: 10px;
	margin-bottom: 20px;
	font-size: 13px;
	font-family: "微软雅黑";
	color: #404040;
	height: 60px;
}
</style>