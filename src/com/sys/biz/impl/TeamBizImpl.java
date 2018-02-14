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

}