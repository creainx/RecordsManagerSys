package com.sys.text;

import java.util.List;

import org.junit.Test;

import com.sys.biz.TeaTeamGroupBiz;
import com.sys.dao.TeaTaskTemplateGroupDao;
import com.sys.entity.TeaTaskTemplateGroupInfo;
import com.sys.entity.TeaTeamGroupInfo;
import com.sys.tool.SpringTool;

public class Wen_Test {
	@Test
	public void getTeacherTeamGroupList() {
		TeaTeamGroupBiz teaTeamGroupBiz = SpringTool.getBean(TeaTeamGroupBiz.class);
		List<TeaTeamGroupInfo> list = teaTeamGroupBiz.getTeacherTeamGroupList("1000");
		for (TeaTeamGroupInfo info : list) {
			System.out.println("组名:" + info.getTg_name());
			System.out.println("班级数量:" + info.getTeamInfoList().size());
			System.out.println("================================");
		}
	}

	@Test
	public void getTeaTaskTemplateGroupList() {
		TeaTaskTemplateGroupDao dao = SpringTool.getBean(TeaTaskTemplateGroupDao.class);
		List<TeaTaskTemplateGroupInfo> list = dao.getTeaTaskTemplateGroupList("1000");
		for (TeaTaskTemplateGroupInfo info : list) {
			System.out.println("组名:" + info.getTg_name());
			System.out.println("数量:" + info.getTeaTaskTemplateLibraryList().size());
			System.out.println("================================");
		}
	}
}
