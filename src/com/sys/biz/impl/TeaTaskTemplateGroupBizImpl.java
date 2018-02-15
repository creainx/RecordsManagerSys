package com.sys.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sys.biz.TeaTaskTemplateGroupBiz;
import com.sys.dao.TeaTaskTemplateGroupDao;
import com.sys.entity.TeaTaskTemplateGroupInfo;

@Service
public class TeaTaskTemplateGroupBizImpl implements TeaTaskTemplateGroupBiz {

	@Resource
	private TeaTaskTemplateGroupDao teaTaskTemplateGroupDao;

	@Override
	public List<TeaTaskTemplateGroupInfo> getTeaTaskTemplateGroupList(String tea_id) {
		return teaTaskTemplateGroupDao.getTeaTaskTemplateGroupList(tea_id);
	}

}