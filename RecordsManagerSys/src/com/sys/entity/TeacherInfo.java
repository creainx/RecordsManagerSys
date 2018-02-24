package com.sys.entity;

public class TeacherInfo {

	private String tea_id;
	private String tea_name;
	private String tea_pwd;
	private Integer tea_state;

	public String getTea_id() {
		return tea_id;
	}

	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}

	public String getTea_name() {
		return tea_name;
	}

	public void setTea_name(String tea_name) {
		this.tea_name = tea_name;
	}

	public String getTea_pwd() {
		return tea_pwd;
	}

	public void setTea_pwd(String tea_pwd) {
		this.tea_pwd = tea_pwd;
	}

	public Integer getTea_state() {
		return tea_state;
	}

	public void setTea_state(Integer tea_state) {
		this.tea_state = tea_state;
	}

	@Override
	public String toString() {
		return "TeacherInfo [tea_id=" + tea_id + ", tea_name=" + tea_name + ", tea_pwd=" + tea_pwd + ", tea_state="
				+ tea_state + "]";
	}

}
