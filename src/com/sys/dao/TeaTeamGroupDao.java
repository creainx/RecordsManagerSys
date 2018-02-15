package com.sys.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sys.entity.TeaTeamGroupInfo;

public interface TeaTeamGroupDao {
	
	public List<TeaTeamGroupInfo> getTeacherTeamGroupList(@Param("tea_id") String tea_id);
	
	
}