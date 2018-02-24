package com.sys.biz.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sys.biz.TeacherBiz;
import com.sys.dao.TeacherDao;
import com.sys.entity.TeacherInfo;

@Service
public class TeacherBizImpl implements TeacherBiz{

	@Resource
	private TeacherDao teacherDao;
	
	@Override
	public TeacherInfo getTeacherInfoByTeaId(String teaId) {
		return teacherDao.getTeacherInfoByTeaId(teaId);
	}
}