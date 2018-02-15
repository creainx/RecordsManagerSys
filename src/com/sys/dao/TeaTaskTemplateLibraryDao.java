package com.sys.dao;

import org.apache.ibatis.annotations.Param;

import com.sys.entity.TeamInfo;

public interface TeaTaskTemplateLibraryDao {
	public TeamInfo getTeamInfoAllByTeamId(@Param("teamId") String teamId);
}