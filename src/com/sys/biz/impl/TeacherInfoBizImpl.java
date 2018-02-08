package com.sys.biz.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sys.biz.TeacherInfoBiz;
import com.sys.dao.TeacherInfoDao;
import com.sys.entity.TeacherInfo;

@Service
public class TeacherInfoBizImpl implements TeacherInfoBiz{

	@Resource
	private TeacherInfoDao teacherDao;
	
	@Override
	public TeacherInfo getTeacherInfoByTeaId(String teaId) {
		return teacherDao.getTeacherInfoByTeaId(teaId);
	}
}