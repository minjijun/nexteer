package kr.co.nexteer.domain;

import java.time.LocalDateTime;

public class ProposalHistoryVO {
	private Integer proposal_history_index;
	private String proposal_history_suggested_product;
	private Integer	company_customer_index;
	private Integer member_index;
	private String proposal_history_job;
	private String proposal_history_job_date;
	private String proposal_history_job_date1;
	private String proposal_history_job_date2;
	private String proposal_history_job_date3;
	private LocalDateTime proposal_history_register_date;
	public Integer getProposal_history_index() {
		return proposal_history_index;
	}
	public void setProposal_history_index(Integer proposal_history_index) {
		this.proposal_history_index = proposal_history_index;
	}
	public String getProposal_history_suggested_product() {
		return proposal_history_suggested_product;
	}
	public void setProposal_history_suggested_product(String proposal_history_suggested_product) {
		this.proposal_history_suggested_product = proposal_history_suggested_product;
	}
	public Integer getCompany_customer_index() {
		return company_customer_index;
	}
	public void setCompany_customer_index(Integer company_customer_index) {
		this.company_customer_index = company_customer_index;
	}
	public Integer getMember_index() {
		return member_index;
	}
	public void setMember_index(Integer member_index) {
		this.member_index = member_index;
	}
	public String getProposal_history_job() {
		return proposal_history_job;
	}
	public void setProposal_history_job(String proposal_history_job) {
		this.proposal_history_job = proposal_history_job;
	}
	public String getProposal_history_job_date() {
		return proposal_history_job_date;
	}
	public void setProposal_history_job_date(String proposal_history_job_date) {
		this.proposal_history_job_date = proposal_history_job_date;
	}
	public String getProposal_history_job_date1() {
		return proposal_history_job_date1;
	}
	public void setProposal_history_job_date1(String proposal_history_job_date1) {
		this.proposal_history_job_date1 = proposal_history_job_date1;
	}
	public String getProposal_history_job_date2() {
		return proposal_history_job_date2;
	}
	public void setProposal_history_job_date2(String proposal_history_job_date2) {
		this.proposal_history_job_date2 = proposal_history_job_date2;
	}
	public String getProposal_history_job_date3() {
		return proposal_history_job_date3;
	}
	public void setProposal_history_job_date3(String proposal_history_job_date3) {
		this.proposal_history_job_date3 = proposal_history_job_date3;
	}
	public LocalDateTime getProposal_history_register_date() {
		return proposal_history_register_date;
	}
	public void setProposal_history_register_date(LocalDateTime proposal_history_register_date) {
		this.proposal_history_register_date = proposal_history_register_date;
	}
}
