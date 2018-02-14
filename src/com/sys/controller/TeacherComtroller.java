package com.sys.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tools.ant.taskdefs.Sleep;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sys.biz.TeaTeamGroupBiz;
import com.sys.biz.TeacherBiz;
import com.sys.biz.TeamBiz;
import com.sys.entity.StudentInfo;
import com.sys.entity.TeaTeamGroupInfo;
import com.sys.entity.TeacherInfo;
import com.sys.entity.TeamInfo;
import com.sys.tool.ResultData;

@Controller
@RequestMapping("teacher")
public class TeacherComtroller {

	@Resource
	private TeacherBiz teaBiz;

	@Resource
	private TeamBiz teamBiz;

	@Resource
	private TeaTeamGroupBiz teaTeamGroupBiz;

	/**
	 * 教师快速登陆
	 * 
	 * @param model
	 * @param session
	 * @param teacherInfo
	 * @return
	 */
	@RequestMapping("/fastLogin")
	public String fastLogin(Model model, HttpSession session, HttpServletResponse response, TeacherInfo teacherInfo) {
		this.login(model, session, response, teacherInfo);
		return "redirect:/teacher/indexPage.go";
	}

	/**
	 * 教师登陆
	 * 
	 * @param model
	 * @param session
	 * @param teacherInfo
	 * @return
	 */
	@RequestMapping("/login")
	@ResponseBody
	public String login(Model model, HttpSession session, HttpServletResponse response, TeacherInfo teacherInfo) {

		ResultData resultData = new ResultData();

		/* 判断接收的数据是否为空 */
		if (teacherInfo != null && teacherInfo.getTea_id() != null && teacherInfo.getTea_pwd() != null) {

			// 查找是否存在此Id
			TeacherInfo login_teaInfo = teaBiz.getTeacherInfoByTeaId(teacherInfo.getTea_id());

			// 判断数据库读取的数据是否为空
			if (login_teaInfo != null) {

				// 判断密码是否正确
				if (teacherInfo.getTea_pwd().trim().equals(login_teaInfo.getTea_pwd())) {
					resultData.setResult(true);
					session.setAttribute("teaInfo", login_teaInfo);

					Cookie userCookie = new Cookie("cookieTeaId", login_teaInfo.getTea_id());
					userCookie.setMaxAge(30 * 24 * 60 * 60); // 存活期为一个月 30*24*60*60
					userCookie.setPath("/");
					response.addCookie(userCookie);

				} else {
					// error:2 密码错误
					resultData.setErrorNum(2);
				}
			} else {
				// error:1 账号不存在
				resultData.setErrorNum(1);
			}
		} else {
			// error:3 提交信息错误
			resultData.setErrorNum(3);
		}

		System.out.println(resultData.jsonFormat());
		return resultData.jsonFormat();
	}

	@RequestMapping("/teaTeam")
	public String getTeaTeam(String selTeamId, Model model, HttpSession session) {

		model.addAttribute("sel_navId", "nav_teamInfo");

		TeacherInfo teaInfo = (TeacherInfo) session.getAttribute("teaInfo");
		List<TeaTeamGroupInfo> groupList = teaTeamGroupBiz.getTeacherTeamGroupList(teaInfo.getTea_id());
		model.addAttribute("groupList", groupList);
		model.addAttribute("selTeamId", selTeamId);
		return "team/teaTeam";
	}

	@RequestMapping("/getTeamMember")
	public String getTeamMember(String teamId, Model model, HttpSession session) {
		ResultData resultData = new ResultData();

		TeacherInfo teaInfo = (TeacherInfo) session.getAttribute("teaInfo");
		TeamInfo teamInfo = teamBiz.getTeamInfoAllByTeamId(teamId);
		
		if (teamInfo != null) {
			// 判断这个班级是否是当前老师的,防止修改JS、HTML代码导致的非法访问
			if (teaInfo.getTea_id().equals(teamInfo.getTeaTeamGroupInfo().getTeaInfo().getTea_id())) {
				// List<StudentInfo> list = teamInfo.getTeamMemberList();
				// model.addAttribute("teamMemberList", list);
				resultData.setData(teamInfo);
				resultData.setResult(true);
			} else {
				resultData.setErrorNum(4, "你没有访问此班级的权限");
			}
		} else {
			resultData.setErrorNum(5);
		}
		model.addAttribute("resultData", resultData);

		return "team/teaTeam_member";
	}

	/* 跳转界面Comtroller **************************************/

	@RequestMapping("/loginPage")
	public String gologinPage(Model model, HttpSession session) {
		return "login/teaLogin";
	}

	@RequestMapping("/indexPage")
	public String goIndexPage(String sel_navId, Model model, HttpSession session) {
		TeacherInfo teaInfo = (TeacherInfo) session.getAttribute("teaInfo");
		List<TeaTeamGroupInfo> groupList = teaTeamGroupBiz.getTeacherTeamGroupList(teaInfo.getTea_id());
		model.addAttribute("groupList", groupList);

		List<TeamInfo> topTeamList = new ArrayList<>();
		for (TeaTeamGroupInfo groupInfo : groupList) {
			for (TeamInfo teamInfo : groupInfo.getTeamInfoList()) {
				if (teamInfo.getTeam_type() == 2) {
					topTeamList.add(teamInfo);
				}
			}
		}
		model.addAttribute("topTeamList", topTeamList);

		model.addAttribute("sel_navId", "nav_synthesize");
		return "index/teaSynthesize";
	}

	@RequestMapping("/teamInfoPage")
	public String goTeamInfoPage(String selTeamId, Model model, HttpSession session) {
		model.addAttribute("sel_navId", "nav_teamInfo");
		model.addAttribute("selTeamId", selTeamId);
		return "index/teaIndex";
	}

}
