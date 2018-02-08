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
	 * ��ʦ��½
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

		/* �жϽ��յ������Ƿ�Ϊ�� */
		if (teacherInfo != null && teacherInfo.getTea_id() != null && teacherInfo.getTea_pwd() != null) {

			// �����Ƿ���ڴ�Id
			TeacherInfo login_teaInfo = teaBiz.getTeacherInfoByTeaId(teacherInfo.getTea_id());

			// �ж����ݿ��ȡ�������Ƿ�Ϊ��
			if (login_teaInfo != null) {

				// �ж������Ƿ���ȷ
				if (teacherInfo.getTea_pwd().trim().equals(login_teaInfo.getTea_pwd())) {
					resultData.setResult(true);
					session.setAttribute("teaInfo", login_teaInfo);

					Cookie userCookie = new Cookie("cookieTeaId", login_teaInfo.getTea_id());
					userCookie.setMaxAge(30 * 24 * 60 * 60); // �����Ϊһ���� 30*24*60*60
					userCookie.setPath("/");
					response.addCookie(userCookie);
					
				} else {
					// error:2 �������
					resultData.setErrorNum(2);
				}
			} else {
				// error:1 �˺Ų�����
				resultData.setErrorNum(1);
			}
		} else {
			// error:3 �ύ��Ϣ����
			resultData.setErrorNum(3);
		}

		System.out.println(resultData.jsonFormat());
		return resultData.jsonFormat();
	}

	/* ��ת����Comtroller **************************************/

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
