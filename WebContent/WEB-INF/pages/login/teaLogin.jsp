<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/must.css"/	>
<script type="text/javascript" src="${applicationScope.js}/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>教师登陆</title>
<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/login/teaLogin.css" />
<script type="text/javascript"
	src="${applicationScope.js}/login/teaLogin.js"></script>
</head>
<body class="m_format_body">
	<jsp:include page="/WEB-INF/pages/message/message.jsp"></jsp:include>
	<div class="login_area">
		<div id="login_loading" class="login_loading"></div>
		<div class="login_tit">教师登录</div>
		<div class="login_form">
			<form id="teaInfo_form">
				<div class="input_line">
					<input id="user_id" class="txt_input" type="text" name="tea_id"
						placeholder="请输入账号..." value="${cookie.cookieTeaId.value}" />
				</div>
				<div id="id_alertMassage" class="login_alertLine"></div>
				<div class="input_line">
					<input id="user_pwd" class="txt_input" type="text" name="tea_pwd"
						placeholder="请输入密码..." />
				</div>
				<div id="pwd_alertMassage" class="login_alertLine"></div>
				<div class="btn_line">
					<input id="btn_login" class="btn_login" type="button" value="登录" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>
<style type="text/css">
.try{
	
}
</style>
<script type="text/javascript">
	//防止多次点击登陆
	var loginCount = 0;
	
	var forbiddenTime = null;

	function setIdErrorMessage(info) {
		$("#id_alertMassage").html(info);
		$("#user_id").focus();
	}

	function setPwdErrorMessage(info) {
		$("#pwd_alertMassage").html(info);
		$("#user_pwd").focus();
	}

	//登录信息验证
	function verLoginInfo() {
		//清除之前的错误信息
		$(".login_alertLine").html("");

		var teaId = $.trim($("#user_id").val());
		var teaPwd = $.trim($("#user_pwd").val());

		if (teaId.length == 0) {
			setIdErrorMessage("未填写账号");
		} else if (teaId.length > 12) {
			setIdErrorMessage("账号必须小于12位数");
		} else if (teaPwd.length == 0) {
			setPwdErrorMessage("未填写密码");
		} else if (teaPwd.length > 12) {
			setPwdErrorMessage("密码必须小于12位数");
		}else{
			return true;
		}

		return false;
	}

	//登陆中时禁止部分操作
	function forbiddenInputState() {
		$(".login_alertLine").html("");
		
		$("#btn_login").css("opacity","0.5");
		$("#btn_login").attr("disabled", "disabled");
		$("#user_id").attr("disabled", "disabled");
		$("#user_pwd").attr("disabled", "disabled");
	}

	//恢复禁止的操作
	function resetInputState() {
		$("#btn_login").css("opacity","1");
		
		$("#btn_login").removeAttr("disabled");
		$("#user_id").removeAttr("disabled");
		$("#user_pwd").removeAttr("disabled");
	}

	//教师登陆按钮
	$("#btn_login").click(function() {
		if (verLoginInfo()) {
			loginCount++;
			//多次反复登陆则禁止20秒操作
			if(loginCount >= 8){
				//禁止登陆操作
				forbiddenInputState();
				showMessage(false, "操作频繁",300);
				
				if(forbiddenTime == null){
					forbiddenTime = setTimeout(function() {
						resetInputState();
						$("#user_pwd").focus();
						forbiddenTime = null;
						loginCount = 0;
					}, 30000);
				}
				return false;
			}
			
			var loginTime = setTimeout(function() {
				showMessage(false, "登陆超时");
				resetInputState();
				$("#user_pwd").focus();
				//隐藏 loading.gif
				$("#login_loading").hide();
			}, 10000);

			var url = "${applicationScope.proName}/teacher/login.go";
			var params = $("#teaInfo_form").serialize();
			//登陆中时禁止部分操作
			forbiddenInputState();
			//显示 loading.gif
			$("#login_loading").show();
			$.post(url, params, function(ajaxData) {
				if (ajaxData.result != null && ajaxData.result == true) {
					window.location = "${applicationScope.proName}/teacher/indexPage.go";
				} else {
					//恢复禁止的操作
					resetInputState();
					//隐藏 loading.gif
					$("#login_loading").hide();
					//清除判断超时的timeout
					clearTimeout(loginTime);
					if (ajaxData.errorNum != null && ajaxData.errorNum == 1) {
						setIdErrorMessage(ajaxData.errorMessage);
						//其余错误信息都显示在密码框下方
					} else {
						setPwdErrorMessage(ajaxData.errorMessage);
					}
				}
			});
		}
	});
</script>









