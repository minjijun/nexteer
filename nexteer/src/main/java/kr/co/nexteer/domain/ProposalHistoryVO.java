package kr.co.nexteer.domain;

import java.sql.Timestamp;

public class ProposalHistoryVO {
	private Integer proposal_history_index;
	private String proposal_history_suggested_product;
	private Integer	company_customer_index;
	private Integer member_index;
	private String proposal_history_job;
	private String proposal_history_job_date;
	private Timestamp proposal_history_register_date;
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
	public Timestamp getProposal_history_register_date() {
		return proposal_history_register_date;
	}
	public void setProposal_history_register_date(Timestamp proposal_history_register_date) {
		this.proposal_history_register_date = proposal_history_register_date;
	}
}
