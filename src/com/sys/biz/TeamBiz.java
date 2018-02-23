package com.sys.biz;

import com.sys.entity.TeamInfo;

public interface TeamBiz {
	public TeamInfo getTeamInfoAllByTeamId(String teamId);
	
	@Deprecated
	public int removeTeamInfoByTeamId(String teamId);
	
	public int updateTeamInfo(TeamInfo teamInfo);
}