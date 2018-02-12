package com.sys.text;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.sys.biz.TeaTeamGroupBiz;
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

}
