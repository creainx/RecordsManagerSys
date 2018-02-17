package com.sys.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sys.biz.TeaTaskTemplateGroupBiz;
import com.sys.entity.TeaTaskTemplateGroupInfo;
import com.sys.entity.TeacherInfo;

@Controller
@RequestMapping("teacherTask")
public class TeaTaskComtroller {
	
	@Resource
	private TeaTaskTemplateGroupBiz teaTaskTemplateGroupBiz;
	
	@RequestMapping("/publishStuTask")
	public String publishStuTask(Model model, HttpSession session, HttpServletResponse response, TeacherInfo teacherInfo) {
		return "redirect:/teacher/indexPage.go";
	}
	
	@RequestMapping("/taskBiz")
	public String taskBiz(String selTaskId,Model model, HttpSession session, HttpServletResponse response) {
		TeacherInfo teaInfo = (TeacherInfo) session.getAttribute("teaInfo");
		List<TeaTaskTemplateGroupInfo> taskGroupList = teaTaskTemplateGroupBiz.getTeaTaskTemplateGroupList(teaInfo.getTea_id());
		model.addAttribute("taskGroupList", taskGroupList);
		model.addAttribute("selTaskId", selTaskId);
		return "teaTask/teaTaskBiz";
	}
}
