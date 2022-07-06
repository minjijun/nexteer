package kr.co.nexteer.domain;

import org.apache.poi.ss.formula.functions.T;

public class Criteria {
	private String type;	// 검색타입
	private String keyword; // 검색 키워드
	private String filter_type;
	private Integer filter;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getFilter_type() {
		return filter_type;
	}
	public void setFilter_type(String filter_type) {
		this.filter_type = filter_type;
	}
	public Integer getFilter() {
		return filter;
	}
	public void setFilter(Integer filter) {
		this.filter = filter;
	}

/*	@Override
	public String toString() {
		return "Criteria [type=" + type + ", keyword=" + keyword + "]";
	}*/
}
