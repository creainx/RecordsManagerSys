package com.sys.entity;

public class TeaTaskTemplateLibraryInfo {
	private String tl_id;
	private String tl_title;
	private Integer tl_type;
	private String tl_info;
	private TeaTaskTemplateGroupInfo teaTaskTemplateGroupInfo;

	public String getFormat_tl_info() {
		String tl_info = this.getTl_info();
		tl_info = tl_info.replace("<", "11");
		System.out.println(tl_info);
		return tl_info;
	}
	
	public String getTl_id() {
		return tl_id;
	}

	public void setTl_id(String tl_id) {
		this.tl_id = tl_id;
	}

	public String getTl_title() {
		return tl_title;
	}

	public void setTl_title(String tl_title) {
		this.tl_title = tl_title;
	}

	public Integer getTl_type() {
		return tl_type;
	}

	public void setTl_type(Integer tl_type) {
		this.tl_type = tl_type;
	}

	public String getTl_info() {
		return tl_info;
	}

	public void setTl_info(String tl_info) {
		this.tl_info = tl_info;
	}

	public TeaTaskTemplateGroupInfo getTeaTaskTemplateGroupInfo() {
		return teaTaskTemplateGroupInfo;
	}

	public void setTeaTaskTemplateGroupInfo(TeaTaskTemplateGroupInfo teaTaskTemplateGroupInfo) {
		this.teaTaskTemplateGroupInfo = teaTaskTemplateGroupInfo;
	}

	@Override
	public String toString() {
		return "TeaTaskTemplateLibraryInfo [tl_id=" + tl_id + ", tl_title=" + tl_title + ", tl_type=" + tl_type
				+ ", tl_info=" + tl_info + ", teaTaskTemplateGroupInfo=" + teaTaskTemplateGroupInfo + "]";
	}

}
