package com.sys.dao;

import com.sys.entity.TeacherInfo;

public interface TeacherDao {
	
	public TeacherInfo getTeacherInfoByTeaId(String teaId);
}