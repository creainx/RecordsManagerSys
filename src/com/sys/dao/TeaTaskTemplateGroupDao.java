package com.sys.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sys.entity.TeaTaskTemplateGroupInfo;

public interface TeaTaskTemplateGroupDao {
	public List<TeaTaskTemplateGroupInfo> getTeaTaskTemplateGroupList(@Param("tea_id") String tea_id);
}