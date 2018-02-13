<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:choose>
	<c:when test="${fn:length(requestScope.resultData.data) == 0}">
      	 没有成员
    </c:when>
	<c:when test="${requestScope.resultData.result == false}">
      	${requestScope.message}
    </c:when>
	<c:otherwise>
		<c:forEach items="${requestScope.resultData.data}" var="i">
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



