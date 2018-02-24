package com.sys.biz;

import java.util.List;

import com.sys.entity.TeaTaskTemplateGroupInfo;

public interface TeaTaskTemplateGroupBiz {
	public List<TeaTaskTemplateGroupInfo> getTeaTaskTemplateGroupList(String tea_id);
}