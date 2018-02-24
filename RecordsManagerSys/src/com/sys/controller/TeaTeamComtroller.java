package com.sys.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sys.biz.TeamBiz;
import com.sys.entity.TeacherInfo;
import com.sys.entity.TeamInfo;
import com.sys.tool.ResultData;

@Controller
@RequestMapping("teacherTeam")
public class TeaTeamComtroller {
	
	@Resource
	private TeamBiz teamBiz;
	
	@RequestMapping("/removeTeamInfo")
	@ResponseBody
	public String removeTeamInfo(String removeTeamId,Model model, HttpSession session) {
		ResultData resultData = new ResultData();
		
		TeacherInfo teaInfo = (TeacherInfo) session.getAttribute("teaInfo");
		TeamInfo teamInfo = teamBiz.getTeamInfoAllByTeamId(removeTeamId);
		if(teamInfo != null) {
			if(teamInfo.getTeaTeamGroupInfo().getTeaInfo().getTea_id().equals(teaInfo.getTea_id())) {
				teamInfo.setTeam_state(0);
				System.out.println(teamInfo);
				teamBiz.updateTeamInfo(teamInfo);
				resultData.setResult(true);
			}else {
				//没有权限
			}
		}
		return resultData.jsonFormat();
	}
}
