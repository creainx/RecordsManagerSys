package com.sys.entity;

import java.util.Date;

public class StudentInfo {

	private String stu_id;
	private String stu_name;
	private Integer stu_pwd;
	private Integer stu_state;
	private Date stu_data;
	private TeamInfo teamInfo;
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public Integer getStu_pwd() {
		return stu_pwd;
	}
	public void setStu_pwd(Integer stu_pwd) {
		this.stu_pwd = stu_pwd;
	}
	public Integer getStu_state() {
		return stu_state;
	}
	public void setStu_state(Integer stu_state) {
		this.stu_state = stu_state;
	}
	public Date getStu_data() {
		return stu_data;
	}
	public void setStu_data(Date stu_data) {
		this.stu_data = stu_data;
	}
	public TeamInfo getTeamInfo() {
		return teamInfo;
	}
	public void setTeamInfo(TeamInfo teamInfo) {
		this.teamInfo = teamInfo;
	}
	@Override
	public String toString() {
		return "StudentInfo [stu_id=" + stu_id + ", stu_name=" + stu_name + ", stu_pwd=" + stu_pwd + ", stu_state="
				+ stu_state + ", stu_data=" + stu_data + ", teamInfo=" + teamInfo + "]";
	}
	
}
