<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/must.css" />
<script type="text/javascript" src="${applicationScope.js}/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>作业管理</title>
<link rel="stylesheet" type="text/css"
	href="${applicationScope.css}/task/teaTaskBiz.css" />
<script type="text/javascript"
	src="${applicationScope.js}/task/teaTaskBiz.js"></script>
</head>
<body class="m_format_body" onresize="reset_hint_line()">
	<jsp:include page="/WEB-INF/pages/message/message.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/pages/head/teaHead.jsp"></jsp:include>
	<div class="mid_main">
		<jsp:include page="/WEB-INF/pages/menu/teaMenu.jsp"></jsp:include>
		
	</div>
</body>
</html>

<style type="text/css">
	
</style>
<script type="text/javascript">
</script>



















