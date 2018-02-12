package com.sys.entity;

import java.util.Date;

public class TeamInfo {

	private String team_id;
	private String team_name;
	private Integer team_state;
	private Integer team_type;
	private Date team_date;
	private TeaTeamGroupInfo teaTeamGroupInfo;
	
	public String getTeam_id() {
		return team_id;
	}
	public void setTeam_id(String team_id) {
		this.team_id = team_id;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public Integer getTeam_state() {
		return team_state;
	}
	public void setTeam_state(Integer team_state) {
		this.team_state = team_state;
	}
	public Integer getTeam_type() {
		return team_type;
	}
	public void setTeam_type(Integer team_type) {
		this.team_type = team_type;
	}
	public Date getTeam_date() {
		return team_date;
	}
	public void setTeam_date(Date team_date) {
		this.team_date = team_date;
	}
	public TeaTeamGroupInfo getTeaTeamGroupInfo() {
		return teaTeamGroupInfo;
	}
	public void setTeaTeamGroupInfo(TeaTeamGroupInfo teaTeamGroupInfo) {
		this.teaTeamGroupInfo = teaTeamGroupInfo;
	}
	
}
