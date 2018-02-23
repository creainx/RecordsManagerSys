package com.sys.biz;

import org.apache.ibatis.annotations.Param;

import com.sys.entity.TeamInfo;

public interface TeamBiz {
	public TeamInfo getTeamInfoAllByTeamId(String teamId);
	
	public TeamInfo getTeamInfoBaseByTeamId(String teamId);
	
	@Deprecated
	public int removeTeamInfoByTeamId(String teamId);
	
	public int updateTeamInfo(TeamInfo teamInfo);
}