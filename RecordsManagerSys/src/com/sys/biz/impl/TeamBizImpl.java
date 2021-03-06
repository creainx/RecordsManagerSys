package com.sys.biz.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sys.biz.TeamBiz;
import com.sys.dao.TeamDao;
import com.sys.entity.TeamInfo;

@Service
public class TeamBizImpl implements TeamBiz {

	@Resource
	private TeamDao teamDao;

	@Override
	public TeamInfo getTeamInfoAllByTeamId(String teamId) {
		if (teamId == null) {
			return null;
		}
		return teamDao.getTeamInfoAllByTeamId(teamId);
	}

	@Override
	public int removeTeamInfoByTeamId(String teamId) {
		if (teamId == null) {
			return 0;
		}
		return teamDao.removeTeamInfoByTeamId(teamId);
	}

	@Override
	public int updateTeamInfo(TeamInfo teamInfo) {
		return teamDao.updateTeamInfo(teamInfo);
	}

	@Override
	public TeamInfo getTeamInfoBaseByTeamId(String teamId) {
		return teamDao.getTeamInfoBaseByTeamId(teamId);
	}
}