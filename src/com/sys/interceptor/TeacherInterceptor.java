package com.sys.interceptor;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.sys.entity.TeacherInfo;

public class TeacherInterceptor implements HandlerInterceptor {

	/**
	 * √‚µ«»Î √‚ºÏ≤Èµÿ÷∑
	 */
	private List<String> uncheckUrls;

	public void setUncheckUrls(List<String> uncheckUrls) {
		this.uncheckUrls = uncheckUrls;
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		Boolean flag = false;
		
		String requestUrl = request.getRequestURI();
		for (String noUrl : uncheckUrls) {
			if (requestUrl.contains(noUrl)) {
				flag = true;
				break;
			}
		}

		if (flag == false) {
			HttpSession session = request.getSession();
			if (session.getAttribute("teaInfo") != null) {
				TeacherInfo teaInfo = (TeacherInfo) session.getAttribute("teaInfo");
				if (teaInfo.getTea_state() == 1) {
					return true;
				}
			}
			//request.getRequestDispatcher("/teacher/loginPage.go").forward(request,response);
			request.getRequestDispatcher("/teacher/fastLogin.go?tea_id=1000&tea_pwd=0000").forward(request,response);
		}
		
		return flag;
	}

}
