package com.sys.controller;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aliyuncs.http.HttpResponse;
import com.sys.biz.TeacherInfoBiz;
import com.sys.entity.TeacherInfo;
import com.sys.tool.ResultData;

@Controller
@RequestMapping("teacher")
public class TeacherComtroller {

	@Resource
	private TeacherInfoBiz teaBiz;

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
	public String login(Model model, HttpSession session,HttpServletResponse response, TeacherInfo teacherInfo) {

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

	/* 跳转界面Comtroller **************************************/

	@RequestMapping("/loginPage")
	public String gologinPage(Model model, HttpSession session) {
		return "login/teaLogin";
	}

	@RequestMapping("/indexPage")
	public String goIndexPage(Model model, HttpSession session) {
		return "index/teaIndex";
	}
	
	@RequestMapping("/getTeamInfo")
	public String getTeamInfo(Model model, HttpSession session) {
		return "index/teaTeamInfo";
	}
}
