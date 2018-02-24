package com.sys.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sys.biz.TeaTeamGroupBiz;
import com.sys.dao.TeaTeamGroupDao;
import com.sys.entity.TeaTeamGroupInfo;

@Service
public class TeaTeamGroupBizImpl implements TeaTeamGroupBiz{

	@Resource
	private TeaTeamGroupDao teaTeamGroupDao;

	@Override
	public List<TeaTeamGroupInfo> getTeacherTeamGroupList(String tea_id){
		return teaTeamGroupDao.getTeacherTeamGroupList(tea_id);
	}
	
}