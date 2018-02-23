package com.sys.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sys.biz.TeaTaskTemplateGroupBiz;
import com.sys.biz.TeamBiz;
import com.sys.entity.StudentInfo;
import com.sys.entity.TeaTaskTemplateGroupInfo;
import com.sys.entity.TeaTaskTemplateLibraryInfo;
import com.sys.entity.TeacherInfo;
import com.sys.entity.TeamInfo;

@Controller
@RequestMapping("teacherTask")
public class TeaTaskComtroller {

	@Resource
	private TeaTaskTemplateGroupBiz teaTaskTemplateGroupBiz;
	
	@Resource
	private TeamBiz teamBiz;

	@RequestMapping("/publishStuTask")
	public String publishStuTask(Model model, HttpSession session, HttpServletResponse response,
			TeacherInfo teacherInfo) {
		return "redirect:/teacher/indexPage.go";
	}

	@RequestMapping("/taskBiz")
	public String taskBiz(String selCheckTaskId, Model model, HttpSession session, HttpServletResponse response) {
		TeacherInfo teaInfo = (TeacherInfo) session.getAttribute("teaInfo");
		List<TeaTaskTemplateGroupInfo> taskGroupList = teaTaskTemplateGroupBiz
				.getTeaTaskTemplateGroupList(teaInfo.getTea_id());
		model.addAttribute("taskGroupList", taskGroupList);
		if (taskGroupList.size() > 0) {
			// 如果为空,默认选择第一个退出
			if (selCheckTaskId == null) {
				if(session.getAttribute("selCheckTaskInfo") == null) {
					TeaTaskTemplateGroupInfo teaTaskTemplateGroupInfo = taskGroupList.get(0);
					TeaTaskTemplateLibraryInfo taskInfo = teaTaskTemplateGroupInfo.getTeaTaskTemplateLibraryList().get(0);
					session.setAttribute("selCheckTaskInfo",taskInfo);
				}
			} else {
				boolean find_task_id = false;
				for (TeaTaskTemplateGroupInfo teaTaskTemplateGroupInfo : taskGroupList) {
					for (TeaTaskTemplateLibraryInfo teaTaskTemplateLibraryInfo : teaTaskTemplateGroupInfo
							.getTeaTaskTemplateLibraryList()) {
						if (teaTaskTemplateLibraryInfo.getTl_id().equals(selCheckTaskId)) {
							find_task_id = true;
							session.setAttribute("selCheckTaskInfo",teaTaskTemplateLibraryInfo);
						}
					}
				}
				// 如果找不到这个Id,重定向
				if (find_task_id == false) {
					return "redirect:/teacherTask/taskBiz.go";
				}
			}

		}
		
		return "teaTask/teaTaskBiz";
	}
	@RequestMapping("/pushTask")
	public String teaPushTask(String pushTaskId, Model model, HttpSession session, HttpServletRequest request) {
		//根据教师ID查询教师的作业列表
		TeacherInfo teaInfo = (TeacherInfo) session.getAttribute("teaInfo");
		List<TeaTaskTemplateGroupInfo> taskGroupList = teaTaskTemplateGroupBiz.getTeaTaskTemplateGroupList(teaInfo.getTea_id());
		model.addAttribute("taskGroupList", taskGroupList);
		
		if (taskGroupList.size() > 0) {
			// 如果为空,默认选择第一个退出
			if (pushTaskId == null) {
				if(request.getAttribute("selPushTaskInfo") == null) {
					TeaTaskTemplateGroupInfo teaTaskTemplateGroupInfo = taskGroupList.get(0);
					TeaTaskTemplateLibraryInfo taskInfo = teaTaskTemplateGroupInfo.getTeaTaskTemplateLibraryList().get(0);
					pushTaskId = taskInfo.getTl_id();
					model.addAttribute("selPushTaskInfo", taskInfo);
				}
			} else {
				boolean find_task_id = false;

				for (TeaTaskTemplateGroupInfo teaTaskTemplateGroupInfo : taskGroupList) {
					for (TeaTaskTemplateLibraryInfo teaTaskTemplateLibraryInfo : teaTaskTemplateGroupInfo
							.getTeaTaskTemplateLibraryList()) {
						if (teaTaskTemplateLibraryInfo.getTl_id().equals(pushTaskId)) {
							find_task_id = true;
							model.addAttribute("selPushTaskInfo", teaTaskTemplateLibraryInfo);
						}
					}
				}
				// 如果找不到这个Id,默认选中第一个
				if (find_task_id == false) {
					TeaTaskTemplateGroupInfo teaTaskTemplateGroupInfo = taskGroupList.get(0);
					TeaTaskTemplateLibraryInfo taskInfo = teaTaskTemplateGroupInfo.getTeaTaskTemplateLibraryList()
							.get(0);
					model.addAttribute("selPushTaskInfo", taskInfo);
				}
			}

		}
		return "teaTask/teaPushTask";
	}

	
}
