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
import com.sys.entity.TeaTaskTemplateLibraryInfo;
import com.sys.entity.TeacherInfo;
import com.sys.entity.TeamInfo;

@Controller
@RequestMapping("teacherTask")
public class TeaTaskComtroller {

	@Resource
	private TeaTaskTemplateGroupBiz teaTaskTemplateGroupBiz;

	@RequestMapping("/publishStuTask")
	public String publishStuTask(Model model, HttpSession session, HttpServletResponse response,
			TeacherInfo teacherInfo) {
		return "redirect:/teacher/indexPage.go";
	}

	@RequestMapping("/taskBiz")
	public String taskBiz(String selTaskId, Model model, HttpSession session, HttpServletResponse response) {
		TeacherInfo teaInfo = (TeacherInfo) session.getAttribute("teaInfo");
		List<TeaTaskTemplateGroupInfo> taskGroupList = teaTaskTemplateGroupBiz.getTeaTaskTemplateGroupList(teaInfo.getTea_id());
		model.addAttribute("taskGroupList", taskGroupList);
		
		if (taskGroupList.size() > 0) {
			// 如果为空,默认选择第一个退出
			if (selTaskId == null) {
				TeaTaskTemplateGroupInfo teaTaskTemplateGroupInfo = taskGroupList.get(0);
				TeaTaskTemplateLibraryInfo taskInfo = teaTaskTemplateGroupInfo.getTeaTaskTemplateLibraryList().get(0);
				selTaskId = taskInfo.getTl_id();
				model.addAttribute("selTaskId", selTaskId);
				model.addAttribute("selTaskInfo", taskInfo.getTl_info());
				return "teaTask/teaTaskBiz";
			}

			boolean find_task_id = false;

			for (TeaTaskTemplateGroupInfo teaTaskTemplateGroupInfo : taskGroupList) {
				for (TeaTaskTemplateLibraryInfo teaTaskTemplateLibraryInfo : teaTaskTemplateGroupInfo
						.getTeaTaskTemplateLibraryList()) {
					if (teaTaskTemplateLibraryInfo.getTl_id().equals(selTaskId)) {
						find_task_id = true;
						model.addAttribute("selTaskId", selTaskId);
						model.addAttribute("selTaskInfo", teaTaskTemplateLibraryInfo.getTl_info());
					}
				}
			}
			// 如果找不到这个Id,默认选中第一个
			if (find_task_id == false) {
				TeaTaskTemplateGroupInfo teaTaskTemplateGroupInfo = taskGroupList.get(0);
				TeaTaskTemplateLibraryInfo taskInfo = teaTaskTemplateGroupInfo.getTeaTaskTemplateLibraryList().get(0);
				selTaskId = taskInfo.getTl_id();
				model.addAttribute("selTaskId", selTaskId);
				model.addAttribute("selTaskInfo", taskInfo.getTl_info());
			}
		}

		return "teaTask/teaTaskBiz";
	}
}
