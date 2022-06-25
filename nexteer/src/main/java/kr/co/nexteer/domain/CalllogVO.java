package kr.co.nexteer.domain;

import java.time.LocalDateTime;

public class CalllogVO {
	private Integer calllog_index;
	private Integer company_index;
	private Integer member_index;
	private Integer company_customer_index;
	private String calllog_call_date;
	private String calllog_call_contents;
	private LocalDateTime calllog_register_date;
	private LocalDateTime calllog_modify_date;
	public Integer getCalllog_index() {
		return calllog_index;
	}
	public void setCalllog_index(Integer calllog_index) {
		this.calllog_index = calllog_index;
	}
	public Integer getCompany_index() {
		return company_index;
	}
	public void setCompany_index(Integer company_index) {
		this.company_index = company_index;
	}
	public Integer getMember_index() {
		return member_index;
	}
	public void setMember_index(Integer member_index) {
		this.member_index = member_index;
	}
	public Integer getCompany_customer_index() {
		return company_customer_index;
	}
	public void setCompany_customer_index(Integer company_customer_index) {
		this.company_customer_index = company_customer_index;
	}
	public String getCalllog_call_date() {
		return calllog_call_date;
	}
	public void setCalllog_call_date(String calllog_call_date) {
		this.calllog_call_date = calllog_call_date;
	}
	public String getCalllog_call_contents() {
		return calllog_call_contents;
	}
	public void setCalllog_call_contents(String calllog_call_contents) {
		this.calllog_call_contents = calllog_call_contents;
	}
	public LocalDateTime getCalllog_register_date() {
		return calllog_register_date;
	}
	public void setCalllog_register_date(LocalDateTime calllog_register_date) {
		this.calllog_register_date = calllog_register_date;
	}
	public LocalDateTime getCalllog_modify_date() {
		return calllog_modify_date;
	}
	public void setCalllog_modify_date(LocalDateTime calllog_modify_date) {
		this.calllog_modify_date = calllog_modify_date;
	}
}
