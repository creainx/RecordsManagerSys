package com.sys.entity;

import java.util.Date;
import java.util.List;

public class TeaTaskTemplateGroupInfo {
	private String tg_id;
	private String tg_name;
	private Integer tg_type;
	private Integer tg_state;
	private Date tg_date;
	private TeacherInfo teaInfo;
	private List<TeaTaskTemplateLibraryInfo> teaTaskTemplateLibraryList;
	
	public String getTg_id() {
		return tg_id;
	}
	public void setTg_id(String tg_id) {
		this.tg_id = tg_id;
	}
	public String getTg_name() {
		return tg_name;
	}
	public void setTg_name(String tg_name) {
		this.tg_name = tg_name;
	}
	public Integer getTg_type() {
		return tg_type;
	}
	public void setTg_type(Integer tg_type) {
		this.tg_type = tg_type;
	}
	public Integer getTg_state() {
		return tg_state;
	}
	public void setTg_state(Integer tg_state) {
		this.tg_state = tg_state;
	}
	public Date getTg_date() {
		return tg_date;
	}
	public void setTg_date(Date tg_date) {
		this.tg_date = tg_date;
	}
	public TeacherInfo getTeaInfo() {
		return teaInfo;
	}
	public void setTeaInfo(TeacherInfo teaInfo) {
		this.teaInfo = teaInfo;
	}
	public List<TeaTaskTemplateLibraryInfo> getTeaTaskTemplateLibraryList() {
		return teaTaskTemplateLibraryList;
	}
	public void setTeaTaskTemplateLibraryList(List<TeaTaskTemplateLibraryInfo> teaTaskTemplateLibraryList) {
		this.teaTaskTemplateLibraryList = teaTaskTemplateLibraryList;
	}
	@Override
	public String toString() {
		return "TeaTaskTemplateGroupInfo [tg_id=" + tg_id + ", tg_name=" + tg_name + ", tg_type=" + tg_type
				+ ", tg_state=" + tg_state + ", tg_date=" + tg_date + ", teaInfo=" + teaInfo
				+ ", teaTaskTemplateLibraryList=" + teaTaskTemplateLibraryList + "]";
	}
	
}
