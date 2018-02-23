package com.sys.dao;

import org.apache.ibatis.annotations.Param;

import com.sys.entity.TeamInfo;

public interface TeamDao {
	public TeamInfo getTeamInfoAllByTeamId(@Param("teamId") String teamId);
	
	public int updateTeamInfo(@Param("teamInfo") TeamInfo teamInfo);
	
	public int removeTeamInfoByTeamId(@Param("teamId") String teamId);
}