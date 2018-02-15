package com.sys.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sys.biz.TeaTeamGroupBiz;
import com.sys.entity.TeacherInfo;

@Controller
@RequestMapping("teacharTask")
public class TeaTaskComtroller {
	
	@Resource
	private TeaTeamGroupBiz TeaTaskTemplateGroupBiz;
	
	@RequestMapping("/publishStuTask")
	public String publishStuTask(Model model, HttpSession session, HttpServletResponse response, TeacherInfo teacherInfo) {
		return "redirect:/teacher/indexPage.go";
	}
	
	@RequestMapping("/taskBiz")
	public String taskBiz(Model model, HttpSession session, HttpServletResponse response, TeacherInfo teacherInfo) {
		return "teaTask/teaTaskBiz";
	}
}
