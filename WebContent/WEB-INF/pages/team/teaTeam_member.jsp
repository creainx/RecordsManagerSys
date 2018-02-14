<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript"
	src="${applicationScope.js}/team/teaTeam_member.js"></script>
	
<div class="selTeamName">${requestScope.resultData.data.team_name }</div>
<div class="team_member_tit">
	<div class="team_member_titFont">
		<input type="checkbox" />班级学生
	</div>
	<div class="tea_team_tool">
		<input id="add_student" class="add_student" type="button" value=添加学生 />
	</div>
</div>
<div class="team_memberList">
	<div class="header_team_memberItem">
		<label class="header_item_font_interval">账号</label> <label
			class="header_item_font_interval">姓名</label> <label
			class="header_item_font_interval m_c_green">账号状态</label> <label
			class="header_item_font_interval">操作</label>
	</div>
	<c:choose>
		<c:when test="${fn:length(requestScope.resultData.data.teamMemberList) == 0}">
      	 没有成员
    </c:when>
		<c:when test="${requestScope.resultData.result == false}">
      	${requestScope.message}
    </c:when>
		<c:otherwise>
			<c:forEach items="${requestScope.resultData.data.teamMemberList}"
				var="i">
				<div class="team_memberItem">
					<span class="item_font_interval"><input type="checkbox" />${i.stu_id }</span>
					<label class="item_font_interval">${i.stu_name}</label> <label
						class="item_font_interval m_c_green">正常</label> <span
						class="item_font_interval"> <a href="www.baidu.com">查看学生记录</a>
					</span>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>

