package com.sys.entity;

import java.util.List;

public class PageInfo{
	
	/**
	 * 当前页
	 */
	private Integer  current_page;
	
	/**
	 * 总页数
	 */
	private Integer page_countNum;
	
	/**
	 * 一页的数量
	 */
	private Integer page_num;
	
	
	/**
	 * 数据
	 */
	private List list_info;


	public Integer getCurrent_page() {
		return current_page;
	}


	public void setCurrent_page(Integer current_page) {
		this.current_page = current_page;
	}


	public Integer getPage_countNum() {
		return page_countNum;
	}


	public void setPage_countNum(Integer page_countNum) {
		this.page_countNum = page_countNum;
	}


	public Integer getPage_num() {
		return page_num;
	}


	public void setPage_num(Integer page_num) {
		this.page_num = page_num;
	}


	public List getList_info() {
		return list_info;
	}


	public void setList_info(List list_info) {
		this.list_info = list_info;
	}


	@Override
	public String toString() {
		return "PageInfo [current_page=" + current_page + ", page_countNum=" + page_countNum + ", page_num=" + page_num
				+ ", list_info=" + list_info + "]";
	}
	
}

